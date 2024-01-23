import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/core/colors.dart';
import 'package:fac_app/core/texts.dart';
import 'package:fac_app/providers/attendance.dart';
import 'package:fac_app/widgets/datebutton.dart';
import 'package:fac_app/widgets/dropdown.dart';
import 'package:fac_app/widgets/removeoradd.dart';
import 'package:fac_app/widgets/textform.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:searchfield/searchfield.dart';

class leavingwork extends StatelessWidget{
    TextEditingController hours=TextEditingController();
TextEditingController search=TextEditingController();
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar:  AppBar(
          centerTitle: true,
          title: Text("الاضافي والتصاريح".tr
          (),style: TextStyle(fontFamily: apptexts.appfonfamily,fontSize: 20,fontWeight: FontWeight.bold),)
         , backgroundColor: appcolors.kprimarycolor,),
    body: SingleChildScrollView(
      child: Column(
        children: [
           datebutton(onpressed: (){
                Provider.of<attendanceprovider>(context,listen: false).chagedate(context);
                },date: Provider.of<attendanceprovider>(context).date,),
                 dropdownbutton(hint: "choose departement".tr(),mo:Provider.of<attendanceprovider>(context).departements,onchanged: (val){
                Provider.of<attendanceprovider>(context,listen: false).changedropdepartement(val);
              },name: Provider.of<attendanceprovider>(context).departementname,),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 10),
                 child: Container(
                  padding: EdgeInsets.symmetric(horizontal:10 ),
                         decoration: BoxDecoration(
                          
                               color: appcolors.amcolor,
                               borderRadius: BorderRadius.circular(10)
                             ),
                             width: double.infinity,
                             height: 50,
                   child:  Center(
                     child: SearchField(
                    
                      scrollbarDecoration: ScrollbarDecoration(),
                       suggestions: ["aa","ss","dd"]
                           .map((e) => SearchFieldListItem(e,child: Center(child: Text(e),)))
                           .toList(),
                       suggestionState: Suggestion.expand,
                       
                       suggestionItemDecoration: BoxDecoration(
                        
                       ),
                       
                       textInputAction: TextInputAction.next,
                       suggestionStyle:   TextStyle(fontSize: 20,color: const Color.fromARGB(255, 86, 17, 17),fontFamily: apptexts.appfonfamily) ,
                     
                       hint: 'اسم الموظف',
                       
                       searchStyle: TextStyle(
                         fontSize: 18,
                         color: Color.fromARGB(255, 126, 21, 21).withOpacity(0.8),
                       ),
                       
                       searchInputDecoration: InputDecoration(
                        
                        hintStyle:  TextStyle(fontSize: 20,color: Colors.white,fontFamily: apptexts.appfonfamily,) ,
                     enabledBorder: OutlineInputBorder(
                           borderSide: BorderSide(
                             color: appcolors.amcolor,
                           ),
                         ),
                         focusedBorder: OutlineInputBorder(
                           borderSide: BorderSide(
                             color: appcolors.amcolor,
                           ),
                         ),
                         border: OutlineInputBorder(
                        
                           borderSide: BorderSide(color:appcolors.amcolor),
                         ),
                       ),
                       maxSuggestionsInViewPort: 6,
                       itemHeight: 50,
                       controller:search ,
                       
                     ),
                   )
                 ),
               )  ,
              textform(con: hours, valid: "برجاء ادخال عدد ساعات العمل", hinttext: "عدد الساعات", suffix: "", keyboardType: TextInputType.text)
      , SizedBox(height: 20,),
      addbutton(type: "confirm", height: 50, onpressed: (){
        print(search.text);
      }, fontsize: 20, padding: 30)
        ],
      ),
    ),

   );
  }

}