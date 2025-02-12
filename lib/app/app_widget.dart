import 'package:flutter/material.dart';
import 'package:motel_list/app/core/ui/theme.dart';
import 'package:motel_list/app/motel/ui/home_page.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Motéis',
      theme: lightTheme,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(1.0),
          ),
          child: child ?? const SizedBox.shrink(),
        );
      },
      home: Builder(
        builder: (context) {
          return const HomePage();
        },
      ),
    );
  }
}
