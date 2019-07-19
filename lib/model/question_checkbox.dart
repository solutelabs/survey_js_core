import 'question_select_base.dart';

class QuestionCheckboxModel extends QuestionCheckboxBaseModel {
  bool hasNone, hasSelectAll, isSelectAll, isItemSelectAll;

  String noneText, selectAllText;

  dynamic selectAll, toggleSelectAll;

  ItemValue nonItem, selectAllItem;

  QuestionCheckboxModel(Map<String, dynamic> json) : super(json) {
    hasNone = json["hasNone"];
    hasSelectAll = json["hasSelectAll"];

    noneText = json["noneText"];
    selectAllText = json["selectAllText"];
  }

  bool isItemSelected(ItemValue itemValue) {
    //todo returns if item isSelected
  }

  @override
  bool operator ==(other) {
    if (identical(this, other)) {
      return true;
    }
    return other is QuestionCheckboxModel &&
        (this.hasNone == other.hasNone) &&
        (this.hasSelectAll == other.hasSelectAll) &&
        (this.noneText == other.noneText) &&
        (this.selectAllText == other.selectAllText);
  }
}
