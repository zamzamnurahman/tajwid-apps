import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:tajwid_apps/models/hukum_mad.dart';

import '../config/theme.dart';

final audioProvider = StateProvider.autoDispose<bool>((ref) => false);

class DetailHukumMadScreen extends ConsumerWidget {
  final Subpoints data;
  const DetailHukumMadScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPlay = ref.watch(audioProvider);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Detail Materi",
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
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.title!,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      )),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: linearGradientLight,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(data.description!),
                        const SizedBox(height: 25),
                        ListTile(
                          title: Text(data.example!,
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                fontSize: 34,
                                fontWeight: FontWeight.bold,
                              )),
                          trailing: isPlay
                              ? null
                              : IconButton(
                                  onPressed: () async {
                                    final audio = AudioPlayer();
                                    final duration = await audio.setAsset(
                                      data.audio!,
                                    );
                                    ref.watch(audioProvider.notifier).state =
                                        true;
                                    audio.setVolume(5.0);
                                    audio.play().whenComplete(() => ref
                                        .watch(audioProvider.notifier)
                                        .state = false);
                                  },
                                  icon: const Icon(Icons.play_circle)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
