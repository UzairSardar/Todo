import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/screens/homeScreen/home_screen.dart';

import '../constants/colors.dart';
import '../constants/custom_formField.dart';
import '../screens/homeScreen/provider/provider.dart';
class AddTodoItem extends StatelessWidget {
   AddTodoItem({super.key});

  @override
  final formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeScreenProvider>(context);

    return Scaffold(
      appBar:  AppBar(
        centerTitle: true,
        title: Text("Add New Item"),) ,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: formKey,
              child: CustomFormField(
                validator: (value) =>provider.checkValidation(value, provider.controller) ,
                obscureText: false,
                controller: provider.addItemController,
                text: "item name",
              ),
            ),
        const SizedBox(height: 30,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: R.blueColor,foregroundColor: Colors.white),
                onPressed:   () {
              if(formKey.currentState!.validate()){
                provider.addTodoItems();
                provider.addItemController.clear();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
              }

            }, child: const Text("Add Item"))
          ],
        ),
      ),
    );
  }
}
