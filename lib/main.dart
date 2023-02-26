import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasker/bindings/bindings.dart';
import 'package:tasker/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
      getPages: Routes.pages,
      initialBinding: MyBindings(),
      initialRoute: '/homeScreen',
      theme: ThemeData(textTheme: GoogleFonts.montserratTextTheme()),
    );
  }

  static void changeColor(Color color, Brightness brightness) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: color, statusBarBrightness: brightness));
  }
}
