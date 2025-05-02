import 'package:flutter/material.dart';

class Task {
  String title;
  int points;
  bool isCompleted;

  Task({required this.title, required this.points, this.isCompleted = false});
}

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  TasksScreenState createState() => TasksScreenState();
}

class TasksScreenState extends State<TasksScreen> {
  List<Task> allTasks = [
    Task(title: 'Take out the trash 🗑️', points: 3),
    Task(title: 'Clean the dishes', points: 3),
    Task(title: 'Water bathroom plants!!', points: 1),
    Task(title: 'Replace bathroom bulb', points: 2),
    Task(title: 'Buy groceries', points: 4),
    Task(title: 'Mop kitchen floor', points: 5),
  ];

  String searchQuery = '';

  void _toggleTask(Task task) {
    setState(() {
      task.isCompleted = !task.isCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredTasks =
        allTasks
            .where(
              (task) =>
                  task.title.toLowerCase().contains(searchQuery.toLowerCase()),
            )
            .toList();

    final activeTasks =
        filteredTasks.where((task) => !task.isCompleted).toList();
    final completedTasks =
        filteredTasks.where((task) => task.isCompleted).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              "Let's get\nthings done 💪",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (value) => setState(() => searchQuery = value),
                  decoration: InputDecoration(
                    hintText: "Search for any task...",
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding: const EdgeInsets.symmetric(vertical: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Color(0xFFC0C0C0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Color(0xFFC0C0C0),
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Color(0xFFC0C0C0),
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF1F8EBE),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add, color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                if (activeTasks.isEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: Center(
                      child: Text(
                        "Nothing to do 🏖️\nNice work!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ),
                ...activeTasks.map((task) => _buildTaskTile(task, false)),
                if (completedTasks.isNotEmpty) ...[
                  const Padding(
                    padding: EdgeInsets.only(top: 24, bottom: 8),
                    child: Text(
                      "Completed",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ...completedTasks.map((task) => _buildTaskTile(task, true)),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskTile(Task task, bool isCompletedSection) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[400]!, width: 1),
        ),
        child: ListTile(
          leading: GestureDetector(
            onTap: () => _toggleTask(task),
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFC0C0C0), width: 1),
                color:
                    task.isCompleted
                        ? const Color(0xFF1F8EBE)
                        : const Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Icon(
                task.isCompleted ? Icons.close : Icons.circle,
                color: task.isCompleted ? Colors.black : Colors.transparent,
                size: 24,
              ),
            ),
          ),
          title: Text(
            task.title,
            style: TextStyle(
              fontSize: 16,
              color: task.isCompleted ? Colors.grey : Colors.black,
              decoration:
                  task.isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                task.points.toString(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color:
                      task.isCompleted ? Colors.grey : const Color(0xFF1F8EBE),
                ),
              ),
              const SizedBox(width: 12),
              const Icon(Icons.more_vert),
            ],
          ),
        ),
      ),
    );
  }
}
