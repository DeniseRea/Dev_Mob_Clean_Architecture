

import '../entities/products.dart';
import '../repositories/products_repository.dart';

class Add_Product{
  final Products_Repository repository;
  Add_Product(this.repository);

  /*
  * call: Llama al metodo getProducts del repositorio para obtener la lista de productos.
  * es una función directa de Kotlin
  * */

  void call(Products product) => repository.addProduct(product);


}