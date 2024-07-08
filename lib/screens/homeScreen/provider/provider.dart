import 'package:flutter/material.dart';
import 'package:to_do_app/modal/to_do_modal.dart';

class HomeScreenProvider extends ChangeNotifier {
  bool value = false;
  late final ToDoModal todo;
  final TextEditingController addItemController = TextEditingController();
  final TextEditingController controller = TextEditingController();
  List<ToDoModal> allItems = todoList;
  List<ToDoModal> filteredItem = [];
  search(String searchText) {
    filteredItem.clear();
    if (searchText.isNotEmpty) {
      filteredItem.addAll(allItems
          .where((element) => element.title.toLowerCase().contains(searchText))
          .toList());
    }
    notifyListeners();
  }

  addTodoItems() {
    todoList.add(ToDoModal(title: addItemController.text, isChecked: false));
    notifyListeners();
  }

  removeItems(int index) {
    todoList.removeAt(index);
    notifyListeners();
  }

  handleTodoItems() {
    todo.isChecked = value;
    notifyListeners();
  }

  String? checkValidation(String? value, TextEditingController controller) {
    if (value!.isEmpty) {
      return "Please enter your item name";
    }
    return null;
  }
}
