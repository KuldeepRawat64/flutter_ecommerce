import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/widgets/custom_button.dart';
import 'package:flutter_ecommerce_app/common/widgets/custom_textfield.dart';
import 'package:flutter_ecommerce_app/constants/utils.dart';
import 'package:flutter_ecommerce_app/features/admin/services/admin_services.dart';
import '../../../constants/global_variables.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = '/add-product';
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  String category = 'Mobiles';
  List<File> images = [];
  final AdminServices adminServices = AdminServices();
  final _addProductFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
  }

  List<String> productCategories = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion'
  ];

  void sellProduct() {
    if (_addProductFormKey.currentState!.validate() && images.isNotEmpty) {
      adminServices.sellProduct(
        context: context,
        name: productNameController.text,
        description: descriptionController.text,
        price: double.parse(priceController.text),
        quantity: double.parse(quantityController.text),
        category: category,
        images: images,
      );
    }
  }

  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res.cast<File>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: GlobalVariables.appBarGradient,
              ),
            ),
            title: const Text(
              'Add Product',
              style: TextStyle(color: Colors.black),
            )),
      ),
      body: SingleChildScrollView(
          child: Form(
              key: _addProductFormKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    const SizedBox(height: 15.0),
                    images.isNotEmpty
                        ? CarouselSlider(
                            items: images
                                .map(
                                  (i) => Builder(
                                    builder: (BuildContext context) =>
                                        Image.file(
                                      i,
                                      fit: BoxFit.cover,
                                      height: 200.0,
                                    ),
                                  ),
                                )
                                .toList(),
                            options: CarouselOptions(
                                viewportFraction: 1.0, height: 200.0),
                          )
                        : GestureDetector(
                            onTap: selectImages,
                            child: DottedBorder(
                              strokeCap: StrokeCap.round,
                              dashPattern: const [10, 4],
                              radius: const Radius.circular(10.0),
                              borderType: BorderType.RRect,
                              child: Container(
                                width: double.infinity,
                                height: 150.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.folder_open,
                                      size: 40.0,
                                    ),
                                    const SizedBox(
                                      height: 15.0,
                                    ),
                                    Text(
                                      'Select Product Images',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.grey.shade400,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                    const SizedBox(height: 30.0),
                    CustomTextField(
                        controller: productNameController,
                        hintText: 'Product Name'),
                    const SizedBox(height: 10.0),
                    CustomTextField(
                        maxLines: 7,
                        controller: descriptionController,
                        hintText: 'Description'),
                    const SizedBox(height: 10.0),
                    CustomTextField(
                        controller: priceController, hintText: 'Price'),
                    const SizedBox(height: 10.0),
                    CustomTextField(
                        controller: quantityController, hintText: 'Quantity'),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      width: double.infinity,
                      child: DropdownButton(
                        value: category,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: productCategories.map((String item) {
                          return DropdownMenuItem(
                              value: item, child: Text(item));
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            category = newValue!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    CustomButton(text: 'Sell', onPressed: sellProduct)
                  ],
                ),
              ))),
    );
  }
}
