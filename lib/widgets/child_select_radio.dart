import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../views/create_events.dart';

class ChildRadioSelect extends StatefulWidget {
  final List<QueryDocumentSnapshot> dataList;

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
      setState(() {
        CreateEvents.of(context)?.childSelected = {
          'first_name': widget.dataList[_currentChildValue]['firstname'],
          'last_name': widget.dataList[_currentChildValue]['lastname'],
          'id': widget.dataList[_currentChildValue].id,
          'child': true
        };
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(8.0),
      children: widget.dataList.map((child) {
        return RadioListTile(
          groupValue: _currentChildValue,
          title: Text(child['firstname']),
          value: buildIndexWhere(child),
          onChanged: (val) {
            setState(() {
              _currentChildValue = buildIndexWhere(child);
              CreateEvents.of(context)?.childSelected = {
                'first_name': child['firstname'],
                'last_name': child['lastname'],
                'id': child.id,
                'child': true
              };
            });
          },
        );
      }).toList(),
    );
  }

  int buildIndexWhere(QueryDocumentSnapshot<Object?> child) {
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
