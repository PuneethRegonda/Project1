import 'package:flutter/material.dart';

class Student{

  final String id;
  final String fullname;
  final String email;
  final String password;
  Student({@required this.id, @required this.email, @required this.fullname, @required this.password});

  Future<Null> fetchStudent() async {

//    return
    
    final Student student = Student(
       id: null,
       email: null,
       fullname: null,
       password: null,
   );

  }


}


class ExamQuestion{
  final String sessionId;
  final String questionId;
  ExamQuestion({@required this.sessionId,@required this.questionId});



}


class AddBookmark{
  final String sessionId;
  final String questionId;
  AddBookmark({@required this.sessionId,@required this.questionId});
}

class ExamQuestionSubmit{
  final String sessionId;
  final String questionId;
  final String giveAnswer;
  final String timeTaken;

  ExamQuestionSubmit({@required this.sessionId,@required this.questionId,
  @required this.giveAnswer,@required this.timeTaken
  });
}


class ExamQuestionSeen{
  final String sessionId;
  final String questionId;
  final String giveAnswer;


  ExamQuestionSeen({@required this.sessionId,@required this.questionId,
    @required this.giveAnswer
  });
}

class TestSeries{}
class FlashCardUpdate{
  final int id;
  final bool known;

  FlashCardUpdate({@required this.id,@required this.known});
}

class StartBookmark{}

class QBank{}

class StartMockExam{
  final String university;
  StartMockExam({@required this.university});
}

class StartDailyExam{
  final String university;
 StartDailyExam({@required this.university});

}

