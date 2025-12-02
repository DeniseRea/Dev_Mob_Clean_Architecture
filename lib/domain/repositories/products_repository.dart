/*
*  Repository for managing product data.
*
*  Llamado contrato del repositorio, se implementa en la capa de datos
* */

import '../entities/products.dart';

abstract class Products_Repository {
  List <Products> getProducts();
  void addProduct(Products product);
  void updateProduct(Products product);
  void deleteProduct(String id);

}