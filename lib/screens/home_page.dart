import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:to_do_lists/models/todo.dart';
import 'package:to_do_lists/widget/my_drawer.dart';
import 'package:to_do_lists/widget/todo_items.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  final todosList = ToDo.toDoLists();
  List<ToDo> _foundToDoItem = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    _foundToDoItem = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: const MyDrawer(),
      body: Stack(children: [
        Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              searchBox(),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 50, bottom: 20),
                      child: const Text(
                        "All ToDos",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w500),
                      ),
                    ),
                    for (ToDo todo in _foundToDoItem.reversed)
                      ToDoItem(
                        onToDoChanged: _handleToDoChange,
                        todoo: todo,
                        onDeleteItem: _onDeleteToDoItem,
                      ),
                    const SizedBox(
                      height: 70,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              Expanded(
                  child: Container(
                margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  controller: _todoController,
                  decoration: const InputDecoration(
                    hintText: 'Add a new ToDo item',
                    border: OutlineInputBorder(),
                  ),
                ),
              )),
              Container(
                  margin: const EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      _addToDoItem(_todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                        // backgroundColor:
                        //     Theme.of(context).scaffoldBackgroundColor,
                        elevation: 10,
                        minimumSize: const Size(50, 50)),
                    child: Icon(
                      MdiIcons.plus,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ))
            ],
          ),
        )
      ]),
    );
  }

  void _handleToDoChange(ToDo toDo) {
    setState(() {
      toDo.isDone = !toDo.isDone;
    });
  }

  void _onDeleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo) {
    setState(() {
      todosList.add(ToDo(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          toDoText: toDo));
    });
    _todoController.clear();
  }

  void _runFilter(String keyword) {
    List<ToDo> result = [];
    if (keyword.isEmpty) {
      result = todosList;
    } else {
      result = todosList
          .where((item) =>
              item.toDoText!.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundToDoItem = result;
    });
  }

  Widget searchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            prefixIcon: Icon(
              Icons.search,
              color: Theme.of(context).cardColor,
              size: 20,
            ),
            prefixIconConstraints:
                const BoxConstraints(maxHeight: 20, minWidth: 25),
            border: InputBorder.none,
            hintText: "Search Your ToDos",
            hintStyle: TextStyle(color: Theme.of(context).cardColor)),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/dragon.png'),
              ),
            )
          ],
        ));
  }
}
