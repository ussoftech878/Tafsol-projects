class QuestionsAttemptedRequest {
  int QuestionID;
  String SelectedOption;

  QuestionsAttemptedRequest({
    required this.QuestionID,
    required this.SelectedOption,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['QuestionID'] = QuestionID;
    data['SelectedOption'] = SelectedOption;

    return data;
  }
}
