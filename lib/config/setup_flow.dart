import 'package:flutter/material.dart';

class SetupFlow extends StatefulWidget {
  const SetupFlow({Key? key}) : super(key: key);

  @override
  _SetupFlowState createState() => _SetupFlowState();
}

class _SetupFlowState extends State<SetupFlow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildFlowAppBar(),
      body: const SizedBox(),
    );
  }

  PreferredSizeWidget _buildFlowAppBar() {
    return AppBar(
      title: const Text('Bulb Setup'),
    );
  }
}
