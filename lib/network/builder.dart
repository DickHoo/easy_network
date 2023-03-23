
import 'retrofit.dart';
class Builder {
  late Builder _builder;

  Builder baseUrl(String url) => _builder;

  Builder connectTimeout(Duration duration) => _builder;

  Builder receiveTimeout(Duration duration) => _builder;

  Builder openLog() => _builder;

  late Retrofit _retrofit;

  Retrofit get build => _retrofit;
}
