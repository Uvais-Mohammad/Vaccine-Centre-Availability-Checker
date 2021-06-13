import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vaccine_checker/widgets/data_card.dart';
import 'package:vaccine_checker/constants/constants.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        children: [
          SizedBox(
            height: 140,
            width: double.infinity,
          ),
          Expanded(
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: ClipOval(
                child: Image.asset(
                  'assets/images/profile.jpg',
                  fit: BoxFit.cover,
                  // width: 90.0,
                  // height: 90.0,
                ),
              ),
              radius: 75,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  "Uvais Mohammad",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 40,
                      letterSpacing: 2),
                ),
                Text(
                  "Flutter Developer",
                )
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              margin: EdgeInsets.only(right: 16, left: 16, top: 16),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.teal.shade700),
              child: SingleChildScrollView(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SocialCard(
                      text: 'Github',
                      icon: FontAwesomeIcons.github,
                      link: kGithubLink,
                    ),
                    SocialCard(
                      text: 'LinkedIN',
                      icon: FontAwesomeIcons.linkedin,
                      link: kLinkedInLink,
                    ),
                    SocialCard(
                      text: 'Gmail',
                      icon: FontAwesomeIcons.envelope,
                      link: kGmailLink,
                    ),
                    SocialCard(
                      text: 'Facebook',
                      icon: FontAwesomeIcons.facebook,
                      link: kFacebookLink,
                    ),
                    SocialCard(
                      text: 'Instagram',
                      icon: FontAwesomeIcons.instagram,
                      link: kInstagramLink,
                    ),
                    SocialCard(
                      text: 'WhatsApp',
                      icon: FontAwesomeIcons.whatsapp,
                      link: kWhatsAppLink,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 140,
          )
        ],
      ),
    );
  }
}
