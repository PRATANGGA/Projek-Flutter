import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Map<dynamic, dynamic>> mylist = [
    {
      "Nama": "Masakan Padang",
      "Makanan": [
        "Rendang",
        "Ayam Bakar",
        "Ati Ampela",
        "Tambosu",
        "Telur Ikan",
        "Udang Goreng",
        "Kepala Kakap"
      ],
      "Email": "pratanggajulang31@gmail.com",
      "NomorHP": "+1234567890",
      "WhatsApp": "+6287736947833",
      "Alamat": "Jl. Contoh No. 123, Semarang",
      "JamBuka": "Senin - Sabtu: 10.00 - 22.00, Minggu: 12.00 - 20.00",
      "Latitude": -7.024542,
      "Longitude": 110.431705,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Restaurant"),
        ),
        body: ListView(
          children: mylist.map((data) {
            List menu = data['Makanan'];
            String email = data['Email'];
            String nomorHP = data['NomorHP'];
            String whatsapp = data['WhatsApp'];
            String alamat = data['Alamat'];
            String jamBuka = data['JamBuka'];
            double latitude = data['Latitude'];
            double longitude = data['Longitude'];
            return Card(
              color: Color.fromRGBO(253, 213, 13, 0.965),
              margin: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Image.asset(
                    'images/warung.jpg',
                    fit: BoxFit.cover,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Icon(
                          Icons.food_bank_rounded,
                          size: 40,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Masakan Padang",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text("Trio Minang"),
                        ],
                      )
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: menu.map((makanan) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(242, 156, 7, 0.965),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          padding: EdgeInsets.all(10),
                          child: Text(makanan),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: Icon(Icons.phone),
                        onPressed: () {
                          _makePhoneCall(nomorHP);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.email),
                        onPressed: () {
                          _sendEmail(email);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.message),
                        onPressed: () {
                          _sendWhatsAppMessage(whatsapp);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.map),
                        onPressed: () {
                          _openMap(latitude, longitude);
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text("Alamat"),
                    subtitle: Text(alamat),
                  ),
                  ListTile(
                    leading: Icon(Icons.access_time),
                    title: Text("Jam Buka"),
                    subtitle: Text(jamBuka),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  void _makePhoneCall(String phoneNumber) {
    final Uri _phoneLaunchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    //launch(_phoneLaunchUri.toString());
  }

  void _sendEmail(String email) {
    final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    //launch(_emailLaunchUri.toString());
  }

  void _sendWhatsAppMessage(String whatsapp) {
    final Uri _whatsappLaunchUri = Uri(
      scheme: 'https',
      host: 'wa.me',
      path: whatsapp,
    );
    //launch(_whatsappLaunchUri.toString());
  }

  void _openMap(double latitude, double longitude) {
    final Uri _mapLaunchUri = Uri(
      scheme: 'geo',
      query: '$latitude,$longitude',
    );
    //launch(_mapLaunchUri.toString());
  }
}
