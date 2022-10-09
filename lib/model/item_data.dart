
import 'dart:collection';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'item_model.dart';

class ItemData extends ChangeNotifier{

  final List<ItemModel> _items = [];

  List<String>itemAsString = [];

  void changeStatus(int index){
    _items[index].changeStatus();
    saveItemShared(_items);
    notifyListeners();
  }

  void addItem(String title){
    _items.add(ItemModel(title: title),);
    saveItemShared(_items);
    notifyListeners();
  }

  void removeItem(int index){
    _items.removeAt(index);
    saveItemShared(_items);
    notifyListeners();
  }

  UnmodifiableListView <ItemModel> get items => UnmodifiableListView(_items); 

  //shared

  Future<void> creatSharedObject() async{
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
  }

  void saveItemShared(List<ItemModel> items)async{
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    itemAsString.clear();
    for (var item in items) {
      itemAsString.add(jsonEncode(item.toMap()));
    }
    sharedPref.setStringList('todoData', itemAsString);

  }
  void loadItemSharedsPref()async{
     SharedPreferences sharedPref = await SharedPreferences.getInstance();

     List<String> tempList = sharedPref.getStringList('todoData') ?? [];
     _items.clear();

     for(var item in tempList){
       _items.add(ItemModel.fromMap(jsonDecode(item)));
     }

  }

}