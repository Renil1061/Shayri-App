import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shayriappp/second%20page.dart';

void main() {
  runApp(MaterialApp(
    home: FirstPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  // ListView
  // ListView.Builder

  List<String> cat_list = [
    "Ghazal",
    "Nazm",
    "Rubaiyat",
    "Marsiya",
    "Hasya ",
    "Sad ",
    "Romantic ",
  ];

  List<String> cat_list2 = [
    "Ghazal padhne ke lie yaha click kare",
    "zaalim padhne ke lie yaha click kare",
    "Rubaiyat padhne ke lie yaha click kare",
    "Marsiya padhne ke lie yaha click kare",
    "Hasya padhne ke lie yaha click kare",
    "Sad padhne ke lie yaha click kare",
    "Romantic padhne ke lie yaha click kare",
  ];

  @override
  void initState() {
    super.initState();
    permissionn();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade700,
      appBar: AppBar(
        centerTitle: true,
        title: Text("𝕊ℍ𝔸𝕐𝔸ℝ𝕀"),
        backgroundColor: Colors.black,
        shape: Border.all(width: 5, color: Colors.grey.shade900),
      ),
      body: ListView.builder(
        itemCount: cat_list.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return sec(cat_list, index);
                  },
                ));
              },
              shape: BeveledRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 2)),
              tileColor: Colors.black,
              title: Text("${cat_list[index]}",
                  style: TextStyle(color: Colors.white)),
              subtitle: Text(
                "${cat_list2[index]}",
                style: TextStyle(color: Colors.white30),
              ),
              trailing: Icon(
                Icons.arrow_right,
                color: Colors.white30,
              ),
              leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                    "Imagesss/ग़ज़ल${index + 1}.jpg",
                  )),
              // leading: Container(
              //   height: 50,
              //   width: 50,
              //   decoration: BoxDecoration(
              //       shape: BoxShape.circle,
              //       image: DecorationImage(image: AssetImage("Imagesss/img1.jpeg"))),
              //   // child: Image.asset("Imagesss/img1.jpeg"),
              // ),
            ),
          );
        },
      ),
    );
  }

  Future<void> permissionn() async {
    var status = await Permission.photos.status;
    if (status.isDenied) {
      Permission.photos.request();
    }
  }
}
