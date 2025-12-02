

import '../repositories/products_repository.dart';

class getProducts {
  final Products_Repository repository;
  getProducts(this.repository);

  /*
  * call: Llama al metodo getProducts del repositorio para obtener la lista de productos.
  * es una función directa de Kotlin
  * */

  List call()=> repository.getProducts();
}