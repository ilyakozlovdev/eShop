import 'package:flutter/foundation.dart';

class Dialog {
  final String id;
  final String interlocutorName;
  final String interlocutorId;
  final String interlocutorImageUrl;

  Dialog({
    @required this.id,
    @required this.interlocutorId,
    @required this.interlocutorName,
    @required this.interlocutorImageUrl,
  });
}
