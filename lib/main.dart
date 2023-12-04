import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Task {
  String title;
  DateTime dueDate;
  bool isCompleted;

  Task(this.title, this.dueDate, {this.isCompleted = false});
}

class TasksList {
  final List<Task> tasks;

  TasksList(this.tasks);

  void addTask(Task task) {
    tasks.add(task);
  }

  void removeTask(Task task) {
    tasks.remove(task);
  }

  void completeTask(Task task) {
    task.isCompleted = true;
  }

  void uncompleteTask(Task task) {
    task.isCompleted = false;
  }
}

class TasksPage extends StatefulWidget {
  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  late TasksList tasksList; // Added 'late' to avoid the error
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    tasksList = TasksList([
      Task("Comprar pão", DateTime.now().add(Duration(days: 1))),
      Task("Lavar a louça", DateTime.now().add(Duration(days: 2))),
      Task("Ir ao banco", DateTime.now().add(Duration(days: 3))),
      Task("Fazer exercícios", DateTime.now().add(Duration(days: 4))),
      Task("Ler um livro", DateTime.now().add(Duration(days: 5))),
    ]);

    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void showDetails(Task task) {
    // Implementar a lógica para mostrar mais detalhes da tarefa
    print("Detalhes da tarefa: ${task.title}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tarefas"),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_upward),
            onPressed: () {
              // Implement logic to sort tasks in ascending order
            },
          ),
          IconButton(
            icon: Icon(Icons.arrow_downward),
            onPressed: () {
              // Implement logic to sort tasks in descending order
            },
          ),
        ],
      ),
      body: RawKeyboardListener(
        focusNode: _focusNode,
        onKey: (RawKeyEvent event) {
          if (event is RawKeyDownEvent) {
            if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
              // Handle arrow up key press
              // Implement logic to move selection up
            } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
              // Handle arrow down key press
              // Implement logic to move selection down
            }
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: ListView.builder(
            itemCount: tasksList.tasks.length,
            itemBuilder: (context, index) {
              Task task = tasksList.tasks[index];
              return Column(
                children: [
                  ListTile(
                    title: Text(task.title),
                    subtitle: Text(task.dueDate.toIso8601String()),
                    trailing: InkWell(
                      onTap: () {
                        showDetails(task);
                      },
                      child: Icon(Icons.arrow_forward),
                    ),
                  ),
                  Divider(), // Adiciona uma linha de divisão após cada ListTile
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: TasksPage(),
    ),
  );
}
