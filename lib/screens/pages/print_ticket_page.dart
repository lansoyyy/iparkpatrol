import 'package:flutter/material.dart';
import 'package:iparkpatrol_mobile/utlis/colors.dart';
import 'package:iparkpatrol_mobile/widgets/text_widget.dart';

class PrintTicketPage extends StatelessWidget {
  const PrintTicketPage({super.key});

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
                        text: 'Date: January 5, 2024',
                        fontSize: 12,
                        color: Colors.black,
                        fontFamily: 'Medium',
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextWidget(
                        text: 'Time: 12:00 P.M.',
                        fontSize: 12,
                        color: Colors.black,
                        fontFamily: 'Medium',
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextWidget(
                        text: 'Citation Ticket Number: 2024-01-001',
                        fontSize: 12,
                        color: Colors.black,
                        fontFamily: 'Medium',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      rowData('Name', 'Sample data'),
                      const SizedBox(
                        height: 5,
                      ),
                      rowData('Address', 'Sample data'),
                      const SizedBox(
                        height: 5,
                      ),
                      rowData('Gender', 'Sample data'),
                      const SizedBox(
                        height: 5,
                      ),
                      rowData('Drivers License Number', 'Sample data'),
                      const SizedBox(
                        height: 5,
                      ),
                      rowData('Expiry', 'Sample data'),
                      const SizedBox(
                        height: 5,
                      ),
                      rowData('Nationality', 'Sample data'),
                      const SizedBox(
                        height: 5,
                      ),
                      rowData('Height', 'Sample data'),
                      const SizedBox(
                        height: 5,
                      ),
                      rowData('Weight', 'Sample data'),
                      const SizedBox(
                        height: 5,
                      ),
                      rowData('Restriction', 'Sample data'),
                      const SizedBox(
                        height: 20,
                      ),
                      rowData('Plate No.', 'Sample data'),
                      const SizedBox(
                        height: 5,
                      ),
                      rowData('Maker', 'Sample data'),
                      const SizedBox(
                        height: 5,
                      ),
                      rowData('Color', 'Sample data'),
                      const SizedBox(
                        height: 5,
                      ),
                      rowData('Model', 'Sample data'),
                      const SizedBox(
                        height: 5,
                      ),
                      rowData('Marking', 'Sample data'),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextWidget(
                              decoration: TextDecoration.underline,
                              text: 'Mark Lister Nalupa',
                              fontSize: 14,
                              color: Colors.black,
                            ),
                            TextWidget(
                              text: 'Traffic Enforcer on Case',
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: 'Bold',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
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
