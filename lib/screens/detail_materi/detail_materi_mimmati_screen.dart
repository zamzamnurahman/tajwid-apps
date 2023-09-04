import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:tajwid_apps/screens/components/remove_glow.dart';

import '../../config/theme.dart';
import '../../controller/get_data.dart';
import '../../models/materi.dart';
import '../components/card_materi.dart';

final pageProvider = StateProvider<int>((ref) => 0);

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
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
      ref.watch(getDataMateriProvider.notifier).getDataMateri();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int index = ref.watch(pageProvider);
    Materi dataMateri = ref.watch(getDataMateriProvider)[1];
    final isPlay = ref.watch(audioProvider);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leadingWidth: 100,
          leading: InkWell(
            onTap: () {
              ref.watch(pageProvider.notifier).state = 0;
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
            child: Column(children: [
              SizedBox(
                height: 350,
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageCtrl,
                  onPageChanged: (index) {
                    ref.read(pageProvider.notifier).state = index;
                  },
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 30,
                        ),
                        Container(
                          width: 250,
                          height: double.infinity,
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                dataMateri.body![0].subTitle!.toUpperCase(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 34,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                width: 100,
                                child: const IntrinsicHeight(
                                  child: Divider(
                                    color: Colors.black,
                                    thickness: 2,
                                    height: 2,
                                  ),
                                ),
                              ),
                              Text(dataMateri.title!),
                            ],
                          ),
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                dataMateri.body![1].subTitle!.toUpperCase(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 34,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                width: 100,
                                child: const IntrinsicHeight(
                                  child: Divider(
                                    color: Colors.black,
                                    thickness: 2,
                                    height: 2,
                                  ),
                                ),
                              ),
                              Text(dataMateri.title!),
                            ],
                          ),
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                dataMateri.body![2].subTitle!.toUpperCase(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 34,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                width: 100,
                                child: const IntrinsicHeight(
                                  child: Divider(
                                    color: Colors.black,
                                    thickness: 2,
                                    height: 2,
                                  ),
                                ),
                              ),
                              Text(dataMateri.title!),
                            ],
                          ),
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
                      final bool isCurrent = currentIndex == index;
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
                  index: index,
                  children: dataMateri.body!
                      .map((e) => Container(
                            height: double.infinity,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                                gradient: linearGradientLight,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50),
                                )),
                            child: SingleChildScrollView(
                              physics: const NeverScrollableScrollPhysics(),
                              child: Column(children: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      gradient: linearGradientLight,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(50),
                                        topRight: Radius.circular(50),
                                      )),
                                  child: Column(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            modalBottom(context, dataMateri,
                                                index, isPlay);
                                          },
                                          icon: const Icon(
                                              Icons
                                                  .keyboard_double_arrow_up_outlined,
                                              size: 30)),
                                      const SizedBox(height: 10),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                            dataMateri.body![index].subTitle!,
                                            textAlign: TextAlign.start,
                                            style: const TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                            )
                                            // style: const TextStyle(fontSize: 16),
                                            ),
                                      ),
                                      Text(
                                        dataMateri.body![index].description!,
                                        textAlign: TextAlign.justify,
                                        // style: const TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ])));
  }

  Future<dynamic> modalBottom(
    BuildContext context,
    Materi dataMateri,
    int index,
    bool isPlay,
  ) {
    return showModalBottomSheet(
      isScrollControlled: true,
      enableDrag: false,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(50),
        topRight: Radius.circular(50),
      )),
      context: context,
      builder: (context) => StatefulBuilder(builder: (context, state) {
        return Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.7,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
              gradient: linearGradientLight,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              )),
          child: ScrollConfiguration(
            behavior: NoGlowScrollBehavior(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                          Icons.keyboard_double_arrow_down_outlined,
                          size: 30)),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(dataMateri.body![index].subTitle!,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        )
                        // style: const TextStyle(fontSize: 16),
                        ),
                  ),
                  Text(
                    dataMateri.body![index].description!,
                    textAlign: TextAlign.justify,
                    // style: const TextStyle(fontSize: 16),
                  ),
                  ListTile(
                    title: const Text("Contoh : "),
                    subtitle: Wrap(
                      alignment: WrapAlignment.end,
                      children: [
                        RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: const TextStyle(
                                fontSize: 40,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                TextSpan(
                                  text: dataMateri.body![index].contoh![0],
                                ),
                                TextSpan(
                                  text: dataMateri.body![index].contoh![1],
                                  style: const TextStyle(
                                    color: Colors.green,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                TextSpan(
                                  text: dataMateri.body![index].contoh![2],
                                ),
                              ],
                            )),
                        if (!isPlay)
                          IconButton(
                              onPressed: () async {
                                print("PLAY ${isPlay}");
                                state(() {
                                  isPlay = true;
                                });

                                final audio = AudioPlayer();
                                final duration = await audio.setAsset(
                                  dataMateri.body![index].sound!,
                                );

                                audio.setVolume(5.0);
                                audio.play().whenComplete(() {
                                  state(() {
                                    isPlay = false;
                                  });
                                });
                              },
                              icon: const Icon(Icons.play_circle))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
