import 'package:flutter/material.dart';
import 'package:klinik_app/model/poli.dart';
import 'package:klinik_app/ui/Poli/poli_detail.dart';
import '../Poli/poli_detail.dart';

class PoliForm extends StatefulWidget {
  const PoliForm({Key? key}): super(key: key);
  _PoliFormState createState() => _PoliFormState();
}

class _PoliFormState extends State<PoliForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaPoliCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tambah Poli")),
      body: SingleChildScrollView(
        child: Form(
            child: Column(
          children: [
            _fieldNamaPoli(),
            SizedBox(height: 20),
            _tombolSimpan()
          ],
        )),
      ),
    );
  }

_fieldNamaPoli(){
  return TextField(
    decoration: InputDecoration(labelText: "Nama Poli"),
    controller: _namaPoliCtrl,
  );
}
 _tombolSimpan(){
  return ElevatedButton(
    onPressed: (){
      Poli poli = Poli(namaPoli: _namaPoliCtrl.text);
      Navigator.push(context,
      MaterialPageRoute(builder: 
      (context) => PoliDetail(poli:poli))
      );
    },
    child: Text("Simpan"),
  );
 }
}
