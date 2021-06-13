import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialCard extends StatelessWidget {
  SocialCard({required this.text, required this.icon, required this.link});
  final String text;
  final IconData icon;
  final String link;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: FaIcon(icon),
        title: Text(
          text,
          style: TextStyle(fontSize: 18),
        ),
        onTap: () {
          launch(link);
        },
        dense: true,
      ),
    );
  }
}
