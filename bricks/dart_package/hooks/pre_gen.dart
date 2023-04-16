import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  final logger = context.logger;

  final projectName = context.vars['project_name'] as String;
  final description = context.vars['description'] as String;
  final publishable = context.vars['publishable'] as bool;

  final process = await Process.run(
    'mason',
    [
      'make',
      'very_good_dart_package',
      '--description',
      description,
      'project_name=$projectName',
      'publishable=$publishable',
    ],
  );

  if (process.exitCode != 0) {
    logger.err(process.stderr);
    exit(1);
  }

  logger.info(process.stdout);
}
