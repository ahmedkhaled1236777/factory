import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/pages/finish/reports.dart';
import 'package:fac_app/providers/shiftsprovider.dart';
import 'package:fac_app/widgets/show-container-report.dart';
import 'package:fac_app/widgets/showfinishcontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../providers/finishprovider.dart';
import '../../providers/injectionprovider.dart';
import '../../providers/showfinishprovider.dart';
import '../../providers/showinjectionreportprovider.dart';
import '../../widgets/datebutton.dart';
import '../../widgets/dropdown.dart';
import '../../widgets/gradient.dart';
import '../../widgets/removeoradd.dart';

class showfinishreport extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var prov=Provider.of<showfinishprovider>(context);
    var prov2=Provider.of<finishprovider>(context);
    return Scaffold(
      appBar:AppBar(title:Text("finish reports".tr(),style: TextStyle(fontSize:20 ),),) ,
      body: SafeArea(child: gradients(
        child: Column(
          children: [
            datebutton(onpressed: (){
                Provider.of<showfinishprovider>(context,listen: false).chagedate(context);
                },date: Provider.of<showfinishprovider>(context).date,),
                 dropdownbutton(hint:"choose shift".tr(),mo:Provider.of<shiftsprovider>(context).shift,onchanged: (val){
                  Provider.of<showfinishprovider>(context,listen: false).changedropshift(val);
                },name: Provider.of<showfinishprovider>(context).shift,),
                addbutton(type: "show".tr(), height: 50, width: double.infinity, onpressed:()async{
                  if(prov.date=="choose date"||prov.shift==null)showDialog(context: context, builder: ((context) {
                    return AlertDialog(content: Text("show error".tr()),actions: [Center(child: MaterialButton(color: Colors.blue,onPressed: (){Navigator.pop(context);},child: Text("ok".tr(),style: TextStyle(color: Colors.white),),))]);
                  }));
                  else{ 
                    
          await prov.reportsdata(prov.date,prov.shift!);
                    Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
                    return finishreports();
                  })));
                  }
                
                }, fontsize: 25, padding: 5),
                
          ]),
      )
      
      
      ),
    );
  }





}