import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

import '../../models/injection/production.dart';

class pdfservice{
  static Future<File> generatepdf(List<productionmodel>m,String name)async{
final pdf=pw.Document();
final theme = pw.ThemeData.withFont(
    base: Font.ttf(await rootBundle.load('assets/Amiri-Regular.ttf')),
  bold: Font.ttf(await rootBundle.load('assets/Amiri-Regular.ttf')),
);



pdf.addPage( pw.MultiPage(
    theme: theme,
    textDirection: TextDirection.rtl,
    build: (context) => [
 pw.Center(child: pw.Text("تقارير قسم الحقن",style: pw.TextStyle(fontSize: 40,fontBold: Font.courier()))),
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
   static buildtable(List<productionmodel>m){


   
  

    final data=m.map((item){
return[
item.stopreason,
item.cycle_time,
item.scrap,
item.production,
item.mold,
item.machinename,
item.worker
];
}).toList();
    return  pw.Table.fromTextArray(
      headerHeight: 10,
      cellHeight: 10,
      
      columnWidths: {0:pw.FixedColumnWidth(PdfPageFormat.cm*3),
      1:pw.FixedColumnWidth(PdfPageFormat.cm*3),
      2:pw.FixedColumnWidth(PdfPageFormat.cm*3),
      3:pw.FixedColumnWidth(PdfPageFormat.cm*3),
      4:pw.FixedColumnWidth(PdfPageFormat.cm*3),
      5:pw.FixedColumnWidth(PdfPageFormat.cm*3),
      6:pw.FixedColumnWidth(PdfPageFormat.cm*3)
      
      
      },
          cellAlignment: pw.Alignment.center,
          headerAlignment: pw.Alignment.center,

          headers: [
       "الاعطال",
                     "زمن الدوره"

        "(ثانيه)"
             ,
"كمية الهالك"      
"(قطعه) " ,

               " كمية الانتاج"
               "(قطعه)",

      "اسم الاسطمبه",
              "اسم الماكينه",

               "اسم العامل",

          
          ],
          data:data);
   }
   static buildbasic(List<productionmodel>m){
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.end,
      children: [
     pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.end,
      children: [
      pw.Text(m[0].engineer),
            pw.Text(" : "),

            pw.Text("اسم المهندس")   ,

        ]) ,  
     pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.end,

      children: [
      pw.Text(m[0].shift),
      pw.Text(" : "),
            pw.Text("الورديه")   ,

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
