// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Task extends Equatable {
  final String title;
  final String description;
  final String id;
  bool? isDone;
  bool? isDeleted;

  Task({required this.title, required this.description,required  this.id, this.isDone, this.isDeleted}) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  Task copyWith({
    String? title,
    String? description,
    String? id,
    bool? isDone,
    bool? isDeleted,
  }) {
    return Task(
      title: title ?? this.title,
      description: description ?? this.description,
      id: id ?? this.id,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'id': id,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'] as String, //json['title'] ?? ''
      description: json['description'] as String, //json['title'] ?? ''
      id: json['id'] as String, //json['title'] ?? ''
      isDone: json['isDone'] != null
          ? json['isDone'] as bool
          : null, //json['isDone']
      isDeleted: json['isDeleted'] != null
          ? json['isDeleted'] as bool
          : null, //json['isDeleted']
    );
  }

  @override
  List<Object?> get props => [title, isDeleted, isDone, id, description];
}
