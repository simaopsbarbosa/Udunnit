import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Task {
  String id;
  String title;
  int points;
  bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.points,
    this.isCompleted = false,
  });

  factory Task.fromSnapshot(DataSnapshot snap) {
    final data = Map<String, dynamic>.from(snap.value as Map);
    return Task(
      id: snap.key!,
      title: data['title'] as String,
      points: data['points'] as int,
      isCompleted: data['isCompleted'] as bool,
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'points': points,
    'isCompleted': isCompleted,
  };
}

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  TasksScreenState createState() => TasksScreenState();
}

class TasksScreenState extends State<TasksScreen> {
  final DatabaseReference _tasksRef = FirebaseDatabase.instance.ref('tasks');
  final TextEditingController _searchController = TextEditingController();
  List<Task> allTasks = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    _tasksRef.onValue.listen((event) {
      final List<Task> loadedTasks = [];
      if (event.snapshot.value != null) {
        for (final snap in event.snapshot.children) {
          loadedTasks.add(Task.fromSnapshot(snap));
        }
      }
      setState(() {
        allTasks = loadedTasks;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _toggleTask(Task task) {
    final newStatus = !task.isCompleted;
    _tasksRef.child(task.id).update({'isCompleted': newStatus});
  }

  void _addTask() {
    final text = _searchController.text.trim();
    if (text.isEmpty) return;

    double effortPoints = 1;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder:
              (context, setState) => AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                title: const Text(
                  "Set Task Effort",
                  style: TextStyle(
                    color: Color(0xFF1F8EBE),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "How much effort is \"${text}\"?",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Effort: ${effortPoints.toInt()} point(s)",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F8EBE),
                      ),
                    ),
                    Slider(
                      value: effortPoints,
                      min: 1,
                      max: 5,
                      divisions: 4,
                      activeColor: const Color(0xFF1F8EBE),
                      inactiveColor: Colors.grey[300],
                      label: effortPoints.toInt().toString(),
                      onChanged: (value) {
                        setState(() {
                          effortPoints = value;
                        });
                      }
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1F8EBE),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      final newTaskRef = _tasksRef.push();
                      newTaskRef.set({
                        'title': text,
                        'points': effortPoints.toInt(),
                        'isCompleted': false,
                      });

                      Navigator.of(context).pop();
                      _searchController.clear();
                      setState(() {
                        searchQuery = '';
                      });
                    },
                    child: const Text(
                      "Add Task",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
        );
      },
    );
  }

  void _showDeleteDialog(Task task) {
    showDialog(
      context: context,
      builder:
          (ctx) => AlertDialog(
            title: const Text(
              "Delete Task",
              style: TextStyle(color: Color(0xFF1F8EBE)),
            ),
            content: Text(
              "Are you sure you want to delete \"${task.title}\"?",
              style: const TextStyle(color: Colors.black87),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.deepOrange),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                ),
                onPressed: () async {
                  Navigator.of(ctx).pop();
                  await _tasksRef.child(task.id).remove();
                },
                child: const Text("Delete"),
              ),
            ],
          ),
    );
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
                  controller: _searchController,
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
                  onPressed: _addTask,
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
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Center(
                      child: Text(
                        searchQuery.isNotEmpty
                            ? "No results found 😕\nTap ➕to add a task!"
                            : "Nothing to do 🏖️\nNice work!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ),

                ...activeTasks.map((task) => _buildTaskTile(task)),
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
                  ...completedTasks.map((task) => _buildTaskTile(task)),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskTile(Task task) {
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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color:
                      task.isCompleted
                          ? Colors.grey[300]
                          : const Color(0xFF1F8EBE),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  task.points.toString(),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: task.isCompleted ? Colors.grey[600] : Colors.white,
                  ),
                ),
              ),
              PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == 'delete') {
                    _showDeleteDialog(task);
                  }
                },
                icon: const Icon(Icons.more_vert, color: Colors.grey),
                itemBuilder:
                    (BuildContext context) => [
                      const PopupMenuItem<String>(
                        value: 'delete',
                        child: Row(
                          children: [
                            Icon(Icons.delete, color: Colors.deepOrange),
                            SizedBox(width: 8),
                            Text('Delete'),
                          ],
                        ),
                      ),
                    ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
