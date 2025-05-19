import 'package:flutter/material.dart';
import 'package:tugas_aplikasi_youtube/models/video.dart';
import 'package:tugas_aplikasi_youtube/pages/mobile/my_mobile_video_page.dart';
import 'package:tugas_aplikasi_youtube/widget/my_button.dart';
import 'package:tugas_aplikasi_youtube/widget/my_color.dart';
import 'package:tugas_aplikasi_youtube/widget/my_video.dart';

class MobileLayouts extends StatelessWidget {
  const MobileLayouts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 50,
            title: Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/youtube.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "YouTube",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.cast,
                  color: MyColor.white,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: MyColor.white,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: MyColor.white,
                ),
                onPressed: () {},
              )
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(70),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(bottom: 30, left: 17, right: 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                        decoration: BoxDecoration(
                          color: MyColor.buttonGray,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.explore_outlined,
                          color: MyColor.white,
                          size: 18,
                        ),
                      ),
                      onTap: () {},
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    MyButton(title: "All", onTap: () {}, isActive: true),
                    SizedBox(
                      width: 10,
                    ),
                    MyButton(
                        title: "News to You", onTap: () {}, isActive: false),
                    SizedBox(
                      width: 10,
                    ),
                    MyButton(title: "Gaming", onTap: () {}, isActive: false),
                    SizedBox(
                      width: 10,
                    ),
                    MyButton(title: "Music", onTap: () {}, isActive: false),
                    SizedBox(
                      width: 10,
                    ),
                    MyButton(title: "Sport", onTap: () {}, isActive: false),
                    SizedBox(
                      width: 10,
                    ),
                    MyButton(title: "Live", onTap: () {}, isActive: false),
                    SizedBox(
                      width: 10,
                    ),
                    MyButton(title: "Kids", onTap: () {}, isActive: false),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final video = Video.generate()[index];
                return MyVideo(
                  video: video,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyMobileVideoPage(video: video),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: MyColor.primaryColor,
        selectedItemColor: MyColor.white,
        unselectedItemColor: MyColor.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: MyColor.white,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.explore_outlined,
              color: MyColor.white,
            ),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: MyColor.buttonGray,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add,
                color: MyColor.white,
              ),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.subscriptions_outlined,
              color: MyColor.white,
            ),
            label: "Subscriptions",
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage("assets/images/thumbnail.jpg"),
            ),
            label: "You",
          ),
        ],
      ),
    );
  }
}
