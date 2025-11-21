import 'package:freezed_annotation/freezed_annotation.dart';

part 'rating_model.freezed.dart';

@freezed
abstract class RatingModel with _$RatingModel {
  factory RatingModel({required double rate, required int count}) =
      _RatingModel;
}
