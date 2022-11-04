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
              text: 'T',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: tdBlueGoogle)),
          const TextSpan(
              text: 'o',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: tdRedGoogle)),
          const TextSpan(
              text: 'D',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: tdYellowGoogle)),
          const TextSpan(
              text: 'o',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: tdBlueGoogle)),
          TextSpan(
              text: ' Lists',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).cardColor)),
        ],
      ),
    );
  }
}
