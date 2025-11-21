import 'package:flutter_test/flutter_test.dart';
import 'package:testekobe/modules/products/models/rating_model.dart';

void main() {
  group('RatingModel |', () {
    test(
      'Duas instâncias com mesmos valores devem ser iguais (Value Equality)',
      () {
        // 1. ARRANGE
        final rating1 = RatingModel(rate: 4.5, count: 100);
        final rating2 = RatingModel(rate: 4.5, count: 100);

        // 2. ASSERT
        // Graças ao Freezed, isso retorna TRUE. Se fosse classe normal, daria FALSE.
        expect(rating1, equals(rating2));
      },
    );

    test('Duas instâncias com valores diferentes devem ser diferentes', () {
      // 1. ARRANGE
      final rating1 = RatingModel(rate: 4.5, count: 100);
      final rating2 = RatingModel(rate: 5.0, count: 100); // Nota diferente

      // 2. ASSERT
      expect(rating1, isNot(equals(rating2)));
    });
  });
}
