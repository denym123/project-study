import 'package:flutter_test/flutter_test.dart';
import 'package:testekobe/modules/products/dtos/rating_dto.dart';
import 'package:testekobe/modules/products/models/rating_model.dart';

void main() {
  // Massa de dados (Mock do JSON vindo da API)
  final jsonMock = {"rate": 3.9, "count": 120};

  group('RatingDto |', () {
    test('fromJson deve criar um DTO válido com os dados da API', () {
      // 1. ARRANGE & ACT
      final dto = RatingDto.fromJson(jsonMock);

      // 2. ASSERT
      expect(dto, isA<RatingDto>());
      expect(dto.rate, 3.9);
      expect(dto.count, 120);
    });

    test('toModel deve converter para RatingModel sem perder dados', () {
      // 1. ARRANGE
      final dto = RatingDto(rate: 4.5, count: 10);

      // 2. ACT
      final model = dto.toModel();

      // 3. ASSERT
      expect(
        model,
        isA<RatingModel>(),
      ); // Garante que virou o objeto de domínio
      expect(model.rate, 4.5); // Garante que o valor double passou
      expect(model.count, 10); // Garante que o valor int passou
    });
  });
}
