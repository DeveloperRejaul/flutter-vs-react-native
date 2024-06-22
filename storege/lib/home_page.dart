import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:storege/storege.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  List<String> data = [];

  @override
  void initState() {
    super.initState();
    _loadCounter();
    _loadList();
  }

// handle int
  Future<void> _loadCounter() async {
    final count = await Storage.readInt('count');
    setState(() {
      _counter = count;
    });
  }

  Future<void> _incrementCounter() async {
    setState(() {
      _counter = _counter + 1;
    });
    await Storage.writeInt('count', _counter);
  }

// handle String
  Future<void> _loadList() async {
    final listData = await Storage.readStr("list");
    setState(() {
      data = List<String>.from(jsonDecode(listData));
    });
  }

  Future<void> addData(String value) async {
    final mainData = jsonEncode([...data, value]);
    await Storage.writeStr('list', mainData);

    setState(() {
      data = [...data, value];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(
              height: 500,
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Text(data[index]);
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _incrementCounter();
          addData("hello world $_counter");
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
