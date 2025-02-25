import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo/Controller/emp_controller.dart';
import 'package:getx_todo/screens/speech.dart';

class EmpScr extends StatelessWidget{
  @override
  EmpScr({super.key});

  final TextEditingController _name = TextEditingController();
  final EmpControlelr _emp = Get.put(EmpControlelr());


  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Emp Screen")),
        body:  SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child:  Column(
              children: [
                ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Speech())), child: Text("Go to Speech to Text"),style:  ElevatedButton.styleFrom(foregroundColor: Colors.yellow, backgroundColor: Colors.blueAccent),),
                SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container( height: 50, width: MediaQuery.of(context).size.width*0.7, color: Colors.blueGrey.shade100,
                        child:   TextField( controller: _name,decoration: InputDecoration(hintText: "Enter something !"), ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add_circle_outline,size: 40,color: Colors.lightGreen,),
                        onPressed: (){
                          _emp.add(_name.text, _emp.emp.length+1, _name.text.length < 3 ? true : false); _name.clear();
                        },
                      ),
                    ],
                  ),
                SizedBox(height: 20.0,),

                Container(
                  height: 350, color: Colors.grey.shade100,
                  child:
                  Obx(() =>
                    ListView.builder(
                      shrinkWrap: true,
                    itemCount: _emp.emp.length,
                    itemBuilder: (context, index) {
                      return Obx(() => ListTile(
                        leading: Checkbox(value: _emp.emp[index].done, onChanged: (val) => _emp.toggle(index)),
                        trailing: IconButton(icon: Icon(Icons.delete,color: Colors.red,),onPressed: () => _emp.remove(index),),
                        title: Text(_emp.emp[index].name.toString()),
                        subtitle: Text(_emp.emp[index].done.toString()),
                      )
                      );
                    },
                  )
                  ),
                )


              ],
            ), 
        ),

    );
  }
}








/*Obx(() => ListView.builder(
                    itemCount: _emp.emp.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Checkbox(value: _emp.emp[index].done, onChanged: (val) => _emp.toggle(index)),
                        trailing: IconButton(icon: Icon(Icons.delete),onPressed: () => _emp.remove(index),),
                        title: Text(_emp.emp[index].name.toString()),
                        subtitle: Text(_emp.emp[index].done.toString()),
                      );
                    },
                  )),*/



