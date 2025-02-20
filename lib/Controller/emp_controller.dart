import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo/Model/emp_model.dart';

class EmpControlelr extends GetxController {
  var _empList = <Emp>[].obs;

  List<Emp> get emp => _empList;

  void add(String title, int id, bool isDone){
    emp.add(Emp(name: title,id: id, done: isDone ));

  }

  void remove(int index){
    emp.removeAt(index);
  }

  void toggle(int index){
    emp[index] = Emp(name: emp[index].name, id: emp[index].id, done: !emp[index].done);
  }

}
