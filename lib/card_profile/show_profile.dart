import 'package:final_exam_650710839/card_profile/profile.dart';
import 'package:flutter/material.dart';

class ShowProfile extends StatelessWidget {
  const ShowProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 228, 220, 241),
      body: Profile(
        name: "Rapwas Morasuk",
        pronoun: "her",
        music: "Joji - slow dancing in the dark",
        imageUrl: "https://dotandline.net/wp-content/uploads/2019/11/screen_shot_2018-10-26_at_10.06.43_am-1200x642-1.jpg",
      )
    );
  }
}