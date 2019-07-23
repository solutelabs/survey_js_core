import 'package:survey_js_core/model/page.dart';
import 'package:survey_js_core/model/question.dart';
import 'package:survey_js_core/model/survey.dart';

class SurveyChecker {
  List<SurveyCheckerError> surveyCheckerErrors = List();

  List<SurveyCheckerError> completeSurvey(
      Survey surveyModel, List<Map<String, dynamic>> data) {
    PageModel pageModel = surveyModel.pages.first;

    pageModel.element.questions.forEach((surveyQuestion) {
      Map<String, dynamic> answerToValidate;
      try {
        answerToValidate = data.firstWhere((answer) {
          var questionName = answer.keys.first;
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
                surveyCheckerErrors.add(SurveyCheckerError(
                    {surveyQuestion.name: "field is empty"}));
              }
            }

            checkQuestionValidator(surveyQuestion, input);
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
                surveyCheckerErrors.add(SurveyCheckerError(
                    {surveyQuestion.name: "field is empty"}));
              }
            }

            checkQuestionValidator(surveyQuestion, choices);

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
                surveyCheckerErrors.add(SurveyCheckerError(
                    {surveyQuestion.name: "field is empty"}));
              }
            }

            checkQuestionValidator(surveyQuestion, choices);
            break;
          }
      }
    });
    return surveyCheckerErrors;
  }

  void checkQuestionValidator(QuestionModel surveyQuestion, dynamic input) {
    try {
      surveyQuestion.surveyValidators?.forEach((validator) {
        switch (validator.validatorType) {
          case ValidatorType.TEXT:
            if (input.length < validator.minLength ||
                input.length > validator.maxLength) {
              surveyCheckerErrors.add(
                  SurveyCheckerError({surveyQuestion.name: validator.text}));
            }
            if (!validator.allowDigit && RegExp("[0-9]").hasMatch(input)) {
              surveyCheckerErrors.add(
                  SurveyCheckerError({surveyQuestion.name: validator.text}));
            }
            break;
          case ValidatorType.NUMERIC:
            int value = int.parse(input);
            if (value < validator.minValue || value > validator.maxValue) {
              surveyCheckerErrors.add(
                  SurveyCheckerError({surveyQuestion.name: validator.text}));
            }
            break;
          case ValidatorType.REGEX:
            if (!RegExp(validator.regex).hasMatch(input)) {
              surveyCheckerErrors.add(
                  SurveyCheckerError({surveyQuestion.name: validator.text}));
            }
            break;
          case ValidatorType.EMAIL:
            if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(input)) {
              surveyCheckerErrors.add(
                  SurveyCheckerError({surveyQuestion.name: validator.text}));
            }
            break;

          case ValidatorType.EXPRESSION:
            //TODO
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
}

class SurveyCheckerError implements Exception {
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
  int get hashCode => this.map.hashCode;
}
