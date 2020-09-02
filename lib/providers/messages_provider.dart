import 'package:flutter/foundation.dart';
import '../models/message.dart';

class MessagesProvider extends ChangeNotifier {
  List<Message> _messages = [
    Message(
      id: 'm1',
      dialogId: 'd1',
      message:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.',
      timestamp: '15:36:30',
      date: '2020-09-15',
    ),
    Message(
      id: 'm2',
      dialogId: 'd1',
      message:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.',
      timestamp: '15:37:30',
      date: '2020-09-15',
    ),
    Message(
      id: 'm3',
      dialogId: 'd1',
      message:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.',
      timestamp: '15:38:30',
      date: '2020-09-15',
    ),
    Message(
      id: 'm4',
      dialogId: 'd1',
      message:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.',
      timestamp: '15:39:30',
      date: '2020-09-15',
    ),
    Message(
      id: 'm5',
      dialogId: 'd2',
      message:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.',
      timestamp: '15:36:30',
      date: '2020-09-15',
    ),
    Message(
      id: 'm6',
      dialogId: 'd2',
      message:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.',
      timestamp: '15:37:30',
      date: '2020-09-15',
    ),
    Message(
      id: 'm7',
      dialogId: 'd2',
      message:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.',
      timestamp: '15:38:30',
      date: '2020-09-15',
    ),
    Message(
      id: 'm8',
      dialogId: 'd2',
      message:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.',
      timestamp: '15:39:30',
      date: '2020-09-15',
    ),
    Message(
      id: 'm9',
      dialogId: 'd3',
      message:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.',
      timestamp: '15:37:30',
      date: '2020-09-15',
    ),
    Message(
      id: 'm10',
      dialogId: 'd3',
      message:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.',
      timestamp: '15:38:30',
      date: '2020-09-15',
    ),
    Message(
      id: 'm11',
      dialogId: 'd3',
      message:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.',
      timestamp: '15:39:30',
      date: '2020-09-15',
    ),
    Message(
      id: 'm12',
      dialogId: 'd3',
      message:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.',
      timestamp: '15:40:30',
      date: '2020-09-15',
    ),
  ];

  List<Message> getMessages(dialogId) {
    return _messages.where((message) => message.dialogId == dialogId).toList();
  }

  Message getLastMessage(dialogId) {
    return getMessages(dialogId).last;
  }
}
