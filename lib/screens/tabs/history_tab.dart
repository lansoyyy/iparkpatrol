import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:iparkpatrol_mobile/utlis/colors.dart';
import 'package:iparkpatrol_mobile/widgets/text_widget.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            TextWidget(
              text: 'History',
              fontSize: 20,
              fontFamily: 'Bold',
              color: primary,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: primary,
              child: TabBar(
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.white,
                  tabs: [
                    Tab(
                      child: TextWidget(
                        text: 'Resolved',
                        fontSize: 14,
                        fontFamily: 'Bold',
                        color: Colors.white,
                      ),
                    ),
                    Tab(
                      child: TextWidget(
                        text: 'Rejected',
                        fontSize: 14,
                        fontFamily: 'Bold',
                        color: Colors.white,
                      ),
                    ),
                  ]),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 400,
              child: TabBarView(
                children: [
                  for (int i = 0; i < 2; i++)
                    StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('illegal_parking')
                            .where('status',
                                isEqualTo: i == 0 ? 'Resolved' : 'Rejected')
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            print(snapshot.error);
                            return const Center(child: Text('Error'));
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Padding(
                              padding: EdgeInsets.only(top: 50),
                              child: Center(
                                  child: CircularProgressIndicator(
                                color: Colors.black,
                              )),
                            );
                          }

                          final data = snapshot.requireData;
                          return ListView.builder(
                            itemCount: data.docs.length,
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
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextWidget(
                                              text: DateFormat(
                                                      'MMMM dd, yyyy - hh:mm a')
                                                  .format(DateTime.parse(data
                                                      .docs[index].id
                                                      .split('_')[0])),
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontFamily: 'Regular',
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            TextWidget(
                                              text:
                                                  '${data.docs[index]['location']} - ${data.docs[index]['title_of_violation']}',
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontFamily: 'Medium',
                                            ),
                                          ],
                                        ),
                                        const Expanded(child: SizedBox()),
                                        Icon(
                                          i == 0
                                              ? Icons
                                                  .check_circle_outline_rounded
                                              : Icons.close,
                                          size: 32,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
