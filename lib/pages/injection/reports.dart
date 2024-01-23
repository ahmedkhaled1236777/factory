import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/core/texts.dart';
import 'package:fac_app/providers/shiftsprovider.dart';
import 'package:fac_app/providers/showblowprovider.dart';
import 'package:fac_app/providers/showinjectionreportprovider.dart';
import 'package:fac_app/services/pdf/pdf.dart';
import 'package:fac_app/widgets/datebutton.dart';
import 'package:fac_app/widgets/dropdown.dart';
import 'package:fac_app/widgets/gradient.dart';
import 'package:fac_app/widgets/removeoradd.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../widgets/show-container-report.dart';

class injectionreports extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
          var prov=Provider.of<showinjectionprovider>(context,);

    return 
         Padding(
                    padding: const EdgeInsets.only(left: 5,right: 5,bottom: 5),
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        
                        prov.reports .isEmpty?Container(width: double.infinity,child: Center(child: Center(child: Lottie.asset("images/nodata.json"),),),) : containerreport(data: Provider.of<showinjectionprovider>(context).reports),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                              if(Provider.of<showinjectionprovider>(context,listen: false ).reports.isNotEmpty  )                       CircleAvatar(backgroundColor: Colors.purple,
                                child: IconButton(onPressed: () async {
                                                        
                                           File file=await pdfservice.generatepdf(Provider.of<showinjectionprovider>(context,listen: false).reports,"injection");
                                          await pdfservice.openfile(file);}
                                                        , icon: Icon(Icons.picture_as_pdf,color: Colors.white,)),
                              )
                                                    ,SizedBox(width: 5,)
                                                     , CircleAvatar(
                                                      backgroundColor: Colors.purple,
                                                       child: IconButton(onPressed: (){
                                                          showDialog(context: context, builder: ((context) {
                                                                            return AlertDialog(title: Center(child: Text("choosedateandshift".tr(),style: TextStyle(fontFamily: apptexts.appfonfamily),softWrap: true,overflow: TextOverflow.ellipsis,)),actions: [
                                                                              datebutton(onpressed: (){
                                                                          Provider.of<showinjectionprovider>(context,listen: false).chagedate(context);
                                                                          },date: Provider.of<showinjectionprovider>(context).date!,),
                                                                          dropdownbutton(hint:"choose shift".tr(),mo:Provider.of<shiftsprovider>(context).shift,onchanged: (val){
                                                                            Provider.of<showinjectionprovider>(context,listen: false).changedropshift(val);
                                                                          },name: Provider.of<showinjectionprovider>(context).shift,),
                                                                           Center(
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                            children: [
                                                              addbutton(type: "ok".tr(), height: 50,width: 100, onpressed: ()async{
                                                         if(Provider.of<showinjectionprovider>(context,listen: false).date =="choose date" ||Provider.of<showinjectionprovider>(context,listen: false).shift==null){showDialog(context: context, builder: ((context) {
                                                                            return AlertDialog(content: Text("show error".tr(),style: TextStyle(fontFamily: apptexts.appfonfamily),),actions: [Center(child: MaterialButton(color: Colors.purple,onPressed: (){Navigator.pop(context);},child: Text("ok".tr(),style: TextStyle(color: Colors.white,fontFamily: apptexts.appfonfamily),),))],);
                                                                          }));}
                                                                          else{ 
                                                              await Provider.of<showinjectionprovider>(context,listen: false).reportsdata(Provider.of<showinjectionprovider>(context,listen: false).date!,Provider.of<showinjectionprovider>(context,listen: false).shift!);
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