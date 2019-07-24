
Package for generating survey model from json.

Usage:-

After creating survey json,you have to pass it to the SurveyJsonParser 

```SurveyJsonParser surveyJsonParser =SurveyJsonParser();```<br> ```surveyJsonParser.parseSurveyJson(json);```

parseSurveyJson(json) method return the <b>Survey</b> object.<br>
for validating your questions you have to pass your survey model and input data.<br>
input data you have to pass in the below format.<br>
 ``` List<Map<String, dynamic>> data;```<br>
where in Map <b>key</b> will be your <b>questionName</b> and <b>value</b> could be anything.<br>
```SurveyChecker surveyChecker=SurveyChecker();```<br>```surveyChecker.completeSurvey(surveyModel, data);```
 
completeSurvey(surveyModel,data) method will give error if any. 

Note:-currently there are four question type supported.<br>1)Text<br> 2)CheckBox<br> 3)Radiogroup<br> 4)Dropdown.

for more information visit https://surveyjs.io/.
