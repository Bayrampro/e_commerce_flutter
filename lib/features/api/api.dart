import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import 'models/models.dart';

part 'api.g.dart';

@RestApi(baseUrl: 'http://127.0.0.1:8000/api/v1')
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

  @POST("/auth/users/")
  Future<void> signUp(@Body() Map<String, dynamic> body);

  @POST("/token/")
  Future<AuthResponse> signIn(@Body() Map<String, dynamic> body);

  @POST("/token/refresh/")
  Future<AuthResponse> refreshToken(@Body() Map<String, dynamic> body);

  @POST("/auth/verify/")
  Future<void> verify(@Body() Map<String, dynamic> body);

  @POST("/password-reset/request/")
  Future<void> passwordResetRequest(@Body() Map<String, dynamic> body);

  @POST("/password-reset/confirm/")
  Future<void> passwordResetConfirm(@Body() Map<String, dynamic> body);

  @POST("/auth/google/")
  Future<AuthResponse> authWithGoogle(@Body() Map<String, dynamic> body);
}
