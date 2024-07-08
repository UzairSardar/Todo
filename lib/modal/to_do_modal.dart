class ToDoModal{
  String title;
  bool isChecked;
  ToDoModal({
    required this.title,
     required this.isChecked
});
}
 List<ToDoModal> todoList =[
  ToDoModal(title: "Morning Exercise", isChecked: true),
  ToDoModal(title: "Check Mails", isChecked: true),
  ToDoModal(title: "Buy Groceries", isChecked: false,),
];