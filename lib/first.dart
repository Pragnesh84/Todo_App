import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first/second.dart';
import 'package:first/services/todo_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class first extends StatefulWidget {
  const first({super.key});

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {

  Stream? TaskStream;

  getontheload()async{
    TaskStream = await DatabaseMethods().getTaskDetails();
    setState(() {

    });
  }

  @override
  void initState() {
    getontheload();
    super.initState();
  }





  Widget allTaskDetails(){
    return StreamBuilder(
        stream: TaskStream,
        builder: (context,AsyncSnapshot snapshot){
      return snapshot.hasData? ListView.builder(
          itemCount: snapshot.data.docs.length,
          itemBuilder: (context,index){
            DocumentSnapshot ds = snapshot.data.docs[index];
            return  ListView.builder(
              itemCount: 1,
              shrinkWrap: true,
              itemBuilder: (context,index) =>
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 12,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10)
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(""+ds["TaskName"],softWrap: true,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                                    Text(""+ds["Description"],style: TextStyle(color: Colors.white60),),
                                    Divider(
                                      thickness: 1.5,
                                      color: Colors.white,
                                    ),
                                    Text(""+ds["SubTask"],style: TextStyle(color: Colors.red),),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    ),
                  ),
            );
      }) : Container();
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(child: Text('All Task',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
        bottom: PreferredSize(preferredSize: Size.fromHeight(1),
          child: Divider(
            height: 0.3,
            color: Colors.yellow,
          ),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
             SizedBox(
               height: 10000,
               width: double.infinity,
                child: Container(
                    child: allTaskDetails()),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
          context,MaterialPageRoute(builder: (context) => const second()),
        );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
