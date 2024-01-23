import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class rotation extends StatefulWidget{
  @override
  State<rotation> createState() => _rotationState();
}

class _rotationState extends State<rotation> {
  ScrollController ci=ScrollController();
    late final PageController controller;

  double turns=0.0;
  bool reverse=true;
  List indexes=[0,1,2,3,4];
  int currentpage=0;
  
 
  @override
  void initState() {
     controller=PageController

  (
    
    viewportFraction: 0.7,
    initialPage: currentpage,
  );
    controller!.addListener(_changePage);

  }
  void _changePage() {
    setState(() {
      currentpage = controller.page!.round();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Container(
      height: 300,
      width: double.infinity,
      child: 
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child:PageView.builder(
             reverse: reverse, 
              onPageChanged: (o){
              
              },
              itemCount: 7,
              controller: controller,
              padEnds: false,
              itemBuilder:(context,i){
    if(currentpage==i) return GestureDetector(
      onTap: (){
        print("++++++++++++++++++++++++++++++++++++++++++++++");
        print(i);
      },
      child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),                color: Colors.amber,
                ),
                      height: 200,
                      width: 200,
                    ),
                    TweenAnimationBuilder(
                      onEnd: (){
                   turns+=1/4;
                 
                      },
                      tween: Tween<double>(begin:60,end: 15),
                      duration: Duration(
                        milliseconds: 400
                      ),
                builder: (context,value,child){
                           
      
                return Positioned(
                  left: 65,
                  top: value,
                     child: AnimatedContainer(
                      
                          duration: Duration(milliseconds: 400),
                          
                          child: AnimatedRotation(turns: turns, 
                          curve: Curves.easeInOut,
                          onEnd: (){
                         
                          },
                          child: Image.asset("images/ss.png",width: 110,height: 110,),
                          duration: Duration(milliseconds: 400)),
                        ),
                      );}
                    ),
                  ],
                ),
    );
       return  Center(
         child: GestureDetector(
          onTap: (){
             print("++++++++++++++++++++++++++++++++++++++++++++++");
          print(i);
          },
           child: Stack(
                    children: [
                      Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),                color: Colors.amber,
                      ),
                            height: 200,
                            width: 200,
                          ),
                          Positioned( child: Image.asset("images/ss.png",width: 110,height: 110,),top: 0,right: 45,)
                    ],
                  ),
         ),
       );
             }
              
            )
 
)
)
          ),
        
        
      )
  ;
  }
}
/* Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),                color: Colors.amber,
              ),
                    height: 400,
                    width: 200,
                  ),
                  TweenAnimationBuilder(
                    onEnd: (){
                 turns+=1/4;
               
                    },
                    tween: Tween<double>(begin:180,end: 130),
                    duration: Duration(
                      seconds: 1
                    ),
              builder: (context,value,child){
              return Positioned(
                left: 50,
                top: value,
                   child: AnimatedContainer(
                    
                        duration: Duration(milliseconds: 400),
                        
                        child: AnimatedRotation(turns: turns, 
                        curve: Curves.easeInOut,
                        onEnd: (){
                       
                        },
                        child: Image.asset("images/ss.png",width: 110,height: 110,),
                        duration: Duration(milliseconds: 400)),
                      ),
                    );}
                  ),
                ],
              );*/