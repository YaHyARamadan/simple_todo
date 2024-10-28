import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/core/theme/theme.dart';
import 'package:to_do_app/core/theme/theme_provider.dart';
import 'package:to_do_app/features/main_screen/view/main_screen.dart';

import 'core/routes/router.dart';
import 'core/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: themeProvider.themeData,
            initialRoute: AppRoutes.mainScreen,
            onGenerateRoute: onGenerate,
          );
        },
      ),
    );
  }
}
