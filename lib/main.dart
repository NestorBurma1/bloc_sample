import 'package:blocsample/bloc.dart';
import 'package:blocsample/next_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context) => CounterBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),

                    BlocBuilder(
                      bloc: context.bloc<CounterBloc>(),
                      builder: (context, count){
                      return Text(
                        context.bloc<CounterBloc>().state.toString(),
                        style: Theme.of(context).textTheme.headline4,
                      );}
                    ),

                FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<dynamic>(
                        builder: (context) => NextPage(),
                      ),
                    );
                  },
                  child: Text('PUSH'),
                ),
              ],
            ),
          ),
          Positioned(
            left: 14.0,
            bottom: 16.0,
            child: FloatingActionButton(
              heroTag: "btn1",
              onPressed: () {
                context.bloc<CounterBloc>().add(CounterEvents.decrement);
              },
              tooltip: 'Increment',
              child: Icon(Icons.remove),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        heroTag: "btn2",
        onPressed: () {
          context.bloc<CounterBloc>().add(CounterEvents.increment);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
