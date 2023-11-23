abstract class PhraseEvents {}

class LoadPhrasesEvent extends PhraseEvents {
  String? categoryId;

  LoadPhrasesEvent({this.categoryId});
}
