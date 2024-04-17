
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoopp/model/products/product.dart';

class HomeController extends GetxController {

// conntect this to fire base
  FirebaseFirestore firestore = FirebaseFirestore.instance;

// to go to the collection which youneed to read or write ده متغير بتسجل فيه علشان تروح تروح الي الجدول الي انت عايزه
  late CollectionReference productCollection;

  TextEditingController productNameCtrl = TextEditingController();
  TextEditingController productDescriptionCtrl = TextEditingController();
  TextEditingController productImgCtrl = TextEditingController();
  TextEditingController productPriceCtrl = TextEditingController();

  String category = 'general';
  String brand = 'un brand';
  bool offer = false;

  List<Product> products = [];

@override
  Future<void> onInit() async {
    productCollection = firestore.collection("products");
   await fetchProducts();
    super.onInit();
  }


  addProduct() {
    try {
      DocumentReference doc = productCollection.doc();
      Product product = Product(
        id: doc.id,
        name: productNameCtrl.text,
        category: category,
        description: productDescriptionCtrl.text ,
        price: double.tryParse(productPriceCtrl.text),
        brand: brand,
        image: productImgCtrl.text,
        offer: offer,
      );
      final productJson = product.toJson();
      doc.set(productJson);
      Get.snackbar("Success", 'product added successfully', colorText: Colors.green);
      setValuesDefault();
    } catch (e) {
      Get.snackbar("error",e.toString() , colorText: Colors.red);
      print(e);
    }
  }

  setValuesDefault(){
  productNameCtrl.clear();
  productDescriptionCtrl.clear();
  productImgCtrl.clear();
  productPriceCtrl.clear();

  category = 'general';
  brand = 'un branded';
  offer = false;
  update();
  }

  fetchProducts() async {
  try {
    QuerySnapshot productSnapshot = await productCollection.get();
    final List<Product> retrievedProducts = productSnapshot.docs.map((doc) =>
      Product.fromJson(doc.data() as Map<String, dynamic>)).toList();
    products.clear();
    products.assignAll(retrievedProducts);
    Get.snackbar("Success", 'product fetch successfully', colorText: Colors.green);
  } catch (e) {
    Get.snackbar("error", e.toString(), colorText: Colors.red);
    print(e);
  }
  }

  deleteProduct(String id) async {

  try {
    await productCollection.doc(id).delete();
    fetchProducts();
    Get.snackbar("Success", 'product deleted successfully', colorText: Colors.green);
  } catch (e) {
    Get.snackbar("error", e.toString(), colorText: Colors.red);
    print(e);
  }finally{
    update();
  }

  }



}

