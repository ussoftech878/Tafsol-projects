import 'package:wabisabi_mob_app/models/response/base_response_model.dart';

class QuestionsResponse extends BaseResponseModel {
  List<Question>? questions;

  QuestionsResponse({this.questions, bool? isSuccess, String? message})
      : super(isSuccess: isSuccess, message: message);

  QuestionsResponse.fromJson(Map<String, dynamic> json) {
    // Parse the base response fields
    BaseResponseModel base = BaseResponseModel.fromJson(json);
    isSuccess = base.isSuccess;
    message = base.message;

    // Parse the list of questions
    if (json['questions'] != null) {
      questions = [];
      json['questions'].forEach((questionJson) {
        questions!.add(Question.fromJson(questionJson));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    data['message'] = this.message;

    // Convert the list of questions to JSON
    if (this.questions != null) {
      data['questions'] =
          this.questions!.map((question) => question.toJson()).toList();
    }
    return data;
  }
}

class Question {
  int? iD;
  String? question;
  String? header;

  Question({this.iD, this.question, this.header});

  Question.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    question = json['Question'];
    header = json['Header'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Question'] = this.question;
    data['Header'] = this.header;
    return data;
  }
}
