import '../../domain/entities/products.dart';

class ProductMemoryDataSource{

  /*
  * Si se usa una variable privada, se usa el guion bajo _
  *
  * y si es expertno se usa sin guion bajo
  * */

  final List <Products> _products = [];

  //cargamos toda la lista
  List <Products> getAll() => _products;

  //agregamos un producto
  void add(Products product) => _products.add(product);

  //actualizar
  void update (Products product){
    /* existe una función en Dart que permite modificar directamente por el id
    *  indexWhere: busca el índice del producto en la lista que coincide con el id del producto proporcionado.
    * */

    final index = _products.indexWhere((e) => e.id == product.id);

    if(index!=-1) _products[index] = product; //si lo encuentra, asigna el producto
  }

  //eliminar

  void delete (String id){
    /**
     * removeWhere: elimina todos los productos de la lista cuyo id coincide con el id proporcionado.
      */

    _products.removeWhere((e) => e.id == id);
  }



}