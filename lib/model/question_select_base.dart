import 'question.dart';

class QuestionSelectBase extends QuestionModel {
  List<String> choices;

  String choicesEnableIf,
      choicesVisibleIf,
      otherErrorText,
      otherPlaceHolder,
      otherText;

  bool hideIfChoicesEmpty;
  ItemValue enabledChoices, otherItem;
  List<ItemValue> visibleChoices;

  ChoiceOrder choicesOrder;

  QuestionSelectBase(Map<String, dynamic> json) : super(json) {
    choices = (json["choices"] as List<String>);
    choicesEnableIf = json["choicesEnableIf"];
    choicesVisibleIf = json["choicesVisibleIf"];
    otherErrorText = json["otherErrorText"];
    otherPlaceHolder = json["otherPlaceHolder"];
    otherText = json["otherText"];

    hideIfChoicesEmpty = json["hideIfChoicesEmpty"];

    choicesOrder = _getChoiceOrder(json["choicesOrder"]);
  }

  ChoiceOrder _getChoiceOrder(String choiceOrder) {
    switch (choiceOrder) {
      case "none":
        return ChoiceOrder.NONE;
      case "asc":
        return ChoiceOrder.ASE;
      case "desc":
        return ChoiceOrder.DESC;
      case "random":
        return ChoiceOrder.RANDOM;
      default:
        return ChoiceOrder.NONE;
    }
  }
}

class QuestionCheckboxBaseModel extends QuestionSelectBase {
  int colCount;

  QuestionCheckboxBaseModel(Map<String, dynamic> json) : super(json) {
    colCount = json["colCount"];
  }
}

enum ChoiceOrder { NONE, ASE, DESC, RANDOM }

class ItemValue {}
