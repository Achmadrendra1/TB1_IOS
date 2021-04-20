import 'package:flutter/material.dart';

class FormSeleksiScreen extends StatefulWidget {
  @override
  _FormSeleksiScreenState createState() => _FormSeleksiScreenState();
}

class JenisKelamin {
  int id;
  String jeniskelamin;
  JenisKelamin(this.id, this.jeniskelamin);

  static List<JenisKelamin> getjeniskelamin() {
    return <JenisKelamin>[
      JenisKelamin(1, 'Laki - Laki'),
      JenisKelamin(2, 'Perempuan')
    ];
  }
}

class Location {
  String lokasi;
  Location(this.lokasi);
}

class _FormSeleksiScreenState extends State<FormSeleksiScreen> {
  String DropDownValue;
  DateTime selectedDate = DateTime.now();
  TextEditingController nama = new TextEditingController();
  TextEditingController ttl = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController ipk = new TextEditingController();
  var _status;
  var _lokasi;
  final _formKey = GlobalKey<FormState>();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1950),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  //Dropdown Jenis Kelamin
  List<JenisKelamin> _jk = JenisKelamin.getjeniskelamin();
  List<DropdownMenuItem<JenisKelamin>> _menuitems;
  JenisKelamin _selectedjk;

  @override
  void initState() {
    _menuitems = buildDropdownMenuItems(_jk);
    _selectedjk = _menuitems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<JenisKelamin>> buildDropdownMenuItems(List jk) {
    List<DropdownMenuItem<JenisKelamin>> items = List();
    for (JenisKelamin jk in jk) {
      items.add(
        DropdownMenuItem(value: jk, child: Text(jk.jeniskelamin)),
      );
    }
    return items;
  }

  onChangeDropdownItem(JenisKelamin selectedjk) {
    setState(() {
      _selectedjk = selectedjk;
    });
  }

  void _submit() {
    final nilai = double.parse(ipk.value.text);
    if (nilai < 3.0) {
      _status = Text(
        "Tidak Lulus",
        style: TextStyle(
            color: Colors.red, fontSize: 40, fontWeight: FontWeight.bold),
      );
    } else {
      _status = Text(
        "Lulus",
        style: TextStyle(
            color: Colors.green, fontSize: 40, fontWeight: FontWeight.bold),
      );
    }

    AlertDialog alertDialog = new AlertDialog(
      content: Container(
        height: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Nama Lengkap :"),
            Text(
              "${nama.text}",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text("Jenis Kelamin :"),
            Text(
              "${_selectedjk.jeniskelamin}",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text("Tanggal Lahir : "),
            Text(
              "${ttl.text}",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text("Email :"),
            Text(
              "${email.text}",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text("Nilai IPK : "),
            Text(
              "${ipk.text}",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              "Status :",
            ),
            SizedBox(height: 10),
            _status,
            SizedBox(height: 10),
            RaisedButton(
              color: Colors.blue,
              child: Text("OK", style: TextStyle(color: Colors.white)),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );

    showDialog(context: context, builder: (_) => alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Input Data Diri",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: new InputDecoration(
                      labelText: "Nama Lengkap",
                      hintText: "Masukkan Nama Lengkap",
                    ),
                    controller: nama,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Nama Tidak Boleh Kosong !";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      labelText: "Jenis Kelamin",
                    ),
                    isExpanded: true,
                    value: _selectedjk,
                    items: _menuitems,
                    onChanged: onChangeDropdownItem,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: ttl,
                    decoration: InputDecoration(
                      labelText: "Tanggal Lahir",
                    ),
                    onTap: () async {
                      DateTime picked = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2101));
                      if (picked != null && picked != selectedDate)
                        setState(() {
                          selectedDate = picked;
                          var date =
                              "${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}";
                          ttl.text = date;
                        });
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Tanggal Lahir Tidak Boleh Kosong !';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: new InputDecoration(
                      labelText: "Email",
                      hintText: "Masukkan Email",
                    ),
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Email Tidak Boleh Kosong !';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: new InputDecoration(
                      labelText: "Nilai IPK",
                      hintText: "Contoh : 3.7",
                    ),
                    controller: ipk,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'IPK Tidak Boleh Kosong !';
                      }
                      return null;
                    },
                  ),
                  RaisedButton(
                      child:
                          Text("Submit", style: TextStyle(color: Colors.white)),
                      color: Colors.green,
                      onPressed: () {
                        if (_formKey.currentState.validate()) ;
                        _submit();
                      }),
                  RaisedButton(
                      child:
                          Text("Back", style: TextStyle(color: Colors.white)),
                      color: Colors.blue,
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
