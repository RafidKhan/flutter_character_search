import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String name;
  final String query;

  const UserTile({
    Key? key,
    required this.name,
    required this.query,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, int> map = {};

    for (int i = 0; i < query.length; i++) {
      final key = query[i].toLowerCase();
      map[key] = 0;
    }

    TextStyle getTextStyle(String txt) {
      bool result = false;
      late TextStyle textStyle;
      map.forEach((key, value) {
        if (map[key] == map[txt]) {
          if (map[key] != null) {
            map[key] = map[key]! + 1;
          }
        }
      });

      if (map[txt] == 1) {
        result = true;
      }

      if (result) {
        textStyle = const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.red,
        );
      } else {
        textStyle = const TextStyle(
          fontWeight: FontWeight.normal,
          color: Colors.black,
        );
      }

      if (query
          .toLowerCase()
          .replaceAll(" ", "")
          .contains(name.toLowerCase().replaceAll(" ", ""))) {
        textStyle = const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.red,
        );
      }

      return textStyle;
    }

    return Wrap(
      children: List.generate(name.length, (index) {
        final String char = name[index];
        return Text(
          char,
          style: getTextStyle(char.toLowerCase()),
        );
      }),
    );
  }
}
