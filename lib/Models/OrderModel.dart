// import 'package:shopping_app/Models/CartItemModel.dart';

// class OrderModel {
//   final String orderId;
//   final List<CartItemModel> items;
//   final double totalAmount;
//   final DateTime orderDate;

//   OrderModel({
//     required this.orderId,
//     required this.items,
//     required this.totalAmount,
//     required this.orderDate,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'orderId': orderId,
//       'items': items.map((item) => item.toMap()).toList(),
//       'totalAmount': totalAmount,
//       'orderDate': orderDate.toIso8601String(),
//     };
//   }

//   factory OrderModel.fromMap(Map<String, dynamic> map) {
//     return OrderModel(
//       orderId: map['orderId'],
//       items: List<CartItemModel>.from(
//         map['items'].map((x) => CartItemModel.fromMap(x)),
//       ),
//       totalAmount: map['totalAmount'],
//       orderDate: DateTime.parse(map['orderDate']),
//     );
//   }
// }
import 'package:shopping_app/Models/CartItemModel.dart';

class OrderModel {
  final String orderId;
  final List<CartItemModel> items;
  final double totalAmount;
  final DateTime orderDate;

  OrderModel({
    required this.orderId,
    required this.items,
    required this.totalAmount,
    required this.orderDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'items': items.map((item) => item.toMap()).toList(),
      'totalAmount': totalAmount,
      'orderDate': orderDate.toIso8601String(),
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      orderId: map['orderId'],
      items: List<CartItemModel>.from(
        map['items'].map((x) => CartItemModel.fromMap(x)),
      ),
      totalAmount: map['totalAmount'],
      orderDate: DateTime.parse(map['orderDate']),
    );
  }

  OrderModel copyWith({
    String? orderId,
    List<CartItemModel>? items,
    double? totalAmount,
    DateTime? orderDate,
  }) {
    return OrderModel(
      orderId: orderId ?? this.orderId,
      items: items ?? this.items,
      totalAmount: totalAmount ?? this.totalAmount,
      orderDate: orderDate ?? this.orderDate,
    );
  }
}
