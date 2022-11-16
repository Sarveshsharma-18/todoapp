// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleated;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  TodoTile(
      {Key? key,
      required this.taskName,
      required this.taskCompleated,
      required this.onChanged,
      required this.deleteFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 25.0,
        left: 25,
        right: 25,
      ),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
              onPressed: deleteFunction,
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(12)),
          child: Row(children: [
            //checkbox
            Checkbox(
                activeColor: Colors.black,
                value: taskCompleated,
                onChanged: onChanged),
            //task name
            Text(
              taskName,
              style: TextStyle(
                  decoration: taskCompleated
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
          ]),
        ),
      ),
    );
  }
}
