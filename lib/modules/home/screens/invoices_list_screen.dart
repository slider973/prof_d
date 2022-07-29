import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/viewmodels/main_core_viewmodel.dart';

class InvoicesListScreen extends ConsumerWidget {
  const InvoicesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _userModel =
        ref.watch(mainCoreViewModelProvider.notifier).getCurrentUser();
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
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: _userModel!.invoices?.length,
        itemBuilder: (context, index) {
          final invoices = _userModel.invoices?[index];

          return ListTile(
            title: Text(
              DateFormat("yMMMMEEEEd", 'fr_FR').format(invoices!.invoiceDate!),
            ),
            onTap: () {},
          );
        },
      ),
    );
  }
}
