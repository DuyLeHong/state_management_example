import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyModel>(
      create: (context) {
        return MyModel();
      },
      child: MaterialApp(
        home: Scaffold(
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
                        Provider.of<MyModel>(context, listen: false)
                            .doSomething();
                      },
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(35),
                color: Colors.blue[200],
                child: Consumer<MyModel>(
                  builder: (context, mymodel, child) {
                    return Text(mymodel.text);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyModel with ChangeNotifier {
  String text = "Hello";

  void doSomething() {
    if (text == "World")
      text = "Hello";
    else
      text = "World";
    notifyListeners();
  }
}
