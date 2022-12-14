import 'package:futurecoin/data/enums/order_type_enum.dart';
import 'package:futurecoin/data/enums/product_type_enum.dart';
import 'package:futurecoin/data/models/instrument_model.dart';

class OrderModel {
  bool isBuy;
  String instrument;
  ProductTypeEnum productType;
  OrderTypeEnum orderType;
  double totalQuantity;
  double filledQuantity;
  double price;
  // double? limitPrice;
  double leverage;
  late double invested;
  // DateTime timestamp;

  OrderModel({
    required this.isBuy,
    required this.instrument,
    required this.productType,
    required this.orderType,
    required this.totalQuantity,
    required this.filledQuantity,
    required this.price,
    // this.limitPrice,
    this.leverage = 1,
    // required this.timestamp
  }) {
    invested = (price * filledQuantity) / leverage;
  }
}
