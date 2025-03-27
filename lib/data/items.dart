class CoffeeItem {
  final String name;
  final String price;
  final String image;

  CoffeeItem({required this.name, required this.price, required this.image});
}

final List<CoffeeItem> milkCoffeeItems = [
  CoffeeItem(name: "ЛАТТЕ", price: "249RUB", image: "assets/latte.jpg"),
  CoffeeItem(name: "КАПУЧИНО", price: "249RUB", image: "assets/capuccino.png"),
];
final List<CoffeeItem> blackCoffeeItems = [
  CoffeeItem(name: "АМЕРИКАНО", price: "139RUB", image: "assets/americano.jpg"),
  CoffeeItem(name: "ЭСПРЕССО", price: "149RUB", image: "assets/espresso.jpg"),
];
final List<CoffeeItem> coldBrewCoffeeItems = [
  CoffeeItem(name: "КОЛД БРЮ", price: "449RUB", image: "assets/coldbrew.jpg"),
  CoffeeItem(name: "КОЛД БРЮ С ВИШНЕЙ", price: "409RUB", image: "assets/coldbrewCherry.jpg"),
  CoffeeItem(name: "НИТРО", price: "349RUB", image: "assets/nitro.jpg"),
];
final List<CoffeeItem> hotChocCoffeeItems = [
  CoffeeItem(name: "КАКАО", price: "129RUB", image: "assets/cacao.jpg"),
  CoffeeItem(name: "ГОРЯЧИЙ ШОКОЛАД", price: "199RUB", image: "assets/hotchoc.jpg"),];
final List<CoffeeItem> teaItems = [
  CoffeeItem(name: "ШИПОВНИК", price: "209RUB", image: "assets/teaShip.jpg"),
  CoffeeItem(name: "ОБЛЕПИХОВЫЙ", price: "209RUB", image: "assets/teaOblepiha.jpg"),];

