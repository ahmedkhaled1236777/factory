import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/core/colors.dart';
import 'package:fac_app/models/material/material.dart';
import 'package:fac_app/pages/material/showmaterial.dart';
import 'package:fac_app/providers/materialprovider.dart';
import 'package:fac_app/widgets/containermaterial.dart';
import 'package:flutter/material.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class newshowmaterials extends StatefulWidget{
  @override
  State<newshowmaterials> createState() => _newshowmaterialsState();
}
class _newshowmaterialsState extends State<newshowmaterials> {
      TextEditingController textController = TextEditingController();

intialize()async{
   await Provider.of<materialprovider>(context,listen: false).reportsdata();
 Provider.of<materialprovider>(context,listen: false).filterdata=Provider.of<materialprovider>(context,listen: false).reports;


}
@override
  void initState() {
    Future.delayed(Duration.zero,(){   intialize();
});
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(height: 10,),

        Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: AnimatedContainer
          (
            duration: Duration(milliseconds: 500),
            width:Provider.of<materialprovider>(context).containerwidth==true?MediaQuery.of(context).size.width: 50,
            height: 50,
            decoration: BoxDecoration(
              color:Provider.of<materialprovider>(context).containerwidth==true? appcolors.amcolor:Colors.purple,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Provider.of<materialprovider>(context).containerwidth==true? appcolors.amcolor:Colors.purple)
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 5,right: 10),
              child: TextField(
                controller: textController,
               decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.white),
                suffixIcon: IconButton(onPressed: (){

                  Provider.of<materialprovider>(context,listen: false).changecontainercondition();
                }, icon: Icon(Provider.of<materialprovider>(context).containerwidth==true? Icons.arrow_forward_ios:Icons.search,color: Colors.white,)),
                hintText: "${"search".tr()} ...",
                    enabledBorder:OutlineInputBorder(borderSide: BorderSide(color: Provider.of<materialprovider>(context).containerwidth==true? appcolors.amcolor:Colors.purple),borderRadius: BorderRadius.circular(50)) 
                    ,focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Provider.of<materialprovider>(context).containerwidth==true? appcolors.amcolor:Colors.purple),borderRadius: BorderRadius.circular(50))
               ),
                  onChanged: (value ) { 
                  Provider.of<materialprovider>(context,listen: false).searchformaterial(value)         ;          },
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),
    Provider.of<materialprovider>(context).filterdata.isEmpty?Expanded(child: Container(width: double.infinity,child: Center(child: Center(child: Lottie.asset("images/nodata.json"),),),)) :Expanded(child: containermaterial(data: Provider.of<materialprovider>(context,).filterdata))
      ],
    );
  }
}