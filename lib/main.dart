// ignore_for_file: unused_local_variable

import 'package:admin_panel_study_hub/data/firebase_conf/firebase_options.dart';
import 'package:admin_panel_study_hub/logic/riverpod/observer.dart';
import 'package:admin_panel_study_hub/logic/riverpod/theme_switcher.dart';
import 'package:admin_panel_study_hub/presentation/routes/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';

Future main () async{

  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseDatabase database = FirebaseDatabase.instance;

  await Hive.initFlutter();
  var themebox = await Hive.openBox('AppTheme');
  var authstatus = await Hive.openBox('AuthStatus');

  runApp(
    ProviderScope(
      observers: [Observer()],
      child: MyApp(),
    )
  );
}

class MyApp extends ConsumerWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final appRouter = AppRouter(ref);
    
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      theme: ref.watch(themeProvider).themeData,
      routerConfig: appRouter.config(),
    );
  }
}
