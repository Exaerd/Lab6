import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget{
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Возвращение значения')),
        body: Center(child: ElevatedButton(
          onPressed: () async {
            final output = await Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondScreen()));
            ScaffoldMessenger.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(output)));
          },
          child: const Text('Приступить к выбору...'),
        )
        )
    );
  }
}

class SecondScreen extends StatelessWidget{
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(title: const Text('Выберите любой вариант'),),
        body: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 15), child:
                ElevatedButton(onPressed: () {
                  Navigator.pop(context, 'Да!');
                  },
                  child: const Text('Да!'),
                  )
              ),

              ElevatedButton(onPressed: () {
                Navigator.pop(context, 'Нет.');
                },
                child: const Text('Нет.'),
              )]
            )
        )
    );
  }
}

void main() {
  runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(BuildContext context) => const MainScreen(),
        '/second':(BuildContext context) => const SecondScreen()
      })
  );
}