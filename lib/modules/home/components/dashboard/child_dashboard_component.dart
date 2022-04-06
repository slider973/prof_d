import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/styles/sizes.dart';
import '../../../../core/viewmodels/main_core_viewmodel.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../viewmodel/home_viewmodel.dart';
import 'card_component/card_component.dart';
import 'package:intl/intl.dart';
import '../../../../authentification/models/user_model.dart';

class ChildDashBoardComponent extends ConsumerWidget {
  const ChildDashBoardComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final timeTableList = ref.watch(homeViewModelViewModelProvider.notifier);

    final currentUser =
        ref.watch(mainCoreViewModelProvider.notifier).getCurrentUser();
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        buildHeaderDashboardComponent(currentUser, context),
        Container(
          color: Colors.grey[300],
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 9.0, top: 8.0),
            child: Text(
              'Voici la liste de reservation selectionner une ci desous',
              style: TextStyle(
                fontSize: Sizes.fontSizes['h6'],
              ),
            ),
          ),
        ),
        Expanded(
            child: Container(
          color: Colors.grey[300],
          child: FutureBuilder(
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              // WHILE THE CALL IS BEING MADE AKA LOADING
              if (ConnectionState.active != null && !snapshot.hasData) {
                return const Center(child: Text('Loading'));
              }

              // WHEN THE CALL IS DONE BUT HAPPENS TO HAVE AN ERROR
              if (ConnectionState.done != null && snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }

              // IF IT WORKS IT GOES HERE!
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    final data = snapshot.data[index];
                    final DateFormat formatter =
                        DateFormat("yMMMMEEEEd", 'fr_FR');
                    final DateTime now = DateTime.parse(data['date']);
                    final String formatted = formatter.format(now);
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 9.0, right: 9.0, bottom: 9.0),
                      child: SizedBox(

                        height: 150,
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(Sizes.cardRadius),
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                          ListTile(
                            leading: const Icon(Icons.event),
                            title: CustomText.h4(
                              context,
                              formatted,
                              alignment: Alignment.center,
                            ),
                          ),
                                Expanded(

                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: data['slots'].length,
                                      itemBuilder: (context, index) {
                                        final DateFormat formatter =
                                            DateFormat("Hm");
                                        final DateTime currentHours =
                                            DateTime.parse(data['slots'][index]);
                                        final String formatted =
                                            formatter.format(currentHours);
                                        return Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            TextButton(
                                              child: Text(formatted),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  PageRouteBuilder(
                                                    pageBuilder: (_, __, ___) =>
                                                        const SizedBox.shrink(),
                                                    transitionDuration:
                                                        const Duration(
                                                            milliseconds: 300),
                                                    transitionsBuilder: (_,
                                                            animation,
                                                            __,
                                                            child) =>
                                                        SlideTransition(
                                                            position: Tween<
                                                                        Offset>(
                                                                    begin:
                                                                        const Offset(
                                                                            0, 1),
                                                                    end: Offset
                                                                        .zero)
                                                                .animate(
                                                                    animation),
                                                            child: child),
                                                  ),
                                                );
                                              },
                                              style: TextButton.styleFrom(
                                                  primary: Colors.white,
                                                  backgroundColor:
                                                      Theme.of(context)
                                                          .primaryColor),
                                            ),
                                          ],
                                        );
                                      }),
                                ),
                              ]),
                        ),
                      ),
                    );
                  });
            },
            future: timeTableList.getTimeTableAndSlot(),
          ),
        )),
      ],
    );
  }

  Container buildHeaderDashboardComponent(
      UserModel? currentUser, BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text('Bonjour ${currentUser?.firstname}',
                    style: Theme.of(context).textTheme.headline5),
              )
            ],
          ),
        ],
      ),
      height: 50,
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
    );
  }
}
