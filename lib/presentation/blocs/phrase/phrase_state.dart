import 'package:quotify/core/data/models/phrase.dart';

abstract class PhraseState {
  Phrase? phrase;
  String? error;

  PhraseState({this.phrase, this.error});
}

class PhraseInitial extends PhraseState {
  PhraseInitial() : super(phrase: Phrase());
}

class PhraseSuccess extends PhraseState {
  PhraseSuccess({required Phrase phrase}) : super(phrase: phrase);
}

class PhraseError extends PhraseState {
  PhraseError({required String error}) : super(phrase: Phrase(), error: error);
}
