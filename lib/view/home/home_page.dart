import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '나의 일기',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 30),
                const Text(
                  '작년 이맘때,\n여행 일기에요 ✈️',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 12),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.indigoAccent[700],
                        borderRadius: BorderRadius.circular(14)),
                    width: 400,
                    height: 150,
                    child: Padding(
                        padding: const EdgeInsets.all(28),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '#오사카 #도쿄 #후쿠오카',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        '일본 여행 중\n가장 잊지 못할 추억',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            height: 1.3,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.circle),
                                width: 110,
                                height: 120,
                              ),
                            ]))),
                const SizedBox(
                  height: 20,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '교환 한 일기',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      TextButton(
                          onPressed: () {
                            GoRouter.of(context).go('/exchange');
                          },
                          child: const Text('더보기'))
                    ])
              ],
            )),
      )),
    );
  }
}
