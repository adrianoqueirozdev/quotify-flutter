import 'package:quotify/core/data/models/phrase.dart';
import 'package:quotify/core/data/repositories/phrase_repository_impl.dart';

class PhrasesUsecase {
  late final PhraseRepositoryImpl phrasesRepository;

  PhrasesUsecase() {
    phrasesRepository = PhraseRepositoryImpl();
  }

  Future<Phrase> loadPhrases([String? categoryId]) async {
    return await phrasesRepository.loadPhrases(categoryId);
  }
}
