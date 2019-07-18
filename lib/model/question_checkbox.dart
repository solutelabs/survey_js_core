import 'question_select_base.dart';

class QuestionCheckboxModel extends QuestionCheckboxBaseModel {
  bool hasNone, hasSelectAll, isSelectAll, isItemSelectAll;

  String noneText, selectAllText;

  dynamic selectAll, toggleSelectAll;

  ItemValue nonItem, selectAllItem;

  QuestionCheckboxModel(Map<String, dynamic> json) : super(json){
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
    QuestionCheckboxModel otherModel = (other as QuestionCheckboxModel);
    return (this.hasNone == otherModel.hasNone) &&
        (this.hasSelectAll == otherModel.hasSelectAll) &&
        (this.noneText == otherModel.noneText) &&
        (this.selectAllText == otherModel.selectAllText);
  }
}
