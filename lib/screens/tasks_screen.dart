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
    Task(title: 'Clean the dishes', points: 3, isCompleted: true),
    Task(title: 'Water bathroom plants!!', points: 1),
    Task(title: 'Replace bathroom bulb', points: 2, isCompleted: true),
    Task(title: 'Buy groceries', points: 4),
    Task(title: 'Mop kitchen floor', points: 5),
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    List<Task> visibleTasks =
        allTasks
            .where(
              (task) =>
                  task.title.toLowerCase().contains(searchQuery.toLowerCase()),
            )
            .toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: const Text(
              "Let’s get\nthings done 💪",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                height: 1.2, // Adjusted line spacing
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    setState(() => searchQuery = value);
                  },
                  decoration: InputDecoration(
                    hintText: "Search for any task...",
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding: const EdgeInsets.symmetric(vertical: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),

                      borderSide: BorderSide.none,
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
                  onPressed: () {
                    // Placeholder for now
                  },
                  icon: const Icon(Icons.add, color: Colors.white),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Expanded(
            child: ListView.builder(
              itemCount: visibleTasks.length,
              itemBuilder: (context, index) {
                final task = visibleTasks[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: GestureDetector(
                        onTap: () {
                          setState(() {
                            task.isCompleted = !task.isCompleted;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(6),

                          decoration: BoxDecoration(
                            color:
                                task.isCompleted
                                    ? const Color(0xFF1F8EBE)
                                    : Colors.grey[300],

                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Icon(
                            task.isCompleted ? Icons.close : Icons.circle,
                            color:
                                task.isCompleted
                                    ? Colors.black
                                    : Colors.transparent,
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
                                  task.isCompleted
                                      ? Colors.grey
                                      : const Color(0xFF1F8EBE),
                            ),
                          ),

                          const SizedBox(width: 12),

                          const Icon(Icons.more_vert),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
