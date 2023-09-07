import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class QuesWidget extends StatefulWidget {
  final doc;
  const QuesWidget({super.key, this.doc});

  @override
  State<QuesWidget> createState() => _QuesWidgetState();
}

class _QuesWidgetState extends State<QuesWidget> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _keyController = TextEditingController();
  File? file;
  ImagePicker image = ImagePicker();
  var url;
  // DatabaseReference? dbRef;
  final CollectionReference _productss =
      FirebaseFirestore.instance.collection('courses');
  String action = 'Create';
  @override
  void initState() {
    // print("kkkkk " + widget.doc["name"]);
    if (widget.doc != null) {
      action = 'Update';
      url = widget.doc['url'];
      _nameController.text = widget.doc['name'];
      _keyController.text = widget.doc['key'];
    }
    if (file == null) {
      print("file initState $url");
    } else {
      print("file initState Not null");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          action + ' Courses',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.indigo[900],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 200,
                width: 200,
                child: url == null
                    ? file == null
                        ? IconButton(
                            icon: Icon(
                              Icons.add_a_photo,
                              size: 90,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                            onPressed: () {
                              getImage();
                            },
                          )
                        : MaterialButton(
                            height: 100,
                            child: Image.file(
                              file!,
                              fit: BoxFit.fill,
                            ),
                            onPressed: () {
                              getImage();
                            },
                          )
                    : MaterialButton(
                        height: 100,
                        child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(url),
                                    fit: BoxFit.cover))),
                        onPressed: () {
                          // setState(() {
                          getImage();
                          // if (file != null) {
                          // }
                          // });
                        },
                      ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Name',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _keyController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Key',
              ),
              maxLength: 10,
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              height: 40,
              onPressed: () {
                // getImage();

                if (file != null) {
                  uploadFile(doc: widget.doc);
                }
              },
              child: Text(
                action == "Create" ? "Create" : "Update",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                ),
              ),
              color: Colors.indigo[900],
            ),
          ],
        ),
      ),
    );
  }

  getImage() async {
    var img = await image.pickImage(source: ImageSource.gallery);
    if (img != null) {
      setState(() {
        url = null;
        // if (file != null) {
        file = File(img.path);
        // }
      });
    }

    print("file files" + file.toString());
  }

  uploadFile({required doc}) async {
    final String? name = _nameController.text;
    final String? key = _keyController.text;

    try {
      var imagefile = FirebaseStorage.instance
          .ref()
          .child("courses_photo")
          .child("/${name}.jpg");
      UploadTask task = imagefile.putFile(file!);
      TaskSnapshot snapshot = await task;
      url = await snapshot.ref.getDownloadURL();
      setState(() {
        url = url;
      });
      if (name != null && key != null && url != null) {
        if (action == 'Create') {
          // Persist a new product to Firestore
          await _productss.add({"name": name, "key": key, "url": url});
        }

        if (action == 'Update') {
          // Update the product
          await _productss
              .doc(doc!.id)
              .update({"name": name, "key": key, "url": url});
        }
        // Clear the text fields
        _nameController.text = '';
        _keyController.text = '';

        // Hide the bottom sheet
        Navigator.of(context).pop();
        // dbRef!.push().set(Contact).whenComplete(() {
        //   Navigator.pushReplacement(
        //     context,
        //     MaterialPageRoute(
        //       builder: (_) => AdminPage(),
        //     ),
        //   );
        // });
      } else {
        print("no file");
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
