import 'package:flutter/material.dart';
import 'package:tugas_aplikasi_youtube/layouts/mobile_layouts.dart';
import 'package:tugas_aplikasi_youtube/layouts/web_layouts.dart';
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
          iconTheme: const IconThemeData(color: Colors.white),
          fontFamily: "YouTube",
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
              color: Colors.white,
            ),
          ),
          useMaterial3: false,
          scaffoldBackgroundColor: MyColor.primaryColor,
          appBarTheme: const AppBarTheme(
              backgroundColor: MyColor.primaryColor,
              titleTextStyle: TextStyle(
                color: Colors.white,
              ))),
      home: LayoutBuilder(builder: (builder, constraints) {
        if (constraints.maxWidth < 600) {
          return const MobileLayouts();
        } else {
          return const WebLayouts();
        }
      }),
    );
  }
}
