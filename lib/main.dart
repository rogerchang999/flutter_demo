import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_change_notifier.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget
{
    const MyApp({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context)
    {
        return MultiProvider
        (
            providers: [ChangeNotifierProvider(create: (_) => CounterChangeNotifier())],
            child: const MaterialApp
            (
                home: HomePage()
            )
        );
    }
}

class HomePage extends StatelessWidget
{
    const HomePage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context)
    {
        return Scaffold
        (
            appBar: AppBar
            (
                title: const Text("Demo")
            ),
            body: Center
            (
                child: Consumer<CounterChangeNotifier>
                (
                    builder: (context, counter, _)
                    {
                        return Column
                        (
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>
                            [
                                Text("目前計數值：${counter.count}")
                            ]
                        );
                    }
                )
            ),
            floatingActionButton: FloatingActionButton
            (
                onPressed: ()
                {
                    Provider.of<CounterChangeNotifier>(context, listen: false).increment();
                },
                child: const Icon(Icons.add)
            )
        );
    }
}