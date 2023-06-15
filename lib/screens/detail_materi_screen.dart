import 'package:flutter/material.dart';

import '../config/theme.dart';

class DetailMateriScreen extends StatefulWidget {
  const DetailMateriScreen({super.key});

  @override
  State<DetailMateriScreen> createState() => _DetailMateriScreenState();
}

class _DetailMateriScreenState extends State<DetailMateriScreen> {
  late PageController _pageCtrl;

  @override
  void initState() {
    _pageCtrl = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 100,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: CircleAvatar(
            backgroundColor: primaryColor.withOpacity(0.2),
            foregroundColor: Colors.black,
            child: const Icon(Icons.keyboard_arrow_left),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 100),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: linearGradient,
        ),
        child: Column(
          children: [
            Container(
              height: 100,
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageCtrl,
                onPageChanged: (page) {},
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(onPressed: () {}, child: const Text("")),
                      const Chip(
                          backgroundColor: Colors.white, label: Text("Idhar")),
                      TextButton(
                        onPressed: () {
                          _pageCtrl.animateToPage(
                            1,
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.bounceInOut,
                          );
                        },
                        child: const Text("Idgham"),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          _pageCtrl.animateToPage(
                            0,
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.bounceInOut,
                          );
                        },
                        child: const Text("Idhar"),
                      ),
                      const Chip(
                        backgroundColor: Colors.white,
                        label: Text("Idgham"),
                      ),
                      TextButton(
                        onPressed: () {
                          _pageCtrl.animateToPage(
                            2,
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.bounceInOut,
                          );
                        },
                        child: const Text("Iqlab"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          _pageCtrl.animateToPage(
                            1,
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.bounceInOut,
                          );
                        },
                        child: const Text("Idgham"),
                      ),
                      const Chip(
                        backgroundColor: Colors.white,
                        label: Text("Iqlab"),
                      ),
                      TextButton(
                        onPressed: () {
                          _pageCtrl.animateToPage(
                            3,
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.bounceInOut,
                          );
                        },
                        child: const Text("Ikhfa"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          _pageCtrl.animateToPage(
                            2,
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.bounceInOut,
                          );
                        },
                        child: const Text("Idgham"),
                      ),
                      const Chip(
                        backgroundColor: Colors.white,
                        label: Text("Ikhfa"),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(""),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
                child: IndexedStack(
              index: 0,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: linearGradient,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(2, -5),
                          blurRadius: 10,
                        )
                      ],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      )),
                ),
                Container(
                  width: double.infinity,
                  color: Colors.green,
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
