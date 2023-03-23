class ResponseEntity {
  final String? msg;
  final int? code;
  final dynamic data;

  ResponseEntity({this.msg, this.code, this.data});

  factory ResponseEntity.fromJson(Map<String, dynamic> json) {
    return ResponseEntity(msg: json['msg'], code: json['code'], data: json['data']);
  }

  Map<String, dynamic> toJson() => {'msg': msg, 'code': code, 'data': data};
}
