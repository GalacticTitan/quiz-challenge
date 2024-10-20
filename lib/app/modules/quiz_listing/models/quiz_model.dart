class QuizModel {
  QuizModel({
      this.quizId, 
      this.questions,});

  QuizModel.fromJson(dynamic json) {
    quizId = json['quiz_id'];
    if (json['questions'] != null) {
      questions = [];
      json['questions'].forEach((v) {
        questions?.add(Questions.fromJson(v));
      });
    }
  }
  String? quizId;
  List<Questions>? questions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['quiz_id'] = quizId;
    if (questions != null) {
      map['questions'] = questions?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Questions {
  Questions({
      this.question, 
      this.options, 
      this.answer,});

  Questions.fromJson(dynamic json) {
    question = json['question'];
    options = json['options'] != null ? json['options'].cast<String>() : [];
    answer = json['answer'];
  }
  String? question;
  List<String>? options;
  num? answer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['question'] = question;
    map['options'] = options;
    map['answer'] = answer;
    return map;
  }

}