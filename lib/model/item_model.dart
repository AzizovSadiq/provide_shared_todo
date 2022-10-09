
import 'package:flutter/cupertino.dart';

class ItemModel{
 
  final String title;
 
  bool isCompleted;

  ItemModel({required this.title,this.isCompleted = false});

  void changeStatus(){
    isCompleted = !isCompleted;
  }

  ItemModel.fromMap(Map<String,dynamic> map)
  : title = map['title'],
  isCompleted = map['isComplated'];

  Map<String,dynamic> toMap() => {'title': title,'isComplated': isCompleted};

}