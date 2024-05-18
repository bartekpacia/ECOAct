class Quiz {
  Quiz({
    required this.questions,
  });

  final List<Question> questions;
}

enum QuestionType { multiChoice, intValue }

class Question {
  Question({
    required this.id,
    required this.type,
    required this.question,
    required this.color,
    required this.answers,
  });

  final String id;
  final QuestionType type;
  final String question;
  final String color;
  final List<Answer> answers;
}

class Answer {
  Answer(this.answer, this.points, this.emissions, {required this.icon});

  final String answer;
  final String icon;
  final int points;
  final int emissions;
}

// need to change values
// values just to implement logic
final quiz = Quiz(
  questions: [
    Question(
      id: 'question_0',
      type: QuestionType.multiChoice,
      question: 'What means of transportation did you use today?',
      color: '0XFF1AA3DE',
      answers: [
        Answer('walked', 30, 5, icon: 'walking.png'),
        Answer('bicycle', 30, 5, icon: 'bicycle.png'),
        Answer('car', -10, 10, icon: 'car.png'),
        Answer('electric bicycle', 13, 10, icon: 'electric_bicycle.png'),
        Answer('electric car', -5, 10, icon: 'electric_car.png'),
        Answer('motorcycle', -15, 10, icon: 'motorcycle.png'),
        Answer('train', 11, 10, icon: 'train.png'),
        Answer('bus', 7, 10, icon: 'bus.png'),
        Answer('scooter', -5, 10, icon: 'scooter.png'),
        Answer('electric scooter', 2, 10, icon: 'eletricscooter.png'),
        Answer('tram', 12, 10, icon: 'tram.png'),
        Answer('subway', 12, 10, icon: 'subway.png'),
        Answer('sail boat', -20, 10, icon: 'sail-boat.png'),
        Answer('ship', -30, 10, icon: 'cruise-ship.png'),
        Answer('airplane', -35, 10, icon: 'plane.png'),
        Answer('helicopter', -40, 10, icon: 'helicopter.png'),
        Answer('private airplane', -70, 10, icon: 'private_plane.png'),
      ],
    ),
    Question(
      id: 'question_1',
      type: QuestionType.multiChoice,
      question: 'What did you eat today?',
      color: '0XFFA1CB8D',
      answers: [
        Answer('meat', 5, 10, icon: 'meat.png'),
        Answer('fish', 5, 10, icon: 'fish.png'),
        Answer('vegetables', 10, 10, icon: 'vegetables.png'),
        Answer('processed food', -10, 10, icon: 'pizza.png'),
        Answer('local products', 20, 10, icon: 'local_products.png'),
        Answer('imported products', -15, 10, icon: 'imported_products.png'),
        Answer('made at home', 25, 10, icon: 'home.png'),
      ],
    ),
    Question(
      id: 'question_2',
      type: QuestionType.multiChoice,
      color: '0X6FED2FC8',
      question: 'Did you buy clothes today, if yes what type?',
      answers: [
        Answer('No', 5, 10, icon: 'no.png'),
        Answer('Fast Fashion', -20, 10, icon: 'fast.png'),
        Answer('Second Hand', 10, 10, icon: 'second_hand.png'),
        Answer('Eco Friendly', 5, 10, icon: 'eco.png'),
        Answer('Organic Cotton Clothing', 5, 10, icon: 'cotton.png'),
        Answer('Upcycled or Recycled Fashion', 10, 10, icon: 'recycle.png'),
        Answer('Vegan Fashion', -5, 10, icon: 'vegan_fashion.png'),
        Answer('Slow Fashion', -5, 10, icon: 'slow_fashion.png'),
        Answer('Renting or Swapping Clothes', 10, 10, icon: 'swap.png'),
        Answer('Local or Artisanal Fashion', 10, 10, icon: 'clothes.png'),
        Answer('others', 0, 10, icon: 'dress.png'),
      ],
    ),
    Question(
      id: 'question_3',
      type: QuestionType.intValue,
      color: '0xFF002D62',
      question: 'Estimate how much water you used today :',
      answers: [
        Answer('text box placeholder', 0, 10, icon: 'text_box_icon.png'),
      ],
    ),
    Question(
      id: 'question_4',
      type: QuestionType.multiChoice,
      color: '0XFF95BF8D',
      question: 'Did you separated the trash and recycled today ?',
      answers: [
        Answer("Didn't take the trash out today", 0, 10, icon: 'no_trash.png'),
        Answer(
          "Didn't separate the trash or recycled",
          -20,
          10,
          icon: 'trash_out.png',
        ),
        Answer(
          'Separated almost everything',
          10,
          10,
          icon: 'recycle_trash.png',
        ),
        Answer('Separated everything ', 20, 10, icon: 'recycle.png'),
      ],
    ),
  ],
);
