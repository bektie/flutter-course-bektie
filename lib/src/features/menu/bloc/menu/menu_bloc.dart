import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:coffeeshop/src/features/menu/data/repositories/category_repository.dart';
import 'package:coffeeshop/src/features/menu/data/repositories/location_repository.dart';
import 'package:coffeeshop/src/features/menu/data/repositories/product_repository.dart';
import 'package:coffeeshop/src/features/menu/models/models/category_model.dart';
import 'package:coffeeshop/src/features/menu/models/models/locations_model.dart';
import 'package:coffeeshop/src/features/menu/models/models/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'menu_event.dart';
part 'menu_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc(
    this._productsRepository,
    this._categoriesRepository,
    this._locationRepository,
  ) : super(
        const MenuState(
          status: MenuStatus.idle,
          items: [],
          categories: [],
          locations: [],
        ),
      ) {
    on<CategoryLoadingStarted>(_loadCategories);
    on<PageLoadingStarted>(
      _loadProducts,
      transformer: throttleDroppable(throttleDuration),
    );
    on<OneCategoryLoadingStarted>(_loadProductsFromOneCategory);
    on<LocationsLoadingStarted>(_loadLocations);
    on<LocationSelected>((event, emit) async {
      await saveSelectedLocation(event.location);
      emit(state.copyWith(selectedLocation: event.location));
    });

    add(const CategoryLoadingStarted());
    add(const LocationsLoadingStarted());
  }

  final IProductsRepository _productsRepository;
  final ICategoriesRepository _categoriesRepository;
  final ILocationsRepository _locationRepository;

  CategoryModel? _currentPaginatedCategory;

  int _currentPage = 0;

  final int _pageLimit = 25;

  Future<void> _loadCategories(event, emit) async {
    emit(state.copyWith(items: state.items, status: MenuStatus.progress));
    try {
      final categories = await _categoriesRepository.loadCategories();
      _currentPaginatedCategory =
          categories.isNotEmpty ? categories.first : null;
      _currentPage = 0;
      emit(
        state.copyWith(
          categories: categories,
          items: state.items,
          status: MenuStatus.success,
        ),
      );
      add(const PageLoadingStarted());
    } on Object {
      emit(
        state.copyWith(
          categories: state.categories,
          items: state.items,
          status: MenuStatus.error,
        ),
      );
      rethrow;
    }
  }

  Future<void> _loadProductsFromOneCategory(event, emit) async {
    CategoryModel? currentCategory = event.category;
    if (currentCategory == null) return;
    emit(state.copyWith(items: state.items, status: MenuStatus.progress));
    final List<ProductModel> previousItems = List<ProductModel>.from(
      state.items,
    );
    try {
      final items = await _productsRepository.loadProducts(
        category: currentCategory,
        limit: _pageLimit,
      );
      previousItems.addAll(items);
      emit(
        state.copyWith(
          categories: state.categories,
          items: previousItems,
          status: MenuStatus.success,
        ),
      );
    } on Object {
      emit(
        state.copyWith(
          categories: state.categories,
          items: state.items,
          status: MenuStatus.error,
        ),
      );
      rethrow;
    }
  }

  Future<void> _loadProducts(event, emit) async {
    List<CategoryModel>? categories = state.categories;
    if (categories.isEmpty) return;
    CategoryModel? currentCategory = _currentPaginatedCategory;
    currentCategory ??= categories.first;
    emit(state.copyWith(items: state.items, status: MenuStatus.progress));
    try {
      final List<ProductModel> previousItems = List<ProductModel>.from(
        state.items,
      );
      final items = await _productsRepository.loadProducts(
        category: currentCategory,
        page: _currentPage,
        limit: _pageLimit,
      );

      if (items.isEmpty) {
        if (currentCategory != categories.last) {
          int nextIndex = categories.indexOf(currentCategory) + 1;
          currentCategory = categories[nextIndex];
          _currentPaginatedCategory = currentCategory;
          _currentPage = 0;
          add(const PageLoadingStarted());
        } else {
          _currentPaginatedCategory = null;
        }
        return;
      }
      _currentPage += 1;
      if (items.length < _pageLimit) {
        if (currentCategory != categories.last) {
          int nextIndex = categories.indexOf(currentCategory) + 1;
          currentCategory = categories[nextIndex];
          _currentPage = 0;
        } else {
          currentCategory = null;
        }
      }
      _currentPaginatedCategory = currentCategory;
      previousItems.addAll(items);
      emit(
        state.copyWith(
          categories: state.categories,
          items: previousItems,
          status: MenuStatus.success,
        ),
      );
    } on Object {
      emit(
        state.copyWith(
          categories: state.categories,
          items: state.items,
          status: MenuStatus.error,
        ),
      );
      rethrow;
    }
  }

  Future<void> _loadLocations(event, emit) async {
    final List<LocationsModel> locations =
        await _locationRepository.loadLocations();

    final savedLocation = await loadSelectedLocation();

    final selected = locations.firstWhere(
      (l) => l.address == savedLocation?.address,
      orElse:
          () =>
              locations.isNotEmpty
                  ? locations.first
                  : LocationsModel(address: '', lat: 0, lng: 0),
    );

    emit(state.copyWith(locations: locations, selectedLocation: selected));
  }

  Future<void> saveSelectedLocation(LocationsModel location) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(location.toJson());
    await prefs.setString('selected_location', jsonString);
  }

  Future<LocationsModel?> loadSelectedLocation() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('selected_location');
    if (jsonString == null) return null;
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return LocationsModel.fromJson(json);
  }
}
