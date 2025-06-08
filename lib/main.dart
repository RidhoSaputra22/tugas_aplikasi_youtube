import 'package:flutter/material.dart';
import 'package:tugas_aplikasi_youtube/layouts/mobile_layouts.dart';
import 'package:tugas_aplikasi_youtube/layouts/desktop_layouts.dart';
import 'package:tugas_aplikasi_youtube/pages/login.dart';
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final bool isLogin;
  const MyHomePage({super.key, this.isLogin = true});

  @override
  Widget build(BuildContext context) {
    return isLogin
        ? LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth < 600) {
              return MobileLayouts();
            } else {
              return DesktopLayouts();
            }
          })
        : const LoginPage();
  }
}
