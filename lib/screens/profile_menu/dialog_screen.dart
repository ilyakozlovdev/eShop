import 'package:eShop/providers/dialogs_provider.dart';
import 'package:eShop/providers/messages_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DialogScreen extends StatelessWidget {
  const DialogScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dialogId = ModalRoute.of(context).settings.arguments as String;
    final messages =
        Provider.of<MessagesProvider>(context).getMessages(dialogId);
    final dialog = Provider.of<DialogsProvider>(context).getDialog(dialogId);

    return Scaffold(
      appBar: AppBar(
        title: Text(dialog.interlocutorName),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => Container(
          height: constraints.maxHeight,
          child: Column(
            children: [
              Container(
                  height: constraints.maxHeight - 60,
                  color: Colors.black12,
                  child: ListView.builder(
                    itemBuilder: (context, index) => Card(
                      child: Text(messages[index].message),
                    ),
                    itemCount: messages.length,
                  )),
              TextField(
                autocorrect: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: BorderSide.none),
                    hintText: 'Enter a message'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
