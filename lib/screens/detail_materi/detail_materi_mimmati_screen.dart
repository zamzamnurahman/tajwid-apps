import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/theme.dart';

final pageProvider = StateNotifierProvider<PageNotifier, int>((ref) {
  return PageNotifier();
});

class PageNotifier extends StateNotifier<int> {
  PageNotifier() : super(0);

  changePage(int newIndex) => state = newIndex;
}

class DetailMateriMimMatiScreen extends ConsumerStatefulWidget {
  const DetailMateriMimMatiScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DetailMateriMimMatiScreenState();
}

class _DetailMateriMimMatiScreenState
    extends ConsumerState<DetailMateriMimMatiScreen> {
  late PageController _pageCtrl;

  @override
  void initState() {
    _pageCtrl = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int _index = ref.watch(pageProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 100,
        leading: InkWell(
          onTap: () {
            ref.watch(pageProvider.notifier).changePage(0);
            Navigator.pop(context);
          },
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
            SizedBox(
              height: 350,
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageCtrl,
                onPageChanged: ref.watch(pageProvider.notifier).changePage,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 30,
                      ),
                      Container(
                        width: 250,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            gradient: linearGradientLight,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset(1, 1),
                                blurRadius: 20,
                                spreadRadius: 5,
                              )
                            ]),
                      ),
                      InkWell(
                        onTap: () {
                          _pageCtrl.animateToPage(1,
                              duration: const Duration(milliseconds: 100),
                              curve: Curves.bounceInOut);
                        },
                        child: Container(
                          height: 250,
                          width: 30,
                          decoration: BoxDecoration(
                              gradient: linearGradientLight,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(1, 1),
                                  blurRadius: 20,
                                  spreadRadius: 5,
                                )
                              ]),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          _pageCtrl.animateToPage(0,
                              duration: const Duration(milliseconds: 100),
                              curve: Curves.bounceInOut);
                        },
                        child: Container(
                          height: 250,
                          width: 30,
                          decoration: BoxDecoration(
                              gradient: linearGradientLight,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(1, 1),
                                  blurRadius: 20,
                                  spreadRadius: 5,
                                )
                              ]),
                        ),
                      ),
                      Container(
                        width: 250,
                        decoration: BoxDecoration(
                            gradient: linearGradientLight,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset(1, 1),
                                blurRadius: 20,
                                spreadRadius: 5,
                              )
                            ]),
                      ),
                      InkWell(
                        onTap: () {
                          _pageCtrl.animateToPage(2,
                              duration: const Duration(milliseconds: 100),
                              curve: Curves.bounceInOut);
                        },
                        child: Container(
                          height: 250,
                          width: 30,
                          decoration: BoxDecoration(
                              gradient: linearGradientLight,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(1, 1),
                                  blurRadius: 20,
                                  spreadRadius: 5,
                                )
                              ]),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          _pageCtrl.animateToPage(1,
                              duration: const Duration(milliseconds: 100),
                              curve: Curves.bounceInOut);
                        },
                        child: Container(
                          height: 250,
                          width: 30,
                          decoration: BoxDecoration(
                              gradient: linearGradientLight,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(1, 1),
                                  blurRadius: 20,
                                  spreadRadius: 5,
                                )
                              ]),
                        ),
                      ),
                      Container(
                        width: 250,
                        decoration: BoxDecoration(
                            gradient: linearGradientLight,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset(1, 1),
                                blurRadius: 20,
                                spreadRadius: 5,
                              )
                            ]),
                      ),
                      Container(
                        width: 30,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.all(10),
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(3, (currentIndex) {
                    final bool isCurrent = currentIndex == _index;
                    return GestureDetector(
                      onTap: () {
                        _pageCtrl.animateToPage(
                          currentIndex,
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: CircleAvatar(
                        radius: isCurrent ? 7 : 5,
                        backgroundColor:
                            isCurrent ? Colors.white : Colors.black,
                      ),
                    );
                  }),
                ),
              ),
            ),
            Expanded(
              child: IndexedStack(
                index: _index,
                children: List.generate(
                  3,
                  (index) => Container(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
