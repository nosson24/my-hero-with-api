import 'package:test_project/model/data_model.dart';
import 'package:test_project/model/model_whats_new.dart';
import 'package:test_project/network/response_list.dart';

abstract class Repository {
  Future<ResponseList<DataModel>?> getTodoList();
  Future<ResponseList<DataModel>> putCompleted(DataModel todo);
  Future<String> deletedTodo(DataModel todo);
  Future<ResponseList<DataModel>> postTodo(DataModel todo);
  Future<ResponseList<WhatsNewModel>?> getWhatsNew();

}
