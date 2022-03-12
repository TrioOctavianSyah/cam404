import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class CamLoc extends StatefulWidget {

  @override
  State<CamLoc> createState() => _CamLocState();
}

class _CamLocState extends State<CamLoc> {
  File? filephoto;
  Position? position;

  @override
  void initState(){
    super.initState();

    Geolocator.checkPermission().then((value) async{
      if (value == LocationPermission.denied){
        await Geolocator.requestPermission();
      }

      try {
        Geolocator.getPositionStream().listen((event) {
          position = event;
          setState(() {});

        });

      } catch(e){}
    });
  }

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
      body: Column(
        children: [
          textJudulProdile(),
          Center(
            child: Visibility(
              visible: filephoto != null,
              child: Column(
                children: [
                  Image.file(filephoto ?? File(''),
                      width: 100, height: 100,
                  ),

                  ElevatedButton.icon(onPressed: (){
                    filephoto = null;
                    setState(() {});

                  }, icon: const Icon(Icons.delete),
                      label: const Text("Hapus Gambar"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red
                    ),
                  ),
                  Text('${position?.latitude}, ${position?.longitude}'),
                ],
              ),


              replacement: ElevatedButton.icon(onPressed: ()async {
                bool izin = await Permission.camera.isGranted;
                  if (izin == false){
                    final status = await Permission.camera.request();
                    izin = (status == PermissionStatus.granted);
              }

              if (izin == true){
                final f = await ImagePicker().pickImage(source: ImageSource.camera, maxHeight: 600, maxWidth: 600
                );
                if (f != null ){
                  filephoto = File(f.path);
                    setState(() {});
                }
              }
              }, icon: Icon(FontAwesomeIcons.camera), label: Text ('Kamera')
              ), // ElevatedButton.icon
            ),
          ),
        ],
      ),
    );
  }
}