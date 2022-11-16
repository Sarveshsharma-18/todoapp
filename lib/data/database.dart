import 'package:hive/hive.dart';

class ToDoDataBase {
  List toDoList = [];
  //refrence our box
  final _myBox = Hive.box('mybox');

  //run this method if this is 1st time ever opening this app
  void createInitialData() {
    toDoList = [
      ['Make App', false],
      ['Make UI', false],
    ];
  }

  //load the data from database
  void loadData() {
    toDoList = _myBox.get('TODOLIST');
  }

  //update the database
  void updateDatabase() {
    _myBox.put('TODOLIST', toDoList);
  }
}
