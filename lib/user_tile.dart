import 'package:character_search/user_model.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final UserModel model;
  final String query;

  const UserTile({
    Key? key,
    required this.model,
    required this.query,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String name = model.name;
    final Map<String, int> mapName = {};

    for (int i = 0; i < query.length; i++) {
      final key = query[i].toLowerCase();
      mapName[key] = 0;
    }

    TextStyle getTextStyle(String txt) {
      bool result = false;
      late TextStyle textStyle;
      mapName.forEach((key, value) {
        if (mapName[key] == mapName[txt]) {
          if (mapName[key] != null) {
            mapName[key] = mapName[key]! + 1;
          }
        }
      });

      if (mapName[txt] == 1) {
        result = true;
      }

      if (result) {
        textStyle = const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.red,
          fontSize: 16,
        );
      } else {
        textStyle = const TextStyle(
          fontWeight: FontWeight.normal,
          color: Colors.black,
          fontSize: 16,
        );
      }

      if (query
          .toLowerCase()
          .replaceAll(" ", "")
          .contains(name.toLowerCase().replaceAll(" ", ""))) {
        textStyle = const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.red,
          fontSize: 16,
        );
      }

      return textStyle;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            children: List.generate(name.length, (index) {
              final String char = name[index];
              return Text(
                char,
                style: getTextStyle(char.toLowerCase()),
              );
            }),
          ),
          const Divider()
        ],
      ),
    );
  }
}
