import 'package:flutter/material.dart';
import 'package:fmea/colors.dart';
import 'package:fmea/models/fmea_model.dart';



class ItemCard extends StatelessWidget {
  ItemCard({
    Key? key,
    required this.item, required this.index,
  }) : super(key: key);

  final FMEAData item;
  final int index;

  @override
  Widget build(BuildContext context) {
    final color = itemColor(index);
    final minHeight = getMinHeight(index);

    return Card(
      color: color,
      child: Container(
        constraints: BoxConstraints(minHeight: minHeight),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.machine != null? item.machine! : 'No Machine',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              item.problemOccured != null? item.problemOccured! : 'No Date',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              item.problem != null? item.problem! : 'No Problem Description',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              item.status != null? item.status! : 'No Status',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  double getMinHeight(int index) {
    switch (index % 4) {
      case 0:
        return 100;
      case 1:
        return 120;
      case 2:
        return 140;
      case 3:
        return 160;
      default:
        return 100;
    }
  }
}
