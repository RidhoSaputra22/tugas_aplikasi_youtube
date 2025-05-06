import 'package:flutter/material.dart';
import 'package:tugas_aplikasi_youtube/pages/my_video_page.dart';
import 'package:tugas_aplikasi_youtube/widget/my_color.dart';

class MyVideo extends StatelessWidget {
  MyVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MyVideoPage(),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/thumbnail.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: MyColor.primaryColor,
            padding: EdgeInsets.only(left: 10, top: 15, right: 10, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage("assets/images/thumbnail.jpg"),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rose Walton - | Realy Want to Stay At Home",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: MyColor.textColor,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Channel Name • ",
                            style: TextStyle(
                              fontSize: 12,
                              color: MyColor.textGray,
                            ),
                          ),
                          TextSpan(
                            text: "154K views • ",
                            style: TextStyle(
                              fontSize: 12,
                              color: MyColor.textGray,
                            ),
                          ),
                          TextSpan(
                            text: "5 dayys ago",
                            style: TextStyle(
                              fontSize: 12,
                              color: MyColor.textGray,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Icon(Icons.more_vert),
              ],
            ),
          )
        ],
      ),
    );
  }
}
