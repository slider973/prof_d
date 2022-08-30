import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/utils/navigate.dart';
import '../../../core/viewmodels/main_core_viewmodel.dart';
import '../../../core/widgets/loading_indicators.dart';
import 'pdf_viewer_screen.dart';

class InvoicesListScreen extends ConsumerWidget {
  const InvoicesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
/*    final userModel =
        ref.watch(mainCoreViewModelProvider.notifier).getCurrentUser();*/
    final mainVM = ref.watch(mainCoreViewModelProvider);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close_rounded),
          ),
          title: const Text('Facture'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            // WHILE THE CALL IS BEING MADE AKA LOADING
            if (ConnectionState.active != null && !snapshot.hasData) {
              return LoadingIndicators.instance.smallLoadingAnimation(context);
            }

            // WHEN THE CALL IS DONE BUT HAPPENS TO HAVE AN ERROR
            if (ConnectionState.done != null && snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }

            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                final invoices = snapshot.data[index];

                return ListTile(
                  title: Text(
                    DateFormat("yMMMMEEEEd", 'fr_FR')
                        .format(invoices!.invoiceDate!),
                  ),
                  onTap: () {
                    NavigateUtils.instance.navigationFromTheBottomAnimation(
                        context,
                        PdfViewer(
                          id: invoices.id!,
                        ));
                  },
                );
              },
            );
          },
          future: mainVM.getInvoices(),
        ));
  }
}
