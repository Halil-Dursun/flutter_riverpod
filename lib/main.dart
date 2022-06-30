import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpood_lesson/riverpod_manager.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.green),
      title: 'Material App',
      home: const HomePage(),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final count = ref.watch<IncremenetCounter>(counterProvider);
    // final response = ref.watch(responseProvider);
    final getData = ref.watch(getDataProvider('https://jsonplaceholder.typicode.com/users'));
    try {
      debugPrint("${getData.value?.data.toString()}");
    } catch (e) {
      debugPrint("Error : ${e.toString()}");
    }
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                //count.incCounter();
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Center(child: Text('')),
      // Center(
      //   child: response.map(data: (data) => Text(data.value), error: (_)=> Text('Hata oluştu'), loading: (_)=> const CircularProgressIndicator()),
      //   // child: Column(
      //   //   children: [
      //   //     Text(''
      //   //         ref.read<String>(merhabaMesaji),
      //   //         ),
      //   //     Text(''
      //   //       count.value.toString(),
      //   //     ),
      //   //   ],
      //   // ),
      // ),
    );
  }
}

