// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Task extends Equatable {
  final String title;
  final String description;
  final String id;
  final String date;
  bool? isDone;
  bool? isDeleted;
  bool? isFavorite;

  Task({required this.title, required this.description,required  this.id, required this.date, this.isFavorite, this.isDone, this.isDeleted,  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
    isFavorite = isFavorite ?? false;
  }

  Task copyWith({
    String? title,
    String? date,
    String? description,
    String? id,
    bool? isDone,
    bool? isDeleted,
    bool? isFavorite,
  }) {
    return Task(
      title: title ?? this.title,
      date: date ?? this.date,
      description: description ?? this.description,
      id: id ?? this.id,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'date': date,
      'id': id,
      'isDone': isDone,
      'isDeleted': isDeleted,
      'isFavorite': isFavorite,
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'] as String, //json['title'] ?? ''
      description: json['description'] as String, //json['title'] ?? ''
      date: json['date'] as String, //json['title'] ?? ''
      id: json['id'] as String, //json['title'] ?? ''
      isDone: json['isDone'] != null
          ? json['isDone'] as bool
          : null, //json['isDone']
      isDeleted: json['isDeleted'] != null
          ? json['isDeleted'] as bool
          : null, //json['isDeleted']
        isFavorite: json['isFavorite'] != null
          ? json['isFavorite'] as bool
          : null, //json['isDeleted']
    );
  }

  @override
  List<Object?> get props => [title, isDeleted, isDone, id, description, date, isFavorite];
}
