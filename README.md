<b>Package for generating survey model from json<b>.

<b>Usage</b>:-

```json
json=
{
 "pages": [
  {
   "name": "page1",
   "elements": [
    {
     "type": "checkbox",
     "name": "questionSongLanguage",
     "width": "50",
     "title": "select song language you listen",
     "description": "select your languages of songs",
     "valueName": "song you listen..",
     "isRequired": true,
     "requiredErrorText": "select atleast on language",
     "hasComment": true,
     "otherPlaceHolder": "other language you listen",
     "choices": [
      "hindi",
      "english",
      "french"
     ],
     "choicesOrder": "asc",
     "hasSelectAll": true,
     "hasNone": true,
     "selectAllText": "all language"
    },
    {
     "type": "radiogroup",
     "name": "questionGender",
     "width": "50",
     "title": "select gender",
     "description": "select gender",
     "valueName": "gender",
     "isRequired": true,
     "requiredErrorText": "select one gender type",
     "choices": [
      "male",
      "female",
      "other"
     ],
     "choicesOrder": "asc",
     "hideIfChoicesEmpty": true,
     "showClearButton": true
    },
    {
     "type": "text",
     "name": "about your self",
     "placeHolder": "tell us about yourself"
    }
   ],
   "questionTitleLocation": "top",
   "title": "Music selection form",
   "description": "page description for music",
   "navigationButtonsVisibility": "show"
  }
 ],
 "showQuestionNumbers": "onPage",
 "showProgressBar": "top",
 "clearInvisibleValues": "onHidden",
 "checkErrorsMode": "onValueChanged",
 "showTimerPanel": "top",
 "showTimerPanelMode": "page"
}
```
for example take above survey and pass it to the SurveyJsonParser like below

<b>SurveyJsonParser surveyJsonParser = SurveyJsonParser();<br>
surveyJsonParser.parseSurveyJson(json);</b>

parseSurveyJson(json) method return the <b>Survey</b> object.<br><br>

<b>Note:-currently there are four question type supported.<br>1)Text<br> 2)CheckBox<br> 3)Radiogroup<br> 4)Dropdown

for more information visit https://surveyjs.io/.
