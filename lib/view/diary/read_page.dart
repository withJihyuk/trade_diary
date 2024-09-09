import 'package:flutter/material.dart';
import 'package:markdown_editor_plus/markdown_editor_plus.dart';
import 'package:trade_diary/desginSystem/color.dart';
import 'package:go_router/go_router.dart';
import 'package:trade_diary/view/components/global_appbar.dart';
import 'package:trade_diary/view/components/user_box.dart';
import 'package:trade_diary/viewModel/diary_model.dart';

class ReadPage extends StatefulWidget {
  final String id;
  const ReadPage({super.key, required this.id});

  @override
  State<ReadPage> createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  final TextEditingController controller = TextEditingController();
  final DiaryPostViewModel viewModel = DiaryPostViewModel();

  @override
  void initState() {
    super.initState();
    loadDiaryPost();
  }

  Future<void> loadDiaryPost() async {
    try {
      final value = await viewModel.getDiaryPost(widget.id);
      if (value.isNotEmpty) {
        setState(() {
          controller.text = value[0]['content'];
        });
      } else if (mounted) {
        context.go('/error');
      }
    } catch (error) {
      if (mounted) {
        context.go('/error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const GlobalAppbar(
          title: "일기",
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          UserBox(
                              name: "이지혁",
                              description: "소통해요~",
                              imageUrl: "https://picsum.photos/200"),
                          Text(
                            "팔로우",
                            style: TextStyle(
                                fontSize: 18,
                                color: DiaryColorBlue.normal,
                                fontWeight: FontWeight.w500),
                          )
                        ]),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          viewModel.getTodayDate(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 30,
                              fontFamily: "EF_Diary"),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    MarkdownField(
                      padding: const EdgeInsets.all(0),
                      controller: controller,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      maxLines: 100,
                      readOnly: true,
                    ),
                  ])),
        )));
  }
}
