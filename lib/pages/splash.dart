import 'package:fac_app/core/colors.dart';
import 'package:fac_app/main.dart';
import 'package:fac_app/pages/login/newlogin/newchangepassword.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:lottie/lottie.dart';

class splash extends StatefulWidget{
  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> with TickerProviderStateMixin {
 late AnimationController controller;
 bool animated=true;
 @override
  void initState() {
   controller=AnimationController(vsync: this);
controller.addListener(() {
  if(controller.value>0.3){
    animated=false;
    setState(() {
      
    });

  }
})  ;}
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.purple,
    body: Container(
            height:MediaQuery.of(context).size.height ,

      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
      if(animated==false)    Positioned(left: 20,right: 20,bottom: 150,child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: AnimatedTextKit(
              
                onFinished: (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_){
                return MyHomePage();}));
                },
                totalRepeatCount: 1,
              
                    animatedTexts: [
              TypewriterAnimatedText("My factory app Is The First App That Control Production process In  Plastic Factories",textStyle: TextStyle(color: Colors.white,fontFamily: "laila",fontSize: 15,),speed: Duration(milliseconds: 60)),
              
              
                    ],
                    onTap: () {
              print("Tap Event");
                    },
                  ),
            ),
          ),
        ),
       AnimatedContainer(
        height:animated==true?MediaQuery.of(context).size.height: 400,
        decoration: BoxDecoration(        color: Colors.white,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(animated?0:45) ,bottomRight: Radius.circular(animated?0:45),)
        
),
        duration: Duration(seconds: 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height*0.25,child: Lottie.asset("images/fact.json",fit: BoxFit.fill,controller: controller ,
              onLoaded: (composition) {
                // Configure the AnimationController with the duration of the
                // Lottie file and start the animation.
                controller
                  ..duration = composition.duration
                  ..forward();
              }, ))
         , SizedBox(height: 10,)
         , Directionality(
          textDirection: TextDirection.ltr,
           child: AnimatedTextKit(
            pause: Duration(seconds: 2),
            totalRepeatCount: 1,
                 animatedTexts: [
                   WavyAnimatedText('My Factory',textStyle: TextStyle(fontSize: 30,color: Colors.black,fontFamily: "great",fontWeight: FontWeight.bold),speed: Duration(milliseconds: 400)),],),
         ),

          ],
        ),
       )
        ],
      ),
    ),
  );
  }
}