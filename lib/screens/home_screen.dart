import 'package:flutter/material.dart';
import 'package:iparkpatrol_mobile/screens/auth/login_page.dart';
import 'package:iparkpatrol_mobile/screens/tabs/history_tab.dart';
import 'package:iparkpatrol_mobile/screens/tabs/home_tab.dart';
import 'package:iparkpatrol_mobile/screens/tabs/notif_tab.dart';
import 'package:iparkpatrol_mobile/widgets/drawer_widget.dart';
import 'package:iparkpatrol_mobile/widgets/text_widget.dart';

import '../utlis/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  late dynamic userData1 = {};

  @override
  Widget build(BuildContext context) {
    final tabs = [
      const HomeTab(),
      const NotifTab(),
      const HistoryTab(),
    ];

    return Scaffold(
        drawer: const DrawerWidget(),
        bottomNavigationBar: Material(
          elevation: 0,
          color: Colors.black,
          child: BottomNavigationBar(
            currentIndex: _index,
            selectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'QBold',
                color: Colors.black),
            unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.normal,
                fontFamily: 'QRegular',
                color: Colors.black),
            unselectedItemColor: Colors.grey,
            selectedItemColor: primary,
            items: const [
              BottomNavigationBarItem(
                  label: 'Home',
                  icon: Icon(
                    Icons.home,
                    size: 32,
                  )),
              BottomNavigationBarItem(
                  label: 'Notifications',
                  icon: Icon(
                    Icons.notifications_sharp,
                    size: 32,
                  )),
              BottomNavigationBarItem(
                  label: 'History',
                  icon: Icon(
                    Icons.history,
                    size: 32,
                  )),
            ],
            onTap: (value) {
              setState(() {
                _index = value;
              });
            },
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: background,
          ),
          child: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Builder(builder: (context) {
                      return IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: Icon(
                          Icons.menu,
                          color: primary,
                          size: 32,
                        ),
                      );
                    }),
                    IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: const Text(
                                    'Logout Confirmation',
                                    style: TextStyle(
                                        fontFamily: 'QBold',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  content: const Text(
                                    'Are you sure you want to Logout?',
                                    style: TextStyle(fontFamily: 'QRegular'),
                                  ),
                                  actions: <Widget>[
                                    MaterialButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(true),
                                      child: const Text(
                                        'Close',
                                        style: TextStyle(
                                            fontFamily: 'QRegular',
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    MaterialButton(
                                      onPressed: () async {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginPage()));
                                      },
                                      child: const Text(
                                        'Continue',
                                        style: TextStyle(
                                            fontFamily: 'QRegular',
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ));
                      },
                      icon: Icon(
                        Icons.logout,
                        color: primary,
                        size: 32,
                      ),
                    ),
                  ],
                ),
              ),
              tabs[_index],
            ],
          )),
        ));
  }
}
