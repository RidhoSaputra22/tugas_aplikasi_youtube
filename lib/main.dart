import 'package:flutter/material.dart';
import 'package:tugas_aplikasi_youtube/layouts/mobile_layouts.dart';
import 'package:tugas_aplikasi_youtube/layouts/desktop_layouts.dart';
import 'package:tugas_aplikasi_youtube/pages/mobile/my_login.dart';
import 'package:tugas_aplikasi_youtube/widget/my_color.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          drawerTheme: DrawerThemeData(
              backgroundColor: MyColor.primaryColor,
              shape: BeveledRectangleBorder()),
          inputDecorationTheme: InputDecorationTheme(
              hintStyle: const TextStyle(
                color: MyColor.white,
              ),
              iconColor: MyColor.white,
              suffixIconColor: MyColor.white,
              suffixStyle: const TextStyle(
                  color: MyColor.white, backgroundColor: MyColor.buttonGray)),
          iconTheme: const IconThemeData(color: MyColor.white),
          fontFamily: "Roboto",
          bottomAppBarTheme: BottomAppBarTheme(
            color: MyColor.primaryColor,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: MyColor.buttonGray,
            ),
          ),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(
              color: MyColor.white,
            ),
          ),
          useMaterial3: false,
          scaffoldBackgroundColor: MyColor.primaryColor,
          appBarTheme: const AppBarTheme(
              backgroundColor: MyColor.primaryColor,
              titleTextStyle: TextStyle(
                color: MyColor.white,
              ))),
      home: LayoutBuilder(builder: (builder, constraints) {
        if (constraints.maxWidth < 600) {
          return MyLoginPage1();
        } else {
          return DesktopLayouts();
        }
      }),
    );
  }
}
