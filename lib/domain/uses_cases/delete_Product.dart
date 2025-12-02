import '../repositories/products_repository.dart';

class DeleteProduct{
   final Products_Repository repository;
  DeleteProduct(this.repository);
  void call (String id) => repository.deleteProduct(id);
}