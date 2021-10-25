import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/book_appointment_controller.dart';
import '../../../models/address_model.dart';

class FieldSelectedAddress extends StatefulWidget {
  final List<Address> addressList;
  const FieldSelectedAddress({Key key, @required this.addressList})
      : super(key: key);

  @override
  State<FieldSelectedAddress> createState() => _FieldSelectedAddressState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _FieldSelectedAddressState extends State<FieldSelectedAddress> {
  String dropdownValue = "VICHY";
  final BookingAppointmentController _controller = Get.put(BookingAppointmentController());

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
      value: dropdownValue,
      icon: const Icon(Icons.add_business_sharp),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      underline: Container(
        height: 2,
        color: Colors.black12,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: widget.addressList.map<DropdownMenuItem<String>>((Address value) {
        return DropdownMenuItem<String>(
          value: value.locality,
          child: Text(value.locality),
        );
      }).toList(),
    );
  }
}
