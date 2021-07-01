import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
var output="";
  List<dynamic> lst = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: lst.length,
        itemBuilder: (context,index){
          return Container(
            height: 50,
            color: Colors.blue[200],
            margin: EdgeInsets.all(20),
            child: ListTile(
              title: Text("${lst[index]}"),
              trailing: Container(
                width: 70,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: GestureDetector(
                        onTap: (){
                           showDialog(context: context,builder: (context){
                            return AlertDialog(
                              title: Text("Edit Item"),
                              content: TextField(onChanged: (value){
                                output = value;
                              },),
                              actions: [
                                ElevatedButton(onPressed: (){
                                  setState(() {
                                    lst.replaceRange(index, index+1, {output});
                                  });
                                  Navigator.of(context).pop();
                                }, child: Text("Edit"))
                              ],
                            );
                          });
                        },
                        child: Icon(Icons.edit)),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          lst.removeAt(index);
                        });
                      },
                      child: Icon(Icons.delete)),
                  ],
                ),
              ),
            ),
          );
        }),
        floatingActionButton: FloatingActionButton(onPressed: (){
          showDialog(context: context,builder: (context){
            return AlertDialog(
              title: Text("Add Item"),
              content: TextField(onChanged: (value){
                output = value;
              },),
              actions: [
                ElevatedButton(onPressed: (){
                  Navigator.of(context).pop();
                  setState(() {
                    lst.add(output);
                  });
                }, child: Text("Add"))
              ],
            );
          });
        },child: Text("Add"),),
    );
  }
}