import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  await _removeFiles(context, '.gitkeep');
}

Future<void> _removeFiles(HookContext context, String name) async {
  final removingFilesProgress =
      context.logger.progress('removing .gitkeep files ...');
  var dir = Directory('.');
  await dir
      .list(recursive: true)
      .where((element) => element.toString().contains(name))
      .listen(
    (element) {
      element.delete();
    },
    onDone: () => removingFilesProgress.complete('.gitkeep files removed!'),
  );
}
