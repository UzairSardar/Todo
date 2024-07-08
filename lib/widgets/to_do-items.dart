import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/modal/to_do_modal.dart';
import 'package:to_do_app/screens/homeScreen/provider/provider.dart';

import '../constants/colors.dart';
class ToDoItems extends StatefulWidget {
   ToDoItems({super.key,  this.toDoModal,required this.index});
final ToDoModal? toDoModal;
int index;

  @override
  State<ToDoItems> createState() => _ToDoItemsState();
}

class _ToDoItemsState extends State<ToDoItems> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeScreenProvider>(context);
    return  Container(
      margin: EdgeInsets.symmetric(vertical: 7),
      child:ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        onTap: () {
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18)
        ),
        tileColor: Colors.white,
        leading: Checkbox(value: widget.toDoModal!.isChecked, onChanged: (value) {

           setState(() {
             widget.toDoModal!.isChecked =value!;
           });
           // provider.handleTodoItems(value);
        },
          shape: RoundedRectangleBorder(),
          activeColor: R.blueColor,
          checkColor: R.bgColor,

        ),
        title: Text(widget.toDoModal!.title,style: TextStyle(fontSize: 15,color: R.blackColor),),
         trailing: Container(
           height: 35,
           width: 35,
           decoration:BoxDecoration(color: R.redColor,borderRadius: BorderRadius.circular(4)),
           child: IconButton(onPressed: () {
             provider.removeItems(widget.index);
           }, icon: Icon(Icons.delete),
           color: Colors.white,

           iconSize: 20,),
         ),
      ),
    );
  }
}

