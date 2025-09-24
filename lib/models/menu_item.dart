// Parent class
class MenuItem {
  String name;
  double price;
  String imagePath;

  MenuItem(this.name, this.price, this.imagePath);

  String getInfo() => "$name - Rp $price";
}

// Subclass: makanan
class Food extends MenuItem {
  Food(String name, double price, String imagePath) : super(name, price, imagePath);

  @override
  String getInfo() => "🍔 Makanan: $name - Rp $price";
}

// Subclass: minuman
class Drink extends MenuItem {
  Drink(String name, double price, String imagePath) : super(name, price, imagePath);

  @override
  String getInfo() => "🥤 Minuman: $name - Rp $price";
}

// global menu list
List<MenuItem> menuItems = [
  Food("Nasi Goreng", 20000, "assets/images/nasi_goreng.png"),
  Food("Mie Goreng", 18000, "assets/images/mie_goreng.png"),
  Food("Ricebowl", 20000, "assets/images/ricebowl.png"),
  Food("Spahetti", 25000,"assets/images/spaghetti.png"),
  Drink("Es Teh", 5000, "assets/images/es_teh.png"),
  Drink("Lemon Tea", 7000, "assets/images/lemon_tea.png"),
  Drink("Kopi Hitam", 8000, "assets/images/kopi_hitam.png"),
  Drink("Cappuccino", 10000, "assets/images/cappuccino.png"),
  Drink("Thai Tea", 12000, "assets/images/thai_tea.png"),
  Drink("Matcha", 12000, "assets/images/matcha.png"),
];
