import 'package:flutter/material.dart';

class AddHabitDialog extends StatelessWidget {
  AddHabitDialog({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: const Text("Tambah Habit Baru"),
      content: TextField(
        controller: _controller,
        decoration: const InputDecoration(
          hintText: "Contoh: Minum Air 2 Liter",
        ),
        autofocus: true,
      ),
      actions: [
        TextButton(onPressed: () {
          Navigator.pop(context);
        }, child: const Text("Batal")),
        FilledButton(onPressed: () {
          final name = _controller.text.trim();
          if (name.isNotEmpty) {
            Navigator.pop(context, name);
          }
        }, child: const Text("Simpan"))
      ],
    );
  }
}