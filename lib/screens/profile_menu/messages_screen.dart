import 'package:eShop/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/dialogs_provider.dart';
import '../../providers/messages_provider.dart';
import '../../models/dialog.dart' as dialogModel;
import '../../models/message.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<dialogModel.Dialog> dialogs =
        Provider.of<DialogsProvider>(context).getDialogs();

    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => ListView.builder(
          itemBuilder: (context, index) {
            final Message lastMessage = Provider.of<MessagesProvider>(context)
                .getLastMessage(dialogs[index].id);
            return Column(children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    dialogs[index].interlocutorImageUrl,
                  ),
                ),
                title: Text(dialogs[index].interlocutorName),
                subtitle: Text(lastMessage.message.length > 0
                    ? lastMessage.message.substring(
                        0, lastMessage.message.length > 80 ? 80 : null)
                    : ''),
                onTap: () => Navigator.of(context).pushNamed(
                    AppRoutes.dialogScreen,
                    arguments: dialogs[index].id),
                isThreeLine: true,
              ),
              Divider(
                height: 0,
              )
            ]);
          },
          itemCount: 3,
        ),
      ),
    );
  }
}
