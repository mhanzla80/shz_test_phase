class MyNotificationModel {
  final int id;
  final String title;
  final String time;
  final String description;

  MyNotificationModel(
      {required this.id,
      required this.title,
      required this.time,
      required this.description});

  static List<MyNotificationModel> fromJsonList(List<dynamic> jsonList) =>
      jsonList.map((e) => MyNotificationModel.fromJson(e)).toList();

  factory MyNotificationModel.fromJson(Map<String, dynamic> json) =>
      MyNotificationModel(
        id: json['id'] as int,
        title: json['title'] as String,
        time: json['time'] as String,
        description: json['description'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'title': title,
        'time': time,
        'description': description,
      };

  DateTime get parsedDate => DateTime.parse(time);
}
