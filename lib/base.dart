import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todos/viewmodel/app_view_models/button_loading_manager.dart';
import 'package:todos/viewmodel/global_providers.dart';

import 'models/todo.dart';

class Base extends ConsumerStatefulWidget {
  const Base({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _BaseState();
}

class _BaseState extends ConsumerState<Base> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Yapılacak işlemi girin',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: SizedBox(
                width: 150,
                height: 50,
                child:
                ref.read(currentButtonLoadingState) != LoadingStates.loading
                    ? ElevatedButton(
                  onPressed: () =>
                      ref
                          .read(currentTodoState.notifier)
                          .addTodo(Todo(todo: controller.text), ref).then((
                          value) {
                        setState(() {});
                      }),
                  child: const Text("Ekle"),
                )
                    : const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              ),
            ),
            FutureBuilder<List<Todo>?>(
                future: ref.read(currentTodoState.notifier).getTodoList(ref),
                builder: (context, snapshot) {
                  var list = snapshot.data;
                  return snapshot.connectionState == ConnectionState.done
                      ? (list != null && list.isNotEmpty)
                      ? ListView.builder(
                      shrinkWrap: true,
                      itemExtent: 60,
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 50,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(list[index].todo!),
                                  IconButton(
                                      onPressed: () {
                                        ref.read(currentTodoState.notifier)
                                            .deleteTodo(list[index].sId!, ref).then((value){
                                              setState(() {});
                                        });
                                      },
                                      icon: const Icon(Icons.delete))
                                ],
                              ),
                            ),
                          ),
                        );
                      })
                      : const Center(
                    child: Text("Henüz oluşturulmuş bir todo yok"),
                  )
                      : const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                })
          ],
        ),
      ),
    );
  }
}
