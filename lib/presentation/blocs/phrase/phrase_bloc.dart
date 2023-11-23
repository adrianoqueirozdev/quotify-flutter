import 'package:bloc/bloc.dart';
import 'package:quotify/core/domain/usecases/phrases_usecase.dart';
import 'package:quotify/presentation/blocs/phrase/phrase_events.dart';
import 'package:quotify/presentation/blocs/phrase/phrase_state.dart';

class PhraseBloc extends Bloc<PhraseEvents, PhraseState> {
  final PhrasesUsecase _phrasesUsecase = PhrasesUsecase();

  PhraseBloc() : super(PhraseInitial()) {
    on<LoadPhrasesEvent>((event, emit) async {
      try {
        final phrases = await _phrasesUsecase.loadPhrases(event.categoryId);

        emit(PhraseSuccess(phrase: phrases));
      } catch (e) {
        emit(PhraseError(error: e.toString()));
      }
    });
  }
}
