import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class SingleQuestionAnswers {
  SingleQuestionAnswers({required this.questionId, required this.answers});

  final String questionId;
  final List<String> answers;
}

class ScoreNotifier extends ChangeNotifier {
  ScoreNotifier() : _firestore = FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  Future<void> toggle(String questionId, bool selected) async {
    _firestore.collection('answers').doc(questionId).set(
      
    )
  }

  Stream<List<SingleQuestionAnswers>> answers() {
    return _firestore.collection('answers').snapshots().map((snapshot) {
      final answers = snapshot.docs.map((doc) {
        final data = doc.data();
        return SingleQuestionAnswers(answers: data['answers'] as List<String>);
      }).toList();

      return answers;
    });
  }
}

class ScoreModel extends ChangeNotifier {
  int _score = 0;
  int get score => _score;

  void increment([int value = 1]) {
    _score += value;
    notifyListeners();
  }

  void decrement([int value = 2]) {
    _score -= value;
    notifyListeners();
  }
}
