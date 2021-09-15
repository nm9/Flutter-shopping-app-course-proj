import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {
  final Function addProduct;

  ProductControl(
      this.addProduct); //Access to passed function. Functions can be passed like variables.

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Theme.of(context).primaryColor,
      onPressed: () {
        addProduct({'title': 'chocolate', 'image': 'assets/burger.jpeg'});
      },
      child: Text('Add Product'),
    );
  }
}
