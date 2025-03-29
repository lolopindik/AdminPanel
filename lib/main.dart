import 'package:admin_panel_study_hub/logic/riverpod/observer.dart';
import 'package:admin_panel_study_hub/logic/riverpod/theme_switcher.dart';
import 'package:admin_panel_study_hub/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';

Future main () async{

  await Hive.initFlutter();
  // ignore: unused_local_variable
  var themebox = await Hive.openBox('AppTheme');
  
  await dotenv.load(fileName: ".env");

  runApp(
    ProviderScope(
      observers: [Observer()],
      child: MyApp(),
    )
  );
}

class MyApp extends ConsumerWidget{
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ref.watch(themeProvider).themeData,
      routerConfig: _appRouter.config(),
    );
  }
}
