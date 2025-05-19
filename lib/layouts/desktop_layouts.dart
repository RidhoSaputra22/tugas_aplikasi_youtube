import 'package:flutter/material.dart';
import 'package:tugas_aplikasi_youtube/models/video.dart';
import 'package:tugas_aplikasi_youtube/pages/desktop/my_desktop_video_page.dart';
import 'package:tugas_aplikasi_youtube/widget/my_appbar.dart';
import 'package:tugas_aplikasi_youtube/widget/my_color.dart';
import 'package:tugas_aplikasi_youtube/widget/my_drawer.dart';
import 'package:tugas_aplikasi_youtube/widget/my_video.dart';

class DesktopLayouts extends StatelessWidget {
  const DesktopLayouts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
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
                    children: List.generate(6, (index) {
                      final video = Video.generate()[index];
                      return MyVideo(
                          video: video,
                          onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MyDesktopVideoPage(video: video),
                                ),
                              ));
                    }),
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
