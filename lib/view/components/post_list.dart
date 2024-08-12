import 'package:flutter/material.dart';
import 'package:trade_diary/desginSystem/color.dart';

class PostListWidget extends StatelessWidget {
  final List<Map<String, String>> postList;
  const PostListWidget({super.key, required this.postList});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: postList
          .map((post) =>
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(
                  children: [
                    Text(
                      post['category'] ?? "없엉",
                      style: const TextStyle(color: DiaryColorBlue.normal),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      post['title'] ?? "없엉",
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
              ]))
          .toList(),
    ));
  }
}
