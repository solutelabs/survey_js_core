import 'package:survey_js_core/model/page.dart';
import 'package:survey_js_core/model/question.dart';
import 'package:survey_js_core/model/survey.dart';
import 'model/panel.dart';

class SurveyChecker {
  List<SurveyCheckerError> surveyCheckerError;

  List<SurveyCheckerError> completeSurvey(
      Survey surveyModel, List<Map<String, dynamic>> data) {
    PageModel pageModel = surveyModel.pages.first;

    _validateQuestions(pageModel.element.questions, data);

    _validatePanels(pageModel.element.panels, data);
    return surveyCheckerError;
  }

  void _validateQuestions(
      List<QuestionModel> questions, List<Map<String, dynamic>> data) {
    questions.forEach((surveyQuestion) {
      Map<String, dynamic> answerToValidate;
      try {
        answerToValidate = data?.firstWhere((answer) {
          String questionName = answer.keys.first;
          return questionName == surveyQuestion.name;
        });
      } catch (exception) {
        print(exception);
      }

      switch (surveyQuestion.type) {
        case "text":
          {
            String input = answerToValidate?.values?.first;
            if (surveyQuestion.isRequired) {
              bool isRequiredFieldValid = false;
              if (input != null) {
                isRequiredFieldValid = input.isNotEmpty;
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
              bool isRequiredFieldValid = false;
              if (choices != null) {
                isRequiredFieldValid = choices.isNotEmpty;
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
              bool isRequiredFieldValid = false;
              if (choices != null) {
                isRequiredFieldValid = choices.isNotEmpty;
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

  void _validatePanels(
      List<PanelModel> panels, List<Map<String, dynamic>> data) {
    panels?.forEach((panel) {
      try {
        if (panel.elementSurvey.questions != null) {
          _validateQuestions(panel.elementSurvey.questions, data);
        } else {
          _validatePanels(panel.elementSurvey.panels, data);
        }
      } catch (exception) {
        _validatePanels(panel.elementSurvey.panels, data);
      }
    });
  }
}

class SurveyCheckerError {
  Map<String, String> map;

  SurveyCheckerError(this.map);

  @override
  bool operator ==(other) {
    return other is SurveyCheckerError &&
        other.map.keys.first == this.map.keys.first;
  }

  @override
  int get hashCode => this.map.keys.first.hashCode;
}
