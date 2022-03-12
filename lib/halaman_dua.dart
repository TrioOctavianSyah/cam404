import 'package:flutter/material.dart';

class HalamanDua extends StatelessWidget {
  final String nama, alamat, notlp; //variabel nampung data dari halaman profile
  HalamanDua(this.nama, this.alamat, this.notlp); //panggil parameter diatas


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Dua'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Nama : ${this.nama}' ),
            Text('Alamat : ${this.alamat}' ),
            Text('No Tlp : ${this.notlp}' )
          ],
        ),
      )
    );
  }
}
