import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:useraddress/providers/clientSelected.dart';

class ClientInfo extends StatefulWidget {
  ClientInfo({Key? key}) : super(key: key);

  @override
  State<ClientInfo> createState() => _ClientInfoState();
}

class _ClientInfoState extends State<ClientInfo> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final client = Provider.of<ClientSelected>(context).client;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.close_rounded),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed("/");
            },
          )
        ],
        backgroundColor: Colors.cyan[300],
        title: ListTile(
            title: Text(client!.name, style: const TextStyle(fontSize: 24, color: Colors.white))),
        // Text(client!.name, style: const TextStyle(fontSize: 24, color: Colors.white)),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final result = await showDialog(
            barrierDismissible: false,
            context: context,
            builder: (_) => AlertDialog(
              backgroundColor: Colors.cyan[300],
              title: const Text(
                "Nueva direccion",
                style: TextStyle(color: Colors.white),
              ),
              content: TextField(
                controller: controller,
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: const Text("Confirmar")),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: Text("Descartar"))
              ],
            ),
          );
          if (controller.text != "" && result) client.addresses.add(controller.text);
          setState(() {});
          controller.clear();
        },
      ),
      body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const Text("Direcciones",
                  style: TextStyle(
                      fontSize: 24, color: Colors.black, decoration: TextDecoration.underline)),
              const SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                    itemCount: client.addresses.length,
                    itemBuilder: (BuildContext context, int index) => ListTile(
                        title: Text(client.addresses[index]!,
                            style: const TextStyle(fontSize: 24, color: Colors.black)),
                        subtitle: Text("Direccion ${index + 1}",
                            style: const TextStyle(fontSize: 16, color: Colors.blueGrey)),
                        onTap: () {})),
              ),
            ],
          )

          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     Container(
          //       width: size.width * .50,
          //       height: size.height * .2,
          //       decoration: BoxDecoration(
          //         color: Colors.cyan[300],
          //       ),
          //       child: Text(Provider.of<ClientSelected>(context).client!.name,
          //           style: const TextStyle(fontSize: 32, color: Colors.black)),
          //     ),
          //   ],
          // ),
          ),
    );
  }
}
