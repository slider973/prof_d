import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/styles/sizes.dart';
import '../../models/child_model.dart';
import '../../viewmodels/child_screen_view_model.dart';

childListFutureBuilder(BuildContext context, WidgetRef ref) {
  final childViewModel = ref.watch<ChildViewModel>(childViewModelProvider);
  return FutureBuilder(
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        // WHILE THE CALL IS BEING MADE AKA LOADING
        if (!snapshot.hasData) {
          return const Center(child: Text('Loading'));
        }

        // WHEN THE CALL IS DONE BUT HAPPENS TO HAVE AN ERROR
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }
        if (childViewModel.childList.isEmpty) {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //TODO ajouter en valiare dans le fichier de configuration
              SvgPicture.asset('assets/images/profile/flying-a-kite.svg',
                  height: 200),
              SizedBox(
                height: Sizes.hPaddingSmallest,
              ),
              const Text('Ajouter un enfant'),
            ],
          ));
        }

        return ListView.builder(
            itemCount: childViewModel.childList.length,
            itemBuilder: (context, index) {
              ChildModel child = childViewModel.childList[index];

              return ListTile(
                title: Text('${child.firstname} ${child.lastname}'),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   PageRouteBuilder(
                  //     pageBuilder: (_, __, ___) => Container(),
                  //     transitionDuration: const Duration(milliseconds: 300),
                  //     transitionsBuilder: (_, animation, __, child) =>
                  //         SlideTransition(
                  //             position: Tween<Offset>(
                  //                     begin: const Offset(0, 1),
                  //                     end: Offset.zero)
                  //                 .animate(animation),
                  //             child: child),
                  //   ),
                  // );
                },
              );
            });
      },
      future: childViewModel.getChildList());
}
