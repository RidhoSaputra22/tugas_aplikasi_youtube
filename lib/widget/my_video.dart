import 'package:flutter/material.dart';
import 'package:tugas_aplikasi_youtube/models/video.dart';
import 'package:tugas_aplikasi_youtube/pages/mobile/my_mobile_video_page.dart';
import 'package:tugas_aplikasi_youtube/widget/my_color.dart';

class MyVideo extends StatelessWidget {
  final double height;
  final Video video;
  final bool isMobile;
  final Function() onTap;

  MyVideo({
    super.key,
    required this.video,
    required this.onTap,
    this.isMobile = false,
    this.height = 200,
  });

  @override
  Widget build(BuildContext context) {
    return isMobile
        ? MyMobileVideo(onTap: onTap, video: video)
        : InkWell(
            onTap: onTap,
            child: Column(
              children: [
                Container(
                  height: height,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("${video.thumbnailUrl}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  color: MyColor.primaryColor,
                  padding:
                      EdgeInsets.only(left: 10, top: 15, right: 10, bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage("${video.user.photo}"),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${video.title}",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: MyColor.textColor,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "${video.user.nama} • ",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: MyColor.textGray,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "${video.views} views • ",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: MyColor.textGray,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "${video.datePosted}",
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
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.more_vert),
                    ],
                  ),
                )
              ],
            ),
          );
  }
}

class MyMobileVideo extends StatelessWidget {
  final double height;
  final Video video;
  final Function() onTap;

  MyMobileVideo({
    super.key,
    required this.onTap,
    required this.video,
    this.height = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: 190,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
                image: DecorationImage(
                  image: AssetImage(video.thumbnailUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    video.title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: MyColor.textColor,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "${video.user.nama}  \n",
                          style: TextStyle(
                            fontSize: 12,
                            color: MyColor.textGray,
                          ),
                        ),
                        TextSpan(
                          text: "${video.views} x ditonton • ",
                          style: TextStyle(
                            fontSize: 12,
                            color: MyColor.textGray,
                          ),
                        ),
                        TextSpan(
                          text: "${video.datePosted}",
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
            ),
            Icon(Icons.more_vert),
          ],
        ),
      ),
    );
  }
}
