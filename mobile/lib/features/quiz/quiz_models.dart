class Quiz {
  Quiz({
    required this.questions,
  });

  final List<Question> questions;
}

class Question {
  Question({
    required this.color,
    required this.question,
    required this.answers,
  });

  final String color;
  final String question;
  final List<Answer> answers;
}

class Answer {
  Answer(this.answer, {required this.icon});

  final String answer;
  final String icon;
}

final quiz = Quiz(
  questions: [
    Question(
      color: '0XFF1AA3DE',
      question: 'What means of transportation did you use today?',
      answers: [
        Answer('walked', icon: 'walking.png'),
        Answer('bicycle', icon: 'bicycle.png'),
        Answer('car', icon: 'car.png'),
        Answer('electric bicycle', icon: 'electric_bicycle.png'),
        Answer('electric car', icon: 'electric_car.png'),
        Answer('motorcycle', icon: 'motorcycle.png'),
        Answer('train', icon: 'train.png'),
      ],
    ),
    Question(
      color: '0XFFA1CB8D',
      question: 'What did you eat today?',
      answers: [
        Answer('meat', icon: 'meat.png'),
        Answer('fish', icon: 'fish.png'),
        Answer('vegetables', icon: 'vegetables.png'),
        Answer('processed food', icon: 'pizza.png'),
        Answer('local products', icon: 'local_products.png'),
        Answer('imported products', icon: 'imported_products.png'),
        Answer('made at home', icon: 'home.png'),
      ],
    ),
  ],
);
