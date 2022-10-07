import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:listview_dio_test123/xdsa.dart';

class Kizartmasi extends StatefulWidget {
  const Kizartmasi({super.key});

  @override
  State<Kizartmasi> createState() => _KizartmasiState();
}

class _KizartmasiState extends State<Kizartmasi> {
  final Dio dio = Dio();
  final String url = 'https://jsonplaceholder.typicode.com/albums';
  List <DenemeModel>albums = [];

  Future<void> getData() async {
    var response = await dio.get(url);
    if(
    response.statusCode == HttpStatus.ok
    ){
      var data = response.data;
      if (data is List){
        setState(() {
          albums = data.map((e) => DenemeModel.fromJson(e)).toList();
        });
      }

    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Listview with dio'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: ListView.builder(
        itemCount: albums.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Text(albums[index].id.toString()),
            title: Text(albums[index].title.toString()),
            trailing: Icon(Icons.music_note),
          );
        },
      ),
    );
  }
}
