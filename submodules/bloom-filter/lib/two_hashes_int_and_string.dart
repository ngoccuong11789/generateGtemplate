import 'package:bloom_filter/two_hashes_templated.dart';

class TwoHashesIntAndString {
  final TwoHashesTemplated<int> intHashes;
  final TwoHashesTemplated<String> stringHashes;

  TwoHashesIntAndString(this.intHashes, this.stringHashes);
}
