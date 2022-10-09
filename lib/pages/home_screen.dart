import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/item_data.dart';
import '../provider/theme_setting.dart';
import '../widgets/list_item_cart.dart';
import 'add_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _currentCheck = Provider.of<ThemeSettings>(context).currentCheck;
    return Scaffold(
      appBar: buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            bodyExpContOne(context),
            bodyExpContTwo(),
          ],
        ),
      ),
    );
    ;
  }

  Expanded bodyExpContTwo() {
    return Expanded(
            flex: 9,
            child: Container(
              padding: EdgeInsets.only(top: 20, left: 10, right: 10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.6),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
              ),
              child: Consumer<ItemData>(
                builder: (context, value, child) {
                  final allItems = value.items;
                  return Align(
                    alignment: Alignment.topCenter,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: allItems.length,
                        reverse: true,
                        itemBuilder: (context, index) {
                          var item = allItems[index];
                          return ItemCart(
                            title: item.title,
                            isCompleted: item.isCompleted,
                            changeStatus: (_) {
                              Provider.of<ItemData>(context, listen: false)
                                  .changeStatus(index);
                            },
                            deleteItem: (_) {
                              Provider.of<ItemData>(context, listen: false)
                                  .removeItem(index);
                            },
                          );
                        }),
                  );
                },
              ),
            ),
          );
  }

  Expanded bodyExpContOne(BuildContext context) {
    return Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.6),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Tooltip(
                    padding: EdgeInsets.zero,
                    message: 'All Todos',
                    child: TextButton(
                        onPressed: () {},
                        child: Text('All',
                            style: Theme.of(context).textTheme.headline6)),
                  ),
                  Tooltip(
                    padding: EdgeInsets.zero,
                    message: 'Only Completed Todos',
                    child: TextButton(
                        onPressed: () {},
                        child: Text('Completed',
                            style: Theme.of(context).textTheme.headline6)),
                  )
                ],
              ),
            ),
          );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Text(
            '${Provider.of<ItemData>(context).items.length}',
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            'Todos',
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(color: context.read<ThemeSettings>().colorTheme),
          )
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AddItemAdd()));
            },
            child: Text(
              'Add',
              style: Theme.of(context).textTheme.headline5,
            )),
        IconButton(
            onPressed: () {
              Provider.of<ThemeSettings>(context, listen: false)
                  .toggleTheme();
            },
            icon: CircleAvatar(
                backgroundColor: context.read<ThemeSettings>().colorTheme)),
      ],
    );
  }
}
