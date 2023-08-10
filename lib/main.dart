import 'package:character_search/user_model.dart';
import 'package:character_search/user_tile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController textEditingController = TextEditingController();

  final List<UserModel> users = [
    const UserModel(name: "Rafid Hussain Khan", email: "rafid@gmail.com"),
    const UserModel(name: "Mausum Nandy", email: "mausum@gmail.com"),
    const UserModel(name: "Rafsan Biswas", email: "rafsan@gmail.com"),
    const UserModel(name: "Asif Malik", email: "asif@gmail.com"),
    const UserModel(name: "Rezaul Karim", email: "rezaul@gmail.com"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              decoration: const InputDecoration(hintText: "Search..."),
              onChanged: (v) {
                setState(() {});
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final element = users[index];

                  final name = element.name.toLowerCase().replaceAll(" ", "");
                  final email = element.email.toLowerCase().replaceAll(" ", "");
                  final query = textEditingController.text
                      .toLowerCase()
                      .replaceAll(" ", "");

                  if (query.isEmpty) {
                    return UserTile(
                      model: element,
                      query: query,
                    );
                  }

                  if (query.contains(name) ||
                      name.contains(query) ||
                      query.contains(email) ||
                      email.contains(query) ||
                      name == query ||
                      email == query) {
                    return UserTile(
                      model: element,
                      query: query,
                    );
                  }

                  return const SizedBox();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
