import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class AnswersToQuestion {
  AnswersToQuestion({required this.questionId, required this.answers});

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
  List<AnswersToQuestion> _answers = [];
  List<AnswersToQuestion> get answers => _answers;
  StreamSubscription<void>? _subscription;

  Future<void> selectAnswer({
    required String questionId,
    required String answer,
  }) async {
    await _firestore.collection('answers').doc(questionId).update({
      'selectedAnswers': FieldValue.arrayUnion([answer]),
    });
  }

  Future<void> unselectAnswer({
    required String questionId,
    required String answer,
  }) async {
    await _firestore.collection('answers').doc(questionId).update({
      'selectedAnswers': FieldValue.arrayRemove([answer]),
    });
  }

  Stream<List<AnswersToQuestion>> _getAnswers() {
    // TODO: Rename the "answers" collection to "answersToQuestions"
    return _firestore.collection('answers').snapshots().map((snapshot) {
      final answers = snapshot.docs.map((doc) {
        final data = doc.data();
        return AnswersToQuestion(
          questionId: doc.id,
          answers: (data['selectedAnswers'] as List<dynamic>)
              .map((e) => e.toString())
              .toList(),
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
