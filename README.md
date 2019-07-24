<b>Package for generating survey model from json<b>.

<b>Usage</b>:-

After creating survey json,you have to pass it to the SurveyJsonParser 

<b>SurveyJsonParser surveyJsonParser = SurveyJsonParser();<br>
surveyJsonParser.parseSurveyJson(json);</b>

parseSurveyJson(json) method return the <b>Survey</b> object.<br><br>
for validating your questions you have to pass your survey model and input data.<br>
input data you have to pass in the below format.<br>
<b>List<Map<String, dynamic>> data;</b><br>
where in Map <b>key</b> will be your <b>questionName</b> and <b>value</b> could be anything.<br><br>
<b>SurveyChecker surveyChecker=SurveyChecker();<br>
surveyChecker.completeSurvey(surveyModel, data);</b>
 
completeSurvey(surveyModel,data) method will give error if any. 

<b>Note:-currently there are four question type supported.<br>1)Text<br> 2)CheckBox<br> 3)Radiogroup<br> 4)Dropdown

for more information visit https://surveyjs.io/.
