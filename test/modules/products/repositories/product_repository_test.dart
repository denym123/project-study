import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:testekobe/core/core.dart';
import 'package:testekobe/modules/modules.dart';
import 'package:testekobe/modules/products/models/models.dart';

class MockHttpAdapter extends Mock implements HttpAdapter {}

void main() {
  late ProductRepository productRepository;
  late MockHttpAdapter mockHttpAdapter;

  setUp(() {
    mockHttpAdapter = MockHttpAdapter();
    productRepository = ProductRepositoryImpl(httpAdapters: mockHttpAdapter);
  });

  final jsonList = [
    {
      "id": 1,
      "title": "Fjallraven Backpack",
      "price": 109.95,
      "description": "Your perfect pack",
      "category": "men's clothing",
      "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png",
      "rating": {"rate": 3.9, "count": 120},
    },
  ];

  group('ProductRepository |', () {
    test(
      'Deve retornar List<ProductModel> quando a API responder 200',
      () async {
        // ARRANGE
        when(() => mockHttpAdapter.get('/products')).thenAnswer(
          (_) async => Response(
            data: jsonList,
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          ),
        );

        // ACT
        final result = await productRepository.fetchProducts();

        // ASSERT
        expect(result, isA<List<ProductModel>>());
        expect(result.first.id, 1);
        expect(result.first.title, "Fjallraven Backpack");
      },
    );

    test('Deve lançar Exception quando a API falhar', () async {
      // ARRANGE
      when(
        () => mockHttpAdapter.get('/products'),
      ).thenThrow(Exception('Erro de Rede'));

      // ACT & ASSERT
      expect(
        () => productRepository.fetchProducts(),
        throwsA(isA<Exception>()),
      );
    });
  });
}
