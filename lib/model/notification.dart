List<Notification> notificationFromJson(List<dynamic> json) {
  return json.map((e) => Notification.fromJson(e)).toList();
}

class Notification {
  int? id;
  String? title;
  String? message;
  String? type;
  bool? isRead;
  Null? readAt;
  String? createdAt;

  Notification({
    this.id,
    this.title,
    this.message,
    this.type,
    this.isRead,
    this.readAt,
    this.createdAt,
  });

  Notification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    message = json['message'];
    type = json['type'];
    isRead = json['is_read'];
    readAt = json['read_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['message'] = this.message;
    data['type'] = this.type;
    data['is_read'] = this.isRead;
    data['read_at'] = this.readAt;
    data['created_at'] = this.createdAt;
    return data;
  }
}
