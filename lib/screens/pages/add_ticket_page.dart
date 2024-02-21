import 'package:flutter/material.dart';
import 'package:iparkpatrol_mobile/screens/pages/print_ticket_page.dart';
import 'package:iparkpatrol_mobile/utlis/colors.dart';
import 'package:iparkpatrol_mobile/widgets/button_widget.dart';
import 'package:iparkpatrol_mobile/widgets/text_widget.dart';
import 'package:iparkpatrol_mobile/widgets/textfield_widget.dart';

class AddTicketPage extends StatefulWidget {
  const AddTicketPage({super.key});

  @override
  State<AddTicketPage> createState() => _AddTicketPageState();
}

class _AddTicketPageState extends State<AddTicketPage> {
  final name = TextEditingController();
  final address = TextEditingController();
  final gender = TextEditingController();
  final nationality = TextEditingController();
  final licensenumber = TextEditingController();
  final expiry = TextEditingController();
  final restriction = TextEditingController();
  final height = TextEditingController();
  final weight = TextEditingController();
  final platenumber = TextEditingController();
  final maker = TextEditingController();
  final color = TextEditingController();
  final model = TextEditingController();
  final marking = TextEditingController();
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
              TextWidget(
                text: 'Violator’s Information',
                fontSize: 16,
                color: primary,
                fontFamily: 'Bold',
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                controller: name,
                label: 'Name',
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                controller: address,
                label: 'Address',
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFieldWidget(
                    width: 150,
                    controller: gender,
                    label: 'Gender',
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextFieldWidget(
                    width: 150,
                    controller: nationality,
                    label: 'Nationality',
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                controller: licensenumber,
                label: 'License Number',
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFieldWidget(
                    width: 150,
                    controller: expiry,
                    label: 'Expiry',
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextFieldWidget(
                    width: 150,
                    controller: restriction,
                    label: 'Restriction',
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFieldWidget(
                    width: 150,
                    controller: height,
                    label: 'Height',
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextFieldWidget(
                    width: 150,
                    controller: weight,
                    label: 'Weight',
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextWidget(
                text: 'Vehicle’s Information',
                fontSize: 16,
                color: primary,
                fontFamily: 'Bold',
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                controller: platenumber,
                label: 'Plate Number',
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFieldWidget(
                    width: 150,
                    controller: maker,
                    label: 'Maker',
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextFieldWidget(
                    width: 150,
                    controller: color,
                    label: 'Color',
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFieldWidget(
                    width: 150,
                    controller: model,
                    label: 'Model',
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextFieldWidget(
                    width: 150,
                    controller: marking,
                    label: 'Marking',
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: ButtonWidget(
                  width: 150,
                  radius: 15,
                  fontSize: 14,
                  color: primary,
                  label: 'Generate Ticket',
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PrintTicketPage()));
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
