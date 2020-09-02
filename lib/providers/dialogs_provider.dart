import 'package:flutter/foundation.dart';
import '../models/dialog.dart';

class DialogsProvider extends ChangeNotifier {
  List<Dialog> _dialogs = [
    Dialog(
      id: 'd1',
      interlocutorId: 'i1',
      interlocutorImageUrl:
          'https://cdn1.iconfinder.com/data/icons/ninja-things-1/720/ninja-background-512.png',
      interlocutorName: 'Ninja',
    ),
    Dialog(
      id: 'd2',
      interlocutorId: 'i2',
      interlocutorImageUrl:
          'https://cdn1.iconfinder.com/data/icons/ninja-things-1/720/ninja-background-512.png',
      interlocutorName: 'Ninja 2',
    ),
    Dialog(
      id: 'd3',
      interlocutorId: 'i3',
      interlocutorImageUrl:
          'https://cdn1.iconfinder.com/data/icons/ninja-things-1/720/ninja-background-512.png',
      interlocutorName: 'Ninja 3',
    ),
    Dialog(
      id: 'd4',
      interlocutorId: 'i4',
      interlocutorImageUrl:
          'https://cdn1.iconfinder.com/data/icons/ninja-things-1/720/ninja-background-512.png',
      interlocutorName: 'Ninja 4',
    ),
    Dialog(
      id: 'd5',
      interlocutorId: 'i5',
      interlocutorImageUrl:
          'https://cdn1.iconfinder.com/data/icons/ninja-things-1/720/ninja-background-512.png',
      interlocutorName: 'Ninja 5',
    ),
    Dialog(
      id: 'd6',
      interlocutorId: 'i6',
      interlocutorImageUrl:
          'https://cdn1.iconfinder.com/data/icons/ninja-things-1/720/ninja-background-512.png',
      interlocutorName: 'Ninja 6',
    ),
    Dialog(
      id: 'd7',
      interlocutorId: 'i7',
      interlocutorImageUrl:
          'https://cdn1.iconfinder.com/data/icons/ninja-things-1/720/ninja-background-512.png',
      interlocutorName: 'Ninja 7',
    )
  ];

  List<Dialog> getDialogs() {
    return _dialogs;
  }

  Dialog getDialog(id) {
    return _dialogs.firstWhere((element) => element.id == id);
  }
}
