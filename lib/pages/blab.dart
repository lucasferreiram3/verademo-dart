import 'package:flutter/material.dart';
import 'package:verademo_dart/widgets/app_bar.dart';

class BlabPage extends StatelessWidget {
  const BlabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: VAppBar('Blab'),

    );
  }
}