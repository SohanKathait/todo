import 'dart:async';

import 'package:todo_app/model/todo.dart';
import 'package:todo_app/repository/todo_repository.dart';

class TodoBloc {
  //get instance of the repo

  final _todoRepository = TodoRepository();

  //Stream controller is the 'Admin' that manages
  // the state of our stream of data like adding
//new data, change the state of the stream
//and broadcast it to observers/subscribers

  final _todoController = StreamController<List<Todo>>.broadcast();

  get todos => _todoController.stream;

  TodoBloc() {
    getTodos();
  }

  void getTodos({String query}) async {
    //sink is a way of adding data reactively to the stream
    //by registering a new event

    _todoController.sink.add(await _todoRepository.getAllTodos(query: query));
  }

  addTodo(Todo todo) async {
    await _todoRepository.insertTodo(todo);
    getTodos();
  }

  updateTodo(Todo todo) async {
    await _todoRepository.updateTodo(todo);
    getTodos();
  }

  deleteTodoById(int id) async {
    _todoRepository.deleteTodoById(id);
    getTodos();
  }

  deleteAllTodo() async {
    _todoRepository.deleteAllTodos();

    getTodos();
  }

  dispose() {
    _todoController.close();
  }
}
