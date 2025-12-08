import 'package:flutestadosycleanarchiejemdos/data/datasources/product_memory_datasource.dart';
import 'package:flutestadosycleanarchiejemdos/data/repositories/product_repository_impl.dart';
import 'package:flutestadosycleanarchiejemdos/presentation/layouts/product_detail_page.dart';
import 'package:flutestadosycleanarchiejemdos/presentation/layouts/product_list_page.dart';
import 'package:flutestadosycleanarchiejemdos/presentation/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'domain/usecases/add_product.dart';
import 'domain/usecases/delete_product.dart';
import 'domain/usecases/get_products.dart';
import 'domain/usecases/update_product.dart';

void main() {
  final datasource  = ProductMemoryDatasource();
  final repository = ProductRepositoryImpl(datasource);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>
            ProductoProvider(
            getProductsUseCase: GetProductos(repository),
            addProductUseCase: AddProduct(repository),
            updateProductUseCase: UpdateProduct(repository),
            deleteProductUseCase: DeleteProduct(repository),
            ),
        ),
      ],
      child: const MainApp(),
    )
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clean Architecture - productos',
      initialRoute: '/',
      routes: {
        '/': (context) => const ProductListPage(),
        '/detail': (context) => const ProductDetailPage(),
        },
     /* home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),*/
    );
  }
}
