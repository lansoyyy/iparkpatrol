import 'package:flutter/material.dart';
import 'package:iparkpatrol_mobile/screens/pages/view_notif_page.dart';
import 'package:iparkpatrol_mobile/utlis/colors.dart';
import 'package:iparkpatrol_mobile/widgets/text_widget.dart';

class NotifTab extends StatelessWidget {
  const NotifTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          TextWidget(
            text: 'Notifications',
            fontSize: 20,
            fontFamily: 'Bold',
            color: primary,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 500,
            width: double.infinity,
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                    bottom: 5,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 75,
                    color: primary,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: 'November 25, 2023 - 10:00 A.M.',
                                fontSize: 14,
                                color: Colors.white,
                                fontFamily: 'Regular',
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              TextWidget(
                                text: 'Divisoria No Parking Space',
                                fontSize: 14,
                                color: Colors.white,
                                fontFamily: 'Medium',
                              ),
                            ],
                          ),
                          const Expanded(child: SizedBox()),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const ViewNotifPage()));
                            },
                            child: TextWidget(
                              text: 'View',
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: 'Bold',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
