import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.isSelected, required this.itemName});

  final bool isSelected;
  final String itemName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.green[100] : Colors.white,
        border: Border.all(
          color: isSelected ? Colors.green : Colors.grey,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                itemName,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            if (isSelected) ...{
              const Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
            } else ...{
              const Icon(
                Icons.circle_outlined,
                color: Colors.grey,
              ),
            }
          ],
        ),
      ),
    );
  }
}
