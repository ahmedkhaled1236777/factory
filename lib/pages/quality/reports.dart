import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/providers/qualityprovider.dart';
import 'package:fac_app/providers/shiftsprovider.dart';
import 'package:fac_app/services/pdf/pdf.dart';
import 'package:fac_app/widgets/containerquality.dart';
import 'package:fac_app/widgets/datebutton.dart';
import 'package:fac_app/widgets/dropdown.dart';
import 'package:fac_app/widgets/removeoradd.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:fac_app/services/pdf/qualitypdf.dart';

import '../../widgets/gradient.dart';

class qualityreports extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
          var prov=Provider.of<qualityprovider>(context);

    return  Padding(
                    padding: const EdgeInsets.only(left: 5,right: 5,bottom: 5),
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        
                        prov.reports .isEmpty?Container(width: double.infinity,child: Center(child: Center(child: Lottie.asset("images/nodata.json"),),),) : containerquality(data: Provider.of<qualityprovider>(context).reports),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                              if(Provider.of<qualityprovider>(context,listen: false ).reports.isNotEmpty  )                       CircleAvatar(backgroundColor: Colors.purple,
                                child: IconButton(onPressed: () async {
                                                        
                                           File file=await qualitypdf.generatepdf(Provider.of<qualityprovider>(context,listen: false).reports,"quality");
                                          await pdfservice.openfile(file);}
                                                        , icon: Icon(Icons.picture_as_pdf,color: Colors.white,)),
                              )
                                                    ,SizedBox(width: 5,)
                                                     , CircleAvatar(
                                                      backgroundColor: Colors.purple,
                                                       child: IconButton(onPressed: (){
                                                          showDialog(context: context, builder: ((context) {
                                                                            return AlertDialog(title: Center(child: Text("choosedateandshift".tr(),style: TextStyle(),softWrap: true,overflow: TextOverflow.ellipsis,)),actions: [
                                                                              datebutton(onpressed: (){
                                                                          Provider.of<qualityprovider>(context,listen: false).chagedate(context);
                                                                          },date: Provider.of<qualityprovider>(context).date!,),
                                                                          dropdownbutton(hint:"choose shift".tr(),mo:Provider.of<shiftsprovider>(context).shift,onchanged: (val){
                                                                            Provider.of<qualityprovider>(context,listen: false).changedropshift(val);
                                                                          },name: Provider.of<qualityprovider>(context).shift,),
                                                                           Center(
                                                          child: Row(
                                                            children: [
                                                              addbutton(type: "ok".tr(), height: 50,width: 100, onpressed: ()async{
                                                         if(Provider.of<qualityprovider>(context,listen: false).date =="choose date" ||Provider.of<qualityprovider>(context,listen: false).shift==null){showDialog(context: context, builder: ((context) {
                                                                            return AlertDialog(content: Text("show error".tr()),actions: [Center(child: MaterialButton(color: Colors.purple,onPressed: (){Navigator.pop(context);},child: Text("ok".tr(),style: TextStyle(color: Colors.white),),))],);
                                                                          }));}
                                                                          else{ 
                                                              await Provider.of<qualityprovider>(context,listen: false).reportsdata(Provider.of<qualityprovider>(context,listen: false).date!,Provider.of<qualityprovider>(context,listen: false).shift!);
                                                                                Navigator.pop(context);
                                                        
                                                                          }      }, fontsize: 15, padding: 5),
                                                              addbutton(type: "back".tr(), height: 50,width: 100, onpressed: ()async{
                                                              Navigator.pop(context);
                                                              }, fontsize: 15, padding: 5),
                                                            ],
                                                          ),
                                                        ) 
                                                                            ],);
                                                                          }));
                                                        },icon: Icon(Icons.calendar_month,color: Colors.white,),),
                                                     ),
                                                    ],
                                                  ),
                                                ),

                      ],
                    ),
                  );
                
  }

}