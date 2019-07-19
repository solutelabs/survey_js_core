import 'package:survey_js_core/model/page.dart';
import 'package:survey_js_core/model/question.dart';
import 'package:survey_js_core/model/element_survey.dart';
import 'package:survey_js_core/model/panel.dart';
import 'base.dart';

class Survey extends Base implements SurveyEvents {
  ErrorMode checkErrorMode = ErrorMode.ON_NEXT_PAGE;
  ClearInvisibleValues clearInvisibleValues = ClearInvisibleValues.ON_COMPLETE;
  SurveyMode surveyMode = SurveyMode.EDIT;
  ProgressbarType progressbarType = ProgressbarType.PAGES;
  ShowNavigationButton showNavigationButton = ShowNavigationButton.BOTTOM;
  ShowProgressBar showProgressBar = ShowProgressBar.OFF;
  ShowQuestionNumber showQuestionNumber = ShowQuestionNumber.ON;
  ShowTimerPanel showTimerPanel = ShowTimerPanel.NONE;

  bool clearValueOnDisableItem = true,
      firstPageIsStarted,
      focusFirstQuestionAutomatic = true,
      focusOnFirstError = false,
      goNextPageAutomatic,
      isCurrentPageHasError,
      isEditMode,
      isEmpty,
      isFirstPage,
      isLastPage,
      isNavigationButtonShowing,
      isSinglePage,
      isValidatingOnServer,
      sendResultOnPageNext,
      showCompletedPage,
      showInvisibleElements,
      showPageNumbers,
      showPageTitles,
      showPreviousButton,
      showTitle = true,
      showOthersAsComment = true;

  String clientId,
      commentPrefix,
      completeText,
      description,
      emptySurveyText,
      locale,
      pageNextText,
      pagePreviousText,
      processedTitle,
      progressText,
      questionStartIndex,
      requiredText,
      startSurveyText,
      title;

  dynamic comments, currentPage, data;

  num currentPageNumber,
      maxOtherLength,
      maxTimeToFinish,
      maxTimeToFinishPage,
      maxTextLength,
      pageCount,
      timeSpent,
      visiblePageCount;

  List<JsonError> jsonError;

  List<PageModel> pages;

  PageModel startedPage;

  SurveyState surveyState;

  List<PageModel> visiblePages;

  void addNewPage(String name) {
    //todo add page to [pages]
  }

  void addPage(PageModel pageModel) {
    //todo add page to survey pages
  }

  void clear(bool clearData, gotoFirstPage) {
    //todo clear survey data and state
  }

  void clearIncorrectValues() {
    //todo Call this function to remove all question values from the survey, that end-user will not be able to enter
  }

  void clearValue(String name) {
    //todo remove value from survey result
  }

  bool completeLastPage() {
    //todo complete the survey,if current page is last.false if page has error.
  }

  void doComplete() {
    //todo complete survey,set survey into completed
  }

  void focusFirstQuestion() {
    //todo set the input focus to the first question with the input.
  }

  List<QuestionModel> getAllQuestions(bool visibleOnly) {
    //todo return all question in survey.
  }

  String getComment(String name) {
    //todo return comment value.
  }

  num getCorrectAnswerCount() {
    //todo Returns the number of corrected answers on quiz
  }

  num getInCorrectAnswerCount() {
    //todo Returns the number of inCorrected answers on quiz
  }

  num getProgress() {
    //todo Returns the progress that a user made by answering on the survey.
  }

  PageModel getPageByElement(ElementSurvey element) {
    //todo Returns a page on which an element (question or panel) is placed.
  }

  PageModel getPageByName(String name) {
    //todo Returns a page by its name.
  }

  PageModel getPageByQuestion(QuestionModel questionModel) {
    //todo Returns a page on which a question is located
  }

  PageModel getPageByNames(List<String> names) {
    //todo Returns a list of pages by their names
  }

  PanelModel getPanelByName(String name, bool caseInsensitive) {
    //todo Returns a panel by its name
  }

  dynamic getPropertyValue(String name) {
    //todo Returns the property value by name
  }

  QuestionModel getQuestionByName(String name) {
    //todo Returns a question by its name
  }

  List<QuestionModel> getQuestionByNames(
      List<String> names, bool caseInsensitive) {
    //todo Get a list of questions by their names
  }

  QuestionModel getQuestionByValueName(String name, bool caseInsensitive) {
    //todo Returns a question by its ValueName
  }

  List<QuestionModel> getQuestions() {
    //todo All visible questions that has input(s) widgets.
  }

  String getType() {
    //todo
  }

  List<String> getUsedLocales() {
    //todo
  }

  bool nextPage() {
    //todo call to next page,return false if page is last
  }

  bool previousPage() {
    //todo call to previous page,return false if page is first
  }

  void removePage() {
    //todo remove page from survey
  }

  void setComment(String name, String newValue) {
    //todo Set the comment value
  }

  void start() {
    //todo startSurvey
  }

  void startTimer() {
    //todo start timer of user spend on survey
  }

  void stopTimer() {
    //todo stop timer of user spend on survey
  }
}

class JsonError {
}

enum SurveyMode { EDIT, DISPLAY }
enum ErrorMode { ON_NEXT_PAGE, ON_VALUE_CHANGE }
enum ClearInvisibleValues { NONE, ON_COMPLETE, ON_HIDDEN }
enum ProgressbarType { PAGES, QUESTIONS, CORRECT_QUESTIONS }
enum QuestionOrder { INITIAL, RANDOM }
enum ShowNavigationButton { NONE, TOP, BOTTOM, BOTH }
enum ShowTimerPanel { NONE, TOP, BOTTOM }
enum ShowTimerPanelMode { ALL, PAGE, SURVEY }
enum ShowProgressBar { OFF, TOP, BOTTOM, BOTH }
enum ShowQuestionNumber { ON, OFF, ON_PAGE }
enum SurveyState { LOADING, COMPLETED, STARTING, RUNNING, EMPTY }

abstract class SurveyEvents {}

class SurveyValidator {
  String text, regex, expression;

  ValidatorType validatorType;

  num minValue, maxValue, minCount, maxCount;

  bool allowDigit;

  SurveyValidator(Map<String, dynamic> validator) {
    validatorType = _getValidatorType(validator["type"]);
    maxCount = validator["maxCount"];
    minCount = validator["minCount"];
    minValue = validator["minValue"];
    maxValue = validator["maxValue"];
    regex = validator["regex"];
    expression = validator["expression"];
  }

  ValidatorType _getValidatorType(String type) {
    switch (type) {
      case "text":
        return ValidatorType.TEXT;
      case "numeric":
        return ValidatorType.NUMERIC;
      case "answercount":
        return ValidatorType.ANSWER_COUNT;
      case "regex":
        return ValidatorType.REGEX;
      case "email":
        return ValidatorType.EMAIL;
      case "expression":
        return ValidatorType.EXPRESSION;
      default:
        return ValidatorType.TEXT;
    }
  }
}

enum ValidatorType { TEXT, NUMERIC, ANSWER_COUNT, REGEX, EMAIL, EXPRESSION }

class SurveyError {}
