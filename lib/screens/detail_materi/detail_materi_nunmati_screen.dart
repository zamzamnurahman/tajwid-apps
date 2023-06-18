import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tajwid_apps/controller/get_data.dart';
import 'package:tajwid_apps/models/materi.dart';

import '../../config/theme.dart';
import '../components/card_materi.dart';

final pageProvider = StateNotifierProvider<PageNotifier, int>((ref) {
  return PageNotifier();
});

class PageNotifier extends StateNotifier<int> {
  PageNotifier() : super(0);

  changePage(int newIndex) => state = newIndex;
}

class DetailMateriNunMatiScreen extends ConsumerStatefulWidget {
  const DetailMateriNunMatiScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DetailMateriNunMatiScreenState();
}

class _DetailMateriNunMatiScreenState
    extends ConsumerState<DetailMateriNunMatiScreen> {
  late PageController _pageCtrl;

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
      ref.watch(getDataProvider.notifier).getData();
    });
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
    List<Materi> dataMateri = ref.watch(getDataProvider);
    print("CEK INDEX : ${_index.toString()}");
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
                    children: List.generate(
                      dataMateri[0].body!.length,
                      (index) => CardMateri(
                        materi: dataMateri[0].body![index],
                        index: index,
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
