import 'package:flutter/material.dart';
import 'package:motel_list/app/app_widget.dart';
import 'package:motel_list/app/core/core_provider.dart';
import 'package:motel_list/app/motel/motel_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [...CoreProvider.providers, ...MotelProvider.providers],
      child: const AppWidget(),
    ),
  );
}
