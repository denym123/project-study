import 'package:flutter_test/flutter_test.dart';
import 'package:testekobe/modules/products/models/product_model.dart';
import 'package:testekobe/modules/products/models/rating_model.dart'; // Importe o rating

void main() {
  // Massa de dados para reuso
  final rating = RatingModel(rate: 4.5, count: 10);

  final productA = ProductModel(
    id: 1,
    title: "Produto A",
    price: 10.0,
    description: "Desc",
    category: "Cat",
    image: "img",
    rating: rating,
  );

  final productA_Clone = ProductModel(
    id: 1,
    title: "Produto A",
    price: 10.0,
    description: "Desc",
    category: "Cat",
    image: "img",
    rating: rating,
  );

  final productB = ProductModel(
    id: 2,
    title: "Produto B", // Diferente
    price: 20.0,
    description: "Desc",
    category: "Cat",
    image: "img",
    rating: rating,
  );

  group('ProductModel |', () {
    // Teste 1: Value Equality (O motivo de usar Freezed)
    test(
      'Duas instâncias com os mesmos dados devem ser consideradas iguais (==)',
      () {
        // ASSERT
        // No Dart puro, isso daria false (instâncias diferentes na memória).
        // Com Freezed, isso deve dar true (valores iguais).
        expect(productA, equals(productA_Clone));
      },
    );

    test('Instâncias com dados diferentes devem ser diferentes', () {
      // ASSERT
      expect(productA, isNot(equals(productB)));
    });

    // Teste 2: Imutabilidade e CopyWith
    test('copyWith deve gerar uma nova instância com valores alterados', () {
      // ACT
      final productModificado = productA.copyWith(title: "Novo Título");

      // ASSERT
      // 1. Não deve ser o mesmo objeto (Imutabilidade)
      expect(productModificado, isNot(equals(productA)));

      // 2. O campo alterado deve estar certo
      expect(productModificado.title, "Novo Título");

      // 3. Os outros campos devem permanecer iguais
      expect(productModificado.id, productA.id);
      expect(productModificado.price, productA.price);
    });
  });
}
