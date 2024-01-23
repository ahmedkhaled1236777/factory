import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/core/colors.dart';
import 'package:fac_app/providers/typesprovider.dart';
import 'package:fac_app/widgets/containertypes.dart';
import 'package:fac_app/widgets/scanner.dart';
import 'package:flutter/material.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class newshowtypes extends StatefulWidget{
  @override
  State<newshowtypes> createState() => _newshowtypesState();
}
class _newshowtypesState extends State<newshowtypes> {
      TextEditingController textController = TextEditingController();

intialize()async{
   await Provider.of<typesprovider>(context,listen: false).reportsdata();
 Provider.of<typesprovider>(context,listen: false).filterdata=Provider.of<typesprovider>(context,listen: false).reports;


}
@override
  void initState() {
   intialize();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(height: 10,),
Row(
  children: [
    SizedBox(width: 5,),
    IconButton(onPressed: ()async{
       var res = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SimpleBarcodeScannerPage(),
                    ));
               
                  if (res is String) {
Provider.of<typesprovider>(context,listen: false).searchformaterialscanner(res)   ;               }
    }, icon: Icon(Icons.qr_code_scanner,color: appcolors.kprimarycolor,)),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: AnimatedContainer
              (
                duration: Duration(milliseconds: 500),
                width:Provider.of<typesprovider>(context).containerwidth==true?MediaQuery.of(context).size.width*0.75: 50,
                height: 50,
                decoration: BoxDecoration(
                  color:Provider.of<typesprovider>(context).containerwidth==true? appcolors.amcolor:Colors.purple,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Provider.of<typesprovider>(context).containerwidth==true? appcolors.amcolor:Colors.purple)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5,right: 10),
                  child: TextField(
                    controller: textController,
                   decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white),
                    suffixIcon: IconButton(onPressed: (){
    
                      Provider.of<typesprovider>(context,listen: false).changecontainercondition();
                    }, icon: Icon(Provider.of<typesprovider>(context).containerwidth==true? Icons.arrow_forward_ios:Icons.search,color: Colors.white,)),
                    hintText: "${"search".tr()} ...",
                        enabledBorder:OutlineInputBorder(borderSide: BorderSide(color: Provider.of<typesprovider>(context).containerwidth==true? appcolors.amcolor:Colors.purple),borderRadius: BorderRadius.circular(50)) 
                        ,focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Provider.of<typesprovider>(context).containerwidth==true? appcolors.amcolor:Colors.purple),borderRadius: BorderRadius.circular(50))
                   ),
                      onChanged: (value ) { 
                      Provider.of<typesprovider>(context,listen: false).searchformaterial(value)         ;          },
                  ),
                ),
              ),
            ),
  ],
),
        SizedBox(height: 10,),
    Provider.of<typesprovider>(context).filterdata.isEmpty?Expanded(child: Container(width: double.infinity,child: Center(child: Center(child: Lottie.asset("images/nodata.json"),),),)) :Expanded(child: containertypes(data: Provider.of<typesprovider>(context,).filterdata,sectionname: "types",))
      ],
    );
  }
}