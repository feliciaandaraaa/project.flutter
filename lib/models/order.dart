import 'menu_item.dart';

class Order {
  final List<MenuItem> items;
  final double totalPrice;

  Order({required this.items})
      : totalPrice = items.fold(0, (sum, item) => sum + item.price);
}
