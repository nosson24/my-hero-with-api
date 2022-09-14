import 'package:test_project/model/data_model.dart';
import 'package:test_project/network/response_list.dart';
import 'package:test_project/service/repository/repository.dart';

class TodoController {
  final Repository _repository;
  TodoController(this._repository);

  Future<ResponseList<DataModel>?> fetchTodoList() async {
    return _repository.getTodoList();
  }

  Future<String> deleteTodo(DataModel todo) async {
    return _repository.deletedTodo(todo);
  }

  Future<ResponseList<DataModel>> postTodo(DataModel todo) async {
    return _repository.postTodo(todo);
  }

  Future<ResponseList<DataModel>> putCompleted(DataModel todo) async {
    return _repository.putCompleted(todo);
  }
}
