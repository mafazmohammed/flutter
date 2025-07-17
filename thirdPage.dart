import 'package:flutter/material.dart';

class MyThirdPage extends StatelessWidget {
  const MyThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ListView',
          style: TextStyle(fontFamily: 'Impact', fontSize: 35),
        ),
        backgroundColor: Colors.pink,
      ),
      body: ListView(
        children: [
          ListTile(leading: Icon(Icons.wb_sunny), title: Text('sun')),
          ListTile(leading: Icon(Icons.nightlight), title: Text('moon')),
          ListTile(leading: Icon(Icons.star), title: Text('star')),
        ],
      ),
    );
  }
}
