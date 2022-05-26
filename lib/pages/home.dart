import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late String _userToDO;
  List toDoList = [];

  @override
  void initState() {
    super.initState();

    toDoList.addAll(['купить хлеб', 'купить молоко', 'купить яйца']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Text('Список дел'),
          iconTheme: ,
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: toDoList.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: Key(toDoList[index]),
                child: Card(
                  child: ListTile(
                      title: Text(toDoList[index]),
                      trailing: IconButton(
                        icon: Icon(Icons.delete_forever,
                            color: Colors.blueGrey),
                        onPressed: () {
                          setState(() {
                            toDoList.removeAt(index);
                          });
                        },
                      )),
                ),
                onDismissed: (direction) {
                  setState(() {
                    toDoList.removeAt(index);
                  });
                },
              );
            }
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueAccent,
          onPressed: () {
            showDialog(context: context, builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Добавление элемента'),
                content: TextField(
                  onChanged: (String value) {
                    _userToDO = value;
                  },
                ),
                actions: [
                  ElevatedButton(onPressed: () {
                    setState(() {
                      toDoList.add(_userToDO);
                    });

                    Navigator.of(context).pop();
                  }, child: Text("Добавить"))
                ],
              );
            });
          },
          child: Icon(
            Icons.add_circle_outline,
            color: Colors.white,
          ),
        )
    );
  }
}
