import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tajwid_apps/config/theme.dart';
import 'package:tajwid_apps/controller/mute_controller.dart';
import 'package:tajwid_apps/screens/components/button_effect.dart';
import 'package:tajwid_apps/screens/materi_screen.dart';
import 'package:tajwid_apps/screens/quiz_scren.dart';
import 'package:url_launcher/url_launcher.dart';

import 'components/button_circle.dart';

class WelcomeScreen extends ConsumerStatefulWidget {
  const WelcomeScreen({super.key});

  @override
  ConsumerState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends ConsumerState<WelcomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _emailCtrl;
  late TextEditingController _deskriptionCtrl;


  @override
  void initState() {
    _emailCtrl = TextEditingController();
    _deskriptionCtrl = TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    bool isMute = ref.watch(handleMuteProvider);
    return WillPopScope(
      onWillPop: () {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  content: const Text("Yakin Keluar Aplikasi?"),
                  actions: [
                    OutlinedButton(
                        onPressed: Navigator.of(context).pop,
                        child: const Text(
                          "Kembali",
                          style: TextStyle(color: Colors.black),
                        )),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor),
                        onPressed: () => SystemNavigator.pop(),
                        child: const Text(
                          "Keluar",
                        )),
                  ],
                ));
        return Future.value(true);
      },
      child: Scaffold(
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
                      builder: (_) =>
                          StatefulBuilder(builder: (context, state) {
                            final size = MediaQuery.of(context).size;
                            return AlertDialog(
                              backgroundColor: primaryDark,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              content: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {

                                      state(() {
                                        ref
                                            .watch(handleMuteProvider.notifier)
                                            .changeIsMuted(!isMute);
                                        isMute = !isMute;
                                      });
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
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (_) {
                                            return StatefulBuilder(
                                              builder: (context, state) {
                                                return AlertDialog(
                                                  scrollable: true,
                                                  insetPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical:
                                                              size.height * 0.05,
                                                          horizontal: 25),
                                                  title: SizedBox(
                                                      width: size.width,
                                                      child: const Text(
                                                          "Kirimkan Pesan mengenai Aplikasi")),
                                                  content: Form(
                                                    key: _formKey,
                                                    child: Column(
                                                      children: [
                                                        TextFormField(
                                                          controller: _deskriptionCtrl,
                                                          minLines: 3,
                                                          maxLines: null,
                                                          decoration: const InputDecoration(
                                                              border: OutlineInputBorder(),
                                                              hintText: "Masukkan Deskripsi"
                                                          ),
                                                          validator: (value){
                                                            if(value!.isEmpty){
                                                              return "harap isi";
                                                            }
                                                            return null;
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  actions: [
                                                    ElevatedButton(
                                                        onPressed: () async{
                                                          if(_formKey.currentState!.validate()){
                                                            String? encodeQueryParameters(Map<String, String> params) {
                                                              return params.entries
                                                                  .map((MapEntry<String, String> e) =>
                                                              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                                                  .join('&');
                                                            }
// ···
                                                            final Uri emailLaunchUri = Uri(
                                                              scheme: 'mailto',
                                                              path: '1806046@itg.ac.id',
                                                              query: encodeQueryParameters(<String, String>{
                                                                'subject': 'Pesan penilaian Aplikasi tajwid',
                                                                'body' : _deskriptionCtrl.text
                                                              }),
                                                            );
                                                            if(await canLaunchUrl(emailLaunchUri)) {
                                                              launchUrl(
                                                                  emailLaunchUri);
                                                            }
                                                          }
                                                        },
                                                        child: const Text("Kirim"),
                                                    style: ElevatedButton.styleFrom(
                                                      backgroundColor: primaryColor,
                                                    ),
                                                    ),
                                                  ],
                                                );
                                              }
                                            );
                                          });
                                    },
                                    child: const ButtonCircle(
                                      isGradient: false,
                                      child: Icon(
                                        Icons.email,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (_) => AboutDialog(
                                                applicationIcon: Image.asset(
                                                  "assets/images/illustration_cover.png",
                                                  height: 50,
                                                  width: 50,
                                                ),
                                                applicationName: "Tajwid Apps",
                                                applicationVersion: "V.1.0.0",
                                                children: const [
                                                  Text(
                                                      "Tajwid Apps adalah sebuah aplikasi pembelajaran pada pengetahuan Tajwid"),
                                                ],
                                              ));
                                    },
                                    child: const ButtonCircle(
                                      isGradient: false,
                                      child: Icon(
                                        Icons.info_outline,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }));
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
                    const SizedBox(width: 20),
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
          )),
    );
  }
}
