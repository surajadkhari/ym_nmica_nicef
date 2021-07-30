class NotificationModel {
  int? id;
  String? notificationTitle;
  String? notificationText;
  String? notificationDate;
  bool? isOpen;

  NotificationModel(
      {this.id,
      this.notificationTitle,
      this.notificationText,
      this.notificationDate,
      this.isOpen = true});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    notificationTitle = json['notification_title'];
    notificationText = json['notification_text'];
    notificationDate = json['notification_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['notification_title'] = this.notificationTitle;
    data['notification_text'] = this.notificationText;
    data['notification_date'] = this.notificationDate;

    return data;
  }
}
