import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tugas_aplikasi_youtube/models/user.dart';
import 'package:tugas_aplikasi_youtube/widget/my_button.dart';
import 'package:tugas_aplikasi_youtube/widget/my_color.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

  final List sideBarTitle = [
    "Home",
    "Shorts",
    "Subscriptions",
    "Youtube Music",
  ];

  final List sideBarTitle2 = [
    "Histori",
    "Playlist",
    "Video Anda",
    "Kursus Anda",
    "Tontonn Anda",
    "Video yang disukai",
    "Download"
  ];

  final List sideBarTitle3 = [
    "That User",
    "That User",
    "That User",
    "That User",
    "That User",
  ];

  final List<IconData> sideBarIcon = [
    Icons.home,
    Icons.video_library,
    Icons.subscriptions,
    Icons.music_note,
  ];

  final List<IconData> sideBarIcon2 = [
    Icons.history,
    Icons.playlist_add,
    Icons.video_call,
    Icons.school,
    Icons.person,
    Icons.thumb_up,
    Icons.download
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: sideBarTitle.map((e) {
                  final index = sideBarTitle.indexOf(e);
                  return MyButton(
                    onTap: () {},
                    title: e,
                    icon: sideBarIcon[index],
                    fontSize: 16,
                    gap: 24,
                    padding: const EdgeInsets.all(10),
                    color: MyColor.transparent,
                  );
                }).toList(),
              ),
              Container(
                // padding: const EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 2, color: MyColor.buttonGray),
                  ),
                ),
              ),
              Container(
                // padding: const EdgeInsets.symmetric(horizontal: 30),
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text(
                      "Anda",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Icon(Icons.expand_less),
                  ],
                ),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 2, color: MyColor.buttonGray),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: sideBarTitle2.map((e) {
                  final index = sideBarTitle2.indexOf(e);
                  return MyButton(
                    onTap: () {},
                    title: e,
                    icon: sideBarIcon2[index],
                    fontSize: 16,
                    gap: 24,
                    padding: const EdgeInsets.all(10),
                    color: MyColor.transparent,
                  );
                }).toList(),
              ),
              Container(
                // padding: const EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 2, color: MyColor.buttonGray),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text(
                      "Subscriptions",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 2, color: MyColor.buttonGray),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: User.generate().map((e) {
                  return Container(
                    padding: const EdgeInsets.only(bottom: 10, left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundImage: AssetImage(e.photo),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            e.nama,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.stream_outlined),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
