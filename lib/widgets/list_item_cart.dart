import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app_with_provider/model/item_data.dart';

class ItemCart extends StatelessWidget {
  final String title;
  final bool isCompleted;
  final Function(bool?)? changeStatus;
  final Function(void)? deleteItem;
  const ItemCart(
      {super.key,
      required this.title,
      required this.isCompleted,
      this.changeStatus,required this.deleteItem,});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: deleteItem,
      key: Key(title),
      direction: DismissDirection.horizontal,
      child: Card(
        color: isCompleted ? Colors.grey.shade200 : Colors.white,
        elevation: isCompleted ? 1 : 5,
        shadowColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(overflow: TextOverflow.ellipsis,
                color: Colors.black,
                decoration: isCompleted ? TextDecoration.lineThrough : null),
          ),
          trailing: Checkbox(
            value: isCompleted,
            onChanged: changeStatus,
            activeColor: Colors.green,
          ),
        ),
      ),
    );
  }
}
