import 'package:flutter_test/flutter_test.dart';
import 'package:survey_js_core/survey_validator.dart';
import 'package:survey_js_core/survey_js_core.dart';

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

  List<SurveyCheckerError> errors = List();

  errors.add(SurveyCheckerError({"question1": "invalid text entered"}));
  errors.add(SurveyCheckerError({"question2": "field is empty"}));
  errors.add(SurveyCheckerError({"question3": "field is empty"}));

  test('check survey validations', () {
    expect(
        surveyChecker.completeSurvey(
            surveyJsonParser.parseSurveyJson(survey), data),
        errors);
  });
}
