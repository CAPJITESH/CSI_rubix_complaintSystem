class ChatModel {
  String? message;
  String? by;
  String? to;
  String? dateTime;

  ChatModel({this.message, this.by, this.to, this.dateTime});

  ChatModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    by = json['by'];
    to = json['to'];
    dateTime = json["dateTime"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['by'] = by;
    data['to'] = to;
    data["dateTime"] = dateTime;
    return data;
  }
}