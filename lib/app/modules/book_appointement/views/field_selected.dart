import 'package:flutter/material.dart';

class FieldSelected extends StatefulWidget {
  FieldSelected() : super();

  @override
  _FieldSelectedState createState() {
    return _FieldSelectedState();
  }
}

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class _FieldSelectedState extends State<FieldSelected> {
WhyFarther _selection;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: PopupMenuButton<WhyFarther>(
        onSelected: (WhyFarther result) { setState(() { _selection = result; }); },
        itemBuilder: (BuildContext context) => [
          const PopupMenuItem(
            value: WhyFarther.harder,
            child: Text('Working a lot harder'),
          )
        ],
      ),
    );
  }
}