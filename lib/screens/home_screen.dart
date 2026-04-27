import 'package:flutter/material.dart';
import '../models/habit.dart';
import '../widgets/habit_tile.dart';
import '../widgets/add_habit_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Habit> _habits = [];

  void _addHabit(String name) {
    setState(() {
      _habits.add(Habit(name: name));
    });
  }

  void _toggleHabit(int index) {
    setState(() {
      _habits[index].isDone = !_habits[index].isDone;
    });
  }

  void _deleteHabit(int index) {
    setState(() {
      _habits.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Habit Tracker'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: _habits.isEmpty
          ? const Center(
              child: Text(
                'Belum ada habit.\nTekan + untuk menambahkan.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: _habits.length,
              itemBuilder: (context, index) {
                final habit = _habits[index];
                return HabitTile(
                  name: habit.name,
                  isDone: habit.isDone,
                  onChanged: (_) => _toggleHabit(index),
                  onDelete: () => _deleteHabit(index),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final name = await showDialog<String>(
            context: context,
            builder: (context) => AddHabitDialog(),
          );
          if (name != null) {
            _addHabit(name);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}