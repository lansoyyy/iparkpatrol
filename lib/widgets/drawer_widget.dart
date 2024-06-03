import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iparkpatrol_mobile/screens/pages/about_page.dart';
import 'package:iparkpatrol_mobile/widgets/text_widget.dart';

import '../screens/home_screen.dart';
import '../utlis/colors.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Stream<DocumentSnapshot> userData = FirebaseFirestore.instance
        .collection('Enforcers')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
    return StreamBuilder<DocumentSnapshot>(
        stream: userData,
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox();
          } else if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox();
          }
          dynamic data = snapshot.data;
          return Container(
            height: double.infinity,
            width: 250,
            color: Colors.blue[100],
            child: SafeArea(
                child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: primary),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(data['img'])),
                            color: Colors.white),
                      ),
                      TextWidget(
                        text: '${data['fname']} ${data['lname']}',
                        fontFamily: 'Bold',
                        fontSize: 16,
                      ),
                      Builder(builder: (context) {
                        return IconButton(
                          onPressed: () {
                            Scaffold.of(context).closeDrawer();
                          },
                          icon: Icon(
                            Icons.menu,
                            color: primary,
                            size: 32,
                          ),
                        );
                      }),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AboutPage()));
                    },
                    title: TextWidget(
                      text: 'About iParkPatrol',
                      fontSize: 14,
                      fontFamily: 'Bold',
                    ),
                  ),
                ],
              ),
            )),
          );
        });
  }
}
