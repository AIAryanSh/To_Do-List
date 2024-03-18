import 'package:hive/hive.dart';

class ToDoDB {

  List toDoTile = [];

  //refernce the box
  final _myBox = Hive.box('myBox');

  //for first time openeing this app
  void createInitialData(){
    toDoTile = [
      ["Padhai???????", false],
      ["Fapp!!!!!", false],
      ["Anime🤩", false],
    ];
  }

  //load the data
  void loadData() {
    toDoTile = _myBox.get("TODOLIST ");
  }

  //update the data
  void updateData() {
    _myBox.put("TODOLIST", toDoTile);
  }
}