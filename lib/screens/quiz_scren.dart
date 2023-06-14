import 'package:flutter/material.dart';
import 'package:tajwid_apps/models/materi.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Materi().getData();
    return const Scaffold(
      body: Column(
        children: [
          Text("data"),
        ],
      ),
    );
  }
}
