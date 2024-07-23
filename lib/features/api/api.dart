import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'models/models.dart';

part 'api.g.dart';

@RestApi(baseUrl: 'https://eshop2024.pythonanywhere.com/api/v1')
abstract class ProductsApiClient {
  factory ProductsApiClient(Dio dio, {String baseUrl}) = _ProductsApiClient;

  @GET('/all-products')
  Future<List<Product>> getProducts();

  @GET('/all-products/{slug}')
  Future<Product> getProductsDetails(@Path('slug') String slug);

  @GET('/products-by-category')
  Future<List<Category>> getCategories();

  @GET('/categories/{slug}')
  Future<List<Product>> getCategoriesDetails(@Path('slug') String slug);

  @GET('/search/{query}')
  Future<List<Product>> searchProducts(@Path('query') String query);

  @GET('/new-products')
  Future<List<Product>> getNewProducts();
}
