import 'package:survey_js_core/model/question_select_base.dart';

class QuestionDropdownModel extends QuestionSelectBase {
  int choicesMax,choicesMin,choicesStep;

  String optionsCaption;
  bool showOptionsCaption=true;

  QuestionDropdownModel(Map<String, dynamic> json) : super(json){
    this.choicesMax=json["choicesMax"];
    this.choicesMin=json["choicesMin"];
    this.choicesStep=json["choicesStep"];
    this.optionsCaption=json["optionsCaption"];
    this.showOptionsCaption=json["showOptionsCaption"];
  }
}
