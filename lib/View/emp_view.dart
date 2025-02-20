import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo/Controller/emp_controller.dart';

class EmpScr extends StatelessWidget{
  @override
  EmpScr({super.key});

  final TextEditingController _name = TextEditingController();
  final EmpControlelr _emp = Get.put(EmpControlelr());


  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Emp Screen")),
        body: Padding(padding: EdgeInsets.all(20.0), child: Column(
          children: [
            TextField(
              controller: _name,
            ),
            IconButton(
              icon: Icon(Icons.add_box_outlined),
              onPressed: (){
                _emp.add(_name.text, _emp.emp.length+1, _name.text.length < 3 ? true : false); _name.clear();
              },
            ),

            Container(
                height: 250, color: Colors.limeAccent,
                child: Expanded(
                  child: Obx(() => ListView.builder(
                    itemCount: _emp.emp.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Checkbox(value: _emp.emp[index].done, onChanged: (val) => _emp.toggle(index)),
                        trailing: IconButton(icon: Icon(Icons.delete),onPressed: () => _emp.remove(index),),
                        title: Text(_emp.emp[index].name.toString()),
                        subtitle: Text(_emp.emp[index].done.toString()),
                      );
                    },
                  )),
                )
            )
          ],
        ),)
    );
  }
}