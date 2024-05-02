import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/extensions.dart';

class AnswersToQuestion {
  AnswersToQuestion({
    required this.date,
    required this.questionId,
    required this.selectedAnswers,
    required this.userId,
  });

  final DateTime date;
  final String questionId;
  final List<String> selectedAnswers;
  final String userId;
}

class QuizChangeNotifier extends ChangeNotifier {
  QuizChangeNotifier()
      : _firestore = FirebaseFirestore.instance,
        _auth = FirebaseAuth.instance {
    assert(_auth.currentUser != null, 'user must be authenticated');
    user = _auth.currentUser!;

    _subscription = _getAnswers().listen((answers) {
      _answers = answers;
      notifyListeners();
    });
  }

  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  late User user;
  List<AnswersToQuestion> _answers = [];
  List<AnswersToQuestion> get answers => _answers;
  StreamSubscription<void>? _subscription;

  String _createDocId(String questionId, String userId, String dateId) {
    return '$dateId-$questionId-$userId';
  }

  Future<void> selectAnswer({
    required String dateId,
    required String questionId,
    required String answer,
  }) async {
    final docId = _createDocId(questionId, user.uid, dateId);
    await _firestore.collection('answers').doc(docId).set(
      {
        'date': DateTimeX.fromId(dateId),
        'questionId': questionId,
        'selectedAnswers': FieldValue.arrayUnion([answer]),
        'userId': user.uid,
      },
      SetOptions(merge: true),
    );
  }

  Future<void> unselectAnswer({
    required String dateId,
    required String questionId,
    required String answer,
  }) async {
    final docId = _createDocId(questionId, user.uid, dateId);
    await _firestore.collection('answers').doc(docId).update({
      'selectedAnswers': FieldValue.arrayRemove([answer]),
    });
  }

  Stream<List<AnswersToQuestion>> _getAnswers() {
    return _firestore
        .collection('answers')
        .where('userId', isEqualTo: user.uid)
        .snapshots()
        .map((snapshot) {
      final answers = snapshot.docs.map((doc) {
        final data = doc.data();
        return AnswersToQuestion(
          date: (data['date'] as Timestamp).toDate(),
          userId: data['userId'] as String,
          questionId: data['questionId'] as String,
          selectedAnswers: (data['selectedAnswers'] as List<dynamic>)
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
