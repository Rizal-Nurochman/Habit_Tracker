import 'package:flutter/material.dart';

class HabitTile extends StatelessWidget {
  final String name;
  final bool isDone;
  final ValueChanged<bool?> onChanged;
  final VoidCallback onDelete;

  const HabitTile({
    super.key,
    required this.name,
    required this.isDone,
    required this.onChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: isDone,
        onChanged: onChanged,
      ),
      title: Text(
        name,
        style: TextStyle(
          decoration: isDone ? TextDecoration.lineThrough : TextDecoration.none,
          color: isDone ? Colors.grey : null,
        ),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete, color: Colors.red),
        onPressed: onDelete,
      ),
    );
  }
}