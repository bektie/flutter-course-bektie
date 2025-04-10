import 'dart:developer';

import 'package:bloc/bloc.dart';


class MainblocObserver extends BlocObserver {
  const MainblocObserver();

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
     super.onEvent(bloc, event);
     log('onEvent $event');
  }

}