import 'package:flutter/material.dart';

class BuildDropdownChip extends StatelessWidget {
  final String value;
  final List<String> items;
  final Function(String) onSelected;
  const BuildDropdownChip({super.key, required this.onSelected, required this.value, required this.items});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: Colors.white,
      onSelected: onSelected,
      itemBuilder: (context) {
        return items
            .map(
              (e) => PopupMenuItem<String>(
            value: e,
            child: Text(e),
          ),
        )
            .toList();
      },
      child: Chip(
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(value),
            const SizedBox(width: 4),
            const Icon(Icons.keyboard_arrow_down_rounded, size: 18),
          ],
        ),
        backgroundColor: Colors.white,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: BorderSide(color: Colors.grey.shade300),
        ),
      ),
    );
  }
}