import 'package:flutter/material.dart';
import 'dart:async';

class ProductPage extends StatelessWidget {
  final String title;
  final String imgpath;

  ProductPage(this.title, this.imgpath);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('Button pressed');
        Navigator.pop(context,
            false); //leave page with value false, i.e., don't delete said product
        return Future.value(false); //allow user to leave page
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(imgpath),
            Container(padding: EdgeInsets.all(10.0), child: Text(title)),
            Container(
              padding: EdgeInsets.all(10.0),
              child: RaisedButton(
                color: Theme.of(context).accentColor,
                child: Text('DELETE'),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Are you sure?'),
                          content: Text('This Action cannot be undone!'),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('Cancel'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            FlatButton(
                              child: Text('Delete'),
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pop(context, true);
                              },
                            ),
                          ],
                        );
                      });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
