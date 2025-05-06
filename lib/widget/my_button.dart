import 'package:flutter/material.dart';
import 'package:tugas_aplikasi_youtube/widget/my_color.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  final bool isActive;

  MyButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
        decoration: BoxDecoration(
          color: isActive ? Colors.white : MyColor.buttonGray,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isActive ? Colors.black : Colors.white,
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
