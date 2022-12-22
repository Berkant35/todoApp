


class Todo {
  String? sId;
  String? todo;

  Todo({this.sId, this.todo});

  Todo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    todo = json['todo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['todo'] = todo;
    return data;
  }
}