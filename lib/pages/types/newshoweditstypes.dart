import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/providers/materialprovider.dart';
import 'package:fac_app/providers/showblowprovider.dart';
import 'package:fac_app/providers/typesprovider.dart';
import 'package:fac_app/widgets/containereditsmaterial.dart';
import 'package:fac_app/widgets/containertypesedits.dart';
import 'package:fac_app/widgets/datebutton.dart';
import 'package:fac_app/widgets/removeoradd.dart';
import 'package:fac_app/widgets/show-container-report.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class typeseditreports extends StatefulWidget{

  @override
  State<typeseditreports> createState() => _typeseditreportsState();
}

class _typeseditreportsState extends State<typeseditreports> {
  intialize()async{
                                       

  }
  @override
  void initState() {
  Future.delayed(Duration.zero,(){
 Provider.of<typesprovider>(context,listen: false).resetdate();
                                        Provider.of<typesprovider>(context,listen: false).reseteditreportsdata();
  });
  }
  @override
  Widget build(BuildContext context) {

    return  Padding(
                    padding: const EdgeInsets.only(left: 5,right: 5,bottom: 5),
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        
                        Provider.of<typesprovider>(context).editreports .isEmpty?Container(width: double.infinity,child: Center(child: Center(child: Lottie.asset("images/nodata.json"),),),) : containertypesedits(data: Provider.of<typesprovider>(context).editreports),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                        /*      if(Provider.of<materialprovider>(context,listen: false ).editreports.isNotEmpty  )     CircleAvatar(backgroundColor: Colors.purple,
                                child: IconButton(onPressed: () async {
                                                        
                                           File file=await pdfservice.generatepdf(Provider.of<showblowprovider>(context,listen: false).reports,"blowing");
                                          await pdfservice.openfile(file);}
                                                        , icon: Icon(Icons.picture_as_pdf,color: Colors.white,)),
                              )*/
                                                    SizedBox(width: 5,)
                                                     , CircleAvatar(
                                                      backgroundColor: Colors.purple,
                                                       child: IconButton(onPressed: (){
                                                          showDialog(context: context, builder: ((context) {
                                                                            return AlertDialog(title: Center(child: Text("choosedateandshift".tr(),style: TextStyle(),softWrap: true,overflow: TextOverflow.ellipsis,)),actions: [
                                                                              datebutton(onpressed: (){
                  Provider.of<typesprovider>(context,listen: false).changedate(context);
                  },date: Provider.of<typesprovider>(context).date,),
                   addbutton(type: "show".tr(), height: 50, width: double.infinity, onpressed:()async{
                  if(Provider.of<typesprovider>(context,listen: false).date=="choose date"){showDialog(context: context, builder: ((context) {
                    return AlertDialog(title:Center(child: Text("please choose date".tr())),
      
      actions: [
        Center(child: addbutton(type: "ok", height: 50, width: 70, onpressed:(){Navigator.pop(context);}, fontsize: 15, padding: 5))
      ],);
                  }));}
                  else{ 
                   
          await Provider.of<typesprovider>(context,listen: false).editreportsdata(Provider.of<typesprovider>(context,listen: false).date,);
              Navigator.pop(context);   
                  }
                 
                }, fontsize: 25, padding: 5),
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