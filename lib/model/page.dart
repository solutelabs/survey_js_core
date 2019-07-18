import 'package:survey_js_core/model/panel.dart';

class PageModel {
  bool areQuestionRandomized, isStarted, wasShown;
  num maxTimeToFinish, timeSpent, visibleIndex;
  NavigationButtonVisibility navigationButtonVisibility;

  PageModel(Map<String, dynamic> json) {
    areQuestionRandomized = json["areQuestionRandomized"];
    isStarted = json["isStarted"];
    wasShown = json["wasShown"];

    maxTimeToFinish = json["maxTimeToFinish"];
    timeSpent = json["timeSpent"];
    visibleIndex = json["visibleIndex"];

    navigationButtonVisibility =
        _getNavigationBtnVisibility(json["navigationButtonsVisibility"]);
  }

  NavigationButtonVisibility _getNavigationBtnVisibility(String visibility) {
    switch (visibility) {
      case "inherit":
        return NavigationButtonVisibility.INHERIT;
      case "show":
        return NavigationButtonVisibility.SHOW;
      case "hide":
        return NavigationButtonVisibility.HIDE;
      default:
        return NavigationButtonVisibility.SHOW;
    }
  }

  void focusFirstErrorQuestion() {
    //todo focus the input of the first question that has an error.
  }

  void focusFirstQuestion() {
    //todo focus the input on the first question
  }

  List<PanelModel> getAllPanel() {
    //todo return panel in the page
  }

  void scrollToTop() {
    //todo call to scroll to top.
  }
}

enum NavigationButtonVisibility { INHERIT, SHOW, HIDE }
enum QuestionOrder { DEFAULT, INITIAL, RANDOM }
