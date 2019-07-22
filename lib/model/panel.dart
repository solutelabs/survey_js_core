import 'package:survey_js_core/model/element_survey.dart';
import 'package:survey_js_core/model/page.dart';
import 'package:survey_js_core/model/question.dart';

class PanelModel extends PanelModelBase {
  bool isCollapsed, isExpanded, startWithNewLine;
  String width, state;

  PageModel pageModel;

  PanelModel(Map<String,dynamic> json):super(json){
    isCollapsed=json["isCollapsed"];
    isExpanded=json["isExpanded"];
    startWithNewLine=json["startWithNewLine"];

    width=json["width"];
    state=json["state"];
  }

  void collapse() {
    //todo collapse
  }

  void expand() {
    //todo expand
  }

  bool moveTo(PanelModel panelModel, dynamic insertBefore) {
    //todo move panel
  }
}

class PanelModelBase {
  String description,
      enableIf,
      name,
      id,
      processedTitle,
      questionTitleLocation,
      requireErrorText,
      title,
      visibleIf;

  ElementSurvey elementSurvey;

  PanelModelBase(Map<String,dynamic> json){
    description=json["description"];
    enableIf=json["enableIf"];
    name=json["name"];
    id=json["id"];
    processedTitle=json["processedTitle"];
    questionTitleLocation=json["questionTitleLocation"];
    requireErrorText=json["requireErrorText"];
    title=json["title"];
    visibleIf=json["visibleIf"];

    elementSurvey=ElementSurvey(json["elements"] as List<Map<String,dynamic>>);
  }

  bool isActive, isPanel, isReadOnly, isRequired, isVisible, visible;

  @override
  bool operator ==(other) {
    if (identical(this, other)) {
      return true;
    }
    return other is PanelModel && this.name == other.name;
  }


  @override
  int get hashCode {
    return this.hashCode^this.name.hashCode;
  }

  bool addElement(QuestionModel questionModel, int index) {
    //todo
  }

  PanelModel addNewPanel(String name) {
    //todo
  }

  bool addPanel(PanelModel panelModel, int index) {
    //todo
  }

  QuestionModel addNewQuestion(String questionType, String name, int index) {
    //todo
  }

  bool hasErrors(bool focusOnFirstError) {
    //todo
  }

  dynamic getValue() {
    //todo
  }

  dynamic getComments() {
    //todo
  }

  bool containsElement(ElementSurvey elementSurvey) {
    //todo
  }

  bool addQuestion(QuestionModel questionModel, int index) {
    //todo
  }

  void addQuestionToList(
      List<QuestionModel> questions, bool visibleOnly, includingDesignTime) {
    //todo
  }

  void clearErrors() {
    //todo
  }

  void clearIncorrectValues() {
    //todo
  }

  ElementSurvey getElementByName(String name) {
    //todo
  }

  QuestionModel getQuestionByName(String name) {
    //todo
  }

  void removeQuestion(QuestionModel questionModel) {}
}
