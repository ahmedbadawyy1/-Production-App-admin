import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoopp/controller/home_controller.dart';
import 'package:shoopp/widgets/dropdown_btn.dart';

class AddNewProduct extends StatelessWidget {
  const AddNewProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Add Product"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(15),
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Add New Product",
                  style: TextStyle(
                    color: Colors.indigoAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: ctrl.productNameCtrl,
                  decoration: InputDecoration(
                      label: Text("Product Name"),
                      hintText: 'Enter Your Product Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 12,
                ),
                TextField(
                  controller: ctrl.productDescriptionCtrl,
                  decoration: InputDecoration(
                    label: Text("Description"),
                    hintText: 'Enter Your Description',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  maxLines: 4,
                ),
                SizedBox(
                  height: 12,
                ),
                TextField(
                  controller: ctrl.productImgCtrl,
                  decoration: InputDecoration(
                      label: Text("Image Url"),
                      hintText: 'Upload Your Image Url',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 12,
                ),
                TextField(
                  controller: ctrl.productPriceCtrl,
                  decoration: InputDecoration(
                      label: Text("Product Price"),
                      hintText: 'Enter Your Price',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                        child: DropDownBtn(
                      items: ['Boots', 'Shoe', 'Beach Shoes', 'High heels'],
                      SelectedItem: ctrl.category,
                      onSelected: (selectedValue) {
                        ctrl.category = selectedValue ?? 'general';
                        ctrl.update();
                      },
                    )),
                    Flexible(
                        child: DropDownBtn(
                      items: ['Puma', 'Sketchers', 'Adidas', 'Clarks'],
                      SelectedItem: ctrl.brand,
                      onSelected: (selectedValue) {
                        ctrl.brand = selectedValue ?? 'unbranded';
                        ctrl.update();
                      },
                    )),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Offer Product?",
                ),
                SizedBox(
                  height: 12,
                ),
                DropDownBtn(
                  items: ['true', 'false'],
                  SelectedItem: ctrl.offer.toString(),
                  onSelected: (selectedValue) {
                    ctrl.offer =
                        bool.tryParse(selectedValue ?? 'false') ?? false;
                    ctrl.update();
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigoAccent,
                        foregroundColor: Colors.white),
                    onPressed: () {
                      ctrl.addProduct();
                    },
                    child: Text("Add product")),
              ],
            ),
          ),
        ),
      );
    });
  }
}
