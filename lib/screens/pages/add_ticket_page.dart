import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:iparkpatrol_mobile/screens/pages/print_ticket_page.dart';
import 'package:iparkpatrol_mobile/utlis/colors.dart';
import 'package:iparkpatrol_mobile/widgets/button_widget.dart';
import 'package:iparkpatrol_mobile/widgets/new_textfield_widget.dart';
import 'package:iparkpatrol_mobile/widgets/text_widget.dart';
import 'package:iparkpatrol_mobile/widgets/textfield_widget.dart';

class AddTicketPage extends StatefulWidget {
  String license;

  dynamic data;

  AddTicketPage({super.key, required this.data, required this.license});

  @override
  State<AddTicketPage> createState() => _AddTicketPageState();
}

class _AddTicketPageState extends State<AddTicketPage> {
  final name = TextEditingController();
  final address = TextEditingController();

  final nationality = TextEditingController();
  final licensenumber = TextEditingController();

  final restriction = TextEditingController();
  final height = TextEditingController();
  final weight = TextEditingController();
  final platenumber = TextEditingController();

  final expiry = TextEditingController();

  final color = TextEditingController();
  final model = TextEditingController();
  final marking = TextEditingController();

  String genderSelected = 'Male';
  String makerSelected = 'Toyota';
  @override
  Widget build(BuildContext context) {
    licensenumber.text = widget.license;
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Gender',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Bold',
                                color: primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const TextSpan(
                              text: '*',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Bold',
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: const Color(0xff0093CB),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: DropdownButton<String>(
                            underline: const SizedBox(),
                            value: genderSelected,
                            hint: const Text('Select gender'),
                            items:
                                <String>['Male', 'Female'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                      fontFamily: 'Bold', color: primary),
                                ),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                genderSelected = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
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
                isEnabled: false,
                controller: licensenumber,
                label: 'License Number',
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Expiry',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Bold',
                                  color: primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const TextSpan(
                                text: '*',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Bold',
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            dateFromPicker(context);
                          },
                          child: SizedBox(
                            width: 150,
                            height: 50,
                            child: TextFormField(
                              enabled: false,
                              style: TextStyle(
                                fontFamily: 'Regular',
                                fontSize: 14,
                                color: primary,
                              ),

                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintStyle: const TextStyle(
                                  fontFamily: 'Regular',
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                                hintText: expiry.text,
                                border: InputBorder.none,
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: primary,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: primary,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: primary,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.red,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                errorStyle: const TextStyle(
                                    fontFamily: 'Bold', fontSize: 12),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.red,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),

                              controller: expiry,
                              // Pass the validator to the TextFormField
                            ),
                          ),
                        ),
                      ],
                    ),
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
                  NewTextFieldWidget(
                    suffix: 'cm',
                    width: 150,
                    controller: height,
                    label: 'Height',
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  NewTextFieldWidget(
                    suffix: 'kg',
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Maker',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Bold',
                                color: primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const TextSpan(
                              text: '*',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Bold',
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: const Color(0xff0093CB),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: DropdownButton<String>(
                            underline: const SizedBox(),
                            value: makerSelected,
                            hint: const Text('Select maker'),
                            items: <String>[
                              'Toyota',
                              'Honda',
                              'Ford',
                              'Chevrolet',
                              'Nissan',
                              'BMW',
                              'Mercedes-Benz',
                              'Volkswagen',
                              'Audi',
                              'Hyundai',
                              'Kia',
                              'Mazda',
                              'Subaru',
                              'Tesla',
                              'Lexus',
                              'Jaguar',
                              'Land Rover',
                              'Porsche',
                              'Ferrari',
                              'Lamborghini'
                            ].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Bold',
                                      color: primary),
                                ),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                makerSelected = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
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
                  onPressed: () async {
                    await FirebaseFirestore.instance
                        .collection('illegal_parking')
                        .doc(widget.data.id)
                        .update({
                      'enforcerId': FirebaseAuth.instance.currentUser!.uid,
                      'status': 'Resolved',
                      'name': name.text,
                      'address': address.text,
                      'gender': genderSelected,
                      'license': widget.license,
                      'expiry': expiry.text,
                      'nationality': nationality.text,
                      'color': color.text,
                      'height': height.text,
                      'make': makerSelected,
                      'marking': marking.text,
                      'model': model.text,
                      'plateno': platenumber.text,
                      'restriction': restriction.text,
                      'weight': weight.text
                    });
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PrintTicketPage(
                            name: name.text,
                            address: address.text,
                            gender: genderSelected,
                            license: widget.license,
                            expiry: expiry.text,
                            nationality: nationality.text,
                            color: color.text,
                            height: height.text,
                            maker: makerSelected,
                            marking: marking.text,
                            model: model.text,
                            plateno: platenumber.text,
                            restriction: restriction.text,
                            weight: weight.text)));
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

  void dateFromPicker(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: primary,
                onPrimary: Colors.white,
                onSurface: Colors.grey,
              ),
            ),
            child: child!,
          );
        },
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2050));

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

      setState(() {
        expiry.text = formattedDate;
      });
    } else {
      return null;
    }
  }
}
