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
        Answer('walked',30, icon: 'walking.png',),
        Answer('bicycle',30 ,icon: 'bicycle.png'),
        Answer('car',-10, icon: 'car.png'),
        Answer('electric bicycle',13,icon: 'electric_bicycle.png'),
        Answer('electric car',-5, icon: 'electric_car.png'),
        Answer('motorcycle',-15, icon: 'motorcycle.png'),
        Answer('train',11, icon: 'train.png'),
        Answer('bus',7, icon: 'bus.png'),
        Answer('scooter',-5, icon: 'scooter.png'),
        Answer('electric scooter',2, icon: 'eletricscooter.png'),
        Answer('tram',12, icon: 'tram.png'),
        Answer('subway',12, icon: 'subway.png'),
        Answer('sail boat',-20, icon: 'sail-boat.png'),
        Answer('ship',-30, icon: 'cruise-ship.png'),
        Answer('airplane',-35, icon: 'plane.png'),
        Answer('helicopter',-40, icon: 'helicopter.png'),
        Answer('private airplane',-70, icon: 'private_plane.png'),
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
      color: '0X6FED2FC8',
      question: 'Did you buy clothes today, if yes what type?',
      answers: [
        Answer('No',5, icon: 'no.png'),
        Answer('Fast Fashion',-20, icon: 'fast.png'),
        Answer('Second Hand',10, icon: 'second_hand.png'),
        Answer('Eco Friendly',5, icon: 'eco.png'),
        Answer('Organic Cotton Clothing',5, icon: 'cotton.png'),
        Answer('Upcycled or Recycled Fashion',10, icon: 'recycle.png'),
        Answer('Vegan Fashion',-5, icon: 'vegan_fashion.png'),
        Answer('Slow Fashion',-5, icon: 'slow_fashion.png'),
        Answer('Renting or Swapping Clothes',10, icon: 'swap.png'),
        Answer('Local or Artisanal Fashion',10, icon: 'clothes.png'),
        Answer('others',0, icon: 'dress.png'),
      ],),
  Question(

      color: '0xFF002D62',
      question: 'Estimate how much water you used today :',
      answers: [
        Answer('text box placeholder', 0, icon: 'text_box_icon.png'),
      ],



    ),
  ],
);
