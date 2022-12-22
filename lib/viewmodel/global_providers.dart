

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todos/viewmodel/todo_works/todo_works_view_models.dart';

import '../models/todo.dart';
import 'app_view_models/button_loading_manager.dart';




final currentButtonLoadingState =
StateNotifierProvider<ButtonLoadingManager, LoadingStates>((ref) {
  return ButtonLoadingManager(LoadingStates.idle);
});

final currentTodoState =
StateNotifierProvider<TodoWorksManager, List<Todo>>((ref) {
  return TodoWorksManager([]);
});