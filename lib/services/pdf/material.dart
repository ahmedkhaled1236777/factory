import 'dart:io';

import 'package:fac_app/models/material/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';


class materialpdf{
  static Future<File> generatepdf(List<materialmodel>m,String name)async{
final pdf=pw.Document();
final theme = pw.ThemeData.withFont(
    base: Font.ttf(await rootBundle.load('assets/Amiri-Regular.ttf')),
  bold: Font.ttf(await rootBundle.load('assets/Amiri-Regular.ttf')),
);



pdf.addPage( pw.MultiPage(
    theme: theme,
    textDirection: TextDirection.rtl,
    build: (context) => [
 pw.Center(child: pw.Text("تقارير مخزن الخامه",style: pw.TextStyle(fontSize: 40,fontBold: Font.courier()))),
pw.SizedBox(height: 10),
buildbasic(m),
pw.SizedBox(height: 10),
  buildtable(m),

],));
  
 
 return await savepdf(name, pdf);
   
 }
static Future<File> savepdf(String filename,pw.Document pdf)async{
  final bytes=await pdf.save();
  var dir=await getExternalStorageDirectory();
  final file= File('${dir!.path}/$filename.pdf');
  await file.writeAsBytes(bytes);
  return file;
  

  
  
   }
   static Future openfile(File file)async{
    final url=file.path;
   return await OpenFile.open(url);
   }
   static buildtable(List<materialmodel>m){


   
  

    final data=m.map((item){
return[

item.quantity,
item.material
];
}).toList();
    return  pw.Table.fromTextArray(
      headerHeight: 10,
      cellHeight: 10,
      
      
     
      
      
      
          cellAlignment: pw.Alignment.center,
          headerAlignment: pw.Alignment.center,

          headers: [
      
              "الكميه",

               "اسم الخامه",

          
          ],
          data:data);
   }
   static buildbasic(List<materialmodel>m){
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.end,
      children: [
     pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.end,
      children: [
      pw.Text(m[0].engineer),
            pw.Text(" : "),

            pw.Text("اسم امين المخزن")   ,

        ]) ,  
    
     pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.end,

      children: [
      pw.Text(m[0].date),
            pw.Text(" : "),

            pw.Text("التاريخ")   ,

        ]) ,  
      
           ]);
   }
   
   }
