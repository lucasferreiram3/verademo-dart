import 'package:flutter/material.dart';
import 'package:verademo_dart/model/Blab.dart';
import 'package:verademo_dart/utils/constants.dart';
import 'package:verademo_dart/widgets/app_bar.dart';

class BlabPage extends StatelessWidget {
  const BlabPage(this.blab, {super.key});

  final Blab blab;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: VAppBar('Blab'),
      body: SingleChildScrollView(
        padding: VConstants.pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // TODO: Original post
          // TODO: Comments list
          

          // TODO: Add comment field
        )
      )
    );
  }
}