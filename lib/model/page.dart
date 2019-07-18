import 'package:survey_js_core/model/panel.dart';

class PageModel {
  bool areQuestionRandomized, isStarted,wasShown;
  num maxTimeToFinish,timeSpent,visibleIndex;
  NavigationButtonVisibility navigationButtonVisibility;

  void focusFirstErrorQuestion(){
    //todo focus the input of the first question that has an error.
  }

  void focusFirstQuestion(){
    //todo focus the input on the first question
  }

  List<PanelModel> getAllPanel(){
    //todo return panel in the page
  }

  void scrollToTop(){
    //todo call to scroll to top.
  }


}

enum NavigationButtonVisibility { INHERIT, SHOW, HIDE }
enum QuestionOrder{DEFAULT,INITIAL,RANDOM}
