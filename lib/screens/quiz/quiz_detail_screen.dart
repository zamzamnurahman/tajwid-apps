import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tajwid_apps/controller/answer_controller.dart';
import 'package:tajwid_apps/controller/get_data.dart';
import 'package:tajwid_apps/models/quiz.dart';
import 'package:tajwid_apps/screens/components/button_effect.dart';
import 'package:tajwid_apps/screens/components/remove_glow.dart';
import 'package:tajwid_apps/screens/score_screen.dart';

import '../../config/theme.dart';
import '../components/button_soal.dart';
import '../components/card_description.dart';

class QuizDetail extends ConsumerStatefulWidget {
  final int number;
  const QuizDetail(this.number, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuizDetailState();
}

class _QuizDetailState extends ConsumerState<QuizDetail> {
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
      ref.watch(getDataQuizProvider.notifier).getDataQuiz();
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final List<Quiz> quiz = ref.watch(getDataQuizProvider);
    // final answer = ref.watch(answerProvider);
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 100,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text("Nun Mati Quiz",
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: CircleAvatar(
            backgroundColor: primaryColor.withOpacity(0.2),
            foregroundColor: Colors.black,
            child: const Icon(Icons.keyboard_arrow_left),
          ),
        ),
        actions: [
          IconButton(
              padding: const EdgeInsets.all(20.0),
              onPressed: () {
                scaffoldKey.currentState!.openEndDrawer();
              },
              icon: const Icon(Icons.more_horiz, color: Colors.black))
        ],
      ),
      endDrawer: drawer(quiz, context, widget.number),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: linearGradient,
        ),
        child: SafeArea(
          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: quiz[widget.number].data != null
                ? quiz[widget.number].data!.map((e) {
                    final List<Options>? options = e.options;
                    return Column(
                      children: [
                        CardDescription(desctiption: e.description!),
                        const SizedBox(height: 10),
                        Column(
                            children: List.generate(options!.length, (index) {
                          String answer = options[index].status!;
                          return ButtonClickUp(
                            click: () {
                              if (e.asnwer == index) {
                                ref
                                    .watch(handleAnswerProvider.notifier)
                                    .increment();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    behavior: SnackBarBehavior.floating,
                                    duration: Duration(milliseconds: 300),
                                    backgroundColor: Colors.green,
                                    content: Text('Benar'),
                                  ),
                                );
                              } else {
                                print(_pageController.page);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    behavior: SnackBarBehavior.floating,
                                    duration: Duration(milliseconds: 300),
                                    backgroundColor: Colors.red,
                                    content: Text('Salah'),
                                  ),
                                );
                              }

                              if (_pageController.page == options.length - 1) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: Colors.white,
                                    content: Text(
                                      'Selamat Quiz telah selesai',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                );
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) => const ScoreScreen(),
                                    ),
                                    (route) => false);
                              } else {
                                _pageController.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.bounceInOut);
                              }
                            },
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  gradient: answer == "none"
                                      ? linearGradientLight
                                      : null,
                                  color: answer == "true"
                                      ? Colors.green
                                      : Colors.red,
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(color: primaryColor),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(2, 2),
                                      blurRadius: 10,
                                      spreadRadius: 3,
                                      color: Colors.black.withOpacity(0.1),
                                    )
                                  ]),
                              child: ListTile(
                                title: Text("${options[index].option}",
                                    textAlign: TextAlign.center),
                              ),
                            ),
                          );
                        })),
                      ],
                    );
                  }).toList()
                : [
                    Text("${quiz[widget.number].data![0]}"),
                  ],
          ),
        ),
      ),
    );
  }

  Drawer drawer(List<Quiz> quiz, BuildContext context, int number) {
    return Drawer(
      backgroundColor: primaryColor.withOpacity(0.5),
      child: SafeArea(
        child: Column(
          children: [
            const ListTile(
              title: Text(
                "Soal Nun Mati",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: ScrollConfiguration(
                behavior: NoGlowScrollBehavior(),
                child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (_, index) => Column(
                          children: [
                            Column(
                              children: List.generate(quiz[number].data!.length,
                                  (index) {
                                return ButtonSoal(
                                  pageController: _pageController,
                                  number: index + 1,
                                );
                              }),
                            ),
                            ButtonClickUp(
                              click: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const ScoreScreen()));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: linearGradientDark,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: const ListTile(
                                  title: Text("Selesai",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                                ),
                              ),
                            ),
                          ],
                        )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
