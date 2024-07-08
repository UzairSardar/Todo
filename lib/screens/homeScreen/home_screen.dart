import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/addTodoItem/add_todo_item.dart';
import 'package:to_do_app/screens/homeScreen/provider/provider.dart';
import 'package:to_do_app/widgets/to_do-items.dart';

import '../../constants/colors.dart';
import '../../constants/custom_formField.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
 bool isSearching =false;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
      builder: (context, homeProvider, child) {
        return Scaffold(
          backgroundColor: R.bgColor,
          appBar: AppBar(
            backgroundColor: R.bgColor,
            elevation: 0,
            title:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "ToDo App",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
                CircleAvatar(
                   child: Image.asset("assets/images/profile.png"),
                ) ],
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 13, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchBar(
                  onChanged: (searchText) {
                    isSearching=searchText.isEmpty?false:true;
                    homeProvider.search(searchText);
                  },
                  leading: Icon(Icons.search),
                  hintText: "search",
                  elevation: MaterialStatePropertyAll(0),
                  backgroundColor: MaterialStatePropertyAll(R.bgColor),
                  side:
                      MaterialStatePropertyAll(BorderSide(color: R.blackColor)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "All ToDos",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => ToDoItems(toDoModal: isSearching?homeProvider.filteredItem[index]:homeProvider.allItems[index], index: index,

                    ),
                    itemCount: isSearching?homeProvider.filteredItem.length:homeProvider.allItems.length,
                  ),
                ),

              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(onPressed: () {
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>AddTodoItem() ,));
          },
            shape: CircleBorder(),
            backgroundColor: R.blueColor,
            child: const Icon(Icons.add,color: Colors.white,),
          ),
        );
      },
    );
  }
}
