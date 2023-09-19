import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/domain/core/websocket.dart';

final webSecoketClientProvider = Provider<WebSecoketClient>(
  (ref) {
    return FakeWebSocket();
  },
);
final newCounterProvider = StreamProvider.family<int,int>((ref,start) {
  final wsClient = ref.watch(webSecoketClientProvider);
  return wsClient.getCounterStream(start: start);
});

class CounterSecondPageScreen extends ConsumerWidget {
  const CounterSecondPageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<int> counter = ref.watch(newCounterProvider(5));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios)),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Counter App'),
        actions: const [],
      ),
      body: SafeArea(
          child: Center(
        child: Text(counter
            .when(
              data: (data) => data,
              error: (error, stackTrace) => error,
              loading: () => 5,
            )
            .toString()),
      )),
    );
  }
}
