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
  Answer(this.answer, this.points, {required this.icon});

  final String answer;
  final String icon;
  final int points;
}

final quiz = Quiz(
  questions: [
    Question(
      color: '0XFF1AA3DE',
      question: 'What means of transportation did you use today?',
      answers: [
        Answer('walked',20, icon: 'walking.png',),
        Answer('bicycle',20 ,icon: 'bicycle.png'),
        Answer('car',-10, icon: 'car.png'),
        Answer('electric bicycle',15,icon: 'electric_bicycle.png'),
        Answer('electric car',-5, icon: 'electric_car.png'),
        Answer('motorcycle',-15, icon: 'motorcycle.png'),
        Answer('train',15, icon: 'train.png'),
      ],
    ),
    Question(
      color: '0XFFA1CB8D',
      question: 'What did you eat today?',
      answers: [
        Answer('meat',5, icon: 'meat.png'),
        Answer('fish',5, icon: 'fish.png'),
        Answer('vegetables',10, icon: 'vegetables.png'),
        Answer('processed food',-10, icon: 'pizza.png'),
        Answer('local products',20, icon: 'local_products.png'),
        Answer('imported products',-15, icon: 'imported_products.png'),
        Answer('made at home',25, icon: 'home.png'),
      ],
    ),
  Question(
      color: '0XFFFFC0CB', // Pink color for the water consumption question
      question: 'Estimate how much water you used today :',
      answers: [
        Answer('text box placeholder', 0, icon: 'text_box_icon.png'), // Placeholder for text input
      ],

    ),
  ],
);
