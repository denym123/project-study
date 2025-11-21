import 'package:flutter_test/flutter_test.dart';
import 'package:testekobe/modules/products/dtos/product_dto.dart';
import 'package:testekobe/modules/products/dtos/rating_dto.dart'; // Importe o rating também
import 'package:testekobe/modules/products/models/product_model.dart';

void main() {
  // 1. Massa de dados (Mock JSON)
  // Copie exatamente o que a API retorna
  final jsonMock = {
    "id": 1,
    "title": "Mochila Fjallraven",
    "price": 109.95,
    "description": "Mochila perfeita para o dia a dia",
    "category": "men's clothing",
    "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png",
    "rating": {"rate": 3.9, "count": 120},
  };

  group('ProductDto |', () {
    test(
      'fromJson deve criar um DTO válido quando o JSON estiver completo',
      () {
        // ACT
        final dto = ProductDto.fromJson(jsonMock);

        // ASSERT
        expect(dto, isA<ProductDto>());
        expect(dto.id, 1);
        expect(dto.title, "Mochila Fjallraven");
        expect(dto.price, 109.95);
        // Verifica se o objeto aninhado também foi criado
        expect(dto.rating, isA<RatingDto>());
        expect(dto.rating.rate, 3.9);
      },
    );

    test('toModel deve converter DTO para ProductModel corretamente', () {
      // ARRANGE
      final dto = ProductDto(
        id: 1,
        title: "Teste",
        price: 50.0,
        description: "Desc",
        category: "Cat",
        image: "img.png",
        rating: RatingDto(rate: 4.5, count: 10),
      );

      // ACT
      final model = dto.toModel();

      // ASSERT
      expect(model, isA<ProductModel>());
      expect(model.id, dto.id);
      expect(model.title, dto.title); // Ou .name, se você renomeou no model
      expect(model.rating.rate, 4.5);
    });
  });
}
