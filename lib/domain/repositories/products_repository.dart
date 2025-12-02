/*
*  Repository for managing product data.
* */

import '../entities/products.dart';

abstract class Products_Repository {
  List <Products> getProducts();
  void addProduct(Products product);
  void updateProduct(Products product);
  void deleteProduct(String id);

}