import 'question.dart';

class QuestionTextModel extends QuestionModel {
  String placeHolder;

  InputType inputType;

  num maxLength, size;

  QuestionTextModel(Map<String, dynamic> json) : super(json) {
    inputType = getInputType(json["inputType"]);
    placeHolder = json["placeHolder"];
    maxLength = json["maxLength"];
    size = json["size"];
  }

  InputType getInputType(String type) {
    switch (type) {
      case "color":
        return InputType.COLOR;
      case "date":
        return InputType.DATE;
      case "datetime":
        return InputType.DATETIME;
      case "datetime-local":
        return InputType.DATETIME_LOCAL;
      case "email":
        return InputType.EMAIL;
      case "month":
        return InputType.MONTH;
      case "number":
        return InputType.NUMBER;
      case "password":
        return InputType.PASSWORD;
      case "range":
        return InputType.RANGE;
      case "tel":
        return InputType.TEL;
      case "text":
        return InputType.TEXT;
      case "time":
        return InputType.TIME;
      case "url":
        return InputType.URL;
      case "week":
        return InputType.WEEK;
      default:
        return InputType.TEXT;
    }
  }
}

enum InputType {
  COLOR,
  DATE,
  DATETIME,
  DATETIME_LOCAL,
  EMAIL,
  MONTH,
  NUMBER,
  PASSWORD,
  RANGE,
  TEL,
  TEXT,
  TIME,
  URL,
  WEEK
}
