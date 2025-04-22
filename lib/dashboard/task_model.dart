class Task {
  final int id;
  final String title;
  final bool isCompleted;

  Task({required this.id, required this.title, required this.isCompleted});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      isCompleted: json['is_completed'],
    );
  }
}
