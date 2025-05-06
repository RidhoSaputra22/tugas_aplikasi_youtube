import 'package:flutter/material.dart';
import 'package:tugas_aplikasi_youtube/widget/my_color.dart';

class MyButton extends StatelessWidget {
  final String? title;
  final Color? color;
  final Function() onTap;
  final IconData? icon;
  final bool isActive;
  final EdgeInsetsGeometry padding;
  final BorderRadius borderRadius;

  MyButton({
    super.key,
    required this.onTap,
    this.title,
    this.color,
    this.icon,
    this.isActive = false,
    this.padding = const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
    this.borderRadius = const BorderRadius.all(Radius.circular(5)),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: color != null
                ? color
                : isActive
                    ? Colors.white
                    : MyColor.buttonGray,
            borderRadius: borderRadius,
          ),
          child: Row(
            children: [
              icon != null ? Icon(icon) : Container(),
              title != null
                  ? Text(
                      title!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isActive ? Colors.black : Colors.white,
                      ),
                    )
                  : Container(),
            ],
          )),
      onTap: onTap,
    );
  }
}
