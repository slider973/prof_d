import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app_bar.dart';
import 'child_list_futur_builder.dart';
import 'floating_action_button.dart';

class ChildListScreen extends ConsumerWidget {
  const ChildListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: childAppBar(context) ,
      floatingActionButton: childFloatingButtonAction(context),
      body:childListFutureBuilder(context, ref)
    );
  }
}
