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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          leading: Checkbox(
            value: isDone, onChanged: onChanged, shape: const CircleBorder(), activeColor: Colors.green,
          ),
          title: Text(
            name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isDone ? FontWeight.normal : FontWeight.w500,
              decoration: isDone ? TextDecoration.lineThrough : TextDecoration.none,
              color: isDone ? Colors.grey : null,
            ),
          ),
          trailing: IconButton(
            icon: const Icon(
              Icons.delete_outline, color: Colors.red
            ),
            onPressed: onDelete,
          ),
        ),
      ),
    );
  }
}