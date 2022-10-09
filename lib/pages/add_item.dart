import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_with_provider/main.dart';
import 'package:todo_app_with_provider/model/item_data.dart';



class AddItemAdd extends StatelessWidget {
  AddItemAdd({super.key});

  final _itemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              TextField(
                minLines: 1,
                maxLines: 3,
                onChanged: (input) {},
                controller: _itemController,
                style: const TextStyle(color: Colors.black),
                autofocus: true,
                decoration: const InputDecoration(
                  labelText: 'Qeyd Et',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Provider.of<ItemData>(context, listen: false)
                          .addItem(_itemController.text);

                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
