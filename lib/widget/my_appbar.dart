import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tugas_aplikasi_youtube/models/video.dart';
import 'dart:typed_data';
import 'package:tugas_aplikasi_youtube/widget/my_button.dart';
import 'package:tugas_aplikasi_youtube/widget/my_color.dart';

import 'package:file_picker/file_picker.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  MyAppBar({Key? key}) : super(key: key);

  void showUploadModal1(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => Center(
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
                child: Text(
                  'Upload video',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 40),
              Icon(Icons.upload_file, size: 80, color: Colors.white70),
              SizedBox(height: 16),
              Text(
                'Tarik lalu lepas file video yang ingin diupload',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'Video Anda akan bersifat pribadi sampai Anda memublikasikannya.',
                style: TextStyle(color: Colors.white38, fontSize: 14),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles();

                  if (result != null && result.files.single.bytes != null) {
                    final fileBytes = result.files.single.bytes!;
                    final fileName = result.files.single.name;

                    showUploadModal2(
                      context,
                      fileBytes,
                      fileName,
                    );
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
              Text(
                'Dengan mengirimkan video ke YouTube, Anda menyatakan bahwa Anda setuju dengan Persyaratan Layanan dan Pedoman Komunitas YouTube.',
                style: TextStyle(fontSize: 12, color: Colors.white38),
                textAlign: TextAlign.center,
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
    Uint8List fileBytes,
    String fileName,
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
                '5 Menit Video Tutorial Ep 16  Sejarah Singkat Komputer Grafis',
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
                  hintText: '5 Menit Video Tutorial Ep 16...',
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
                  hintText: 'Beri tahu penonton tentang video Anda...',
                  hintStyle: TextStyle(color: Colors.white38),
                  filled: true,
                  fillColor: Colors.grey[800],
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Text('Link video', style: TextStyle(color: Colors.white70)),
              SelectableText(
                'https://youtu.be/hQzI8Vxwxz4',
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
                    // await Video.uploadVideoWeb(
                    //   fileBytes: fileBytes,
                    //   fileName: fileName,
                    //   title: titleController.text,
                    //   desc: descriptionController.text,
                    // );

                    Navigator.pop(context);
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
  Size get preferredSize => Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Icon(Icons.menu),
      title: Row(
        children: [
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage("images/youtube.png"),
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(width: 5),
          Text(
            "Premium",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Container(
            height: 40,
            width: 600,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: MyColor.buttonGray),
            ),
            child: TextField(
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
                      bottomRight: Radius.circular(20),
                    ),
                    color: MyColor.buttonGray,
                  ),
                  child: Icon(Icons.search, color: MyColor.white),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          MyButton(
            padding: EdgeInsets.all(10),
            icon: Icons.mic,
            borderRadius: BorderRadius.circular(100),
            onTap: () {},
          ),
          Spacer(),
          MyButton(
            onTap: () {
              showUploadModal1(context);
            },
            icon: Icons.add,
            borderRadius: BorderRadius.circular(20),
            title: "Buat",
          ),
          SizedBox(width: 10),
          MyButton(
            onTap: () {},
            color: Colors.transparent,
            icon: Icons.notifications_outlined,
            borderRadius: BorderRadius.circular(20),
          ),
          SizedBox(width: 5),
          CircleAvatar(
            backgroundImage: AssetImage("images/thumbnail.jpg"),
          ),
        ],
      ),
    );
  }
}
