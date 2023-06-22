import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tajwid_apps/config/theme.dart';
import 'package:tajwid_apps/controller/mute_controller.dart';
import 'package:tajwid_apps/screens/components/button_effect.dart';
import 'package:tajwid_apps/screens/materi_screen.dart';
import 'package:tajwid_apps/screens/quiz_scren.dart';

import 'components/button_circle.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMute = ref.watch(handleMuteProvider);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                          backgroundColor: primaryDark,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  print(isMute);
                                  ref
                                      .watch(handleMuteProvider.notifier)
                                      .changeIsMuted(!isMute);
                                  Navigator.pop(context);
                                },
                                child: ButtonCircle(
                                  isGradient: false,
                                  child: Icon(
                                    isMute
                                        ? Icons.volume_down
                                        : Icons.volume_mute,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const ButtonCircle(
                                isGradient: false,
                                child: Icon(
                                  Icons.email,
                                  color: Colors.white,
                                ),
                              ),
                              const ButtonCircle(
                                isGradient: false,
                                child: Icon(
                                  Icons.info_outline,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ));
              },
              icon: const Icon(Icons.menu),
            )
          ],
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: linearGradient,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset("assets/images/lafad.svg"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonClickUp(
                    click: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const MateriScreen();
                      }));
                    },
                    child: const ButtonCircle(
                      isGradient: true,
                      child: Icon(Icons.assignment, size: 30),
                    ),
                  ),
                  ButtonClickUp(
                    click: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const QuizScreen();
                      }));
                    },
                    child: const ButtonCircle(
                      isGradient: true,
                      child: Icon(Icons.play_arrow, size: 40),
                    ),
                  ),
                ],
              ),
              Image.asset(
                "assets/images/illustration_cover.png",
                height: 200,
              ),
            ],
          ),
        ));
  }
}
