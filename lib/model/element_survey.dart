import 'package:survey_js_core/model/panel.dart';

import 'question.dart';
import 'question_text.dart';
import 'package:survey_js_core/exceptions.dart';
import 'question_checkbox.dart';
import 'question_radio.dart';
import 'package:survey_js_core/model/question_dropdown.dart';

class ElementSurvey {
  List<QuestionModel> questions;
  List<PanelModel> panels;

  ElementSurvey(List<Map<String, dynamic>> elements) {
    try {
      final typePanel = elements.where((element) {
        return element["type"] == "panel";
      }).toList();

      final typeQuestion = elements.where((element) {
        return element["type"] != "panel";
      }).toList();

      if (typeQuestion.isNotEmpty) {
        questions = _parseQuestions(typeQuestion);
      }

      if (typePanel.isNotEmpty) {
        panels = _parsePanels(typePanel);
      }
    } catch (exception) {
      print(exception);
      throw exception;
    }
  }

  List<QuestionModel> _parseQuestions(List<Map<String, dynamic>> questions) {
    return (questions)?.map((question) {
      switch (question["type"]) {
        case "text":
          return QuestionTextModel(question);
        case "checkbox":
          return QuestionCheckboxModel(question);
        case "radiogroup":
          return QuestionRadioModel(question);
        case "dropdown":
          return QuestionDropdownModel(question);
        default:
          throw InvalidTypeException("type not match");
      }
    })?.toList();
  }

  List<PanelModel> _parsePanels(List<Map<String, dynamic>> panels) {
    return (panels)?.map((panel) {
      return PanelModel(panel);
    })?.toList();
  }
}
