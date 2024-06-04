import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:iparkpatrol_mobile/utlis/colors.dart';
import 'package:iparkpatrol_mobile/widgets/text_widget.dart';

class PrintTicketPage extends StatefulWidget {
  String name;
  String address;
  String gender;
  String license;
  String expiry;
  String nationality;
  String height;
  String weight;
  String restriction;
  String plateno;
  String maker;
  String color;
  String model;
  String marking;

  PrintTicketPage(
      {super.key,
      required this.name,
      required this.address,
      required this.gender,
      required this.license,
      required this.expiry,
      required this.nationality,
      required this.color,
      required this.height,
      required this.maker,
      required this.marking,
      required this.model,
      required this.plateno,
      required this.restriction,
      required this.weight});

  @override
  State<PrintTicketPage> createState() => _PrintTicketPageState();
}

class _PrintTicketPageState extends State<PrintTicketPage> {
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
              Container(
                width: double.infinity,
                height: 600,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: primary),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: TextWidget(
                          text: 'Illegal Parking Citation Ticket',
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Bold',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextWidget(
                        text:
                            'Date: ${DateFormat("MMMM d, yyyy").format(DateTime.now())}',
                        fontSize: 12,
                        color: Colors.black,
                        fontFamily: 'Medium',
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextWidget(
                        text:
                            'Time: ${DateFormat("h:mm a").format(DateTime.now())}',
                        fontSize: 12,
                        color: Colors.black,
                        fontFamily: 'Medium',
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextWidget(
                        text:
                            'Citation Ticket Number: ${DateTime.now().year}-${DateTime.now().month}-001',
                        fontSize: 12,
                        color: Colors.black,
                        fontFamily: 'Medium',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      rowData('Name', widget.name),
                      const SizedBox(
                        height: 5,
                      ),
                      rowData('Address', widget.address),
                      const SizedBox(
                        height: 5,
                      ),
                      rowData('Gender', widget.gender),
                      const SizedBox(
                        height: 5,
                      ),
                      rowData('Drivers License Number', widget.license),
                      const SizedBox(
                        height: 5,
                      ),
                      rowData('Expiry', widget.expiry),
                      const SizedBox(
                        height: 5,
                      ),
                      rowData('Nationality', widget.nationality),
                      const SizedBox(
                        height: 5,
                      ),
                      rowData('Height', widget.height),
                      const SizedBox(
                        height: 5,
                      ),
                      rowData('Weight', widget.weight),
                      const SizedBox(
                        height: 5,
                      ),
                      rowData('Restriction', widget.restriction),
                      const SizedBox(
                        height: 20,
                      ),
                      rowData('Plate No.', widget.plateno),
                      const SizedBox(
                        height: 5,
                      ),
                      rowData('Maker', widget.maker),
                      const SizedBox(
                        height: 5,
                      ),
                      rowData('Color', widget.color),
                      const SizedBox(
                        height: 5,
                      ),
                      rowData('Model', widget.model),
                      const SizedBox(
                        height: 5,
                      ),
                      rowData('Marking', widget.marking),
                      const SizedBox(
                        height: 20,
                      ),
                      // Align(
                      //   alignment: Alignment.bottomRight,
                      //   child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     crossAxisAlignment: CrossAxisAlignment.center,
                      //     children: [
                      //       TextWidget(
                      //         decoration: TextDecoration.underline,
                      //         text: 'Mark Lister Nalupa',
                      //         fontSize: 14,
                      //         color: Colors.black,
                      //       ),
                      //       TextWidget(
                      //         text: 'Traffic Enforcer on Case',
                      //         fontSize: 14,
                      //         color: Colors.black,
                      //         fontFamily: 'Bold',
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/logo.png',
                              height: 75,
                            ),
                            Image.asset(
                              'assets/images/RTA logo 1.png',
                              height: 75,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  decoration: BoxDecoration(
                      color: primary, borderRadius: BorderRadius.circular(7.5)),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.print,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
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

  rowData(String label, String data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextWidget(
          text: '$label:',
          fontSize: 12,
          color: Colors.black,
          fontFamily: 'Bold',
        ),
        const SizedBox(
          width: 10,
        ),
        TextWidget(
          decoration: TextDecoration.underline,
          text: data,
          fontSize: 12,
          color: Colors.black,
          fontFamily: 'Bold',
        ),
      ],
    );
  }
}
