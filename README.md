# Survey-js-core
## Package for generating survey model from json.
![Pub](https://img.shields.io/pub/v/survey_js_core) ![GitHub](https://img.shields.io/github/license/solutelabs/survey_js_core)
## Table of Contents
- [About survey-js](https://github.com/solutelabs/survey_js_core/blob/master/README.md#about-survey-js "About survey-js")
- [About survey-js-core](https://github.com/solutelabs/survey_js_core/blob/master/README.md#about-survey-js-core "About survey-js-core")
- [How to add](https://github.com/solutelabs/survey_js_core/blob/master/README.md#how-to-add "How to add")
- [Usage](https://github.com/solutelabs/survey_js_core/blob/master/README.md#usage "Usage")
- [Future plans](https://github.com/solutelabs/survey_js_core/blob/master/README.md#future-plans "Future plans")
- [community help](https://github.com/solutelabs/survey_js_core/blob/master/README.md#community-help "community help")

## About survey-js
Survey js is a library that can build fully customizable online surveys and forms.
with the help of [survey creator](https://surveyjs.io/create-survey/http:// "survey creator") user can build survey definations.after that integrate survey runner for  angular2+, jQuery, knockout, react or vue into your web page.
Survey can contain multiple pages,panels,different types of questions.The result of survey can be store in database.
for more information visit [Survey js](https://surveyjs.io/Documentation/Library/ "Survey js")

## About survey-js-core
survey-js-core package provide you same feature as survey-js library for mobile.you can create survey json from survey-js and give that json as input to core package.core package parse that json and give you survey model.
survey can have multiple pages,panel,questions with validations of input.
survey model can furthur use for rendering widgets in flutter in future releses.

## How to add
for adding survey-js-core to your project you have to add below dependency to your pubspec.yaml file.
 

    dependencies:
       survey_js_core: version

## Usage
After creating survey json,you have to pass it to the SurveyJsonParser 

```dart
SurveyJsonParser surveyJsonParser =SurveyJsonParser();
surveyJsonParser.parseSurveyJson(json);
```

parseSurveyJson(json) method return the <b>Survey</b> object.<br>
for validating your questions you have to pass your survey model and input data.<br>
input data you have to pass in the below format.<br>

```dart
 List<Map<String, dynamic>> data;
```
 
where in Map key will be your <b>questionName</b> and <b>value</b> could be anything.
```dart
SurveyChecker surveyChecker=SurveyChecker();
surveyChecker.completeSurvey(surveyModel, data);
```
 
completeSurvey(surveyModel,data) method will give error if any. 

Note:-currently there are four question type supported.
1. Text 
2. CheckBox
3. Radiogroup
4. Dropdown.

for more information visit https://surveyjs.io/.

## Future plans
1. currently the core package genrates the survey model based on the survey json,  in the future releses we will create seperate package for flutter to render ui based on generated survey model.
2. add more question types to core package.

## Community help
We as a community can make a full featured package.you can submit pull request to [survey-js-core](https://github.com/solutelabs/survey_js_core "survey-js-core").
