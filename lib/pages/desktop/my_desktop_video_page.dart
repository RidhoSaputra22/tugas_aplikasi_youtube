import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:tugas_aplikasi_youtube/models/komentar.dart";
import "package:tugas_aplikasi_youtube/models/video.dart";
import "package:tugas_aplikasi_youtube/widget/my_appbar.dart";
import "package:tugas_aplikasi_youtube/widget/my_button.dart";
import "package:tugas_aplikasi_youtube/widget/my_color.dart";
import "package:tugas_aplikasi_youtube/widget/my_drawer.dart";
import "package:tugas_aplikasi_youtube/widget/my_komentar.dart";
import "package:tugas_aplikasi_youtube/widget/my_mobile_video.dart";
import "package:tugas_aplikasi_youtube/widget/my_video.dart";

class MyDesktopVideoPage extends StatelessWidget {
  final Video video;

  const MyDesktopVideoPage({
    super.key,
    required this.video,
  });

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
                      Container(
                        height: 450,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(video.thumbnailUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 15,
                          top: 15,
                        ),
                        child: Text(
                          video.title,
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
                              backgroundImage: NetworkImage(video.user.photo),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  video.user.nama,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  video.views,
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
                              icon: FaIcon(
                                FontAwesomeIcons.share,
                                size: 5,
                              ).icon,
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
                                      "${video.views} x ditonton ${video.datePosted}\n\n ${video.description}",
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
                                video.user.photo,
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
                      ...(video.komentar..shuffle()).map(
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
                        ...(Video.generate()..shuffle()).map((e) => Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: MyVideo(
                                isMobile: true,
                                video: e,
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          MyDesktopVideoPage(video: e),
                                    ),
                                  );
                                },
                              ),
                            )),
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
