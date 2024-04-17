import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoopp/controller/home_controller.dart';
import 'package:shoopp/pages/add_new_product.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Footware Admin"),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: ctrl.products.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(ctrl.products[index].name ?? ''),
                subtitle: Text((ctrl.products[index].price ?? 0).toString()),
                trailing: IconButton(
                  onPressed: () {
                    ctrl.deleteProduct(
                        (ctrl.products[index].id ?? 0).toString());
                    ctrl.fetchProducts();
                  },
                  icon: Icon(
                    Icons.delete,
                  ),
                ),
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(AddNewProduct());
          },
          child: Icon(Icons.add),
        ),
      );
    });
  }
}
