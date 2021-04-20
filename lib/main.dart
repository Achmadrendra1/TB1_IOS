import 'package:flutter/material.dart';
import 'package:tb_1_achmad_rendra_artama_41818110049/calc.dart';
import 'package:tb_1_achmad_rendra_artama_41818110049/form_seleksi.dart';

void main() {
  runApp(MyApp());
}

const String _title = 'Tugas Besar 1';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TB1 Achmad Rendra Artama 41818110049',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            _images(),
            SizedBox(
              height: 30,
            ),
            Text(
              "Achmad Rendra Artama",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(
              "41818110049",
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 40,
              width: 120,
              child: RaisedButton(
                  child: Text(
                    "Calculator",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CalcScreen()));
                  }),
            ),
            SizedBox(height: 10),
            Container(
              width: 120,
              height: 40,
              child: RaisedButton(
                  padding: EdgeInsets.all(1),
                  child: Text(
                    "Form Seleksi",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FormSeleksiScreen()));
                  }),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _images() {
  return Image.asset(
    'images/logo_umb.png',
    width: 350,
    height: 125,
  );
}
