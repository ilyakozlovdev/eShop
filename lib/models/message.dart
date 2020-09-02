import 'package:flutter/foundation.dart';

class Message {
  final String id;
  final String dialogId;
  final String message;
  final String timestamp;
  final String date;

  Message({
    @required this.id,
    @required this.dialogId,
    @required this.message,
    @required this.timestamp,
    @required this.date,
  });
}
