import 'package:quotify/shared/constants/environment.dart';
import 'package:quotify/shared/http/quotify_api.dart';

abstract class BaseRepository {
  late final QuotifyApi _quotifyApi;

  QuotifyApi get quotifyApi => _quotifyApi;

  BaseRepository() {
    _quotifyApi = QuotifyApi(Environment.baseUrl);
  }
}
