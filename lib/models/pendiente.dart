import 'package:pendientes_app/utils/utils.dart';

class PendienteField {
  static const createdTime = 'createdTime';
}

class Pendiente {
  DateTime createdTime;
  String title;
  String id;
  String description;
  bool isDone;

  Pendiente({
    required this.createdTime,
    required this.title,
    this.description = '',
    required this.id,
    this.isDone = false,
  });

  static Pendiente fromJson(Map<String, dynamic> json) => Pendiente(
        createdTime: Utils.toDateTime(json['createdTime'])!,
        title: json['title'],
        id: json['id'],
        isDone: json['isDone'],
      );

  Map<String, dynamic> toJson() => {
        'createdTime': Utils.fromDateTimeToJson(createdTime),
        'title': title,
        'id': id,
        'description': description,
        'isDone': isDone,
      };
}
