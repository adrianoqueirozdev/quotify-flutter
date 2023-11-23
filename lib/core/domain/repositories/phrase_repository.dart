import 'package:quotify/core/data/models/phrase.dart';
import 'package:quotify/core/domain/repositories/base_repository.dart';

abstract class PhraseRepository extends BaseRepository {
  Future<Phrase> loadPhrases([String? categoryId]);
}
