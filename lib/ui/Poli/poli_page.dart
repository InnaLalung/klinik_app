//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:klinik_app/model/poli.dart';
import 'package:klinik_app/service/poli_service.dart';
import '../Poli/poli_detail.dart';
import '../Poli/poli_form.dart';
import '../Poli/poli_item.dart';
import '../widget/sidebar.dart';

class PoliPage extends StatefulWidget {
  const PoliPage({Key? key}): super(key: key);
  _PoliPageState createState() => _PoliPageState();
}

class _PoliPageState extends State<PoliPage> {
  Stream<List<Poli>> getList() async* {
  List<Poli> data = await PoliService().ListData();
  yield data;
  }
  Future refreshData() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      getList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: const Text("Data Poli"),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => PoliForm()));
            },
          )
        ],
      ),
      body: StreamBuilder(
        stream: getList(),
        builder: (context, AsyncSnapshot AsyncSnapshot) {
          if (AsyncSnapshot.hasError) {
            return Text(AsyncSnapshot.error.toString());
          }
          if (AsyncSnapshot.connectionState != ConnectionState.done){
            return Center(
              child: CircularProgressIndicator(),
            );
          }  
            if (!AsyncSnapshot.hasData &&
            AsyncSnapshot.connectionState == ConnectionState.done){
              return Text( "Data Kosong");
            }
            return ListView.builder(
              itemCount: AsyncSnapshot.data.length,
              itemBuilder: (context, index) {
                return PoliItem(poli: AsyncSnapshot.data[index]);
              },
            ); 
       },     
    ),
    );
  }
}
  
