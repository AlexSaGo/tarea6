import 'package:flutter/material.dart';

class ToolboxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'lib/images/cajaHerramientas.jpg',
            width: 200,
            height: 200,
          ),
          SizedBox(height: 20),
          Text(
            'Herramientas App',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Esta es una caja de herramientas',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}