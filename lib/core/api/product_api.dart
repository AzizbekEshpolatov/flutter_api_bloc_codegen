import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/product_model.dart';
part 'product_api.g.dart';

@RestApi(baseUrl: "https://fakestoreapi.com")
abstract class ProductApi {
  factory ProductApi(Dio dio, {String baseUrl}) = _ProductApi;

  @GET("/products")
  Future<List<Product>> getProducts();
}
