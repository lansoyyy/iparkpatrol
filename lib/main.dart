import 'package:flutter/material.dart';
import 'package:iparkpatrol_mobile/screens/pages/add_ticket_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AddTicketPage(),
    );
  }
}
