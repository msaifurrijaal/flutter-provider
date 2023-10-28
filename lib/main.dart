import 'package:flutter/material.dart';
import 'package:latihan_get_list/models/user.dart';
import 'package:latihan_get_list/repository.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User> userList = [];
  Repository repository = Repository();

  getData() async {
    userList = await repository.getData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List User'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image.network(userList[index].avatar),
              title: Text(
                  "${userList[index].firstname} ${userList[index].lastname}"),
              subtitle: Text(userList[index].email),
            ),
          );
        },
        itemCount: userList.length,
      ),
    );
  }
}
