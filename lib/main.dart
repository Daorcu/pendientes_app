import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:pendientes_app/pages/home_page.dart';
import 'package:pendientes_app/providers/pendiente_provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PendienteProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pendientes App',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          // Color Dark
          // scaffoldBackgroundColor: Color(0xff353940),
          scaffoldBackgroundColor: Colors.orange,
        ),
        home: HomePage(),
      ),
    );
  }
}
