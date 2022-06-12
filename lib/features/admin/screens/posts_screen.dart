import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/widgets/loader.dart';
import 'package:flutter_ecommerce_app/features/account/widgets/single_product.dart';
import 'package:flutter_ecommerce_app/features/admin/screens/add_product_screen.dart';
import 'package:flutter_ecommerce_app/features/admin/services/admin_services.dart';
import 'package:flutter_ecommerce_app/models/product.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final AdminServices adminServices = AdminServices();
  List<Product>? products;

  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }

  fetchAllProducts() async {
    products = await adminServices.fetchAllProducts(context);
    setState(() {});
  }

  void pushToNavigate() {
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }

  void deleteProduct(Product product, int index) {
    adminServices.deleteProduct(
        context: context,
        product: product,
        onSuccess: () {
          products!.removeAt(index);
          setState(() {});
        });
  }

  @override
  Widget build(BuildContext context) {
    return products == null
        ? const Loader()
        : Scaffold(
            body: GridView.builder(
                itemCount: products!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final productData = products![index];
                  return Column(
                    children: [
                      SizedBox(
                        height: 140,
                        child: SingleProduct(
                          image: productData.images[0],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              child: Text(
                            productData.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          )),
                          IconButton(
                              onPressed: () =>
                                  deleteProduct(productData, index),
                              icon: const Icon(Icons.delete_outline))
                        ],
                      )
                    ],
                  );
                }),
            floatingActionButton: FloatingActionButton(
              tooltip: 'Add a Product',
              onPressed: pushToNavigate,
              child: const Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
