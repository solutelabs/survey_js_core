import 'question_select_base.dart';

class QuestionRadioModel extends QuestionCheckboxBaseModel {
  bool showClearButton;

  QuestionRadioModel(Map json) : super(json);

  QuestionRadioModel parseRadioGroupModel(Map<String, dynamic> json) {
    showClearButton = json["showClearButton"];
    return this;
  }

  @override
  bool operator ==(other) {
    QuestionRadioModel otherModel = (other as QuestionRadioModel);
    return this.showClearButton == otherModel.showClearButton;
  }
}
