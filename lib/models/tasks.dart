class task {
  String name;
  bool isDone;

  task({required this.name, this.isDone = false});

  void done() {
    isDone = !isDone;
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'isDone': isDone,
  };

  factory task.fromJson(Map<String, dynamic> json) => task(
    name: json['name'],
    isDone: json['isDone'],
  );
}
