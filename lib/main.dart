import 'package:flutter/material.dart';
import 'package:tugas_aplikasi_youtube/layouts/mobile_layouts.dart';
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
          useMaterial3: false,
          scaffoldBackgroundColor: MyColor.primaryColor,
          appBarTheme: const AppBarTheme(
              backgroundColor: MyColor.primaryColor,
              titleTextStyle: TextStyle(
                color: Colors.white,
              ))),
      home: MobileLayouts(),
    );
  }
}
