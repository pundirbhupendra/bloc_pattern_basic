import 'package:bloc_pattern_basic/Bloc/input_event.dart';
import 'package:bloc_pattern_basic/Bloc/my_bloc.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Block Pattern',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'BLock Pattern'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _bloc = MyBlock();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: StreamBuilder(
          stream: _bloc.NumberOfSelectedItems,
          initialData: 0,
          builder: (BuildContext contex, AsyncSnapshot<int> snapshot) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Container(
                    width: 35.0,
                    height: 80.0,
                    child: Image.network('https://picsum.photos/250?image=9'),
                  ),
                ),
                Text("Jeans RS:1000/-"),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 8.0),
                    width: 150.0,
                    height: 35.0,
                    color: Colors.teal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new IconButton(
                            icon: new Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            onPressed: () =>
                                _bloc.inputItemsSink.add(DecrementEvent())),
                        Text(
                          ' ${snapshot.data} ',
                          style: new TextStyle(
                            backgroundColor: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 15.0,
                          ),
                        ),
                        new IconButton(
                          icon: new Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          onPressed: () =>
                              _bloc.inputItemsSink.add(IncrementEvent()),
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _bloc.dispose();
  }
}