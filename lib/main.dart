import 'dart:developer';
import 'dart:ui';
import 'package:fac_app/core/colors.dart';
import 'package:fac_app/pages/categories/gridcategories.dart';
import 'package:fac_app/pages/categories/home.dart';
import 'package:fac_app/pages/categories/newgridcategories.dart';
import 'package:fac_app/pages/login/newlogin/newaddsubuser.dart';
import 'package:fac_app/pages/login/newlogin/newchangepassword.dart';
import 'package:fac_app/pages/login/newlogin/newlogin.dart';
import 'package:fac_app/pages/login/newlogin/newresetpassword.dart';
import 'package:fac_app/pages/login/newlogin/newsignup.dart';
import 'package:fac_app/pages/notifications/notification.dart';
import 'package:fac_app/pages/splash.dart';
import 'package:fac_app/providers/attendance.dart';
import 'package:fac_app/providers/completetypesprovider.dart';
import 'package:fac_app/providers/providerid.dart';
import 'package:fac_app/providers/scanner.dart';
import 'package:fac_app/widgets/rotation.dart';
import 'package:fac_app/widgets/scanner.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

import 'package:fac_app/pages/finish/finish-page.dart';
import 'package:fac_app/pages/finish/write-finishreport.dart';
import 'package:fac_app/pages/login/changepassword0.dart';
import 'package:fac_app/pages/login/login.dart';
import 'package:fac_app/pages/login/resetpassword.dart';
import 'package:fac_app/providers/languageprovider.dart';
import 'package:fac_app/providers/machinesprovider.dart';
import 'package:fac_app/providers/materialprovider.dart';
import 'package:fac_app/providers/qualityprovider.dart';
import 'package:fac_app/providers/settingsprovider.dart';
import 'package:fac_app/providers/shiftsprovider.dart';
import 'package:fac_app/providers/typesprovider.dart';
import 'package:fac_app/services/sharedprefrences/sharedprefrence.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fac_app/providers/blowprovider.dart';
import 'package:fac_app/providers/finishprovider.dart';
import 'package:fac_app/providers/injectionprovider.dart';
import 'package:fac_app/providers/maintenanceprovider.dart';
import 'package:fac_app/providers/providercategories.dart';
import 'package:fac_app/providers/showblowprovider.dart';
import 'package:fac_app/providers/showfinishprovider.dart';
import 'package:fac_app/providers/showinjectionreportprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:http/http.dart'as http;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:url_launcher/url_launcher.dart';

Future backgroundmessage(RemoteMessage message)async{}
 



bool shouldUseFirebaseEmulator = false;

bool ?is_login;
bool ?block;
bool exist=true;
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
print(DateTime.now().toString().split(".")[0]);
 await cashhelper.init();
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (shouldUseFirebaseEmulator) {
    await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  }
FirebaseMessaging messaging=FirebaseMessaging.instance;
NotificationSettings settings=await messaging.requestPermission(
  sound: true,
  alert: true
);
  FirebaseMessaging.onBackgroundMessage(backgroundmessage);
  User? user=FirebaseAuth.instance.currentUser;
 if(user==null){
  is_login=false;
  
 }else{
  is_login=true;
  await FirebaseFirestore.instance.collection("users").doc(user.email).get().then((value){
exist=value.exists;
  });
    
   if(exist==true){ DocumentReference bloc= FirebaseFirestore.instance.collection("users").doc(user.email);
   await bloc.get().then((value) {
  block=value["block"];
   });
   
 }
 else block=true;
 }
 AwesomeNotifications().initialize("resource://drawable/cccc", [
    NotificationChannel(
      playSound: true,
        channelGroupKey: 'basicchanel',
        channelKey: 'basickey',
        channelName: 'Basicnotifications',
        channelDescription: 'Notification channel for basic tests',
        defaultColor: Color(0xFF9D50DD),
        ledColor: Colors.white)
  ]);
  await EasyLocalization.ensureInitialized();

 runApp(EasyLocalization(
    path: "assets/translations",
    supportedLocales: [
      Locale("en"),
      Locale("ar"),
    ],
    saveLocale: true,
    fallbackLocale:const Locale("en"),
    child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return   MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => categoriesprovider()),
        ChangeNotifierProvider(create: (_) => attendanceprovider()),
        ChangeNotifierProvider(create: (_) => completetypesprovider()),
        ChangeNotifierProvider(create: (_) => scanerprovider()),
        ChangeNotifierProvider(create: ((context) => injectionprovider())),
        ChangeNotifierProvider(create: ((context) => blowprovider())),
        ChangeNotifierProvider(create: ((context) => finishprovider())),
        ChangeNotifierProvider(create: ((context) => showinjectionprovider())),
        ChangeNotifierProvider(create: ((context) => showblowprovider())),
        ChangeNotifierProvider(create: ((context) => showfinishprovider())),
        ChangeNotifierProvider(create: ((context) => maintenceprovider())),
        ChangeNotifierProvider(create: ((context) => qualityprovider())),
        ChangeNotifierProvider(create: ((context) => materialprovider())),
        ChangeNotifierProvider(create: ((context) => typesprovider())),
        ChangeNotifierProvider(create: ((context) => settingsprovider())),
        ChangeNotifierProvider(create: ((context) => machinesprovider())),
        ChangeNotifierProvider(create: ((context) => shiftsprovider())),
        ChangeNotifierProvider(create: ((context) => providerid())),
        
      ],
      child: MaterialApp(
        
          supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
       routes: {
        "login":((context) {
          return login();
        }),
        "reset_password":(context) => resetpassword(),
      "newlogin":(context) => newlogin(),
        "grid_categoriesmanager":(context) => home(grid: Provider.of<categoriesprovider>(context).cat,role: "manager",),
        "admin":(context) => home(grid: Provider.of<categoriesprovider>(context).manager,role: "admin",),
        "production_manager":(context) => home(grid: Provider.of<categoriesprovider>(context).productionmanager,role: "production_manager",),
        "finish_engineer":(context) => home(grid: Provider.of<categoriesprovider>(context).finishengineer,role:"finishengineer" ,),
        "injection_engineer":(context) => home(grid: Provider.of<categoriesprovider>(context).injectionengineer,role:"injectionengineer"),
        "maintenance_engineer":(context) => home(grid: Provider.of<categoriesprovider>(context).maintenanceengineer,role: "maintenance",),
        "material_person":(context) => home(grid: Provider.of<categoriesprovider>(context).materialperson,role: "materialperson",),
        "blowing_engineer":(context) => home(grid: Provider.of<categoriesprovider>(context).blowingengineer,role:"blowengineer"),
        "quality_engineer":(context) => home(grid: Provider.of<categoriesprovider>(context).qualityengineer,role: "qualityengineer",),
        "types_person":(context) => home(grid: Provider.of<categoriesprovider>(context).typesperson,role: "typeperson",),
        "reset_password":(context) => resetpassword(),
        "change_password":(context) => changepassword(),       },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        
          scaffoldBackgroundColor: appcolors.backgroundColor,
          textButtonTheme: TextButtonThemeData(style: ButtonStyle(textStyle: MaterialStatePropertyAll(TextStyle(color: Colors.red)))),
          badgeTheme: BadgeThemeData(
            backgroundColor: Colors.amber,
            textColor: Colors.red
          ),
          backgroundColor: Colors.white,
          elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,textStyle: TextStyle(fontSize: 25,))),
          appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: Colors.white),backgroundColor: Colors.blue,titleTextStyle: TextStyle(fontSize: 30,),centerTitle: true,
          
          
          ),
         primaryTextTheme: TextTheme(),
          textTheme:TextTheme(
       
            headline2: TextStyle(color:Colors.black,fontSize: 30,),
            headline3: TextStyle(color: Colors.white,fontSize: 15)
          ),
         
          
          primarySwatch: Colors.blue,
        ),
        home:is_login==true? splash():newlogin(),
      ),
    );
  }
  
   
}

class MyHomePage extends StatefulWidget {
 


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
 @override
  void initState() {
  
  }


  @override
  Widget build(BuildContext context) {
       

    return Scaffold(
     
      body:is_login==true&&block==false&&exist==true?rotation():rotation()
    );
  }
}
          
 definerole(String role, BuildContext context)  {

      if(role=="admin")
    
return home(grid: Provider.of<categoriesprovider>(context).manager,role:"admin");

      else if(role=="manager")
    
return home(grid: Provider.of<categoriesprovider>(context).cat,role: "manager");
    else if(role=="production manager")
 
home(grid: Provider.of<categoriesprovider>(context).productionmanager,role:"production_manager" ,);
    
     else if(role=="injection production engineer")
    return   home(grid: Provider.of<categoriesprovider>(context).injectionengineer,role: "injectionengineer",);

    
  
    
     else if(role=="blow production engineer")

return home(grid: Provider.of<categoriesprovider>(context).blowingengineer,role: "blowengineer",)    ;
 
    
     else if(role=="maintenance engineer")

  return  home(grid: Provider.of<categoriesprovider>(context).maintenanceengineer,role: "maintenance",);

    
    else if(role=="quality engineer")

  return  home(grid: Provider.of<categoriesprovider>(context).qualityengineer,role: "qualityengineer",);
  
    else if(role=="finish engineer")

return home(grid: Provider.of<categoriesprovider>(context).finishengineer,role: "finishengineer",)   ; 

    else if(role=="material storekeeper")

return home(grid: Provider.of<categoriesprovider>(context).materialperson,role: "materialperson",);

    
    else if(role=="categories storekeeper")
return home(grid: Provider.of<categoriesprovider>(context).typesperson,role: "typeperson",);
    else return null;

  }
