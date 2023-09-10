import 'package:flutter/material.dart';

class ProfileTileUI extends StatelessWidget {
  const ProfileTileUI({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      title: const Text(
        "User Profile",
        textAlign: TextAlign.center,
      ),
      titleTextStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      content: Container(
        alignment: Alignment.center,
        height: 340,
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.white,
              child: Image.asset("assets/image/Profile Image.png"),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Tom Riddle",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("+91 3343343334",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                )),
            const Text("tom@hogwarts.wizdu",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                )),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Address:",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
                "Golden Tower, 4th Floor, 697, 27th Main Rd, 1st Sector, HSR Layout, Bengaluru, Karnataka 560102",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                )),
          ],
        ),
      ),
    );
  }
}
