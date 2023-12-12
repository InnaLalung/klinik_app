import 'dart:ffi';
import 'dart:js_util';
import 'package:flutter/material.dart';
import 'package:klinik_app/model/poli.dart';
import 'poli_detail.dart';
import 'package:klinik_app/service/poli_service.dart';


class PoliUpdateForm extends StatefulWidget{
  final Poli poli;

  const PoliUpdateForm({Key? key,required this.poli}) :super(key: key);
  _PoliUpdateFormState createState() => _PoliUpdateFormState();
}

class _PoliUpdateFormState extends State<PoliUpdateForm>{
  final _formKey = GlobalKey<FormState>();
  final _namaPoliCtrl = TextEditingController();

  Future<Poli> getData() async {
    Poli data = await PoliService().getById(widget.poli.id.toString());
    setState(() {
      _namaPoliCtrl.text = data.namaPoli;
    });
    return data;
  }

  @override
  void initState() {
    super.initState();
    getData(); 
    }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Poli")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
          children: [_fieldNamePoli(),SizedBox(height: 20),_tombolSimpan()],
        ),
        ),
      ),
    );
  }
  _fieldNamePoli() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Poli"),
      controller: _namaPoliCtrl,
    );
  }
  _tombolSimpan() {
    return ElevatedButton(
      onPressed: () async {
        Poli poli = new Poli(namaPoli: _namaPoliCtrl.text);
        String id = widget.poli.id.toString();
        await PoliService().ubah(poli, id).then((value) {
          Navigator.pop(context);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => PoliDetail(poli: value)));
          });
      },
      child: const Text("Simpan Perubahan"));
  }
}