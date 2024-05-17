import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iparkpatrol_mobile/firebase_options.dart';
import 'package:iparkpatrol_mobile/screens/auth/login_page.dart';
import 'package:iparkpatrol_mobile/screens/pages/add_ticket_page.dart';
import 'package:iparkpatrol_mobile/screens/pages/input_license_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'iparkpatrol',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddTicketPage(
        license: '123',
      ),
    );
  }
}
