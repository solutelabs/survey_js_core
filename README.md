
Package for generating survey model from json.
Usage:-
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
