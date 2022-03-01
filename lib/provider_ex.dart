import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    MyModel appData = MyModel();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => appData),
      ],
      child: const MaterialApp(
        home: MyScreen(),
      ),
    );
  }
}

class MyScreen extends StatelessWidget{
  const MyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    MyModel data = Provider.of<MyModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('My App')),
      backgroundColor: Colors.grey,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.green[200],
            child: Builder(
              builder: (BuildContext context) {

                return RaisedButton(
                  child: Text('Do something 123'),
                  onPressed: () {
                    data.doSomething();
                  },
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(35),
            color: Colors.blue[200],
            child: Text(data.text),
          ),
        ],
      ),
    );
  }
}

class MyModel extends ChangeNotifier {
  String text = "Hello";

  void doSomething() {
    if (text == "World")
      text = "Hello";
    else
      text = "World";
    notifyListeners();
  }
}
