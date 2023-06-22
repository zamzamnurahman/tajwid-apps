import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tajwid_apps/controller/get_data.dart';
import 'package:tajwid_apps/models/quiz.dart';

import '../../config/theme.dart';

class QuizNunmatiScreen extends ConsumerStatefulWidget {
  const QuizNunmatiScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _QuizNunmatiScreenState();
}

class _QuizNunmatiScreenState extends ConsumerState<QuizNunmatiScreen> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
      ref.watch(getDataQuizProvider.notifier).getDataQuiz();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final List<Quiz> quiz = ref.watch(getDataQuizProvider);
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
      endDrawer: Drawer(
        backgroundColor: primaryColor.withOpacity(0.5),
        child: const SafeArea(
          child: Column(
            children: [
              DrawerHeader(
                  child: Text(
                "Soal Nun Mati",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ))
            ],
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: linearGradient,
        ),
        child: SafeArea(
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            children: quiz[0]
                .data!
                .map(
                  (e) => Column(
                    children: [
                      CardDescription(
                        desctiption: e.description!,
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class CardDescription extends StatelessWidget {
  final String desctiption;
  const CardDescription({
    super.key,
    required this.desctiption,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          gradient: linearGradientLight,
          borderRadius: BorderRadius.circular(25.0),
          boxShadow: [
            BoxShadow(
              offset: const Offset(2, 2),
              blurRadius: 10,
              spreadRadius: 3,
              color: Colors.black.withOpacity(0.1),
            )
          ],
          border: Border.all(
            color: primaryColor,
          )),
      child: Center(
        child: Text(desctiption,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
            )),
      ),
    );
  }
}
