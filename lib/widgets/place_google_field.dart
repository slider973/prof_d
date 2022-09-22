import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_place/google_place.dart';

class GooglePlaceField extends StatefulWidget {
  final TextEditingController controller;

  const GooglePlaceField({Key? key, required this.controller})
      : super(key: key);

  @override
  _GooglePlaceFieldState createState() => _GooglePlaceFieldState();
}

class _GooglePlaceFieldState extends State<GooglePlaceField> {
  late GooglePlace googlePlace;

  List<AutocompletePrediction> predictions = [];

  @override
  void initState() {
    googlePlace = GooglePlace("AIzaSyDup-iEb6B0BVznU0mq1NRG0S0QFJ1MbOc");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 50.0, top: 20.0),
            child: fieldTextSearch()),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: predictions.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Transform.translate(
                offset: Offset(5, -1.90.h),
                child: const CircleAvatar(
                  backgroundColor: Colors.teal,
                  child: Icon(
                    Icons.pin_drop,
                    color: Colors.white,
                  ),
                ),
              ),
              title: Transform.translate(
                offset: Offset(0, -2.90.h),
                child: Text(predictions[index].description!),
              ),
              onTap: () {
                debugPrint(predictions[index].placeId);
                widget.controller.text = predictions[index].description ?? '';
                setState(() {
                  predictions = [];
                });
              },
            );
          },
        ),
      ],
    );
  }

  void autoCompleteSearch(String value) async {
    var result = await googlePlace.autocomplete.get(value,
        language: "fr",
        types: '(regions)',
        components: [Component("country", "fr")]);
    if (result != null && result.predictions != null && mounted) {
      setState(() {
        predictions = result.predictions!;
      });
    }
  }

  Widget fieldTextSearch() {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: "Ville de naissance",
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: Colors.teal,
            width: 0.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: Colors.black,
            width: 0.5,
          ),
        ),
      ),
      onChanged: (value) {
        ;
        if (value.isNotEmpty) {
          try {
            autoCompleteSearch(value);
          } catch (e) {
            print(e);
          }
        } else {
          if (predictions.isNotEmpty && mounted) {
            setState(() {
              predictions = [];
            });
          }
        }
      },
    );
  }
}
