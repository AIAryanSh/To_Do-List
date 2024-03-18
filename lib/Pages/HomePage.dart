import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todoapp/Pages/dialogbox.dart';
import 'package:todoapp/Pages/toDoList.dart';
import 'package:todoapp/data/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //refernce the Hive Box
  final _myBox = Hive.box('myBox');
  ToDoDB db =  ToDoDB();

  @override
  void initState() {

  if (_myBox.get("TODOLIST") == null) {
    db.createInitialData();
  } 

  else {
    db.loadData();
  }
    // TODO: implement initState
    super.initState();
  }

  final _controller = TextEditingController();

  // List toDoTile = [
  //   ["Do Code", false],
  //   ["fapping", true],
  // ];

  //check box changed
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoTile[index][1] = !db.toDoTile[index][1];
    });
    db.updateData();
  }

  //save new task
  void saveNewTask() {
    setState(() {
      db.toDoTile.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  void createNewTask() {
  showDialog(
    context: context, 
    builder: (context) {
      return DialogBox(
        controller: _controller,
        onSave: saveNewTask,
        onCancel: () => Navigator.of(context).pop(),
      );
    }
  );
}

void deleteTask(int index){
  setState(() {
    db.toDoTile.removeAt(index);
  });
  db.updateData();
}
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Kaam Kar le Thoda!!!!!",
        ),
        elevation: 10,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: createNewTask, child: Icon(Icons.add)),
      body: ListView.builder(
        itemCount: db.toDoTile.length,
        itemBuilder: (context, index) {
          return toDoList(
            taskName: db.toDoTile[index][0],
            taskCompleted: db.toDoTile[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
