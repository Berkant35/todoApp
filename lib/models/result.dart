
class ResponseResult {
  String? msg;
  String? error;

  ResponseResult({this.msg, this.error});

  ResponseResult.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    data['error'] = error;
    return data;
  }
}
