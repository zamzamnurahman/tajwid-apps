import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

import '../../config/theme.dart';
import '../../models/materi.dart';
import 'remove_glow.dart';

final audioProvider = StateProvider.autoDispose<bool>((ref) => false);

class CardMateri extends ConsumerStatefulWidget {
  const CardMateri({
    super.key,
    required this.materi,
    required this.index,
  });

  final Body materi;
  final int index;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CardMateriState();
}

class _CardMateriState extends ConsumerState<CardMateri> {
  @override
  Widget build(BuildContext context) {
    final isPlay = ref.watch(audioProvider);
    return ScrollConfiguration(
      behavior: NoGlowScrollBehavior(),
      child: ListView.builder(
          // physics: const BouncingScrollPhysics(),
          itemCount: 1,
          itemBuilder: (_, index) {
            return Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                  gradient: linearGradientDark,
                  color: Colors.white.withOpacity(0.4),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(2, -5),
                      blurRadius: 10,
                    )
                  ],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(widget.materi.subTitle!,
                              style: const TextStyle(
                                fontSize: 46,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )),
                          const Row(
                            children: [
                              Text("Nun Mati",
                                  style: TextStyle(
                                    color: Colors.black87,
                                  )),
                              Expanded(
                                  child: Divider(
                                height: 1,
                                color: Colors.white,
                                indent: 10,
                                endIndent: 10,
                              )),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              widget.materi.description!,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Center(
                            child: Wrap(
                              children: [
                                RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: widget.materi.contoh![0],
                                        style: const TextStyle(
                                          fontSize: 34,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white70,
                                        )),
                                    TextSpan(
                                        text: widget.materi.contoh![1],
                                        style: const TextStyle(
                                          fontSize: 34,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          decoration: TextDecoration.underline,
                                        )),
                                    TextSpan(
                                        text: widget.materi.contoh![2],
                                        style: const TextStyle(
                                          fontSize: 34,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ))
                                  ]),
                                ),
                                const SizedBox(width: 20),
                                if (!isPlay)
                                  IconButton(
                                      onPressed: () async {
                                        final audio = AudioPlayer();
                                        final duration = await audio.setAsset(
                                          widget.materi.sound!,
                                        );
                                        ref
                                            .watch(audioProvider.notifier)
                                            .state = true;
                                        audio.setVolume(5.0);
                                        audio.play().whenComplete(() => ref
                                            .watch(audioProvider.notifier)
                                            .state = false);
                                      },
                                      icon: const Icon(Icons.play_circle))
                              ],
                            ),
                          ),
                          const SizedBox(height: 100),
                        ],
                      ),
                    );
                  }),
            );
          }),
    );
  }
}
