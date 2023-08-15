import 'package:character_search/modules/home_page/model/animal_model.dart';
import 'package:flutter/material.dart';

class HomeController {
  HomeController() {
    textEditingController.addListener(() {
      queryText.value = textEditingController.text.trim();
    });
  }

  final TextEditingController textEditingController = TextEditingController();
  final ValueNotifier<String> queryText = ValueNotifier("");

  final List<AnimalModel> animals = [
    const AnimalModel(name: "Cat", id: 0),
    const AnimalModel(name: "Dog", id: 1),
    const AnimalModel(name: "Elephant", id: 2),
    const AnimalModel(name: "Tiger", id: 3),
    const AnimalModel(name: "Lion", id: 4),
    const AnimalModel(name: "Zebra", id: 5),
    const AnimalModel(name: "Cow", id: 6),
    const AnimalModel(name: "Horse", id: 7),
    const AnimalModel(name: "Multiple Word", id: 8),
    const AnimalModel(name: "mIx cASe Word", id: 9),
    const AnimalModel(name: "numEriC 10 woRd", id: 10),
  ];
}
