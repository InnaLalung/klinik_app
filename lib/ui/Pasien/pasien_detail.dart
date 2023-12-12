import 'package:flutter/material.dart';
import '/../model/pasien.dart';
import 'pasien_update_form.dart';
import 'pasien_page.dart';

class pasienDetail extends StatefulWidget {
  final Pasien pasien;

  const pasienDetail({super.key, required this.pasien});

  @override
  State<pasienDetail> createState() => _pasienDetailState();
}

class _pasienDetailState extends State<pasienDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Pasien'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "Nomor RM : ${widget.pasien.nomor_rm}",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Nama Pasien : ${widget.pasien.nama}",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Tanggal lahir : ${widget.pasien.tanggal_lahir}",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "No. Telepon : ${widget.pasien.nomor_telepon}",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Alamat : ${widget.pasien.alamat}",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [_tombolUbah(), _tombolHapus()],
          )
        ],
      ),
    );
  }

  _tombolUbah() {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      PasienUpdateForm(pasien: widget.pasien)));
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
        child: const Text("Ubah"));
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
                      MaterialPageRoute(builder: (context) => pasienPage()));
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
