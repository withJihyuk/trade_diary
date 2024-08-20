import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:trade_diary/desginSystem/color.dart';
import 'package:trade_diary/viewmodel/oauth_model.dart';
import 'package:trade_diary/view/components/global_appbar.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final oauth = OauthViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: DiaryColor.globalColor,
        appBar: const GlobalAppbar(title: "로그인"),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 40),
                          const Text(
                            "로그인 해주세요",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 14),
                          Align(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                InkWell(
                                    onTap: () => kIsWeb
                                        ? oauth.webGoogleLogin()
                                        : oauth.nativeGoogleLogin(),
                                    child: Container(
                                        padding: const EdgeInsets.all(20),
                                        height: 70,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors.white),
                                        child: Row(children: [
                                          Image.asset(
                                            'assets/images/google.png',
                                            width: 40,
                                            height: 40,
                                          ),
                                          const SizedBox(width: 20),
                                          const Text("Google로 계속하기 ",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600))
                                        ]))),
                                const SizedBox(height: 8),
                                InkWell(
                                    onTap: () => print("애플 로그인"),
                                    child: Container(
                                        padding: const EdgeInsets.all(20),
                                        height: 70,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors.white),
                                        child: Row(children: [
                                          Image.asset(
                                            'assets/images/apple.png',
                                            width: 40,
                                            height: 40,
                                          ),
                                          const SizedBox(width: 20),
                                          const Text("Apple로 계속하기",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600))
                                        ])))
                              ],
                            ),
                          ),
                        ])))));
  }
}
