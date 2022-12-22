import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todos/db/network_manager.dart';
import 'package:todos/viewmodel/app_view_models/button_loading_manager.dart';
import 'package:todos/viewmodel/global_providers.dart';

import '../../models/todo.dart';

class TodoWorksManager extends StateNotifier<List<Todo>> {
  TodoWorksManager(List<Todo> state) : super([]);

  final networkManager = NetworkManager.instance;

  Future<void> addTodo(Todo todo, WidgetRef ref) async {
    try {
      ref
          .read(currentButtonLoadingState.notifier)
          .changeState(LoadingStates.loading);
       await networkManager!.addTodo(todo);
    } catch (e) {
      debugPrint('$e<-err');

    } finally {
      ref
          .read(currentButtonLoadingState.notifier)
          .changeState(LoadingStates.idle);
    }
  }

  Future<void> deleteTodo(String id,WidgetRef ref) async {
    try {
      ref
          .read(currentButtonLoadingState.notifier)
          .changeState(LoadingStates.loading);
       await networkManager!.deleteTodo(id);
    } catch (e) {
      debugPrint('$e<-err');

    } finally {
      ref
          .read(currentButtonLoadingState.notifier)
          .changeState(LoadingStates.idle);
    }
  }

  Future<List<Todo>> getTodoList(WidgetRef ref)async {
    try {

       return await networkManager!.getTodoList();
    } catch (e) {
      debugPrint('$e<-err');
      return [];
    }
  }

  Future<void> updateTodo(String id, Todo newTodo,WidgetRef ref) async {
    try {
      ref
          .read(currentButtonLoadingState.notifier)
          .changeState(LoadingStates.loading);
       await networkManager!.updateTodo(id,newTodo);
    } catch (e) {
      debugPrint('$e<-err');

    } finally {
      ref
          .read(currentButtonLoadingState.notifier)
          .changeState(LoadingStates.idle);
    }
  }
}
