import 'package:blocsample/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NextPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    final CounterBloc _counterBloc = context.bloc<CounterBloc>();
    return BlocBuilder(
      bloc: _counterBloc,
      builder: (context, count) => Scaffold(
        appBar: AppBar(
          title: Text('Next page'),
        ),
        body: Center(
          child: Container(
            child: Text(
              '$count',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ),
      ),
    );
  }
}
