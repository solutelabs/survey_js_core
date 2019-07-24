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
      isRequired = false,
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
      isRequired = json["isRequired"] ?? false;
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
}

enum TitleLocation { DEFAULT, TOP, BOTTOM, LEFT }
