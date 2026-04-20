class TodoModel {
  final String title;
  final int id;
  final bool isCompleted;

  TodoModel({required this.title, required this.id, required this.isCompleted});

  TodoModel copyWith(int? id, String? title, bool? isCompleted) {
    return TodoModel(
      title: title ?? this.title,
      id: id ?? this.id,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
