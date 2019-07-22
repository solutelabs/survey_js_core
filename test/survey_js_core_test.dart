import 'package:flutter_test/flutter_test.dart';
import 'package:survey_js_core/model/element_survey.dart';
import 'package:survey_js_core/model/panel.dart';
import 'package:survey_js_core/model/question_dropdown.dart';

import 'package:survey_js_core/model/question_text.dart';
import 'package:survey_js_core/model/question_checkbox.dart';
import 'package:survey_js_core/model/question_radio.dart';
import 'package:survey_js_core/model/question.dart';
import 'package:survey_js_core/survey_js_core.dart';
import 'package:survey_js_core/model/page.dart';

void main() {
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
    expect(QuestionTextModel(json), mockModel);
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
      "colCount": 3,
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
    expect(QuestionCheckboxModel(json), mockCheckboxModel);
  });

  test('parse question type radiogroup without error', () {
    var json = {
      "type": "radiogroup",
      "name": "question1",
      "width": "50",
      "startWithNewLine": false,
      "title": "select department",
      "description": "select department for you work",
      "valueName": "department",
      "isRequired": true,
      "requiredErrorText": "select department",
      "hasComment": true,
      "otherPlaceHolder": "other department",
      "choices": ["android", "ios", "web"],
      "choicesOrder": "random",
      "hideIfChoicesEmpty": true,
      "otherErrorText": "required",
      "showClearButton": true
    };

    QuestionRadioModel mockRadioGroupModel = QuestionRadioModel(json);
    expect(QuestionRadioModel(json), mockRadioGroupModel);
  });

  test('parse question type dropdown without error', () {
    var json = {
      "type": "dropdown",
      "name": "question17",
      "choices": ["item1", "item2", "item3"],
      "choicesOrder": "desc",
      "optionsCaption": "caption for options",
      "showOptionsCaption": false,
      "choicesMin": 3,
      "choicesMax": 5,
      "choicesStep": 2
    };

    QuestionDropdownModel questionDropdownModel = QuestionDropdownModel(json);
    expect(QuestionDropdownModel(json), questionDropdownModel);
  });

  test('parse multiple question type', () {
    var json = {
      "elements": [
        {
          "type": "text",
          "name": "question1",
          "width": "20",
          "title": "your name",
          "description": "name will be enter here",
          "valueName": "name",
          "isRequired": true,
          "requiredErrorText": "please enter your name",
          "maxLength": 25,
          "placeHolder": "enter your name here"
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
        },
        {
          "type": "dropdown",
          "name": "question4",
          "choices": ["item1", "item2", "item3"],
          "choicesOrder": "desc",
          "optionsCaption": "caption for options",
          "showOptionsCaption": false,
          "choicesMin": 3,
          "choicesMax": 5,
          "choicesStep": 2
        }
      ]
    };
    List<QuestionModel> questions = List();

    var elements = json["elements"];

    QuestionTextModel textModel =
        QuestionTextModel(elements.firstWhere((question) {
      return question["type"] == "text";
    }));
    questions.add(textModel);

    QuestionCheckboxModel checkboxModel =
        QuestionCheckboxModel(elements.firstWhere((question) {
      return question["type"] == "checkbox";
    }));
    questions.add(checkboxModel);

    QuestionRadioModel radioModel =
        QuestionRadioModel(elements.firstWhere((question) {
      return question["type"] == "radiogroup";
    }));
    questions.add(radioModel);

    QuestionDropdownModel questionDropdownModel= QuestionDropdownModel(elements.firstWhere((question){
      return question["type"]=="dropdown";
    }));
    questions.add(questionDropdownModel);

    expect(ElementSurvey(json["elements"]).questions, questions);
  });

  test('parse pages successfully', () {
    var json = {
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
                          "name": "question1",
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

    List<PageModel> pages = List();
    var page = (json["pages"]).first;
    var elements = page["elements"] as List<Map<String, dynamic>>;
    List<QuestionModel> questions = List();

    QuestionTextModel textModel =
        QuestionTextModel(elements.firstWhere((question) {
      return question["type"] == "text";
    }));
    questions.add(textModel);

    QuestionCheckboxModel checkboxModel =
        QuestionCheckboxModel(elements.firstWhere((question) {
      return question["type"] == "checkbox";
    }));

    questions.add(checkboxModel);

    QuestionRadioModel radioModel =
        QuestionRadioModel(elements.firstWhere((question) {
      return question["type"] == "radiogroup";
    }));

    questions.add(radioModel);
    PageModel pageModel = PageModel(page);
    pageModel.name = "page1";
    pageModel.element = ElementSurvey(elements);
    pages.add(pageModel);
    SurveyJsonParser surveyJsonParser = SurveyJsonParser();
    expect(surveyJsonParser.parseAllPages(json), pages);
  });

  test('check panel parse successfully', () {
    var json = {
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
                  "name": "question1",
                  "choices": ["item1", "item2", "item3"]
                }
              ]
            }
          ]
        }
      ]
    };
    PanelModel panelModel = PanelModel(json);
    expect(PanelModel(json), panelModel);
  });

  test('parse survey successfully', () {
    var json = {
      "title": "survey title",
      "pages": [
        {
          "name": "page1",
          "elements": [
            {
              "type": "text",
              "name": "question",
              "width": "20",
              "title": "your name",
              "description": "name will be enter here",
              "valueName": "name",
              "isRequired": true,
              "requiredErrorText": "please enter your name",
              "maxLength": 25,
              "placeHolder": "enter your name here"
            },
            {
              "type": "checkbox",
              "name": "question1",
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
        },
        {
          "name": "page2",
          "elements": [
            {
              "type": "checkbox",
              "name": "question2",
              "choices": ["item1", "item2", "item3"]
            },
            {
              "type": "panel",
              "name": "panel1",
              "elements": [
                {
                  "type": "radiogroup",
                  "name": "question4",
                  "choices": ["item1", "item2", "item3"]
                }
              ]
            }
          ]
        },
        {
          "name": "page3",
          "elements": [
            {
              "type": "checkbox",
              "name": "question5",
              "choices": ["item1", "item2", "item3"]
            },
            {
              "type": "radiogroup",
              "name": "question6",
              "choices": ["item1", "item2", "item3"]
            }
          ]
        },
        {
          "name": "page4",
          "elements": [
            {"type": "text", "name": "question7"},
            {
              "type": "checkbox",
              "name": "question8",
              "choices": ["item1", "item2", "item3"]
            }
          ]
        },
        {
          "name": "page5",
          "elements": [
            {
              "type": "checkbox",
              "name": "question9",
              "choices": ["item1", "item2", "item3"]
            },
            {"type": "text", "name": "question10"},
            {
              "type": "radiogroup",
              "name": "question11",
              "choices": ["item1", "item2", "item3"]
            }
          ]
        },
        {
          "name": "page6",
          "elements": [
            {
              "type": "checkbox",
              "name": "question12",
              "choices": ["item1", "item2", "item3"]
            },
            {"type": "text", "name": "question13"},
            {
              "type": "radiogroup",
              "name": "question14",
              "choices": ["item1", "item2", "item3"]
            }
          ]
        },
        {
          "name": "page7",
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
                      "name": "question16",
                      "choices": ["item1", "item2", "item3"]
                    }
                  ]
                },
                {
                  "type": "radiogroup",
                  "name": "question15",
                  "choices": ["item1", "item2", "item3"]
                }
              ]
            }
          ]
        }
      ],
      "showQuestionNumbers": "onPage",
      "showProgressBar": "top",
      "clearInvisibleValues": "onHidden",
      "checkErrorsMode": "onValueChanged",
      "showTimerPanel": "top",
      "showTimerPanelMode": "page"
    };

    SurveyJsonParser surveyJsonParser = SurveyJsonParser();
    surveyJsonParser.parseSurveyJson(json);
  });
}
