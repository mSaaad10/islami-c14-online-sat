import 'package:flutter/material.dart';

import '../../../../../../core/resources/colors_manager.dart';

class HadithContent extends StatelessWidget {
  const HadithContent(
      {super.key,
      required this.content,
      this.contentColor = ColorsManager.black,
      this.maxLines,
      this.overflow});

  final String content;
  final Color contentColor;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Text(
        content,
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        overflow: overflow,
        maxLines: maxLines,
        style: TextStyle(
            color: contentColor, fontWeight: FontWeight.w600, fontSize: 16),
      ),
    );
  }
}
