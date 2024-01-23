// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
    "email":"الايميل",
"password":"اسم المستخدم",
"forget-password":"هل نسيت كلمة المرور؟",
"login":"تسجيل الدخول",
"login-as-subuser":"تسجيل الدخول كمستخدم فرعي",
"main":"الرئيسيه",
"injection-departement":"قسم الحقن",
"blow-departement":"قسم النفخ",
"finish-departement":"قسم التشطيب ",
"maintenance-departement":" قسم الصيانه",
"quality-departement":"قسم الجوده ",
"material-departement":" مخزن الخامه",
"categories-departement":"مخزن الاصناف",
"settings":"الاعدادات",
"write-report-injetion":"كتابة تقارير قسم الحقن",
"show-report-injetion":"عرض تقارير قسم الحقن",
"write-report-production":"كتابة تقارير الانتاج ",
"choose-machine":"اختر الماكينه",
"choose-shift":"اختر الورديه",
"engineer-name":"اسم مهندس الورديه",
"worker-name":"اسم العامل",
"mold-name":"اسم الاسطمبه",
"cycle-time":"زمن الدوره",
"production-quantity":"كمية الانتاج",
"scrao-quantity":"كمية الهالك",
"machine-fails":"اعطال الماكينه",

  };
static const Map<String,dynamic> en = {
  "email":"E-mail",
    "password":"Password",
    "forget-password":"Forget passwor ?",
    "login":"Log in",
    "login-as-subuser":"Login as a sub user",
    "main":"Main",
    "injection-departement":"Injection departement",
    "blow-departement":"Blow departement",
    "finish-departement":"Finish departement",
    "maintenance-departement":"Maintenance departement",
    "quality-departement":"Quality departement",
    "material-departement":"Material store",
    "categories-departement":"Categories store",
    "settings":"Settings"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en};
}
