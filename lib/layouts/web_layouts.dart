import 'package:flutter/material.dart';
import 'package:tugas_aplikasi_youtube/widget/my_button.dart';
import 'package:tugas_aplikasi_youtube/widget/my_color.dart';
import 'package:tugas_aplikasi_youtube/widget/my_video.dart';

class WebLayouts extends StatelessWidget {
  const WebLayouts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Row(
          children: [
            Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                  // color: MyColor.red,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage("assets/images/youtube.png"),
                    fit: BoxFit.contain,
                  )),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Premium",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Container(
              // color: MyColor.white,
              width: 600,
              decoration: BoxDecoration(
                // color: MyColor.buttonGray,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: MyColor.buttonGray),
              ),
              child: TextField(
                
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Spacer()
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Column(
            children: [],
          ))
        ],
      ),
    );
  }
}
