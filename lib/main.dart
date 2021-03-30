import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_expenses_app/pages/home_page.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:provider/provider.dart';

import 'model/transaction_model.dart';
import 'providers/home_page_provider.dart';

Future<void> main() async {
  await initHiveForApp();
  runApp(MyApp());
}

Future<void> initHiveForApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(TransactionAdapter());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomePageProvider>(
          create: (_) => HomePageProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
