import "package:flutter/material.dart";
import "package:tugas_aplikasi_youtube/models/video.dart";
import "package:tugas_aplikasi_youtube/widget/my_button.dart";
import "package:tugas_aplikasi_youtube/widget/my_color.dart";
import "package:tugas_aplikasi_youtube/widget/my_video.dart";
import 'package:video_player/video_player.dart';

class MyMobileVideoPage extends StatefulWidget {
  final Video video;
  const MyMobileVideoPage({super.key, required this.video});

  @override
  State<MyMobileVideoPage> createState() => _MyMobileVideoPageState();
}

class _MyMobileVideoPageState extends State<MyMobileVideoPage> {
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
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          videoPlayerController.value.isInitialized
              ? AspectRatio(
                  aspectRatio: videoPlayerController.value.aspectRatio,
                  child: VideoPlayer(videoPlayerController),
                )
              : Container(
                  height: 200,
                  child: Center(child: CircularProgressIndicator()),
                ),
          Container(
            padding: const EdgeInsets.only(
              left: 15,
              top: 15,
            ),
            child: Text(
              "${widget.video.title}",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.only(left: 15),
            child: RichText(
              text: TextSpan(
                text: "${widget.video.user.nama} ",
                style: TextStyle(
                  color: MyColor.textGray,
                  fontSize: 15,
                ),
              ),
            ),
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
                  backgroundImage: NetworkImage("${widget.video.user.photo}"),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "${widget.video.user.nama}",
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "${widget.video.likes}",
                  style: TextStyle(
                    color: MyColor.textGray,
                  ),
                ),
                Spacer(),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      color: MyColor.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Subscribe",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, top: 15),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyButton(
                    title: "Share",
                    isActive: true,
                    onTap: () {},
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  MyButton(
                    title: "Download",
                    isActive: false,
                    onTap: () {},
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  MyButton(
                    title: "More",
                    isActive: false,
                    onTap: () {},
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  MyButton(
                    title: "Remix",
                    isActive: false,
                    onTap: () {},
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  MyButton(
                    title: "Remix",
                    isActive: false,
                    onTap: () {},
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  MyButton(
                    title: "Remix",
                    isActive: false,
                    onTap: () {},
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  MyButton(
                    title: "Remix",
                    isActive: false,
                    onTap: () {},
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  MyButton(
                    title: "Remix",
                    isActive: false,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15),
            child: Container(
              padding: EdgeInsets.all(10),
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
                      children: [
                        TextSpan(
                          text: "Komentar ",
                          style: TextStyle(
                            color: MyColor.textColor,
                          ),
                        ),
                        TextSpan(
                          text: "172",
                          style: TextStyle(
                            color: MyColor.textGray,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              NetworkImage("${widget.video.user.photo}"),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ",
                                style: TextStyle(
                                  color: MyColor.textGray,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          FutureBuilder<List<Video>>(
            future: Video.fetchVideos(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }

              List<Video> videos = snapshot.data!;

              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: videos.length,
                itemBuilder: (context, index) {
                  return MyVideo(
                    video: videos[index],
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MyMobileVideoPage(
                            video: videos[index],
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          )
        ],
      ),
    ));
  }
}
