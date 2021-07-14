import 'package:flutter/material.dart';

class Configurations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      padding: EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.person_sharp,
            size: 200,
            color: Colors.white38,
          ),
          Text(
            'Este es tu perfil',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, color: Colors.white60),
          ),
        ],
      ),
    ));
  }
}
