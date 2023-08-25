import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fz_cyber_quiz/test_01/ui/shared/constant.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../adv_drwer/flutter_advanced_drawer.dart';
import '../../../../rellyDatabase/home_screen.dart';
import '../../../domain/firebaseauth_methods.dart';
import '../../widgets/silder/another_carousel_pro.dart';
import '../admin/admin.dart';
import '../auth/sign_in.dart';
import 'chatapp.dart';
import 'courses_detials.dart';

class HomeScreen0122 extends StatefulWidget {
  @override
  _HomeScreen0122State createState() => _HomeScreen0122State();
}

class _HomeScreen0122State extends State<HomeScreen0122> {
  var currentPage = DrawerSections.dashboard;

  final _advancedDrawerController = AdvancedDrawerController();
  final user = FirebaseAuth.instance.currentUser!;
  FirebaseAuthMethods firebaseAuthMethods = FirebaseAuthMethods();

  @override
  Widget build(BuildContext context) {
    var container;
    String? appBarTatle = "";
    if (currentPage == DrawerSections.dashboard) {
      container = HomePageQuiz();
    } else if (currentPage == DrawerSections.admin) {
      container = AdminPage();
      appBarTatle = "Admin";
    } else if (currentPage == DrawerSections.question) {
      container = HomeScreenAdmin();
    } else if (currentPage == DrawerSections.chat) {
      container = ChatPageMess(
        reciverEmail: 'igozeco120@gmail.com',
        reciverUid: 'mXp9tgrwMHUEbVWGdQypQULTr2q1',
      );
      // } else if (currentPage == DrawerSections.settings) {
      //   container = SettingsPage();
      // } else if (currentPage == DrawerSections.notifications) {
      //   container = NotificationsPage();
      // } else if (currentPage == DrawerSections.privacy_policy) {
      //   container = PrivacyPolicyPage();
      // } else if (currentPage == DrawerSections.send_feedback) {
      //   container = SendFeedbackPage();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTatle != "" ? appBarTatle : "Cyber Quiz"),
      ),
      body: container,
      drawer: MyDrawer(),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }

  Drawer MyDrawer() {
    return Drawer(
      child: Container(
        child: Column(
          children: [
            MyHeaderDrawer(), // MyHeaderDrawer(),
            MyDrawerList(),
            Spacer(),

            FooterDrawer(),
            hSize()
          ],
        ),
      ),
    );
  }

  Widget MyHeaderDrawer() {
    return Container(
      color: Colors.black,
      child: Padding(
        padding:
            const EdgeInsets.only(right: 10, left: 16, top: 40, bottom: 30),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: 60.0,
                height: 60.0,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.person_2_sharp,
                  color: Colors.white60,
                )),
            wSize(),
            wSize(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Name",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                hSize(),
                Text(
                  user.email!,
                  style: TextStyle(color: Color.fromARGB(248, 189, 189, 189)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Dashboard", Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "admin", Icons.people_alt_outlined,
              currentPage == DrawerSections.admin ? true : false),
          menuItem(3, "Add Question", Icons.event,
              currentPage == DrawerSections.question ? true : false),
          menuItem(4, "Chat with me", Icons.chat,
              currentPage == DrawerSections.chat ? true : false),
          Divider(),
          menuItem(5, "Settings", Icons.settings_outlined,
              currentPage == DrawerSections.settings ? true : false),
          // menuItem(6, "Notifications", Icons.notifications_outlined,
          //     currentPage == DrawerSections.notifications ? true : false),
          Divider(),
          menuItem(7, "Privacy policy", Icons.privacy_tip_outlined,
              currentPage == DrawerSections.privacy_policy ? true : false),
          menuItem(8, "Send feedback", Icons.feedback_outlined,
              currentPage == DrawerSections.send_feedback ? true : false),
        ],
      ),
    );
  }

  Widget FooterDrawer() {
    return Column(
      children: [
        DefaultTextStyle(
          style: TextStyle(
            fontSize: 12,
            color: Colors.black45,
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(
              vertical: 16.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Create by. '),
                InkWell(
                  onTap: () => setState(() {
                    _launchURL(
                        "https://www.linkedin.com/mwlite/in/qusai-alsimat-71097b1b1");
                  }),
                  child: Text(
                    'Qusai',
                    style: TextStyle(color: AppColor.orangColor),
                  ),
                ),
                wSize(),
                Icon(Icons.favorite)
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextButton(
            onPressed: () {
              showErrorMessage();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Logout',
                  style: TextStyle(color: Colors.black54),
                ),
                wSize(),
                Icon(Icons.logout, color: Colors.black54)
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _launchURL(url) async {
    final Uri path = Uri.parse(url);
    if (!await launchUrl(path, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $path');
    }
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              // user.email == "igozeco120@gmail.com"
              // ?
              currentPage = DrawerSections.admin;
              // : notAdminMessage();
            } else if (id == 3) {
              user.email == "igozeco120@gmail.com"
                  ? currentPage = DrawerSections.question
                  : notAdminMessage();
            } else if (id == 4) {
              currentPage = DrawerSections.chat;
            } else if (id == 5) {
              currentPage = DrawerSections.settings;
            } else if (id == 6) {
              // currentPage = DrawerSections.notifications;
            } else if (id == 7) {
              currentPage = DrawerSections.privacy_policy;
            } else if (id == 8) {
              currentPage = DrawerSections.send_feedback;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showErrorMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Text("Logout"),
            content: Container(
              height: 100,
              child: Column(
                children: [
                  Text("Do you Really want to logout?"),
                  hSize(),
                  hSize(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        child: Text("Cancel"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      ElevatedButton(
                        child: Text("Logout"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                        ),
                        onPressed: () {
                          firebaseAuthMethods
                              .signOut(context: context)
                              .whenComplete(() => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignINQuiz())));
                        },
                      )
                    ],
                  ),
                ],
              ),
            ));
      },
    );
  }

  void notAdminMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "admin",
            textAlign: TextAlign.center,
          ),
          content: Container(
            height: 100,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("You Don't Have Access."),
                    Icon(Icons.priority_high, color: Colors.red),
                    Icon(Icons.priority_high, color: Colors.red)
                  ],
                ),
                hSize(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: Text("Cancel"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

enum DrawerSections {
  dashboard,
  admin,
  question,
  chat,
  settings,
  privacy_policy,
  send_feedback,
}

class HomePageQuiz extends StatelessWidget {
  const HomePageQuiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CollectionReference _productss =
        FirebaseFirestore.instance.collection('courses');
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: StreamBuilder(
                stream: _productss.snapshots(),
                builder:
                    (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  if (streamSnapshot.hasData) {
                    return Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            height: 250,
                            width: double.infinity,
                            child: AnotherCarousel(
                              images: const [
                                Image(
                                    fit: BoxFit.cover, //or BoxFit.fill
                                    image: AssetImage("assets/image/1.jpg")),
                                Image(
                                  fit: BoxFit.cover, //or BoxFit.fill
                                  image: AssetImage("assets/image/4.jpg"),
                                ),
                                Image(
                                  fit: BoxFit.cover, //or BoxFit.fill
                                  image: AssetImage("assets/image/3.jpg"),
                                ),Image(
                                  fit: BoxFit.cover, //or BoxFit.fill
                                  image: AssetImage("assets/image/5.jpg"),
                                ),
                                // we have display image from netwrok as well
                              ],
                              dotSize: 6,
                              indicatorBgPadding: 5.0,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 200,
                                      childAspectRatio: 3 / 2,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 5),
                              itemCount: streamSnapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                final DocumentSnapshot documentSnapshot =
                                    streamSnapshot.data!.docs[index];
                                return Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: CradCourses(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                CoursesDetails(
                                              courseName:
                                                  documentSnapshot['key']
                                                      .toString(),
                                            ),
                                          ),
                                        );
                                      },
                                      doc: documentSnapshot,
                                      context: context),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            // CradCourses(txt: "CompTIA Security+ 601", context: context),
          ],
        ),
      ),
    );
  }
}

Widget CradCourses({doc, onTap, context}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey,
            blurRadius: 0.001,
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  doc['key'],
                  textAlign: TextAlign.left,
                  style: new TextStyle(
                    fontSize: 20.0,
                    color: new Color(0xFF212121),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
          hSize(),
          Flexible(
            child: new Container(
              padding: new EdgeInsets.all(8.0),
              child: new Text(
                doc['name'],
                overflow: TextOverflow.ellipsis,
                style: new TextStyle(
                  fontSize: 13.0,
                  color: new Color(0xFF212121),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     Expanded(
          //       flex: 8,
          //       child: Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: Column(
          //           children: [
          //              Text(" - "),
          //             Flexible(
          //               child: new Container(
          //                 padding: new EdgeInsets.only(right: 13.0),
          //                 child: new Text(
          //                   doc['name'],
          //                   overflow: TextOverflow.ellipsis,
          //                   style: new TextStyle(
          //                     fontSize: 13.0,
          //                     color: new Color(0xFF212121),
          //                     fontWeight: FontWeight.bold,
          //                   ),
          //                 ),
          //               ),
          //             ),
          //             // Container(
          //             //   child: Text(

          //             //     softWrap: true,
          //             //     overflow: TextOverflow.ellipsis,
          //             //     maxLines: 2,
          //             //   ),
          //             // ),
          //           ],
          //         ),
          //       ),
          //     ),
          //     Expanded(
          //       flex: 2,
          //       child: Container(
          //         decoration: BoxDecoration(
          //           image: DecorationImage(
          //               image: NetworkImage(doc['url']), fit: BoxFit.cover),
          //           borderRadius: BorderRadius.all(Radius.circular(8)),
          //         ),
          //       ),
          //     )
          //   ],
          // ),
        ],
      ),
    ),
  );
}
