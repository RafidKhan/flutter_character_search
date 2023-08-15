import 'package:character_search/modules/home_page/model/animal_model.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final AnimalModel model;
  final String query;
  final bool isSelected;
  final VoidCallback onSelect;

  const UserTile({
    Key? key,
    required this.model,
    required this.query,
    required this.isSelected,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String name = model.name;
    final String queryLowerCase = query.toLowerCase();
    final String queryUpperCase = query.toUpperCase();

    return InkWell(
      onTap: onSelect,
      child: Container(
        height: 60,
        margin: const EdgeInsets.only(bottom: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Wrap(
                  children: List.generate(name.length, (index) {
                    final String char = name[index];
                    return Text(char,
                        style: TextStyle(
                          color: (queryUpperCase.contains(char) ||
                                  queryLowerCase.contains(char))
                              ? Colors.red
                              : null,
                        ));
                  }),
                ),
                const Spacer(),
                if (isSelected) const Icon(Icons.done)
              ],
            ),
            const Divider()
          ],
        ),
      ),
    );
  }
}
