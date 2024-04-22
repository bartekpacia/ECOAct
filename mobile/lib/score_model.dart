import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class SingleQuestionAnswers {
  SingleQuestionAnswers({required this.questionId, required this.answers});

  final String questionId;
  final List<String> answers;
}

class AnswersChangeNotifier extends ChangeNotifier {
  AnswersChangeNotifier() : _firestore = FirebaseFirestore.instance {
    _subscription = _getAnswers().listen((answers) {
      _answers = answers;
      notifyListeners();
    });
  }

  final FirebaseFirestore _firestore;
  List<SingleQuestionAnswers> _answers = [];
  List<SingleQuestionAnswers> get answers => _answers;
  StreamSubscription<void>? _subscription;

  Future<void> toggle(String questionId, {required bool selected}) async {
    await _firestore
        .collection('answers')
        .doc(questionId)
        .set({'selected': selected});
  }

  Stream<List<SingleQuestionAnswers>> _getAnswers() {
    return _firestore.collection('answers').snapshots().map((snapshot) {
      final answers = snapshot.docs.map((doc) {
        final data = doc.data();
        return SingleQuestionAnswers(
          questionId: doc.id,
          answers: data['answers'] as List<String>,
        );
      }).toList();

      return answers;
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
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
