import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:useraddress/data/clients.dart';
import 'package:useraddress/providers/clientSelected.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    final myClients = listClients;
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.cyan[300],
        title: const Text("Clientes"),
      ),
      body: ListView.builder(
        itemCount: myClients.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: const Icon(Icons.person, size: 32),
            title: Text(myClients[index].name,
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 32, color: Colors.black)),
            subtitle: Text(myClients[index].addresses[0]!,
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 24, color: Colors.black)),
            onTap: () {
              Provider.of<ClientSelected>(context, listen: false).client = myClients[index];
              // Navigator.of(context).pushNamed("clientInfo");
              print(Provider.of<ClientSelected>(context, listen: false).client!.name);
              Navigator.of(context).pushReplacementNamed("clientInfo");
            },
          );
        },
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
