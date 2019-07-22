import 'page.dart';
import 'panel.dart';
import 'survey.dart';

class QuestionModel {
  String id,
      name,
      comment,
      commentText,
      description,
      fullTitle,
      no,
      processedTitle,
      renderWidth,
      requiredErrorText,
      requiredIf,
      requiredText,
      enableIf,
      title,
      valueName,
      visibleIf,
      width,
      type;

  bool hasComment,
      hasInput,
      hasTitle,
      isAllowTitleLeft,
      isPanel,
      isReadOnly,
      isRequired,
      isVisible,
      startWithNewLine,
      visible;

  num currentErrorCount, indent, rightIndent, visibleIndex;

  dynamic correctAnswer, defaultValue, value;

  PageModel pageModel;
  PanelModel parent;

  List<SurveyValidator> surveyValidators;

  QuestionModel(Map<String, dynamic> json) {
    parseQuestionModel(json);
  }

  QuestionModel parseQuestionModel(Map<String, dynamic> json) {
    try {
      //String
      id = json["id"];
      name = json["name"];
      comment = json["comment"];
      commentText = json["commentText"];
      description = json["description"];
      fullTitle = json["fullTitle"];
      no = json["no"];
      processedTitle = json["processedTitle"];
      renderWidth = json["renderWidth"];
      requiredErrorText = json["requiredErrorText"];
      requiredIf = json["requiredIf"];
      requiredText = json["requiredText"];
      enableIf = json["enableIf"];
      title = json["title"];
      valueName = json["valueName"];
      visibleIf = json["visibleIf"];
      width = json["width"];
      type = json["type"];

      //bool
      hasComment = json["hasComment"];
      hasInput = json["hasInput"];
      hasTitle = json["hasTitle"];
      isAllowTitleLeft = json["isAllowTitleLeft"];
      isPanel = json["isPanel"];
      isReadOnly = json["isReadOnly"];
      isRequired = json["isRequired"];
      isVisible = json["isVisible"];
      startWithNewLine = json["startWithNewLine"];
      visible = json["visible"];

      //num
      currentErrorCount = json["currentErrorCount"];
      indent = json["indent"];
      rightIndent = json["rightIndent"];
      visibleIndex = json["visibleIndex"];

      correctAnswer = json["correctAnswer"];
      defaultValue = json["defaultValue"];
      value = json["value"];

      surveyValidators =
          (json["validators"] as List<Map<String, dynamic>>)?.map((validator) {
        final surveyValidator = SurveyValidator(validator);
        return surveyValidator;
      })?.toList();
    } catch (exception) {
      print(exception);
    }
    return this;
  }

  @override
  bool operator ==(other) {
    if (identical(this, other)) {
      return true;
    }
    return other is QuestionModel && other.name == this.name;
  }

  @override
  int get hashCode {
    return this.hashCode ^ this.name.hashCode;
  }

  void addError(SurveyError surveyError) {
    //todo add error to question
  }

  void clearErrors() {
    //todo clear all errors in the question
  }

  void clearInCorrectValues() {
    //todo remove values from the current question, that end-user will not be able to enter.
  }

  void focus(bool onError) {
    //todo Move the focus to the input of this question.
  }

  List<SurveyError> getAllErrors() {
//todo Returns a copy of question errors survey
  }

  String getLocale() {
    //todo currentSurveyLocale
  }

  String getTitleLocation() {
    //todo title location based on question
  }

  bool hasErrors() {
    //todo if validation error
  }

  bool isEmpty() {
    //todo true if question value is empty
  }

  bool moveTo(PanelModel panelModel, dynamic insertBefore) {
    //todo Move question to a new container Page/Panel. Add as a last element if insertBefore parameter is not used or inserted into the given index, if insert parameter is number, or before the given element, if the insertBefore parameter is a question or panel
  }

  void removeError(SurveyError surveyError) {
    //todo remove error from question.
  }
}

enum TitleLocation { DEFAULT, TOP, BOTTOM, LEFT }
