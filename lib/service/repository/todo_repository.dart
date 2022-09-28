import 'package:dio/dio.dart';
import 'package:test_project/model/model_whats_new.dart';
import 'package:test_project/network/dioService.dart';
import 'package:test_project/network/response_list.dart';
import 'package:test_project/model/data_model.dart';
import 'package:test_project/service/repository/repository.dart';

class TodoRepository implements Repository {
  @override
  Future<ResponseList<WhatsNewModel>?> getWhatsNew() async {
    Dio dio = await DioWhatNewService.getTmsApiDio();

    Response response = await dio.get('/62f43b2f-573c-461c-bbac-13a22008a1bb');
    final list = response.data["result"] ?? [];
    return ResponseList.fromJson(list, WhatsNewModel.fromJson);
  }

  @override
  Future<ResponseList<DataModel>?> getTodoList() async {
    Dio dio = await DioService.getTmsApiDio();

    Response<List<dynamic>> response =
        await dio.get<List<dynamic>>('/to-do-list');

    return ResponseList.fromJson(response.data ?? [], DataModel.fromJson);
  }

  @override
  Future<String> deletedTodo(DataModel todo) async {
    Dio dio = await DioService.getTmsApiDio();
    var result = 'false';
    await dio.delete('/to-do-list/${todo.id}').then((value) {
      return result = "true";
    });
    return result;
  }

  @override
  Future<ResponseList<DataModel>> postTodo(DataModel todo) async {
    Dio dio = await DioService.getTmsApiDio();

    Response response = await dio.post(
      '/to-do-list',
      data: todo,
    );
    print(response.statusCode);
    print(response.data);
    final parser = response.data == "" ? [] : response.data as List;

    return ResponseList.fromJson(parser, DataModel.fromJson);
  }

  @override
  Future<ResponseList<DataModel>> putCompleted(DataModel todo) async {
    Dio dio = await DioService.getTmsApiDio();

    Response response = await dio.put(
      '/to-do-list',
      data: todo,
    );
    print(response.statusCode);
    print(response.data);
    final parser = response.data == "" ? [] : response.data as List;

    return ResponseList.fromJson(parser, DataModel.fromJson);
  }
}
