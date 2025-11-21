import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:testekobe/modules/products/models/rating_model.dart';

part 'rating_dto.freezed.dart';
part 'rating_dto.g.dart';

@freezed
abstract class RatingDto with _$RatingDto {
  factory RatingDto({required double rate, required int count}) = _RatingDto;
  factory RatingDto.fromJson(Map<String, dynamic> json) =>
      _$RatingDtoFromJson(json);
}

extension RatingDtoMapperExtension on RatingDto {
  RatingModel toModel() {
    return RatingModel(rate: rate, count: count);
  }
}
