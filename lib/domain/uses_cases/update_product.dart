import 'package:clean_architecture/domain/entities/products.dart';

import '../repositories/products_repository.dart';

class UpdateProduct{
  final Products_Repository repository;

  UpdateProduct(this.repository);
  void call (Products product) => repository.updateProduct(product);
}