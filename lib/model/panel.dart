import 'package:survey_js_core/model/element_survey.dart';
import 'package:survey_js_core/model/page.dart';

class PanelModel extends PanelModelBase {
  bool isCollapsed, isExpanded, startWithNewLine;
  String width, state;

  PageModel pageModel;

  PanelModel(Map<String, dynamic> json) : super(json) {
    isCollapsed = json["isCollapsed"];
    isExpanded = json["isExpanded"];
    startWithNewLine = json["startWithNewLine"];

    width = json["width"];
    state = json["state"];
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

  PanelModelBase(Map<String, dynamic> json) {
    description = json["description"];
    enableIf = json["enableIf"];
    name = json["name"];
    id = json["id"];
    processedTitle = json["processedTitle"];
    questionTitleLocation = json["questionTitleLocation"];
    requireErrorText = json["requireErrorText"];
    title = json["title"];
    visibleIf = json["visibleIf"];

    elementSurvey =
        ElementSurvey(json["elements"] as List<Map<String, dynamic>>);
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
    return this.hashCode ^ this.name.hashCode;
  }
}
