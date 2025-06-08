import 'dart:typed_data';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:tugas_aplikasi_youtube/main.dart';
import 'package:tugas_aplikasi_youtube/models/video.dart';
import 'package:tugas_aplikasi_youtube/pages/mobile/my_mobile_video_page.dart';
import 'package:tugas_aplikasi_youtube/widget/my_button.dart';
import 'package:tugas_aplikasi_youtube/widget/my_color.dart';
import 'package:tugas_aplikasi_youtube/widget/my_video.dart';

class MobileLayouts extends StatefulWidget {
  const MobileLayouts({super.key});

  @override
  State<MobileLayouts> createState() => _MobileLayoutsState();
}

class _MobileLayoutsState extends State<MobileLayouts> {
  bool isLoading = false;

  FilePickerResult thumbnail = FilePickerResult([]);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading = false;
  }

  void showUploadModal1(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Center(
        child: Container(
          width: 600,
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Upload video',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Icon(Icons.upload_file, size: 80, color: Colors.white70),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Tarik lalu lepas file video yang ingin diupload',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 8),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Video Anda akan bersifat pribadi sampai Anda memublikasikannya.',
                  style: TextStyle(color: Colors.white38, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  FilePickerResult? video =
                      await FilePicker.platform.pickFiles();
                  if (video != null && video.files.single.bytes != null) {
                    // final fileBytes = result.files.single.bytes!;
                    // final fileName = result.files.single.name;

                    showUploadModal2(context, video);
                  }
                },
                child: Text('Pilih file'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
              SizedBox(height: 24),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Dengan mengirimkan video ke YouTube, Anda menyatakan bahwa Anda setuju dengan Persyaratan Layanan dan Pedoman Komunitas YouTube.',
                  style: TextStyle(fontSize: 12, color: Colors.white38),
                  textAlign: TextAlign.center,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Pelajari lebih lanjut',
                  style: TextStyle(color: Colors.blueAccent, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showUploadModal2(
    BuildContext context,
    FilePickerResult video,

    // Uint8List fileBytes,
    // String fileName,
  ) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.grey[900],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.fromLTRB(
              16, 24, 16, MediaQuery.of(context).viewInsets.bottom + 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${video.files.single.name.substring(0, video.files.single.name.length - 4)}',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 16),
              Text('Judul', style: TextStyle(color: Colors.white70)),
              TextField(
                controller: titleController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: '',
                  hintStyle: TextStyle(color: Colors.white38),
                  filled: true,
                  fillColor: Colors.grey[800],
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Text('Deskripsi', style: TextStyle(color: Colors.white70)),
              TextField(
                controller: descriptionController,
                maxLines: 3,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: '',
                  hintStyle: TextStyle(color: Colors.white38),
                  filled: true,
                  fillColor: Colors.grey[800],
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  FilePickerResult? thumbnail =
                      await FilePicker.platform.pickFiles();
                  if (thumbnail != null &&
                      thumbnail.files.single.bytes != null) {
                    setState(() {
                      this.thumbnail = thumbnail;
                    });
                  }
                },
                child: Text('Pilih Thumbnail'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
              SizedBox(height: 16),
              Text('Link video', style: TextStyle(color: Colors.white70)),
              SelectableText(
                '',
                style: TextStyle(color: Colors.blueAccent),
              ),
              SizedBox(height: 8),
              Text('Nama file', style: TextStyle(color: Colors.white70)),
              Text(
                '5 Menit Video Tutorial Ep_16 - Sejarah...',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 24),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () async {
                    await Video.uploadVideoWeb(
                      video: video,
                      thumbnail: this.thumbnail,
                      title: titleController.text,
                      desc: descriptionController.text,
                    );

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyHomePage(isLogin: true)));
                  },
                  child: Text('Berikutnya'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Video>>(
          future: Video.fetchVideos(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            List<Video> videos = snapshot.data!;

            return CustomScrollView(
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
                            image: AssetImage("images/youtube.png"),
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
                              padding: EdgeInsets.symmetric(
                                  vertical: 7, horizontal: 15),
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
                              title: "News to You",
                              onTap: () {},
                              isActive: false),
                          SizedBox(
                            width: 10,
                          ),
                          MyButton(
                              title: "Gaming", onTap: () {}, isActive: false),
                          SizedBox(
                            width: 10,
                          ),
                          MyButton(
                              title: "Music", onTap: () {}, isActive: false),
                          SizedBox(
                            width: 10,
                          ),
                          MyButton(
                              title: "Sport", onTap: () {}, isActive: false),
                          SizedBox(
                            width: 10,
                          ),
                          MyButton(
                              title: "Live", onTap: () {}, isActive: false),
                          SizedBox(
                            width: 10,
                          ),
                          MyButton(
                              title: "Kids", onTap: () {}, isActive: false),
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
                    childCount: videos.length,
                    (context, index) {
                      final video = videos[index];
                      return MyVideo(
                        video: video,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MyMobileVideoPage(video: video),
                            ),
                          );
                        },
                      );
                    },
                  ),
                )
              ],
            );
          }),
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
              child: IconButton(
                  onPressed: () {
                    showUploadModal1(context);
                  },
                  icon: Icon(
                    Icons.add,
                    color: MyColor.white,
                  )),
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
              backgroundImage: AssetImage("images/thumbnail.jpg"),
            ),
            label: "You",
          ),
        ],
      ),
    );
  }
}
