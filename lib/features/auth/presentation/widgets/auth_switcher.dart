import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthAccountSwitcher extends StatelessWidget {
  const AuthAccountSwitcher({
    required this.text,
    required this.onPressed,
    required this.textButtonText,
    super.key,
  });
  final String textButtonText;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => Row(
    spacing: 4.w,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(text),
      GestureDetector(
        onTap: onPressed,
        child: Text(
          textButtonText,
          style: const TextStyle(decoration: TextDecoration.underline),
        ),
      ),
    ],
  );

  // RichText(
  //   text: TextSpan(
  //     children: [
  //       TextSpan(text: text),
  //       WidgetSpan(
  //         child: Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 10.0),
  //           child: GestureDetector(
  //             onTap: onPressed,
  //             child: Text(textButtonText),
  //           ),
  //         ),
  //       ),
  //     ],
  //   ),
  // );
}
