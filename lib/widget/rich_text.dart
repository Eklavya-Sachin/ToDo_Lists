import 'package:flutter/material.dart';
import 'package:to_do_lists/themes/td_colors.dart';

class WidgetRichText extends StatelessWidget {
  const WidgetRichText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
              text: 'S',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: tdBlueGoogle)),
          const TextSpan(
              text: 'a',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: tdRedGoogle)),
          const TextSpan(
              text: 'c',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: tdYellowGoogle)),
          const TextSpan(
              text: 'h',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: tdBlueGoogle)),
          const TextSpan(
              text: 'i',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: tdGreenGoogle)),
          const TextSpan(
              text: 'n',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: tdRedGoogle)),
          TextSpan(
              text: ' Keep',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).cardColor)),
        ],
      ),
    );
  }
}
