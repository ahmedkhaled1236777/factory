
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fac_app/providers/scanner.dart';
import 'package:fac_app/providers/typesprovider.dart';
import 'package:fac_app/services/sharedprefrences/sharedprefrence.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:barcode/barcode.dart' as br;
import 'package:barcode_widget/barcode_widget.dart'as ss;
import 'package:gallery_saver/gallery_saver.dart';

// ignore: empty_constructor_bodies
class model{
  String ?name;
  String? amount;
  String ?price;
  model(this.name,this.amount,this.price);
  factory model.fromjson(var data){
    return model(data["name"], data["amount"], data["price"]);
  }
}

class scaner extends StatefulWidget{

 final String pagename;

  const scaner({super.key,required this.pagename});

  @override
  State<scaner> createState() => _nerState();
}

class _nerState extends State<scaner> {

    Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
    void _onQRViewCreated(QRViewController controller) {
    
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((Data) {
  if(widget.pagename=="types")   Provider.of<typesprovider>(context,listen: false).changeallvalues(Data.code);
  else if(widget.pagename=="completeproduct")   Provider.of<scanerprovider>(context,listen: false).changeallvalues(Data.code);
           
         else        Provider.of<typesprovider>(context,listen: false).searchformaterialscanner(Data.code);

     setState(() {
      
    });
    if (mounted) {
     
Navigator.pop(context);
}
    });

  }
   
  @override
  Widget build(BuildContext context) {
      var Area =300.0;
    return Scaffold(body:  SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
        overlay: QrScannerOverlayShape(
            borderColor: Colors.red,
            borderRadius: 10,
            borderLength: 30,
            borderWidth: 10,
            cutOutSize: Area),
       ),
    ));
       
            

  }}
  