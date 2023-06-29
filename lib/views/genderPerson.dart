// import 'package:flutter/material.dart';

// class genderPerson extends StatefulWidget {
//   const genderPerson({super.key});

//   @override
//   State<genderPerson> createState() => _genderPersonState();
// }

// class _genderPersonState extends State<genderPerson> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class GenderScreen extends StatefulWidget {
  @override
  _GenderScreenState createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  String name = '';
  String gender = '';
  bool isLoading = false;

  Future<void> getGender() async {
    setState(() {
      isLoading = true;
    });

    final response = await http.get(Uri.parse('https://api.genderize.io/?name=$name'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final fetchedGender = data['gender'];
      setState(() {
        gender = fetchedGender;
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      throw Exception('Failed to fetch gender');
    }
  }

  Color getContainerColor() {
    if (gender == 'male') {
      return Colors.blue;
    } else if (gender == 'female') {
      return Colors.pink;
    } else {
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Predicción de genero'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Escriba su nombre',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                getGender();
              },
              child: Text('Predecir'),
            ),
            SizedBox(height: 16.0),
            Container(
              width: 200.0,
              height: 200.0,
              color: getContainerColor(),
              alignment: Alignment.center,
              child: Text(
                'Gender: $gender',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
