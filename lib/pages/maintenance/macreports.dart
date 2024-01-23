import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/providers/maintenanceprovider.dart';
import 'package:fac_app/providers/shiftsprovider.dart';
import 'package:fac_app/providers/showfinishprovider.dart';
import 'package:fac_app/services/pdf/pdf.dart';
import 'package:fac_app/widgets/containermaintenance.dart';
import 'package:fac_app/widgets/datebutton.dart';
import 'package:fac_app/widgets/dropdown.dart';
import 'package:fac_app/widgets/removeoradd.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:fac_app/services/pdf/machinemaintenancepdf.dart';

import '../../widgets/gradient.dart';


class macreports extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
          var prov=Provider.of<maintenceprovider>(context);

    return  Stack(
      alignment: Alignment.bottomLeft,
      children: [
               prov.reports .isEmpty?Container(width: double.infinity,child: Center(child: Lottie.asset("images/nodata.json"),),) : containermaintenance(data: Provider.of<maintenceprovider>(context).reports),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                            CircleAvatar(child: IconButton(onPressed: (){
                          showDialog(context: context, builder: ((context) {
                                              return AlertDialog(title: Center(child: Text("choosedateandshift".tr(),style: TextStyle(),softWrap: true,overflow: TextOverflow.ellipsis,)),actions: [
                                                datebutton(onpressed: (){
                                            Provider.of<maintenceprovider>(context,listen: false).chagedate(context);
                                            },date: Provider.of<maintenceprovider>(context).date,),
                                            dropdownbutton(hint:"choose shift".tr(),mo:Provider.of<shiftsprovider>(context).shift,onchanged: (val){
                                              Provider.of<maintenceprovider>(context,listen: false).changedropshift(val);
                                            },name: Provider.of<maintenceprovider>(context).shift,),
                                             Center(
                            child: Row(
                              children: [
                                addbutton(type: "ok".tr(), height: 50,width: 100, onpressed: ()async{
                                    if(Provider.of<maintenceprovider>(context,listen: false).date =="choose date" ||Provider.of<maintenceprovider>(context,listen: false).shift==null){showDialog(context: context, builder: ((context) {
                                              return AlertDialog(content: Text("show error".tr()),actions: [Center(child: MaterialButton(color: Colors.purple,onPressed: (){Navigator.pop(context);},child: Text("ok".tr(),style: TextStyle(color: Colors.white),),))],);
                                            }));}
                                            else{ 
                                await Provider.of<maintenceprovider>(context,listen: false).reportsdata(Provider.of<maintenceprovider>(context,listen: false).date,Provider.of<maintenceprovider>(context,listen: false).shift!);
                                            }
                                Navigator.pop(context);
                                }, fontsize: 15, padding: 5),
                                SizedBox(width: 10,),
                                addbutton(type: "back".tr(), height: 50,width: 100, onpressed: ()async{
                                Navigator.pop(context);
                                }, fontsize: 15, padding: 5),
                              ],
                            ),
                          ) 
                                              ],);
                                            }));
                            }, icon:Icon( Icons.calendar_month,color: Colors.white,)),backgroundColor: Colors.purple),
                           SizedBox(width: 5,),
                          if(Provider.of<maintenceprovider>(context,listen: false ).reports.isNotEmpty  )                       CircleAvatar(backgroundColor: Colors.purple,
                                  child: IconButton(onPressed: () async {
                                                          
                                             File file=await maintenancepdf.generatepdf(Provider.of<maintenceprovider>(context,listen: false).reports,"machine","اسم الماكينه");
                                            await pdfservice.openfile(file);}
                                                          , icon: Icon(Icons.picture_as_pdf,color: Colors.white,)),)                        ],),
                        )
      ],
    );
  }

}