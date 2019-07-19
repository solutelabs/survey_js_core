import 'question_select_base.dart';

class QuestionRadioModel extends QuestionCheckboxBaseModel {
  bool showClearButton;

  QuestionRadioModel(Map json) : super(json) {
    showClearButton = json["showClearButton"];
  }

  @override
  bool operator ==(other) {
    if (identical(this, other)) {
      return true;
    }
    return other is QuestionRadioModel &&
        this.showClearButton == other.showClearButton;
  }
}
