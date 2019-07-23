import 'package:survey_js_core/model/page.dart';
import 'package:survey_js_core/model/question.dart';
import 'package:survey_js_core/model/survey.dart';
import 'package:survey_js_core/survey_js_core.dart';

import 'model/panel.dart';

class SurveyChecker {
  List<SurveyCheckerError> surveyCheckerError;

  List<SurveyCheckerError> completeSurvey(
      Survey surveyModel, List<Map<String, dynamic>> data) {
    PageModel pageModel = surveyModel.pages.first;

    validateQuestions(pageModel.element.questions, data);

    validatePanels(pageModel.element.panels, data);
    return surveyCheckerError;
  }

  void validateQuestions(
      List<QuestionModel> questions, List<Map<String, dynamic>> data) {
    questions.forEach((surveyQuestion) {
      Map<String, dynamic> answerToValidate;
      try {
        answerToValidate = data.firstWhere((answer) {
          String questionName = answer.keys.first;
          return questionName == surveyQuestion.name;
        });
      } catch (exception) {}

      switch (surveyQuestion.type) {
        case "text":
          {
            String input = answerToValidate?.values?.first;
            if (surveyQuestion.isRequired) {
              bool isRequiredFieldValid;
              if (input != null) {
                isRequiredFieldValid = input.isNotEmpty;
              } else {
                isRequiredFieldValid = false;
              }

              if (!isRequiredFieldValid) {
                surveyCheckerError ??= List();
                surveyCheckerError.add(SurveyCheckerError(
                    {surveyQuestion.name: "field is required"}));
              }
            }

            _checkQuestionValidator(surveyQuestion, input, data);
            break;
          }
        case "checkbox":
          {
            List<dynamic> choices = answerToValidate?.values?.first;
            if (surveyQuestion.isRequired) {
              bool isRequiredFieldValid;
              if (choices != null) {
                isRequiredFieldValid = choices.isNotEmpty;
              } else {
                isRequiredFieldValid = false;
              }

              if (!isRequiredFieldValid) {
                surveyCheckerError ??= List();
                surveyCheckerError.add(SurveyCheckerError(
                    {surveyQuestion.name: "field is required"}));
              }
            }

            _checkQuestionValidator(surveyQuestion, choices, data);

            break;
          }
        case "radiogroup":
          {
            List<dynamic> choices = answerToValidate?.values?.first;
            if (surveyQuestion.isRequired) {
              bool isRequiredFieldValid;
              if (choices != null) {
                isRequiredFieldValid = choices.isNotEmpty;
              } else {
                isRequiredFieldValid = false;
              }
              if (!isRequiredFieldValid) {
                surveyCheckerError ??= List();
                surveyCheckerError.add(SurveyCheckerError(
                    {surveyQuestion.name: "field is required"}));
              }
            }

            _checkQuestionValidator(surveyQuestion, choices, data);
            break;
          }
      }
    });
  }

  void _checkQuestionValidator(QuestionModel surveyQuestion, dynamic input,
      List<Map<String, dynamic>> data) {
    try {
      surveyQuestion.surveyValidators?.forEach((validator) {
        switch (validator.validatorType) {
          case ValidatorType.TEXT:
            if (input.length < validator.minLength ||
                input.length > validator.maxLength) {
              surveyCheckerError ??= List();
              surveyCheckerError.add(
                  SurveyCheckerError({surveyQuestion.name: validator.text}));
            }
            if (!validator.allowDigit && RegExp("[0-9]").hasMatch(input)) {
              surveyCheckerError ??= List();
              surveyCheckerError.add(
                  SurveyCheckerError({surveyQuestion.name: validator.text}));
            }
            break;
          case ValidatorType.NUMERIC:
            int value = int.parse(input);
            if (value < validator.minValue || value > validator.maxValue) {
              surveyCheckerError ??= List();
              surveyCheckerError.add(
                  SurveyCheckerError({surveyQuestion.name: validator.text}));
            }
            break;
          case ValidatorType.REGEX:
            if (!RegExp(validator.regex).hasMatch(input)) {
              surveyCheckerError ??= List();
              surveyCheckerError.add(
                  SurveyCheckerError({surveyQuestion.name: validator.text}));
            }
            break;
          case ValidatorType.EMAIL:
            if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(input)) {
              surveyCheckerError ??= List();
              surveyCheckerError.add(
                  SurveyCheckerError({surveyQuestion.name: validator.text}));
            }
            break;

          case ValidatorType.EXPRESSION:
            // TODO
            break;

          case ValidatorType.ANSWER_COUNT:
            // TODO
            break;
        }
      });
    } catch (exception) {
      print(exception);
    }
  }

  void validatePanels(List<PanelModel> panels, List<Map<String, dynamic>> data) {
    panels?.forEach((panel) {
      try {
        if (panel.elementSurvey.questions != null) {
          validateQuestions(panel.elementSurvey.questions, data);
        }else{
          validatePanels(panel.elementSurvey.panels, data);
        }
      } catch (exception) {
        validatePanels(panel.elementSurvey.panels, data);
      }
    });
  }
}

class SurveyCheckerError {
  Map<String, String> map;

  SurveyCheckerError(this.map);

  @override
  bool operator ==(other) {
    if (identical(this, other)) {
      return true;
    }
    return other is SurveyCheckerError &&
        other.map.keys.first == this.map.keys.first;
  }

  @override
  int get hashCode => this.map.keys.first.hashCode;
}

void main() {
  SurveyChecker surveyChecker = SurveyChecker();
  var survey = {
    "pages": [
      {
        "name": "page1",
        "elements": [
          {
            "type": "text",
            "name": "question1",
            "width": "20",
            "title": "your name",
            "description": "name will be enter here",
            "valueName": "name",
            "isRequired": true,
            "validators": [
              {
                "type": "text",
                "text": "invalid text entered",
                "minLength": 5,
                "maxLength": 25,
                "allowDigits": true
              }
            ],
            "requiredErrorText": "please enter your name",
            "maxLength": 25,
            "placeHolder": "enter your name here"
          },
          {
            "type": "panel",
            "name": "panel1",
            "elements": [
              {
                "type": "panel",
                "name": "panel2",
                "elements": [
                  {
                    "type": "panel",
                    "name": "panel3",
                    "elements": [
                      {
                        "type": "checkbox",
                        "name": "question7",
                        "choices": ["item1", "item2", "item3"]
                      }
                    ]
                  }
                ]
              }
            ]
          },
          {
            "type": "checkbox",
            "name": "question2",
            "width": "50",
            "title": "select song language you listen",
            "description": "select your languages of songs",
            "valueName": "song you listen..",
            "isRequired": true,
            "requiredErrorText": "select atleast on language",
            "hasComment": true,
            "otherPlaceHolder": "other language you listen",
            "choices": ["hindi", "english", "gujarati"],
            "choicesOrder": "asc",
            "hasSelectAll": true,
            "hasNone": true,
            "selectAllText": "all language"
          },
          {
            "type": "radiogroup",
            "name": "question3",
            "width": "50",
            "title": "select gender",
            "description": "select gender",
            "valueName": "gender",
            "isRequired": true,
            "requiredErrorText": "select one gender type",
            "choices": ["male", "female", "other"],
            "choicesOrder": "asc",
            "hideIfChoicesEmpty": true,
            "showClearButton": true
          }
        ],
        "questionTitleLocation": "top"
      }
    ]
  };
  SurveyJsonParser surveyJsonParser = SurveyJsonParser();
  List<Map<String, dynamic>> data = List();
  data.add({"question1": "test"});
  data.add({"question2": []});

  surveyChecker.completeSurvey(surveyJsonParser.parseSurveyJson(survey), data);
}
