import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:intl/intl.dart' show DateFormat;

class FieldDateView extends StatefulWidget {
  final DateTime day;
  final DateTime hour;
  const FieldDateView({Key? key, required this.day, required this.hour}) : super(key: key);

  @override
  _FieldDateViewState createState() => _FieldDateViewState();
}

class _FieldDateViewState extends State<FieldDateView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.translationValues(
            0, 0, 0),
        child: Column(
          children: [
            FxSpacing.height(25),
            const Text("Service demandé le:"),
            FxText.h3(DateFormat.yMMMMEEEEd('fr').format(
              widget.day
            )),
            FxText.h3(
                'à ${DateFormat('HH:mm').format(widget.hour)} '),
          ],
        )
    );
  }
}