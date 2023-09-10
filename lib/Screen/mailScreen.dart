import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:intl/intl.dart';

import '../provider/mail.dart';

class MailScreen extends StatelessWidget {
  static const routeName = '/mail-screen';
  Mail mail;
  MailScreen({super.key, required this.mail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_sharp),
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.black,
            ),
          ),
        ],
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    mail.subject,
                    overflow: TextOverflow.fade,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(left: 20, top: 20),
                    width: 40,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text(
                        "Inbox",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 20,
                    backgroundColor:
                        Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                            .withOpacity(0.6),
                    child: Text(mail.senderDp,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: [
                                Text(
                                  mail.sender,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(width: 40),
                                Text(DateFormat('MMMMd')
                                    .format(DateTime.parse(mail.timestamp)))
                              ],
                            ),
                            const Text(
                              "to me ⌄",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60, top: 40, right: 20),
              child: Text(
                mail.message,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
