class Questions {
  String questionText;
  bool answerText;
  Questions({this.questionText, this.answerText});
  // Questions({String q, bool a}) {
  //   questionText = q;
  //   answerText = a;
  // }

}

class Quizbrain {
  int questionNum = 0;
  List<Questions> questions = [
    Questions(
        questionText:
            'To avoid channel time , the 1-persistent protocol can be used.',
        answerText: true),
    Questions(
        questionText:
            'Twisted pair is the least expensive in guided transmission media.',
        answerText: true),
    Questions(
        questionText:
            'In half-duplex operation ,both station may transmit,but only one at atime.',
        answerText: true),
    Questions(
        questionText:
            'One of the most powerful ,error-correcting codes is the cyclic redundancy check(CRC).',
        answerText: false),
    Questions(
        questionText:
            'In the tree LAN topology , each station is directly connected to a common central node.',
        answerText: false),
    Questions(
        questionText:
            'In the ring LAN topology , each station is directly connected to a common central node.',
        answerText: false),
    Questions(
        questionText:
            'Each modulated signal requires a certain bandwidth centered on it\'s carrier frequency , referred to as a frame ',
        answerText: false),
    Questions(
        questionText:
            'Each modulated signal requires a certain bandwidth centered on it\'s carrier frequency , referred to as a channel ',
        answerText: true),
    Questions(
        questionText:
            'Shielded twisted pair (STP) provides better performance than unshielded twisted pair(UTP).',
        answerText: true),
    Questions(
        questionText:
            'In virtual circuit approach , each packet is treated independently.',
        answerText: true),
    Questions(
      questionText: 'Finished Questions.',
    ),
  ];

  String getQuestion() {
    return questions[questionNum].questionText;
  }

  bool getAnswer() {
    return questions[questionNum].answerText;
  }

  void next() {
    if (questionNum < questions.length - 1) {
      questionNum++;
    }
  }
}
