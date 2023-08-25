// // // import 'dart:async';
// // // import 'dart:convert';

// // // import 'package:firebase_database/firebase_database.dart';
// // // import 'package:flutter/material.dart';

// // // import 'models/student_model.dart';
// // // import 'package:http/http.dart' as http;

// // // class HomeScreenAdminScreenAdmin extends StatefulWidget {
// // //   const HomeScreenAdminScreenAdmin({Key? key}) : super(key: key);

// // //   @override
// // //   State<HomeScreenAdminScreenAdmin> createState() => _HomeScreenAdminScreenAdminState();
// // // }

// // // class _HomeScreenAdminScreenAdminState extends State<HomeScreenAdminScreenAdmin> {
// // //   DatabaseReference dbRef = FirebaseDatabase.instance.ref();
// // //   late DatabaseReference _dbref;
// // //   String databasejson = '';
// // //   final TextEditingController _edtNameController = TextEditingController();
// // //   final TextEditingController _edtAgeController = TextEditingController();
// // //   final TextEditingController _edtSubjectController = TextEditingController();

// // //   final TextEditingController _questionController = TextEditingController();
// // //   final TextEditingController _aOpController = TextEditingController();
// // //   final TextEditingController _bOpController = TextEditingController();
// // //   final TextEditingController _cOpController = TextEditingController();
// // //   final TextEditingController _dOpController = TextEditingController();
// // //   List<Student> studentList = [];

// // //   bool updateStudent = false;

// // //   @override
// // //   void initState() {
// // //     super.initState();

// // //     retrieveStudentData();
// // //     _realdb_once();

// // //     // dbRef.child("users").once().then(
// // //     // (DataSnapshot snapshot) { print(snapshot.value);}
// // //     // );
// // //   }

// // //   bool isLoading = true;
// // //   List<String> list = [];
// // //   Future<void> readData() async {
// // //     // Please replace the Database URL
// // //     // which we will get in “Add Realtime Database”
// // //     // step with DatabaseURL

// // //     var url = "https://quiz-c6d98-default-rtdb.firebaseio.com/";
// // //     // Do not remove “data.json”,keep it as it is
// // //     try {
// // //       final response = await http.get(Uri.parse(url));
// // //       print("response " + response.body);
// // //       final extractedData = json.decode(response.body) as Map<String, dynamic>;
// // //       print("extractedData " + extractedData.toString());
// // //       if (extractedData == null) {
// // //         return;
// // //       }
// // //       extractedData.forEach((blogId, blogData) {
// // //         print("blogData " + blogData.toString());
// // //         // list.add(blogData["title"]);
// // //       });
// // //       setState(() {
// // //         isLoading = false;
// // //       });
// // //     } catch (error) {
// // //       throw error;
// // //     }
// // //   }

// // //   _realdb_once() {
// // //     _dbref.once().then((DataSnapshot dataSnapshot) {
// // //           print(" read once - " + dataSnapshot.value.toString());
// // //           setState(() {
// // //             databasejson = dataSnapshot.value.toString();
// // //           });
// // //         } as FutureOr Function(DatabaseEvent value));
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: const Text("Student Directory"),
// // //       ),
// // //       body: SingleChildScrollView(
// // //         child: Column(
// // //           children: [
// // //             for (int i = 0; i < studentList.length; i++)
// // //               studentWidget(studentList[i])
// // //           ],
// // //         ),
// // //       ),
// // //       floatingActionButton: FloatingActionButton(
// // //         onPressed: () {
// // //           _edtNameController.text = "";
// // //           _edtAgeController.text = "";
// // //           _edtSubjectController.text = "";
// // //           updateStudent = false;
// // //           // studentDialog();
// // //           readData();
// // //         },
// // //         child: const Icon(Icons.save),
// // //       ),
// // //     );
// // //   }

// // //   void studentDialog({String? key}) {
// // //     showDialog(
// // //         context: context,
// // //         builder: (context) {
// // //           return Dialog(
// // //             child: Container(
// // //               padding: const EdgeInsets.all(10),
// // //               child: Column(
// // //                 mainAxisSize: MainAxisSize.min,
// // //                 children: [
// // //                   TextField(
// // //                     controller: _questionController,
// // //                     decoration: const InputDecoration(helperText: "question"),
// // //                   ),
// // //                   TextField(
// // //                       controller: _aOpController,
// // //                       decoration: const InputDecoration(helperText: "A")),
// // //                   TextField(
// // //                       controller: _bOpController,
// // //                       decoration: const InputDecoration(helperText: "B")),
// // //                   TextField(
// // //                       controller: _cOpController,
// // //                       decoration: const InputDecoration(helperText: "C")),
// // //                   TextField(
// // //                       controller: _dOpController,
// // //                       decoration: const InputDecoration(helperText: "D")),
// // //                   const SizedBox(
// // //                     height: 10,
// // //                   ),
// // //                   ElevatedButton(
// // //                       onPressed: () {
// // //                         Map<String, dynamic> data = {
// // //                           "name": _edtNameController.text.toString(),
// // //                           "age": _aOpController.text.toString(),
// // //                           "subject": _edtSubjectController.text.toString()
// // //                         };
// // //                         // Map<String, dynamic> quDta = {
// // //                         //   "question": _questionController.text.toString(),
// // //                         // };
// // //                         Map<String, dynamic> opData = {
// // //                           "question": _questionController.text.toString(),
// // //                           "ops": {
// // //                             _aOpController.text.toString(): "true",
// // //                             _bOpController.text.toString(): "false",
// // //                             _cOpController.text.toString(): "false",
// // //                             _dOpController.text.toString(): "false"
// // //                           }
// // //                         };

// // //                         if (updateStudent) {
// // //                           dbRef
// // //                               .child("Students")
// // //                               .child(key!)
// // //                               .update(data)
// // //                               .then((value) {
// // //                             int index = studentList
// // //                                 .indexWhere((element) => element.key == key);
// // //                             studentList.removeAt(index);
// // //                             // studentList.insert(
// // //                             //     index,
// // //                             //     Student(
// // //                             //         key: key,
// // //                             //         studentData: StudentData.fromJson(data)));
// // //                             setState(() {});
// // //                             Navigator.of(context).pop();
// // //                           });
// // //                         } else {
// // //                           // dbRef.child("cc").push().set(quDta);
// // //                           dbRef.child("cc").push().set(opData);
// // //                           // dbRef
// // //                           //     .child("Students")
// // //                           //     .push()
// // //                           //     .set(data)
// // //                           //     .then((value) {
// // //                           //   Navigator.of(context).pop();
// // //                           // });
// // //                         }
// // //                       },
// // //                       child: Text(updateStudent ? "Update Data" : "Save Data"))
// // //                 ],
// // //               ),
// // //             ),
// // //           );
// // //         });
// // //   }

// // //   void retrieveStudentData() {
// // //     dbRef.child("Students").onChildAdded.listen((data) {
// // //       StudentData studentData =
// // //           StudentData.fromJson(data.snapshot.value as Map);
// // //       Student student =
// // //           Student(key: data.snapshot.key, studentData: studentData);
// // //       studentList.add(student);
// // //       setState(() {});
// // //     });
// // //   }

// // //   Widget studentWidget(Student student) {
// // //     return InkWell(
// // //       onTap: () {
// // //         _edtNameController.text = student.studentData!.name!;
// // //         _edtAgeController.text = student.studentData!.age!;
// // //         _edtSubjectController.text = student.studentData!.subject!;
// // //         updateStudent = true;
// // //         studentDialog(key: student.key);
// // //       },
// // //       child: Container(
// // //         width: MediaQuery.of(context).size.width,
// // //         padding: const EdgeInsets.all(5),
// // //         margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
// // //         decoration: BoxDecoration(
// // //             borderRadius: BorderRadius.circular(10),
// // //             border: Border.all(color: Colors.black)),
// // //         child: Row(
// // //           mainAxisAlignment: MainAxisAlignment.spaceAround,
// // //           children: [
// // //             Column(
// // //               mainAxisSize: MainAxisSize.min,
// // //               crossAxisAlignment: CrossAxisAlignment.start,
// // //               children: [
// // //                 Text("student.studentData!.name!"),
// // //                 Text("student.studentData!.age!"),
// // //                 Text("student.studentData!.subject!"),
// // //               ],
// // //             ),
// // //             InkWell(
// // //                 onTap: () {
// // //                   dbRef
// // //                       .child("Students")
// // //                       .child("user1")
// // //                       .child(student.key!)
// // //                       .remove()
// // //                       .then((value) {
// // //                     int index = studentList
// // //                         .indexWhere((element) => element.key == student.key!);
// // //                     studentList.removeAt(index);
// // //                     setState(() {});
// // //                   });
// // //                 },
// // //                 child: const Icon(
// // //                   Icons.delete,
// // //                   color: Colors.red,
// // //                 ))
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'dart:async';

// // import 'package:firebase_core/firebase_core.dart';
// // import 'package:firebase_database/firebase_database.dart';
// // import 'package:flutter/material.dart';

// // class HomeScreenAdminScreenAdmin extends StatefulWidget {
// //   const HomeScreenAdminScreenAdmin({Key? key, required this.title}) : super(key: key);

// //   final String title;

// //   @override
// //   State<HomeScreenAdminScreenAdmin> createState() => _HomeScreenAdminScreenAdminState();
// // }

// // class _HomeScreenAdminScreenAdminState extends State<HomeScreenAdminScreenAdmin> {
// //   late DatabaseReference _dbref;
// //   String databasejson = '';
// //   var newAge;
// //   var newAge2;
// //   var status;

// //   _createDB() {
// //     _dbref.child("profile").set(" my profile");
// //     _dbref
// //         .child("carprofile")
// //         .set({'car1': "family car", 'car2': "company car"});
// //   }

// //   _readdb_onechild() {
// //     _dbref
// //         .child("customer1")
// //         .child("age")
// //         .once()
// //         .then((DataSnapshot dataSnapshot) {
// //       print(" read once - " + dataSnapshot.value.toString());
// //       setState(() {
// //         databasejson = dataSnapshot.value.toString();
// //       });
// //     } as FutureOr Function(DatabaseEvent value));
// //   }

// //   _realdb_once() {
// //     _dbref.once().then((DataSnapshot dataSnapshot) {
// //       print(" read once - " + dataSnapshot.value.toString());
// //       setState(() {
// //         databasejson = dataSnapshot.value.toString();
// //       });
// //     } as FutureOr Function(DatabaseEvent value));
// //   }

// //   _updatevalue() {
// //     _dbref.child("carprofile").update({"car2": "big company car"});
// //   }

// //   _delete() {
// //     _dbref.child("profile").remove();
// //   }

// //   @override
// //   void initState() {
// //     super.initState();
// //     _dbref = FirebaseDatabase.instance.reference();
// //     _readdb_onechild();

// //     _createDB();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(widget.title),
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: <Widget>[
// //             buildText('Age is $databasejson'),
// //             buildText('New Age is: $newAge'),
// //             buildText('New Age is: $newAge2'),
// //             buildText('New Status is: $status'),
// //             StreamBuilder(
// //               stream: _dbref.onValue,
// //               builder: (context, AsyncSnapshot snap) {
// //                 if (snap.hasData &&
// //                     !snap.hasError &&
// //                     snap.data.snapshot.value != null) {
// //                   Map data = snap.data.snapshot.value;
// //                   List item = [];
// //                   data.forEach(
// //                       (index, data) => item.add({"key": index, ...data}));
// //                   return Expanded(
// //                     child: ListView.builder(
// //                       itemCount: item.length,
// //                       itemBuilder: (context, index) {
// //                         return ListTile(
// //                           title: Text("Customer: ${item[index]['key']}"),
// //                           subtitle: Text(
// //                               'Age: ${item[index]['age'].toString()} \nStatus: ${item[index]['status']}'),
// //                           isThreeLine: true,
// //                         );
// //                       },
// //                     ),
// //                   );
// //                 } else {
// //                   return Center(child: Text("No data"));
// //                 }
// //               },
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Text buildText(String s) {
// //     return Text(
// //       s,
// //       style: const TextStyle(
// //         fontSize: 20,
// //         fontWeight: FontWeight.bold,
// //       ),
// //     );
// //   }
// // }

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_database/ui/firebase_animated_list.dart';
// import 'package:flutter/material.dart';

// import '../test_01/ui/screen/home/create.dart';

// class HomeScreenAdmin extends StatefulWidget {
//   @override
//   _HomeScreenAdminState createState() => _HomeScreenAdminState();
// }

// class _HomeScreenAdminState extends State<HomeScreenAdmin> {
//   @override
//   Widget build(BuildContext context) {
//     DatabaseReference db_Ref = FirebaseDatabase.instance.ref().child('cc');
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.indigo[900],
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (_) => ccreate(),
//             ),
//           );
//         },
//         child: Icon(
//           Icons.add,
//         ),
//       ),
//       appBar: AppBar(
//         title: Text(
//           'contacts',
//           style: TextStyle(
//             fontSize: 30,
//           ),
//         ),
//         backgroundColor: Colors.indigo[900],
//       ),
//       body: FirebaseAnimatedList(
//         query: db_Ref,
//         shrinkWrap: true,
//         itemBuilder: (context, snapshot, animation, index) {
//           Map contact = snapshot.value as Map;
//           print("object" + contact.toString());
//           contact['key'] = snapshot.key;
//           return GestureDetector(
//             onTap: () {
//               // Navigator.push(
//               //   context,
//               //   MaterialPageRoute(
//               //     builder: (_) => UpdateRecord(
//               //       contact_Key: contact['key'],
//               //     ),
//               //   ),
//               // );
//               // print(contact['key']);
//             },
//             child: Container(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ListTile(
//                   shape: RoundedRectangleBorder(
//                     side: BorderSide(
//                       color: Colors.white,
//                     ),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   tileColor: Colors.indigo[100],
//                   trailing: IconButton(
//                     icon: Icon(
//                       Icons.delete,
//                       color: Colors.red[900],
//                     ),
//                     onPressed: () {
//                       db_Ref.child(contact['key']).remove();
//                     },
//                   ),
//                   // leading: CircleAvatar(
//                   //   backgroundImage: NetworkImage(
//                   //     contact['url'],
//                   //   ),
//                   // ),
//                   title: Text(
//                     contact['question'],
//                     style: TextStyle(
//                       fontSize: 25,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   subtitle: Text(
//                     " contact['number']",
//                     style: TextStyle(
//                       fontSize: 25,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
