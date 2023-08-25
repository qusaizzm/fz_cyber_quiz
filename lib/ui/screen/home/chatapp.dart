// // ignore_for_file: no_leading_underscores_for_local_identifiers, dead_code

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatPageMess extends StatefulWidget {
  final String reciverEmail;
  final String reciverUid;
  const ChatPageMess(
      {super.key, required this.reciverEmail, required this.reciverUid});

  @override
  State<ChatPageMess> createState() => _ChatPageMessState();
}

class _ChatPageMessState extends State<ChatPageMess> {
  final TextEditingController _messageController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final chatSerive _chatService = chatSerive();

  final ScrollController _scrollcontroller = ScrollController();

  Future<void> _refresh() async {
    await Future.delayed(Duration(milliseconds: 400));
    _scrollDown();
  }

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  //Function for detect Emoji in text [and EnCrease Font Size]
  bool isEmoji(String text) {
    final pattern = RegExp(
        r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])');

    final matches = pattern.allMatches(text);

    if (matches.length > 0) {
      return true;
    } else {
      return false;
    }
  }

  ///ScrollDown
  void _scrollDown() {
    if (_scrollcontroller.hasClients) {
      _scrollcontroller.animateTo(
        _scrollcontroller.position.maxScrollExtent,
        duration: Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
      );
    }
  }

//Send Message Function

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(
          widget.reciverUid, _messageController.text.toString());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Message Can not be Empty!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: [Expanded(child: _buildMessageList()), _buildMessageInput()],
      ),
    );
  }

//Message List Widger

  Widget _buildMessageList() {
    return StreamBuilder(
      stream: _chatService.getMessages(
          widget.reciverUid, _firebaseAuth.currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Error')));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView(
          controller: _scrollcontroller,
          children:
              snapshot.data!.docs.map((doc) => _buildMessageitem(doc)).toList(),
        );
      },
    );
  }

//MessageItem Widget

  Widget _buildMessageitem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Directionality(
        textDirection: (data['senderId'] == _firebaseAuth.currentUser!.uid)
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  color: (data['senderId'] == _firebaseAuth.currentUser!.uid)
                      ? Theme.of(context).primaryColor.withOpacity(0.1)
                      : Colors.grey.withOpacity(0.1),
                  border: Border(
                    left: BorderSide(
                        color: Theme.of(context).primaryColor, width: 1),
                    top: BorderSide(
                        color: Theme.of(context).primaryColor, width: 1),
                    bottom: BorderSide(
                        color: Theme.of(context).primaryColor, width: 1),
                    right: BorderSide(
                        color: Theme.of(context).primaryColor, width: 1),
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft:
                          (data['senderId'] == _firebaseAuth.currentUser!.uid)
                              ? Radius.circular(20)
                              : Radius.circular(0),
                      topRight:
                          (data['senderId'] == _firebaseAuth.currentUser!.uid)
                              ? Radius.circular(20)
                              : Radius.circular(20),
                      bottomRight:
                          (data['senderId'] == _firebaseAuth.currentUser!.uid)
                              ? Radius.circular(0)
                              : Radius.circular(20))),

              // alignment: alignment,
              child: Column(
                children: [
                  (data['message'].toString().length == 2 &&
                          isEmoji(data['message'].toString()))
                      ? Text(
                          data['message'].toString(),
                          textDirection: TextDirection.ltr,
                          style: TextStyle(fontSize: 25),
                        )
                      : Text(
                          data['message'].toString(),
                          textDirection: TextDirection.ltr,
                        )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

//Message Input Widget
  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: customTextField(
                  obscureText: false,
                  hintText: 'Enter Message',
                  coltroller: _messageController,
                  iconData: Icons.message)),
          IconButton(
              onPressed: () async {
                sendMessage();
                _messageController.clear();
                _scrollDown();
              },
              icon: Icon(
                Icons.send,
                color: Theme.of(context).primaryColor,
              ))
        ],
      ),
    );
  }
} // ignore_for_file: unnecessary_this

class customTextField extends StatelessWidget {
  final bool obscureText;
  final String hintText;
  final TextEditingController coltroller;
  final IconData iconData;

  customTextField(
      {super.key,
      required this.obscureText,
      required this.hintText,
      required this.coltroller,
      required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          border:
              Border.all(color: Color.fromARGB(255, 216, 6, 221), width: 1)),
      child: TextField(
        controller: coltroller,
        obscureText: obscureText,
        decoration: InputDecoration(
            border: InputBorder.none, hintText: hintText, icon: Icon(iconData)),
      ),
    );
  }
}

class customButton extends StatelessWidget {
  final void Function()? onTap;
  final String buttonText;
  customButton({super.key, required this.onTap, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 216, 6, 221),
            borderRadius: BorderRadius.circular(9)),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class chatSerive extends ChangeNotifier {
//create Instance of FireBaseauth And FireStore

  final FirebaseAuth _fireBaseauth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

//Send Message

  Future<void> sendMessage(String reciverId, String message) async {
//get current user information

    final String currentUserId = _fireBaseauth.currentUser!.uid;
    final String currentUserEmail = _fireBaseauth.currentUser!.email.toString();
    final Timestamp timeStamp = Timestamp.now();

//create new Message
    final Message newMessage = Message(
        senderId: currentUserId,
        senderEmail: currentUserEmail,
        reciverId: reciverId,
        message: message,
        timeStamp: timeStamp);

//create chat room Between users
    List<String> chatIds = [currentUserId, reciverId];

    chatIds.sort();
    final String chatRoomId = chatIds.join('_');

//add message to chatroom

    await _fireStore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());
  }

//Get Messages

  Stream<QuerySnapshot> getMessages(String userId, String partnerUserId) {
    //consturct the chatroomId
    List<String> ids = [userId, partnerUserId];
    ids.sort();
    final String chatRoom = ids.join('_');

    return _fireStore
        .collection('chat_rooms')
        .doc(chatRoom)
        .collection('messages')
        .orderBy('timeStamp', descending: false)
        .snapshots();
  }
}

class Message {
  final String senderId;
  final String senderEmail;
  final String reciverId;
  final String message;
  final Timestamp timeStamp;

  Message(
      {required this.senderId,
      required this.senderEmail,
      required this.reciverId,
      required this.message,
      required this.timeStamp});

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'senderEmail': senderEmail,
      'reciverId': reciverId,
      'message': message,
      'timeStamp': timeStamp
    };
  }
}
