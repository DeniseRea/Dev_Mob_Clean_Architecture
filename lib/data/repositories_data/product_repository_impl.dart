/*
*
*
* */

import 'package:clean_architecture/data/datasources/product_memory_datasources.dart';

import '../../domain/entities/products.dart';


class ProductRepositoryImpl{
  final ProductMemoryDataSource _dataSource;

  ProductRepositoryImpl(this._dataSource);

  @override
  List <Products> getProducts() => _dataSource.getAll();

  @override
  void addProduct(Products product) => _dataSource.add(product);

  @override
  void updateProduct(Products product) => _dataSource.update(product);

  @override
  void deleteProduct(String id) => _dataSource.delete(id);
}