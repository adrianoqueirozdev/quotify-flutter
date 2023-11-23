import 'package:quotify/core/data/models/phrase.dart';
import 'package:quotify/core/domain/repositories/phrase_repository.dart';

class PhraseRepositoryImpl extends PhraseRepository {
  @override
  Future<Phrase> loadPhrases([String? categoryId]) async {
    final response = await quotifyApi.get('phrases', categoryId != null ? {'categoryId': categoryId} : null);

    return PhraseResponse.fromJson(response).data!;
  }
}
