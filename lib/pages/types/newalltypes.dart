import 'package:easy_localization/easy_localization.dart';
import 'package:fac_app/core/colors.dart';
import 'package:fac_app/core/texts.dart';
import 'package:fac_app/pages/material/newmaterial.dart';
import 'package:fac_app/pages/types/newcompletetypes.dart';
import 'package:fac_app/pages/types/newtypes.dart';
import 'package:fac_app/providers/scanner.dart';
import 'package:fac_app/providers/typesprovider.dart';
import 'package:fac_app/widgets/scanner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class alltypes extends StatefulWidget{
  @override
  State<alltypes> createState() => _alltypesState();
}

class _alltypesState extends State<alltypes> {
  bool x=true;
  @override
  void initState() {
  Future.delayed(Duration(milliseconds: 100),(){
    x=false;
    setState(() {
      
    });
  });
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text("categories-departement".tr
          (),style: TextStyle(fontFamily: apptexts.appfonfamily,fontSize: 20,fontWeight: FontWeight.bold),)
         , backgroundColor: appcolors.kprimarycolor,),
    backgroundColor: appcolors.kprimarycolor,
    body: Padding(
      padding: const EdgeInsets.only(left: 30,right: 30),
      child: Column(
        children: [
          SizedBox(height: 50),
          Card(
            elevation: 10,
            color: Colors.green,
            child: SizedBox(
              height: MediaQuery.of(context).size.height*0.6,
              width: double.infinity,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                  
                          Navigator.of(context).push(MaterialPageRoute(builder: (_){
                            return newtypes();
                          }));  
                        },
                        child: AnimatedContainer(
                          curve: Curves.easeInOut,
                          width: x==true?0:220,
                                
                                            duration: Duration(milliseconds: 300),
                          child: Stack(
                            alignment: Alignment.centerRight,
                            children:
                             [
                              Container(
                                child: Center(child: Text("Ingredients store".tr(),style: TextStyle(fontFamily: apptexts.appfonfamily,color: Colors.white),)),
                                height: 35,width: 220,decoration: BoxDecoration(
                                
                                color: appcolors.amcolor,
                                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(20),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(20),)
                          
                              ),),
                              Positioned(
                                child: Container(
                                  child: x==true?SizedBox(): Icon(Icons.search,color: Colors.white,),
                                  height: 60,width: 40,decoration: BoxDecoration(
                                  color: appcolors.amcolor,
                                  borderRadius: BorderRadius.circular(20)
                                ),),
                              ),
                              
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (_){
                            return newcompletetypes();
                          }));   
                        },
                        child: AnimatedContainer(
                                                curve: Curves.easeInOut,
                        
                          width: x==true?0:220,
                                
                                            duration: Duration(milliseconds: 400),
                                
                          child: Stack(
                            alignment: Alignment.centerRight,
                            children:
                             [
                              Container(
                                padding: EdgeInsets.only(right: 40),
                                child: Center(child: Text("Completed product store".tr(),style: TextStyle(fontFamily: apptexts.appfonfamily,color: Colors.white),)),
                                height: 35,width: 220,decoration: BoxDecoration(
                                
                                color: appcolors.amcolor,
                                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(20),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(20),)
                          
                              ),),
                              Positioned(
                                child: Container(
                                  child: x==true?SizedBox(): Icon(Icons.search,color: Colors.white,),
                                  height: 60,width: 40,decoration: BoxDecoration(
                                  color: appcolors.amcolor,
                                  borderRadius: BorderRadius.circular(20)
                                ),),
                              ),
                              
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                     
                      
                     
                              
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
   );
  }
}