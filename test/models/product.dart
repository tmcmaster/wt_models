import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wt_models/src/order_support.dart';
import 'package:wt_models/src/v2/base_model_v2.dart';
import 'package:wt_models/src/v2/model_transform.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product extends BaseModelV2<Product> with _$Product, OrderSupport {
  static final convert = ModelTransform<Product>(
    titles: ['id', 'title', 'order', 'price', 'weight'],
    jsonToModel: Product.fromJson,
    none: Product.empty(),
  );

  factory Product({
    required String id,
    required String title,
    required double order,
    required double price,
    required double weight,
  }) = _Product;

  Product._();

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  factory Product.empty() => Product(
        id: '',
        title: '',
        order: 0.0,
        price: 0.0,
        weight: 0.0,
      );

  @override
  String getId() => id;

  @override
  String getTitle() => title;

  @override
  double getOrder() => order;

  @override
  List<String> getTitles() => convert.to.titles;
}
