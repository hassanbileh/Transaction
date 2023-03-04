
class Task {
  final int idT;
  final String title;
  final DateTime date;
  final String status;

  Task(this.idT, this.title, this.date, this.status);

  String toJson() => '{"id": $idT, "task": "$title", "date": $date, ""status": $status}';
}