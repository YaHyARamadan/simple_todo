import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/core/theme/theme_provider.dart';
import 'core/routes/router.dart';
import 'core/routes/routes.dart';
import 'features/main_screen/view_model/task_provider.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox('todoBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => TaskProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
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
