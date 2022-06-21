import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/styles/sizes.dart';
import '../../core/widgets/custom_text.dart';
import '../models/follow_up_subject.dart';
import '../viewmodels/following_viewmodel.dart';

class AddFollowingScreen extends ConsumerStatefulWidget {
  final String idAppointment;

  const AddFollowingScreen({Key? key, required this.idAppointment})
      : super(key: key);

  @override
  ConsumerState<AddFollowingScreen> createState() => _AddFollowingScreenState();
}

class _AddFollowingScreenState extends ConsumerState<AddFollowingScreen> {
  late List<bool> _isChecked = [];

  @override
  void initState() {
    ref.read(followingViewModelProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _followingVM =
        ref.watch<FollowingViewModel>(followingViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Evalutation du rendez-vous'),
      ),
      body: FutureBuilder<List<FollowUpSubject>>(
          future: _followingVM.getFollowSubject(),
          builder: (context, snapshot) {
            // WHILE THE CALL IS BEING MADE AKA LOADING
            if (!snapshot.hasData) {
              return const CircularProgressIndicator.adaptive();
            }

            // WHEN THE CALL IS DONE BUT HAPPENS TO HAVE AN ERROR
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            final list = snapshot.data!;
            if (_isChecked.isEmpty) {
              _isChecked = List<bool>.filled(list.length, false);
            }

            return Column(
              children: [
                SizedBox(
                  height: Sizes.hMarginSmallest,
                ),
                CustomText.h6(
                  context,
                  "Quels sont les sujets travailler",
                  alignment: Alignment.center,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return CheckboxListTile(
                          title: Text(list[index].name),
                          value: _isChecked[index],
                          onChanged: (val) {
                            setState(
                              () {
                                _isChecked[index] = val!;
                              },
                            );
                            if (val == true) {
                              _followingVM.addFollowUpSubject(list[index].id);
                            } else {
                              _followingVM
                                  .removeFollowUpSubject(list[index].id);
                            }
                          },
                        );
                      },
                    ),
                  ),
                ),
                _buildMakeAppointmentAgainButton(() {
                  _followingVM.sendFollowUpDetail();
                }),
                SizedBox(
                  height: Sizes.hMarginSmallest,
                ),
              ],
            );
          }),
    );
  }
}

ElevatedButton _buildMakeAppointmentAgainButton(cb) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        primary: Colors.teal,
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        shape: const StadiumBorder(),
        elevation: 0),
    onPressed: () {
      cb();
    },
    child: const Text(
      'Enregistrer',
      style: TextStyle(height: 1.0, fontSize: 12),
    ),
  );
}
