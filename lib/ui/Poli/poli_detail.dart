import 'package:flutter/material.dart';
import 'package:klinik_app/service/poli_service.dart';
import '/../model/poli.dart';
import 'poli_form_update.dart';
import 'poli_page.dart';

class PoliDetail extends StatefulWidget {
  final Poli poli;

  const PoliDetail({Key? key, required this.poli}) : super(key: key);
  _PoliDetailState createState() => _PoliDetailState();
}

class _PoliDetailState extends State<PoliDetail> {
  Stream<Poli> getData() async* {
    Poli data = await PoliService().getById(widget.poli.id.toString());
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Poli")),
      body: StreamBuilder(
        stream: getData(),
        builder: (context, AsyncSnapshot Snapshot) {
          if (Snapshot.hasError){
            return Text(Snapshot.error.toString());
          }
          if (Snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!Snapshot.hasData &&
          Snapshot.connectionState == ConnectionState.done) {
            return Text("Data Tidak DItemukan");
          }
          return Column(
            children: [
          SizedBox(height: 20),
          Text(
            "Nama Poli : ${Snapshot.data.namaPoli}",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _tombolUbah(),
              _tombolHapus(),
            ],
          )
        ],
          );
        },
    ),
    );
  }

  _tombolUbah() {
    return StreamBuilder(
      stream: getData(),
      builder: (context, AsyncSnapshot snapshot) => ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => 
                  PoliUpdateForm(poli: snapshot.data)));
        },
        style: ElevatedButton.styleFrom(primary: Colors.green),
        child: Text("Ubah")));
  }

  _tombolHapus() {
    return ElevatedButton(
        onPressed: () {
          AlertDialog alertDialog = AlertDialog(
            content: Text("Yakin ingin menghapus data ini?"),
            actions: [
              //tombol ya
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => PoliPage()));
                },
                child: Text("YA"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
              //tombol batal
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("TIDAK"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              )
            ],
          );
          showDialog(context: context, builder: (context) => alertDialog);
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        child: Text("Hapus"));
  }
}
