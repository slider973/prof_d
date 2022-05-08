import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../modules/account/models/child_model.dart';
import '../views/create_events.dart';

class ChildRadioSelect extends StatefulWidget {
  final List<ChildModel> dataList;

  const ChildRadioSelect({Key? key, required this.dataList}) : super(key: key);

  @override
  _ChildRadioSelectState createState() => _ChildRadioSelectState();
}

class _ChildRadioSelectState extends State<ChildRadioSelect> {
  int _currentChildValue = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero,(){
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(8.0),
      children: widget.dataList.map((child) {
        return RadioListTile(
          groupValue: _currentChildValue,
          title: Text(child.firstname),
          value: buildIndexWhere(child),
          onChanged: (val) {
            setState(() {
              _currentChildValue = buildIndexWhere(child);
            });
          },
        );
      }).toList(),
    );
  }

  int buildIndexWhere(ChildModel child) {
    return widget.dataList.indexWhere((element) {
      return element.id == child.id;
    });
  }
}

/**
 * snapshot.data!.docs.map((DocumentSnapshot document) {
    Map<String, dynamic> data =
    document.data()! as Map<String, dynamic>;
    return ListTile(
    title: Text(data['firstname']),
    );
    }).toList(),
 */
