import 'dart:async';

import 'input_event.dart';

class MyBlock {
  int _items = 0;

  final _ItemStateController = StreamController<int>();

  StreamSink<int> get itemsState => _ItemStateController.sink;

  Stream<int> get NumberOfSelectedItems => _ItemStateController.stream;

  final _EventController = StreamController<InputEvent>();

  Sink<InputEvent> get inputItemsSink => _EventController.sink;

  MyBlock() {
    _EventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(InputEvent event) {
    if (event is IncrementEvent)
      _items++;
    else
      _items--;

    itemsState.add(_items);
  }

  void dispose() {
    _ItemStateController.close();
    _EventController.close();
  }
}
