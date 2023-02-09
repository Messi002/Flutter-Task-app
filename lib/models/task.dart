
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
class Task extends Equatable{
  final String title;
  late final bool? isDone;
   late final bool? isDeleted;

  Task({required this.title, this.isDone, this.isDeleted})
  {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  Task copyWith({
    String? title,
    bool? isDone,
    bool? isDeleted,
  }) {
    return Task(
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'] as String, //json['title'] ?? ''
      isDone: json['isDone'] != null ? json['isDone'] as bool : null, //json['isDone']
      isDeleted: json['isDeleted'] != null ? json['isDeleted'] as bool : null, //json['isDeleted']
    );
  }
  
  @override
  List<Object?> get props =>[title, isDeleted, isDone];


}
