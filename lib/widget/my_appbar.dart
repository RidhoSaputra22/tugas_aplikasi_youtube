import 'package:flutter/material.dart';
import 'package:tugas_aplikasi_youtube/widget/my_button.dart';
import 'package:tugas_aplikasi_youtube/widget/my_color.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  MyAppBar({Key? key}) : super(key: key);

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
            onTap: () {},
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
