/*
* Se hereda de ChangeNotifier para notificar a los widgets que escuchan sobre cambios en el estado.
* */

import 'package:clean_architecture/domain/uses_cases/add_product.dart';
import 'package:clean_architecture/domain/uses_cases/delete_Product.dart';
import 'package:clean_architecture/domain/uses_cases/get_products.dart';
import 'package:clean_architecture/domain/uses_cases/update_product.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider extends ChangeNotifier {
  /*
  * llamamos a todos los casos de uso que hayan sido creados
  * */

  final getProducts getProductsUseCase;
  final Add_Product addProductUseCase;
  final DeleteProduct deleteProductUseCase;
  final UpdateProduct updateProductUseCase;

  ProductProvider({
    required this.getProductsUseCase,
    required this.addProductUseCase,
    required this.deleteProductUseCase,
    required this.updateProductUseCase,
  });


  List get Products => getProductsUseCase();
  void addProduct(product){
    addProductUseCase(product);
    notifyListeners(); //notifica a los widgets que escuchan sobre cambios en el estado.
  }

  void deleteProduct(String id){
    deleteProductUseCase(id);
    notifyListeners();
  }


  void updateProduct(product) {
    updateProductUseCase(product);
    notifyListeners();
  }
}