import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  SearchButton(
      {required this.context, required this.route, required this.label});

  final BuildContext context;
  final String route;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 0, 50, 16),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            label,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
