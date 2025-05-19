import 'package:flutter/material.dart';
import 'package:tugas_aplikasi_youtube/models/komentar.dart';
import 'package:tugas_aplikasi_youtube/widget/my_button.dart';
import 'package:tugas_aplikasi_youtube/widget/my_color.dart';

class MyKomentar extends StatelessWidget {
  final Komentar komentar;

  const MyKomentar({
    super.key,
    required this.komentar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(
              komentar.user.photo,
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
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: MyColor.textColor,
                    ),
                    children: [
                      TextSpan(
                        text: komentar.user.nama,
                      ),
                      TextSpan(
                          text: komentar.dateCreated,
                          style: TextStyle(
                            color: MyColor.textGray,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  komentar.komentar,
                  style: TextStyle(
                    color: MyColor.textGray,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MyButton(
                        padding: EdgeInsets.zero,
                        onTap: () {},
                        color: MyColor.transparent,
                        icon: Icons.thumb_up_outlined,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("16 rb"),
                      MyButton(
                          onTap: () {},
                          color: MyColor.transparent,
                          icon: Icons.thumb_down_outlined),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Balas"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Spacer(),
          SizedBox(
            width: 30,
          ),
          MyButton(
            onTap: () {},
            color: MyColor.transparent,
            icon: Icons.more_vert,
          )
        ],
      ),
    );
  }
}
