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

  Survey(Map<String, dynamic> json) {
    clearValueOnDisableItem = json["clearValueOnDisableItem"];
    firstPageIsStarted = json["clearValueOnDisableItem"];
    focusFirstQuestionAutomatic = json["clearValueOnDisableItem"];
    focusOnFirstError = json["clearValueOnDisableItem"];
    goNextPageAutomatic = json["clearValueOnDisableItem"];
    isCurrentPageHasError = json["clearValueOnDisableItem"];
    isEditMode = json["clearValueOnDisableItem"];
    isEmpty = json["clearValueOnDisableItem"];
    isFirstPage = json["clearValueOnDisableItem"];
    isLastPage = json["clearValueOnDisableItem"];
    isNavigationButtonShowing = json["clearValueOnDisableItem"];
    isSinglePage = json["clearValueOnDisableItem"];
    isValidatingOnServer = json["clearValueOnDisableItem"];
    sendResultOnPageNext = json["clearValueOnDisableItem"];
    showCompletedPage = json["clearValueOnDisableItem"];
    showInvisibleElements = json["clearValueOnDisableItem"];
    showPageNumbers = json["clearValueOnDisableItem"];
    showPageTitles = json["clearValueOnDisableItem"];
    showPreviousButton = json["clearValueOnDisableItem"];
    showTitle = json["clearValueOnDisableItem"];
    showOthersAsComment = json["clearValueOnDisableItem"];

    clientId = json["clientId"];
    commentPrefix = json["commentPrefix"];
    completeText = json["completeText"];
    description = json["description"];
    emptySurveyText = json["emptySurveyText"];
    locale = json["locale"];
    pageNextText = json["pageNextText"];
    pagePreviousText = json["pagePreviousText"];
    processedTitle = json["processedTitle"];
    progressText = json["progressText"];
    questionStartIndex = json["questionStartIndex"];
    requiredText = json["requiredText"];
    startSurveyText = json["startSurveyText"];
    title = json["title"];

    currentPageNumber = json["currentPageNumber"];
    maxOtherLength = json["maxOtherLength"];
    maxTimeToFinish = json["maxTimeToFinish"];
    maxTimeToFinishPage = json["maxTimeToFinishPage"];
    maxTextLength = json["maxTextLength"];
    pageCount = json["pageCount"];
    timeSpent = json["timeSpent"];
    visiblePageCount = json["visiblePageCount"];

    checkErrorMode = _getErrorMode(json["checkErrorsMode"]);
    clearInvisibleValues =
        _getClearInvisibleValues(json["clearInvisibleValues"]);
    surveyMode = _getSurveyMode(json["surveyMode"]);
    progressbarType = _getProgressbarType(json["progressbarType"]);
    showNavigationButton =
        _getShowNavigationButton(json["showNavigationButton"]);
    showTimerPanel = _getShowTimerPanel(json["showTimerPanel"]);
    showProgressBar = _getShowProgressbar(json["showProgressbar"]);
    showQuestionNumber =_getShowQuestionNumber(json["showQuestionNumber"]);
    surveyState=_getSurveyState(json["surveyState"]);
  }

  SurveyState _getSurveyState(String surveyState){
    switch(surveyState){
      case "loading":return SurveyState.LOADING;
      case "completed":return SurveyState.COMPLETED;
      case "starting":return SurveyState.STARTING;
      case "running":return SurveyState.RUNNING;
      case "empty":return SurveyState.EMPTY;
      default:return SurveyState.EMPTY;
    }
  }

  ShowQuestionNumber _getShowQuestionNumber(String showQuestionNumber){
    switch(showQuestionNumber){
      case "on":return ShowQuestionNumber.ON;
      case "off":return ShowQuestionNumber.OFF;
      case "onPage":return ShowQuestionNumber.ON_PAGE;
      default:return ShowQuestionNumber.ON;
    }
  }


  ShowProgressBar _getShowProgressbar(String showProgressbar) {
    switch (showProgressbar) {
      case "off":
        return ShowProgressBar.OFF;
      case "top":
        return ShowProgressBar.TOP;
      case "bottom":
        return ShowProgressBar.BOTTOM;
      case "both":
        return ShowProgressBar.BOTH;
      default:
        return ShowProgressBar.OFF;
    }
  }

  ShowTimerPanel _getShowTimerPanel(String showTimerPanel) {
    switch (showTimerPanel) {
      case "none":
        return ShowTimerPanel.NONE;
      case "top":
        return ShowTimerPanel.TOP;
      case "bottom":
        return ShowTimerPanel.BOTTOM;
      default:
        return ShowTimerPanel.NONE;
    }
  }

  ShowNavigationButton _getShowNavigationButton(String showNavigationButton) {
    switch (showNavigationButton) {
      case "none":
        return ShowNavigationButton.NONE;
      case "top":
        return ShowNavigationButton.TOP;
      case "bottom":
        return ShowNavigationButton.BOTTOM;
      case "both":
        return ShowNavigationButton.BOTH;
      default:
        return ShowNavigationButton.BOTH;
    }
  }

  ProgressbarType _getProgressbarType(String progressbarType) {
    switch (progressbarType) {
      case "pages":
        return ProgressbarType.PAGES;
      case "questions":
        return ProgressbarType.QUESTIONS;
      case "correct_questions":
        return ProgressbarType.CORRECT_QUESTIONS;
      default:
        return ProgressbarType.PAGES;
    }
  }

  SurveyMode _getSurveyMode(String surveyMode) {
    switch (surveyMode) {
      case "edit":
        return SurveyMode.EDIT;
      case "display":
        return SurveyMode.DISPLAY;
      default:
        return SurveyMode.EDIT;
    }
  }

  ErrorMode _getErrorMode(String errorMode) {
    switch (errorMode) {
      case "onNextPage":
        return ErrorMode.ON_NEXT_PAGE;
      case "onValueChanged":
        return ErrorMode.ON_VALUE_CHANGE;
      default:
        return ErrorMode.ON_NEXT_PAGE;
    }
  }

  ClearInvisibleValues _getClearInvisibleValues(String clearInvisibleValue) {
    switch (clearInvisibleValue) {
      case "none":
        return ClearInvisibleValues.NONE;
      case "onComplete":
        return ClearInvisibleValues.ON_COMPLETE;
      case "onHidden":
        return ClearInvisibleValues.ON_HIDDEN;
      default:
        return ClearInvisibleValues.ON_COMPLETE;
    }
  }

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

  List<QuestionModel> getQuestionByNames(List<String> names,
      bool caseInsensitive) {
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

class JsonError {}

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

  num minValue, maxValue, minCount, maxCount,minLength,maxLength;

  bool allowDigit;

  SurveyValidator(Map<String, dynamic> validator) {
    validatorType = _getValidatorType(validator["type"]);
    text=validator["text"];
    maxCount = validator["maxCount"];
    minCount = validator["minCount"];
    minValue = validator["minValue"];
    maxValue = validator["maxValue"];
    minLength = validator["minLength"];
    maxLength = validator["maxLength"];
    regex = validator["regex"];
    expression = validator["expression"];
    allowDigit=validator["allowDigit"];
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
