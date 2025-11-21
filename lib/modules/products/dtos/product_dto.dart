import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/models.dart';
import 'dtos.dart';

part 'product_dto.freezed.dart';
part 'product_dto.g.dart';

@freezed
abstract class ProductDto with _$ProductDto {
  factory ProductDto({
    required int id,
    required String title,
    required double price,
    required String description,
    required String category,
    required String image,
    required RatingDto rating,
  }) = _ProductDto;
  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);
}

extension ProductDtoMapperExtension on ProductDto {
  ProductModel toModel() {
    return ProductModel(
      id: id,
      title: title,
      price: price,
      description: description,
      category: category,
      image: image,
      rating: rating.toModel(),
    );
  }
}
