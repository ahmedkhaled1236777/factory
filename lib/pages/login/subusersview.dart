
import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/core/colors.dart';
import 'package:fac_app/core/texts.dart';
import 'package:fac_app/models/users/usermodal.dart';
import 'package:fac_app/services/usersservices/userservice.dart';
import 'package:fac_app/widgets/gradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class subusersview extends StatefulWidget{
  final List<usermodel>subusers;

  const subusersview({ required this.subusers});

  @override
  State<subusersview> createState() => _subusersviewState();
}

class _subusersviewState extends State<subusersview> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(title: Text("users".tr(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: apptexts.appfonfamily),),backgroundColor: appcolors.kprimarycolor,),
    body: SafeArea(child:widget.subusers.isEmpty?Center(child: Text(""),):ListView.separated(itemBuilder: ((context, index) {
      return Padding(
        padding: const EdgeInsets.all( 8),
        child: Card(child: Row(children: [
      Expanded(child: Padding(
        padding: const EdgeInsets.only(left: 5),
        child:   Text(widget.subusers[index].user_name),
      )),
      IconButton(onPressed: (() async{
      await user_service.deletesubuser(widget.subusers[index].email,widget.subusers[index].email);
      widget.subusers.removeWhere((element){
       return element.email==widget.subusers[index].email;
      });
      setState(() {
        
      });
      
      }), icon: Icon(Icons.delete))
      
        ],),),
      );
    }),
     separatorBuilder: ((context, index) => SizedBox(height: 0,)),
      itemCount: widget.subusers.length)),
   );

  }}

