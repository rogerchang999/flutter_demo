import 'package:flutter/foundation.dart';

class CounterChangeNotifier with ChangeNotifier
{
    int _count = 0;

    int get count => _count;

    increment()
    {
        _count++;

        notifyListeners();
    }
}