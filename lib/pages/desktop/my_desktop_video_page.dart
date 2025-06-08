import "package:flutter/material.dart";
import "package:tugas_aplikasi_youtube/models/video.dart";
import "package:tugas_aplikasi_youtube/widget/my_appbar.dart";
import "package:tugas_aplikasi_youtube/widget/my_button.dart";
import "package:tugas_aplikasi_youtube/widget/my_color.dart";
import "package:tugas_aplikasi_youtube/widget/my_drawer.dart";
import "package:tugas_aplikasi_youtube/widget/my_komentar.dart";
import "package:tugas_aplikasi_youtube/widget/my_video.dart";

import 'package:video_player/video_player.dart';

class MyDesktopVideoPage extends StatefulWidget {
  final Video video;

  const MyDesktopVideoPage({
    super.key,
    required this.video,
  });

  @override
  State<MyDesktopVideoPage> createState() => _MyDesktopVideoPageState();
}

class _MyDesktopVideoPageState extends State<MyDesktopVideoPage> {
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.video.videoUrl))
          ..initialize().then((_) {
            // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.\
            videoPlayerController.play();
            setState(() {});
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        appBar: MyAppBar(),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 120),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      videoPlayerController.value.isInitialized
                          ? AspectRatio(
                              aspectRatio:
                                  videoPlayerController.value.aspectRatio,
                              child: VideoPlayer(videoPlayerController),
                            )
                          : Container(
                              height: 450,
                              child: Center(child: CircularProgressIndicator()),
                            ),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 15,
                          top: 15,
                        ),
                        child: Text(
                          widget.video.title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage:
                                  NetworkImage(widget.video.user.photo),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.video.user.nama,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  widget.video.views,
                                  style: TextStyle(
                                    color: MyColor.textGray,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: MyColor.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: Text(
                                  "Subscribe",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              decoration: BoxDecoration(
                                color: MyColor.buttonGray,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    size: 20,
                                    Icons.thumb_up_outlined,
                                    color: MyColor.textGray,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "1,2jt",
                                    style: TextStyle(
                                      color: MyColor.textGray,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 20,
                                    width: 1,
                                    color: MyColor.textGray,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    size: 20,
                                    Icons.thumb_down_outlined,
                                    color: MyColor.textGray,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            MyButton(
                              onTap: () {},
                              title: "Bagikan",
                              gap: 10,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                              icon: Icons.share,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            MyButton(
                              onTap: () {},
                              padding: EdgeInsets.all(8),
                              borderRadius: BorderRadius.all(
                                Radius.circular(100.0),
                              ),
                              icon: Icons.more_horiz,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: MyColor.buttonGray,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text:
                                      "${widget.video.views} x ditonton ${widget.video.datePosted}\n\n ${widget.video.description}",
                                  style: TextStyle(
                                    color: MyColor.textColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Text(
                              "10K Komentar",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Icon(Icons.menu),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Urutkan")
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                widget.video.user.photo,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              // width: double.infinity,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Tambahkan Komentar',
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ...(widget.video.komentar..shuffle()).map(
                        (e) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: MyKomentar(
                            komentar: e,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              MyButton(
                                onTap: () {},
                                title: "Semua",
                                isActive: true,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              MyButton(
                                onTap: () {},
                                title: "dari channel ini",
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              MyButton(
                                onTap: () {},
                                title: "Terkait",
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              MyButton(
                                onTap: () {},
                                title: "Untuk Anda",
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        FutureBuilder(
                            future: Video.fetchVideos(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }

                              if (snapshot.hasError) {
                                return Center(
                                    child: Text('Error: ${snapshot.error}'));
                              }

                              List<Video> videos = snapshot.data!;

                              return ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: videos.length,
                                itemBuilder: (context, index) {
                                  return MyVideo(
                                    isMobile: true,
                                    video: videos[index],
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              MyDesktopVideoPage(
                                                  video: videos[index]),
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            }),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
