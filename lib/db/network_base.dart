

part of 'network_manager.dart';

abstract class NetworkBase {
  late Dio _dio;

  Dio get manager => _dio;

  NetworkBase();

  static const baseURL = "http://localhost:3000";

  void init(String baseUrl,Map<String,dynamic>? headers){
    _dio = Dio(BaseOptions(baseUrl: baseUrl,headers: headers));
  }

  Future<ResponseResult> addTodo(Todo todo);
  Future<ResponseResult> deleteTodo(String id);
  Future<List<Todo>> getTodoList();
  Future<ResponseResult> updateTodo(String id,Todo newTodo);

}