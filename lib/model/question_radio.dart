import 'question_select_base.dart';

class QuestionRadioModel extends QuestionCheckboxBaseModel {
  bool showClearButton;

  QuestionRadioModel(Map json) : super(json) {
    showClearButton = json["showClearButton"];
  }

  factory QuestionRadioModel.parseJson(Map json)=>QuestionRadioModel(json);
}
