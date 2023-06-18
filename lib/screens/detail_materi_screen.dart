import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

import '../config/theme.dart';

final pageProvider = StateNotifierProvider<PageNotifier, int>((ref) {
  return PageNotifier();
});

class PageNotifier extends StateNotifier<int> {
  PageNotifier() : super(0);

  changePage(int newIndex) => state = newIndex;
}

// class DetailMateriScreen extends ConsumerStatefulWidget {
//   const DetailMateriScreen({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _DetailMateriScreenState();
// }

// class _DetailMateriScreenState extends ConsumerState<DetailMateriScreen> {

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
class DetailMateriScreen extends ConsumerStatefulWidget {
  const DetailMateriScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DetailMateriScreenState();
}

class _DetailMateriScreenState extends ConsumerState<DetailMateriScreen> {
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
    final int _index = ref.watch(pageProvider);
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
            SizedBox(
              height: 100,
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageCtrl,
                onPageChanged: ref.watch(pageProvider.notifier).changePage,
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
              index: _index,
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                      // gradient: linearGradient,
                      color: Colors.white.withOpacity(0.4),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(2, -5),
                          blurRadius: 10,
                        )
                      ],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      )),
                  child: Text("Judul"),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
