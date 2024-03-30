import 'package:first/first.dart';
import 'package:first/model/todo_model.dart';
import 'package:first/service_provider.dart';
import 'package:first/services/todo_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';

import 'package:random_string/random_string.dart';


class second extends StatefulWidget {
  const second({super.key});

  @override
  State<second> createState() => secondState();
}

class secondState extends State<second> {

  late String selectedOption = '';
  TextEditingController textFieldController = TextEditingController();
  TextEditingController taskcontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  TextEditingController subcontroller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(
            child: Text("Add New Task", style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),),
          ),
          bottom: PreferredSize(preferredSize: Size.fromHeight(1),
            child: Divider(
              height: 0.3,
              color: Colors.yellow,
            ),),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Task Name", style: TextStyle(fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: taskcontroller,
                  decoration: InputDecoration(
                    hintText: "Enter Your Task",
                    hintStyle: TextStyle(color: Colors.white38),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25), // Change radius
                      borderSide: BorderSide(
                        color: Colors.yellow, // Change border color
                        width: 2.0, // Change border width
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 15.0, // Change vertical padding
                      horizontal: 15.0, // Change horizontal padding
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                  maxLength: 35,
                  validator: (value) {
                    if(value == null||value.isEmpty){
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Description", style: TextStyle(fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: descriptioncontroller,
                  style: TextStyle(color: Colors.white),
                  textAlignVertical: TextAlignVertical.top,
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  // Allows for unlimited lines
                  decoration: InputDecoration(
                    hintText: "Enter Task Description",
                    hintStyle: TextStyle(color: Colors.white38),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("SubTask", style: TextStyle(fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 100,
                          child: RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Transform.translate(offset: Offset(-22, 0),
                                child: Text('Yes',
                                  style: TextStyle(color: Colors.white38),)
                            ),
                            value: 'yes',
                            groupValue: selectedOption,
                            onChanged: (value) {
                              setState(() {
                                selectedOption = value.toString();
                              });
                            },
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 100,
                          child: RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Transform.translate(offset: Offset(-22, 0),
                                child: Text('No',
                                  style: TextStyle(color: Colors.white38),)
                            ),
                            value: 'no',
                            groupValue: selectedOption,
                            onChanged: (value) {
                              setState(() {
                                selectedOption = value.toString();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    if(selectedOption == 'yes')
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          child: TextFormField(
                            controller: subcontroller,
                            decoration: InputDecoration(
                              hintText: "Enter Your Subtask",
                              hintStyle: TextStyle(color: Colors.white38),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                // Change radius
                                borderSide: BorderSide(
                                  color: Colors.yellow, // Change border color
                                  width: 2, // Change border width
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 15.0, // Change vertical padding
                                horizontal: 15.0, // Change horizontal padding
                              ),
                            ),
                            style: TextStyle(color: Colors.white),
                            maxLength: 40,
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 500,
                  child: ElevatedButton(
                    onPressed: () async {
                      String id = randomAlphaNumeric(10);
                      Map<String, dynamic> taskInfoMap = {
                        "TaskName": taskcontroller.text,
                        "Description": descriptioncontroller.text,
                        "SubTask": subcontroller.text,
                        "Id": id,
                      };
                      await DatabaseMethods().addTaskDetails(taskInfoMap, id);
                    },
                    child: Text(
                      "Add Task", style: TextStyle(color: Colors.white,),),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        foregroundColor: Colors.yellow.shade800
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }

  @override
  void dispose() {
    textFieldController.dispose();
    super.dispose();
  }
}
