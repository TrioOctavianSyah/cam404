import 'dart:ui';

import 'package:cam404/halaman_dua.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

  class Profile extends StatelessWidget {
    late TextEditingController txtNama, txtAlamat, txtNotlp;

    Profile(){
      txtNama = new TextEditingController();
      txtAlamat = new TextEditingController();
      txtNotlp = new TextEditingController();
    }

    //fungsi kelas judul dibuat
    Widget textJudulProdile()=>const Text('hello',
        style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.blue
        )
    );

    Widget cardFormData()=>Card(
      elevation: 8,
      margin: const EdgeInsets.all(10),
      child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textJudulProdile(), //fungsi dipanggil
              selamatDatang(),  //fungsi dipanggil diatas
              inputNama(),
              inputAlamat(),
              inputNoHp(),
            ],
          )
      ),
    );

    // fungsi kelas judul dibuat
    Widget selamatDatang()=> const Text('slemat datang',
        style: TextStyle(color: Colors.amber,
        fontWeight: FontWeight.bold
        ),
    );

    Widget inputNama()=>TextFormField(
      controller: txtNama,
      decoration: const InputDecoration(
        label: Text('Nama Lengkap'),
        icon: Icon(Icons.account_circle_outlined, color: Colors.blue,),
      ),
    );

    Widget inputAlamat()=>TextFormField(
      controller: txtAlamat,
      maxLines: 2,
      decoration: const InputDecoration(
        label: Text('Alamat'),
        icon: Icon(Icons.location_on_outlined,color: Colors.blue,)
      ),
    );

    Widget inputNoHp()=>TextFormField(
      controller: txtNotlp,
      keyboardType: TextInputType.phone,
      decoration: const InputDecoration(
        label: Text('No Hp'),
        icon: Icon(Icons.local_phone_outlined, color: Colors.blue,)
      ),
    );

    Widget tombolSimpan(BuildContext context)=>ElevatedButton.icon(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (a) {
                return HalamanDua(
                    txtNama.value.text,
                    txtAlamat.value.text,
                    txtAlamat.value.text
                );
              })
          );
    },
        icon: const Icon(Icons.save),
        label: const Text('Simpan')
    );

    @override
    Widget build(BuildContext context) {

      return Scaffold(
          appBar: AppBar(
            title: Text('Profile'),
            backgroundColor: Colors.red,
          ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  cardFormData(),
                  SizedBox(height: 50,),
                  tombolSimpan(context),
                ],
              ),
            ),
      );
    }
  }