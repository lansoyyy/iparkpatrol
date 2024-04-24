import 'package:flutter/material.dart';
import 'package:iparkpatrol_mobile/screens/pages/add_ticket_page.dart';
import 'package:iparkpatrol_mobile/screens/pages/print_ticket_page.dart';
import 'package:iparkpatrol_mobile/utlis/colors.dart';
import 'package:iparkpatrol_mobile/widgets/button_widget.dart';
import 'package:iparkpatrol_mobile/widgets/text_widget.dart';
import 'package:iparkpatrol_mobile/widgets/textfield_widget.dart';

class InputLicensePage extends StatefulWidget {
  const InputLicensePage({super.key});

  @override
  State<InputLicensePage> createState() => _InputLicensePageState();
}

class _InputLicensePageState extends State<InputLicensePage> {
  final licensenumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: primary,
                      size: 32,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextWidget(
                text: 'Create Citation Ticket',
                fontSize: 18,
                color: primary,
                fontFamily: 'Bold',
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                controller: licensenumber,
                label: 'Input License Number',
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ButtonWidget(
                  width: 150,
                  radius: 15,
                  fontSize: 14,
                  color: primary,
                  label: 'Enter',
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AddTicketPage(
                              license: licensenumber.text,
                            )));
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
