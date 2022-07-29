import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/build_row.dart';
import '../../components/container_child_section_component.dart';
import '../../components/empty_state_follow_up.dart';
import '../../models/child.dart';
import '../../models/result_follow_up_child.dart';
import '../../viewmodels/create_follow_up_viewmodel.dart';
import '../../viewmodels/following_viewmodel.dart';

class FollowUpScreen extends ConsumerWidget {
  final Child childSelected;

  const FollowUpScreen(this.childSelected, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createFollowUpVM = ref.watch(createFollowUpViewModel);
    final followingVM = ref.watch(followingViewModelProvider);
    return FutureBuilder(
        future: followingVM.getFollowUp(childSelected.id),
        builder: (context, AsyncSnapshot<ResultFollowUpChild> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator.adaptive();
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return EmptyStateFollowUp(
                followingVM: followingVM,
                createFollowUpVM: createFollowUpVM,
                childSelected: childSelected,
              );
            } else if (snapshot.hasData) {
              final data = snapshot.data!;
              final followUpChild = data.result;
              return Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: ContainerChildSectionComponent(
                  children: [
                    BuildRow(
                      children: [
                        const Text(
                          'Date de démarage du suivie',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(followUpChild.start)
                      ],
                    ),
                    BuildRow(
                      children: [
                        const Text(
                          'Nombre de suivie',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(followUpChild.numberOfFollowUp.toString())
                      ],
                    ),
                    BuildRow(
                      children: [
                        const Text(
                          'Nombre d\' activité réaliser',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(followUpChild.numberOfActivities.toString())
                      ],
                    ),
                    BuildRow(
                      children: [
                        const Text(
                          'Etats avant le suivie',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(followUpChild.stateBefore)
                      ],
                    )
                  ],
                ),
              );
            } else {
              return EmptyStateFollowUp(
                followingVM: followingVM,
                createFollowUpVM: createFollowUpVM,
                childSelected: childSelected,
              );
            }
          } else {
            return Text('State: ${snapshot.connectionState}');
          }
        });
  }
}
