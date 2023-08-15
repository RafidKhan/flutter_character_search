import 'package:character_search/modules/home_page/components/user_tile.dart';
import 'package:character_search/modules/home_page/controller/home_controller.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = HomeController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Search Animals"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller.textEditingController,
              decoration: const InputDecoration(hintText: "Search..."),
            ),
            const SizedBox(
              height: 50,
            ),
            ValueListenableBuilder(
                valueListenable: controller.queryText,
                builder: (context, data, child) {
                  return Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.animals.length,
                      itemBuilder: (context, index) {
                        final element = controller.animals[index];

                        final name =
                            element.name.toLowerCase().replaceAll(" ", "");
                        final query = controller.queryText.value
                            .toLowerCase()
                            .replaceAll(" ", "");

                        if (query.isEmpty ||
                            query.contains(name) ||
                            name.contains(query) ||
                            name == query) {
                          return UserTile(
                            model: element,
                            query: query,
                          );
                        }

                        return const SizedBox();
                      },
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
