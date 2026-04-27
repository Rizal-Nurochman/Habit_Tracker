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
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Habit $name berhasil ditambahkan!"))
    );
  }

  void _toggleHabit(int index) {
    setState(() {
      _habits[index].isDone = !_habits[index].isDone;
    });
  }

  void _deleteHabit(int index) {
    final habitName = _habits[index].name;
    setState(() {
      _habits.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Habit $habitName telah dihapus"))
    );
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.event_note_sharp, size: 70),
                  Text("Belum ada habit", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Text("Tekan tombol + di bawah\n untuk menambah habit!")
                ],
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final name = await showDialog<String>(
            context: context,
            builder: (context) => AddHabitDialog(),
          );
          if (name != null) {
            _addHabit(name);
          }
        },
        icon: Icon(Icons.add),
        label: const Text("Tambah Habit"),
      ),
    );
  }
}