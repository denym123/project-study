import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:signals/signals.dart';
import 'package:testekobe/modules/products/controllers/products_controller.dart';
import 'package:testekobe/modules/products/models/models.dart';
import 'package:testekobe/modules/products/repositories/product_repository.dart';

// 1. Mock do Repositório (Para não bater na API de verdade)
class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late ProductsController controller;
  late MockProductRepository mockRepository;

  setUp(() {
    mockRepository = MockProductRepository();
    controller = ProductsController(productRepository: mockRepository);
  });

  final listaFake = [
    ProductModel(
      id: 1,
      title: 'Teste',
      price: 10,
      description: '',
      image: '',
      rating: RatingModel(rate: 0, count: 0),
      category: '',
    ),
  ];

  group('ProductsController |', () {
    test('Deve atualizar productsAS para AsyncData (Sucesso)', () async {
      when(
        () => mockRepository.fetchProducts(),
      ).thenAnswer((_) async => listaFake);
      await controller.fetchProducts();
      final estado = controller.productsAS.value;
      expect(estado, isA<AsyncData<List<ProductModel>>>()); // Virou Data?
      expect(estado.value!.length, 1); // Tem 1 item?
      expect(estado.value!.first.title, 'Teste'); // É o item certo?
      verify(() => mockRepository.fetchProducts()).called(1);
    });

    test('Deve atualizar productsAS para AsyncError (Falha)', () async {
      final erro = Exception('Erro 500');
      when(() => mockRepository.fetchProducts()).thenThrow(erro);
      await controller.fetchProducts();
      final estado = controller.productsAS.value;
      expect(estado, isA<AsyncError>()); // Virou Erro?
      expect(estado.error, erro); // Guardou o erro correto?
    });
  });
}
