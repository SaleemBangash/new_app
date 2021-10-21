import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:new_app/utils/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Catalog App",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Container(
          child: Text('Welcome Here'),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
