
class TaskModel {
  TaskModel({
    this.title,
    this.periorety,
    this.descreption,
    this.id,
    this.date,
    this.isDone,
  });
  
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      title: json["title"],
      periorety: json["periorety"],
      descreption: json["descreption"],
      id: json["id"],
      date: DateTime.fromMillisecondsSinceEpoch(json["id"]),
      isDone: json["isDone"],
    );
  }

  String? title;
  String? periorety;
  String? descreption;
  String? id;
  DateTime? date;
  bool? isDone;

  Map<String, dynamic> tojson() {
    return {
      "title": title,
      "periorety": periorety,
      "descreption": descreption,
      "id": id,
      "date":
          date?.microsecondsSinceEpoch ?? DateTime.now().millisecondsSinceEpoch,
      "isDone": false,
    };
  }
}
