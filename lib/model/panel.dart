import 'package:survey_js_core/model/element.dart';
import 'package:survey_js_core/model/page.dart';
import 'package:survey_js_core/model/question.dart';

class PanelModel extends PanelModelBase {
  bool isCollapsed, isExpanded, startWithNewLine;
  String width;

  PageModel pageModel;

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
      id,
      processedTitle,
      questionTitleLocation,
      requireErrorText,
      title,
      visibleIf;

  ElementSurvey elementSurvey;

  bool isActive, isPanel, isReadOnly, isRequired, isVisible, visible;

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
