import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:iparkpatrol_mobile/screens/pages/add_ticket_page.dart';
import 'package:iparkpatrol_mobile/screens/pages/input_license_page.dart';
import 'package:iparkpatrol_mobile/utlis/colors.dart';
import 'package:iparkpatrol_mobile/widgets/text_widget.dart';

class ViewNotifPage extends StatelessWidget {
  dynamic data;

  ViewNotifPage({
    super.key,
    required this.data,
  });

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
                height: 50,
              ),
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.network(
                          data['image_url'],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextWidget(
                        text:
                            'Time: ${DateFormat('hh:mm a').format(DateTime.parse(data.id.split('_')[0]))}',
                        fontSize: 12,
                        color: Colors.white,
                        fontFamily: 'Medium',
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextWidget(
                        text:
                            'Date: ${DateFormat('MMMM dd, yyyy').format(DateTime.parse(data.id.split('_')[0]))}',
                        fontSize: 12,
                        color: Colors.white,
                        fontFamily: 'Medium',
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextWidget(
                        text:
                            'Location: ${data['location']} - ${data['title_of_violation']}',
                        fontSize: 12,
                        color: Colors.white,
                        fontFamily: 'Medium',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => InputLicensePage(
                                data: data,
                              )));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: primary.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.receipt,
                              color: Colors.white,
                              size: 60,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextWidget(
                          text: 'Cite',
                          fontSize: 16,
                          color: primary,
                          fontFamily: 'Bold',
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await FirebaseFirestore.instance
                          .collection('illegal_parking')
                          .doc(data.id)
                          .update({'status': 'Rejected'});
                      Navigator.pop(context);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: primary.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 60,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextWidget(
                          text: 'Reject',
                          fontSize: 16,
                          color: primary,
                          fontFamily: 'Bold',
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
