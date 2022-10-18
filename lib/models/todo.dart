class ToDo {
  String? id;
  String? toDoText;
  late bool isDone;

  ToDo({required this.id, required this.toDoText, this.isDone = false});

    static List<ToDo> toDoLists() {
    return [
      ToDo(id: '01', toDoText: 'Morning Exercise', isDone: true),
      ToDo(id: '02', toDoText: 'Buy Groceries', isDone: true),
      ToDo(id: '03', toDoText: 'Check Email'),
      ToDo(id: '04', toDoText: 'Team Meating'),
      ToDo(id: '05', toDoText: 'Work On ToDo App For 2 Hours'),
      ToDo(id: '06', toDoText: 'Dinner With ----'),
    ];
  }
}
