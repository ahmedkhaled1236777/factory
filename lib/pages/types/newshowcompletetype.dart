import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/core/colors.dart';
import 'package:fac_app/providers/completetypesprovider.dart';
import 'package:fac_app/widgets/containertypes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class newshowcompletetypes extends StatefulWidget{
  @override
  State<newshowcompletetypes> createState() => _newshowcompletetypesState();
}
class _newshowcompletetypesState extends State<newshowcompletetypes> {
      TextEditingController textController = TextEditingController();

intialize()async{
    await Provider.of<completetypesprovider>(context,listen: false).reportsdata();
 Provider.of<completetypesprovider>(context,listen: false).filterdata=Provider.of<completetypesprovider>(context,listen: false).reports;



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
    IconButton(onPressed: (){
                            Provider.of<completetypesprovider>(context,listen: false).searchformaterial("")   ;

    }, icon: Icon(Icons.store,color: appcolors.kprimarycolor,)),
    IconButton(onPressed: ()async{
       var res = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SimpleBarcodeScannerPage(),
                    ));
               
                  if (res is String) {
                  if(res=="-1")res="";
Provider.of<completetypesprovider>(context,listen: false).searchformaterialscanner(res)   ;               }
    }, icon: Icon(Icons.qr_code_scanner,color: appcolors.kprimarycolor,)),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: AnimatedContainer
              (
                duration: Duration(milliseconds: 300),
                width:Provider.of<completetypesprovider>(context).containerwidth==true?MediaQuery.of(context).size.width*0.65: 50,
                height: 50,
                decoration: BoxDecoration(
                  color:Provider.of<completetypesprovider>(context).containerwidth==true? appcolors.amcolor:Colors.purple,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Provider.of<completetypesprovider>(context).containerwidth==true? appcolors.amcolor:Colors.purple)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5,right: 10),
                  child: TextField(
                    controller: textController,
                   decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white),
                    suffixIcon: IconButton(onPressed: (){
    
                      Provider.of<completetypesprovider>(context,listen: false).changecontainercondition();
                    }, icon: Icon(Provider.of<completetypesprovider>(context).containerwidth==true? Icons.arrow_forward_ios:Icons.search,color: Colors.white,)),
                    hintText: "${"search".tr()} ...",
                        enabledBorder:OutlineInputBorder(borderSide: BorderSide(color: Provider.of<completetypesprovider>(context).containerwidth==true? appcolors.amcolor:Colors.purple),borderRadius: BorderRadius.circular(50)) 
                        ,focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Provider.of<completetypesprovider>(context).containerwidth==true? appcolors.amcolor:Colors.purple),borderRadius: BorderRadius.circular(50))
                   ),
                      onChanged: (value ) { 
                      Provider.of<completetypesprovider>(context,listen: false).searchformaterial(value)         ;          },
                  ),
                ),
              ),
            ),
  ],
),
        SizedBox(height: 10,),
    Provider.of<completetypesprovider>(context).filterdata.isEmpty?Expanded(child: Container(width: double.infinity,child: Center(child: Center(child: Lottie.asset("images/nodata.json"),),),)) :Expanded(child: containertypes(data: Provider.of<completetypesprovider>(context,).filterdata, sectionname: 'complete types',))
      ],
    );
  }
}