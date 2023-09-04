import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:tajwid_apps/controller/get_data.dart';
import 'package:tajwid_apps/models/hukum_mad.dart';
import 'package:tajwid_apps/screens/components/remove_glow.dart';
import 'package:tajwid_apps/screens/detail_hukum_mad_screen.dart';

import '../config/theme.dart';

final navgitaionProvider = StateProvider<int>((ref) => 0);
final audioProvider = StateProvider<bool>((ref) => false);

class HukumMadScreen extends ConsumerStatefulWidget {
  const HukumMadScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HukumMadScreenState();
}

class _HukumMadScreenState extends ConsumerState<HukumMadScreen> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
      ref.watch(getdataHukumMadProvider.notifier).getDataMateri();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int index = ref.watch(navgitaionProvider);
    final List<HukumMad> data = ref.watch(getdataHukumMadProvider);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Hukum Mad",
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
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
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: linearGradient,
          ),
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Center(
                      child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: primaryLightColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        NavigationMateri(
                          title: "Mad Asli",
                          isSelect: index == 0,
                          onTap: () {
                            ref.watch(navgitaionProvider.notifier).state = 0;
                          },
                        ),
                        NavigationMateri(
                          title: "Mad Far'i",
                          isSelect: index == 1,
                          onTap: () {
                            ref.watch(navgitaionProvider.notifier).state = 1;
                          },
                        ),
                      ],
                    ),
                  )),
                ),
                Expanded(
                  flex: 6,
                  child: IndexedStack(
                    index: index,
                    children: [
                      ///[Mad Asli]
                      MadAsliWidget(data: data),

                      ///[Mad Fari]
                      MadFariWidget(data: data),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class MadFariWidget extends StatelessWidget {
  const MadFariWidget({
    super.key,
    required this.data,
  });

  final List<HukumMad> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: linearGradientDark,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: ScrollConfiguration(
        behavior: NoGlowScrollBehavior(),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 20),
            ListTile(
              title: Text(data[1].title!,
                  style: const TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
              subtitle: Text(
                data[1].deskripsi!,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              title: Text(data[1].options!.description!,
                  style: const TextStyle(color: Colors.white)),
            ),
            Column(
              children: data[1]
                  .options!
                  .subpoints!
                  .map((e) => Card(
                        color: primaryLightColor,
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return DetailHukumMadScreen(data: e);
                            }));
                          },
                          title: Text(e.title!),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                          ),
                        ),
                      ))
                  .toList(),
            )
          ]),
        ),
      ),
    );
  }
}

class MadAsliWidget extends StatelessWidget {
  const MadAsliWidget({
    super.key,
    required this.data,
  });

  final List<HukumMad> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: linearGradientDark,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(data[0].title!,
                style: const TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),
            Text(data[0].deskripsi!,
                style: const TextStyle(color: Colors.white)),
            const SizedBox(height: 20),
            Text(data[0].options!.description!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: data[0]
                  .options!
                  .points!
                  .map((e) => Text("- $e",
                      style: const TextStyle(
                        color: Colors.white,
                      )))
                  .toList(),
            ),
            const SizedBox(height: 20),
            Text(data[0].subtitle!,
                style: const TextStyle(
                  color: Colors.white,
                )),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(data[0].example!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                  Consumer(
                    builder: (_, ref, __) => ref.watch(audioProvider)
                        ? const SizedBox()
                        : IconButton(
                            onPressed: () async {
                              final audio = AudioPlayer();
                              final duration = await audio.setAsset(
                                data[0].audio!,
                              );
                              ref.watch(audioProvider.notifier).state = true;
                              audio.setVolume(5.0);
                              audio.play().whenComplete(() => ref
                                  .watch(audioProvider.notifier)
                                  .state = false);
                            },
                            icon: const Icon(Icons.play_circle)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationMateri extends StatelessWidget {
  final String title;
  final bool isSelect;
  final void Function()? onTap;
  const NavigationMateri({
    super.key,
    required this.isSelect,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: isSelect ? primaryColor : null,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
