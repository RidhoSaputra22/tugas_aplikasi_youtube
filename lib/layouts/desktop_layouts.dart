import 'package:flutter/material.dart';
import 'package:tugas_aplikasi_youtube/widget/my_button.dart';
import 'package:tugas_aplikasi_youtube/widget/my_color.dart';
import 'package:tugas_aplikasi_youtube/widget/my_drawer.dart';
import 'package:tugas_aplikasi_youtube/widget/my_video.dart';

class DesktopLayouts extends StatelessWidget {
  const DesktopLayouts({super.key});

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
              height: 40,
              width: 600,
              decoration: BoxDecoration(
                // color: MyColor.buttonGray,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: MyColor.buttonGray),
              ),
              child: TextField(
                // textAlignVertical: TextAlignVertical.center,
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  hintText: "Telusuri",
                  contentPadding: EdgeInsets.only(left: 20, right: 20, top: 10),
                  border: InputBorder.none,
                  suffixIcon: Container(
                      height: 40,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        color: MyColor.buttonGray,
                      ),
                      child: Icon(
                        Icons.search,
                        color: MyColor.white,
                      )),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            MyButton(
              padding: EdgeInsets.all(10),
              icon: Icons.mic,
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
              onTap: () {},
            ),
            Spacer(),
            MyButton(
              onTap: () {},
              icon: Icons.add,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              title: "Buat",
            ),
            SizedBox(
              width: 10,
            ),
            MyButton(
              onTap: () {},
              color: Colors.transparent,
              icon: Icons.notifications_outlined,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/thumbnail.jpg"),
            )
          ],
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: MyDrawer()),
          Expanded(
            flex: 5,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        Text(
                          "Terbaru",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          "Kelola",
                          style: TextStyle(
                            // fontSize: 20,
                            color: MyColor.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(Icons.grid_3x3),
                      ],
                    ),
                  ),
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 0,
                    childAspectRatio: 4 / 3,
                    children: [
                      MyVideo(),
                      MyVideo(),
                      MyVideo(),
                      MyVideo(),
                      MyVideo(),
                      MyVideo(),
                      MyVideo(),
                      MyVideo(),
                      MyVideo(),
                      MyVideo(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
