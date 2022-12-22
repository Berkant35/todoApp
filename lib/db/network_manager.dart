import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todos/models/result.dart';
import 'package:todos/models/todo.dart';

part 'network_base.dart';

class NetworkManager extends NetworkBase {
  static NetworkManager? _instance;

  static NetworkManager? get instance {
    _instance ??= NetworkManager._();
    return _instance;
  }

  NetworkManager._();

  @override
  Future<ResponseResult> addTodo(Todo todo) async {
    final response =
        await _dio.post("${NetworkBase.baseURL}/todos", data: {
          "todo" : todo.todo
        });

    var result = ResponseResult.fromJson(response.data);

    Fluttertoast.showToast(msg: result.msg ?? "--");

    return result;
  }

  @override
  Future<ResponseResult> deleteTodo(String id) async {
    try{

      await _dio.delete("${NetworkBase.baseURL}/$id").then((value){
        Fluttertoast.showToast(msg: "Başarılı bir şekilde silindi");
      });


    }catch(e){
      if(e is DioError){
        debugPrint(e.response!.statusMessage.toString());
        debugPrint(e.response!.statusMessage.toString());
        debugPrint(e.error.toString());
      }

    }

    return ResponseResult();
  }

  @override
  Future<List<Todo>> getTodoList() async {
    var todoList = <Todo>[];

    final response =
        await _dio.get("${NetworkBase.baseURL}/getTodos");

    var responseDataList = response.data as List<dynamic>;

    for (var perTodo in responseDataList) {
      todoList.add(Todo.fromJson(perTodo));
    }

    return todoList;
  }

  @override
  Future<ResponseResult> updateTodo(String id, Todo newTodo) {
    // TODO: implement updateTodo
    throw UnimplementedError();
  }
}
