import 'package:flutter/material.dart';
import 'package:jv_cycles/pages/about.dart';
import 'package:jv_cycles/pages/locateUs.dart';
import 'package:jv_cycles/pages/notification.dart';

class sideBar extends StatelessWidget {
  const sideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: 320,
      child: ClipRRect(

        borderRadius: BorderRadius.horizontal(right:Radius.circular(40.0) ),
        child: Drawer(



          child: Center(
            child: ListView(
              children: [
                Container(
                    decoration: BoxDecoration(color: Colors.green),
                    child: Column( mainAxisAlignment:MainAxisAlignment.center,children: [
                Container(
                  height: 130,
                  child: const Image(
                    image: AssetImage('assets/LOGO.png'),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  child: Center(
                    child: Text(
                      'J V CYCLES',
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                ],)),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Icon(Icons.account_circle_outlined),
                        ),
                        Text(
                          'account',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => About()));
                  },

                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Icon(Icons.info_outline_rounded),
                        ),
                        Text(
                          'About',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),

                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Icon(Icons.mail_rounded),
                        ),
                        Text(
                          'Messages',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => notification(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Icon(Icons.notifications_rounded),
                        ),
                        Text(
                          'Notifications',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Icon(Icons.share_rounded),
                        ),
                        Text(
                          'Share',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LocateUs(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Icon(Icons.location_on_rounded),
                        ),
                        Text(
                          'Locate Us',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
