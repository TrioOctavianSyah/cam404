import 'dart:ui';

import 'package:flutter/material.dart';

class CamLoc extends StatelessWidget {

  //fungsi kelas judul dibuat
  Widget textJudulProdile()=>const Text('Pakai Kamera dan Lokasi',
      style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.blue
      )
  );

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Kamera dan Lokasi'),
        backgroundColor: Colors.green,
      ),
      body: Container(
          child: Center(
            child: Column(
              children: [
                textJudulProdile(),
                Image.asset('img/luffy.jpg', width: 100, height: 100,)
              ],

            ),
          ),
        ),
    );
  }
}