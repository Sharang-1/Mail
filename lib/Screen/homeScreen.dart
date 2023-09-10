import 'package:flutter/material.dart';
import 'package:mail/Components/ProfileTileUI.dart';
import 'package:mail/provider/mails.dart';

import '../Components/MailTile.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              onChanged: (value) {
                print(value);
              },
              decoration: InputDecoration(
                isDense: true,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: 'Search messages',
                prefixIcon: const Icon(
                  Icons.menu,
                  size: 28,
                  weight: 900,
                ),
                suffixIcon: InkWell(
                  child: Image.asset("assets/image/profile.png"),
                  onTap: () => showDialog(
                      context: context,
                      builder: ((context) => const ProfileTileUI())),
                ),
              ),
              keyboardType: TextInputType.text,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 14),
            child: Text(
              "Recipents",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(97, 97, 97, 1)),
            ),
          ),
          SizedBox(
            height: 700,
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 20),
              itemBuilder: ((context, i) => MailTileUI(mail: Mails.mails[i])),
              itemCount: Mails.mails.length,
            ),
          ),
        ],
      ),
    );
  }
}
