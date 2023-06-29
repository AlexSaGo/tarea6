import 'package:flutter/material.dart';

class contactMe extends StatelessWidget {
  const contactMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
              width: double.infinity,
              height: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            Container(
              width: double.maxFinite,
              height: 850,
              child: Stack(
                children: [
                  //Foto 
                  Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('lib/images/Profile_Picture.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  //Información sobre Alex + Card

                  Positioned(
                    top: 280,
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(children: [
                            Text("Alex Gabriel Santiago González",
                                style: TextStyle(
                                    fontSize: 23,
                                    color: Colors.blue[400],
                                    fontWeight: FontWeight.bold)),
                          ]),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child: Icon(Icons.location_on_outlined),
                                    ),
                                    Text('Santo Domingo'),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 17, bottom: 17),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 10),
                                        child: Icon(Icons.email_outlined),
                                      ),
                                      Text("20210191@itla.edu.do"),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child: Icon(Icons.phone),
                                    ),
                                    Text(
                                      ("829-795-2108"),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            child: Divider(
                              color: Colors.grey[300], // Color de la línea
                              indent: 10, // Sangría izquierda de la línea
                              endIndent: 10, // Sangría derecha de la línea
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Descripción',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 40),
                                  child: Text(
                                    "Programador y diseñador.",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey[400]),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
