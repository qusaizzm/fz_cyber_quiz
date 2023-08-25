import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fz_cyber_quiz/auth03/screens/splash/view/splashPage.dart';

import '../../../../adv_drwer/flutter_advanced_drawer.dart';
import '../../../../rellyDatabase/home_screen.dart';
import '../../../domain/firebaseauth_methods.dart';
import '../../shared/constant.dart';
import '../admin/add_ques.dart';
import '../admin/admin.dart';
import '../auth/sign_in.dart';
import '../home/home.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomeScreen0122();
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          if (kDebugMode) {
            return const Center(child: Text('there is some error'));
          }
        }
        return SignINQuiz();
      },
    );
  }
}

// class HomeScreen0122 extends StatefulWidget {
//   @override
//   _HomeScreen0122State createState() => _HomeScreen0122State();
// }

// class _HomeScreen0122State extends State<HomeScreen0122> {
//   final _advancedDrawerController = AdvancedDrawerController();
//   final user = FirebaseAuth.instance.currentUser!;

//   FirebaseAuthMethods firebaseAuthMethods = FirebaseAuthMethods();
//   @override
//   Widget build(BuildContext context) {
//     return AdvancedDrawer(
//       backdropColor: Colors.blueGrey,
//       controller: _advancedDrawerController,
//       animationCurve: Curves.easeInOut,
//       animationDuration: const Duration(milliseconds: 300),
//       animateChildDecoration: true,
//       rtlOpening: false,
//       // openScale: 1.0,
//       disabledGestures: false,
//       childDecoration: const BoxDecoration(
//         //  boxShadow: <BoxShadow>[
//         //   BoxShadow(
//         //     color: Colors.red,
//         //     blurRadius: 1,
//         //   ),
//         // ],
//         borderRadius: const BorderRadius.all(Radius.circular(16)),
//       ),
//       drawer: SafeArea(
//         child: Container(
//           child: ListTileTheme(
//             textColor: Colors.white,
//             iconColor: Colors.white,
//             child: Column(
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(
//                       right: 10, left: 16, top: 40, bottom: 30),
//                   child: Row(
//                     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Container(
//                           width: 60.0,
//                           height: 60.0,
//                           clipBehavior: Clip.antiAlias,
//                           decoration: BoxDecoration(
//                             color: Colors.black26,
//                             shape: BoxShape.circle,
//                           ),
//                           child: Icon(
//                             Icons.person_2_sharp,
//                             color: Colors.white60,
//                           )),
//                       wSize(),
//                       wSize(),
//                       Column(
//                         children: [
//                           Text(
//                             "Your Name",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white),
//                           ),
//                           hSize(),
//                           Text(
//                             user.email!,
//                             style: TextStyle(
//                                 color: Color.fromARGB(248, 189, 189, 189)),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 ListTile(
//                   onTap: () {
//                     currentIndex: _index,

//               setState(() {
//                 _index = value;
//               });

//                   },
//                   leading: Icon(Icons.home),
//                   title: Text('Home'),
//                 ),
//                 ListTile(
//                   onTap: () {},
//                   leading: Icon(Icons.account_circle_rounded),
//                   title: Text(user.email == "igozeco120@gmail.com"
//                       ? 'admin'
//                       : 'Profile'),
//                 ),
//                 // user.email == "igozeco120@gmail.com"
//                 //     ? Container()
//                 //     :
//                 ListTile(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => HomeScreenAdmin(),
//                       ),
//                     );
//                   },
//                   leading: Icon(Icons.question_mark),
//                   title: Text('Add Questions'),
//                 ),
//                 ListTile(
//                   onTap: () {},
//                   leading: Icon(Icons.chat),
//                   title: Text('Chat with me'),
//                 ),
//                 ListTile(
//                   onTap: () {},
//                   leading: Icon(Icons.settings),
//                   title: Text('Settings'),
//                 ),
//                 Spacer(),
//                 Container(
//                   margin: EdgeInsets.symmetric(horizontal: 20),
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: Colors.black26,
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: TextButton(
//                     onPressed: () {
//                       showErrorMessage();
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           'Logout',
//                           style: TextStyle(color: Colors.white54),
//                         ),
//                         wSize(),
//                         Icon(Icons.logout, color: Colors.white54)
//                       ],
//                     ),
//                   ),
//                 ),
//                 DefaultTextStyle(
//                   style: TextStyle(
//                     fontSize: 12,
//                     color: Colors.white54,
//                   ),
//                   child: Container(
//                     margin: const EdgeInsets.symmetric(
//                       vertical: 16.0,
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text('Create by. '),
//                         Text(
//                           'Qusai',
//                           style: TextStyle(color: AppColor.orangColor),
//                         ),
//                         wSize(),
//                         Icon(Icons.favorite)
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Cyber Security Quiz'),
//           leading: IconButton(
//             onPressed: _handleMenuButtonPressed,
//             icon: ValueListenableBuilder<AdvancedDrawerValue>(
//               valueListenable: _advancedDrawerController,
//               builder: (_, value, __) {
//                 return AnimatedSwitcher(
//                   duration: Duration(milliseconds: 250),
//                   child: Icon(
//                     value.visible ? Icons.clear : Icons.menu,
//                     key: ValueKey<bool>(value.visible),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
//         body: HomePageQuiz(),
//       ),
//     );
//   }

//   void _handleMenuButtonPressed() {
//     // NOTICE: Manage Advanced Drawer state through the Controller.
//     // _advancedDrawerController.value = AdvancedDrawerValue.visible();
//     _advancedDrawerController.showDrawer();
//   }
// }
