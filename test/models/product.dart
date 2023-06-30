import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wt_models/src/from_model_to.dart';
import 'package:wt_models/src/order_support.dart';
import 'package:wt_models/src/to_model_from.dart';

import 'customer.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product extends BaseModel<Product> with _$Product, OrderSupport {
  static final from = ToModelFrom<Product>(json: _Product.fromJson, titles: _titles);
  static final to = FromModelTo<Product>(titles: _titles);

  static final _titles = ['id', 'title', 'price', 'weight'];

  factory Product({
    required String id,
    required String title,
    required double order,
    required double price,
    required double weight,
  }) = _Product;

  Product._();

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  @override
  String getId() => id;

  @override
  String getTitle() => title;

  @override
  double getOrder() => order;
}
