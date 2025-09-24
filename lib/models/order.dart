import 'menu_item.dart';

enum OrderStatus { pending, confirmed, completed }

class Order {
  List<MenuItem> items;
  double total;
  OrderStatus status;

  Order(this.items, this.total, {this.status = OrderStatus.pending});
}

// daftar pesanan global
List<Order> orders = [];
