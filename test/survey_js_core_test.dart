import 'package:flutter_test/flutter_test.dart';
import 'package:survey_js_core/model/question_select_base.dart';

import 'package:survey_js_core/survey_js_core.dart';
import 'package:survey_js_core/model/question_text.dart';
import 'package:survey_js_core/model/question_checkbox.dart';

void main() {
  test('invalid text type check', () {
    var json = {
      "name": "name",
      "type": "radiogroup",
      "title": "Please enter your name:",
      "placeHolder": "Jon Snow",
      "isRequired": true
    };
    SurveyJsonParser surveyJsonParser = SurveyJsonParser();
    expect(() => surveyJsonParser.parseQuestionTypeText(json), throwsException);
  });

  test('parse question type text without error', () {
    var json = {
      "name": "name",
      "type": "text",
      "inputType": "text",
      "title": "Please enter your name:",
      "placeHolder": "Jon Snow",
      "maxLength": 10,
      "size": 10,
      "no": "23",
      "isRequired": true
    };

    QuestionTextModel mockModel = QuestionTextModel(json);
    mockModel.inputType = InputType.TEXT;
    mockModel.name = "name";
    mockModel.type = "text";
    mockModel.title = "Please enter your name:";
    mockModel.placeHolder = "Jon Snow";
    mockModel.maxLength = 10;
    mockModel.size = 10;
    mockModel.no = "23";
    mockModel.isRequired = true;

    SurveyJsonParser surveyJsonParser = SurveyJsonParser();
    expect(surveyJsonParser.parseQuestionTypeText(json), mockModel);
  });

  test('invalid checkbox type check', () {
    var json = {
      "type": "text",
      "name": "question1",
      "choices": ["item1", "item2", "item3"]
    };
    SurveyJsonParser surveyJsonParser = SurveyJsonParser();
    expect(() => surveyJsonParser.parseQuestionTypeCheckbox(json),
        throwsException);
  });

  test('parse question type checkbox without error', () {
    var json = {
      "type": "checkbox",
      "name": "select books type",
      "width": "50",
      "title": "select books type",
      "description": "select book type",
      "valueName": "89",
      "isRequired": true,
      "colCount":3,
      "requiredErrorText": "please select atleast 1 book type",
      "hasComment": true,
      "otherPlaceHolder": "please mention other book type",
      "choices": ["fiction", "thriller", "biography"],
      "choicesOrder": "desc",
      "hideIfChoicesEmpty": true,
      "otherErrorText": "other is mandatory",
      "hasSelectAll": true,
      "hasNone": true,
      "noneText": "no book for my type",
      "selectAllText": "select all book type"
    };

    QuestionCheckboxModel mockCheckboxModel = QuestionCheckboxModel(json);

    mockCheckboxModel.type = "checkbox";
    mockCheckboxModel.name = "select books type";
    mockCheckboxModel.width = "50";
    mockCheckboxModel.title = "select books type";
    mockCheckboxModel.description = "select books type";
    mockCheckboxModel.valueName = "89";
    mockCheckboxModel.colCount=3;
    mockCheckboxModel.isRequired = true;
    mockCheckboxModel.requiredErrorText = "please select atleast 1 book type";
    mockCheckboxModel.hasComment = true;
    mockCheckboxModel.otherPlaceHolder = "please mention other book type";
    mockCheckboxModel.choices = List.from(["fiction,thriller,biography"]);
    mockCheckboxModel.choicesOrder = ChoiceOrder.DESC;
    mockCheckboxModel.hideIfChoicesEmpty = true;
    mockCheckboxModel.otherErrorText = "other is mandatory";
    mockCheckboxModel.hasSelectAll = true;
    mockCheckboxModel.hasNone = true;
    mockCheckboxModel.noneText = "no book for my type";
    mockCheckboxModel.selectAllText = "select all book type";
    SurveyJsonParser surveyJsonParser = SurveyJsonParser();

    expect(surveyJsonParser.parseQuestionTypeCheckbox(json), mockCheckboxModel);
  });
}
