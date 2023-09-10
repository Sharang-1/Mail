import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:math' as math;
import 'package:intl/intl.dart';
import 'package:mail/Screen/mailScreen.dart';

import '../provider/mail.dart';

class MailTileUI extends StatefulWidget {
  final Mail mail;
  MailTileUI({super.key, required this.mail});

  @override
  State<MailTileUI> createState() => _MailTileUIState();
}

class _MailTileUIState extends State<MailTileUI> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: isSelected ? Colors.grey[200] : Colors.transparent,
      margin: const EdgeInsets.only(top: 8, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 10),
              InkWell(
                onTap: () {
                  setState(() {
                    isSelected = !isSelected;
                  });
                },
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: isSelected
                      ? Colors.blue
                      : Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                          .withOpacity(0.6),
                  child: isSelected
                      ? const Text(
                          "✓",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        )
                      : Text(
                          widget.mail.senderDp,
                          style: const TextStyle(color: Colors.black),
                        ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MailScreen(
                        mail: widget.mail,
                      ),
                    ),
                  );
                },
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          const Text(
                            ">>  ",
                            style: TextStyle(
                                color: Color.fromRGBO(251, 188, 5, 1),
                                fontSize: 16),
                          ),
                          Text(
                            widget.mail.sender,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      Text(
                        widget.mail.subject,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        widget.mail.shortMessage,
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ]),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              DateFormat('hh:mm a')
                  .format(DateTime.parse(widget.mail.timestamp)),
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
