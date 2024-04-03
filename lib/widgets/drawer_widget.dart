import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
                        decoration: BoxDecoration(
                            border: Border.all(color: primary),
                            shape: BoxShape.circle,
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(2.5),
                          child: Image.asset(
                            'assets/images/RTA logo 1.png',
                            height: 35,
                          ),
                        ),
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
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                    },
                    title: TextWidget(
                      text: 'Help',
                      fontSize: 14,
                      fontFamily: 'Bold',
                    ),
                  ),
                  ListTile(
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
