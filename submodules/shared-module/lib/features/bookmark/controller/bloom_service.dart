import 'dart:async';

import 'package:async_locks/async_locks.dart';
import 'package:bloom_filter/bloom_filter.dart';
import 'package:flutter/foundation.dart';

class BloomService {
  String? _hash;
  BloomFilter? _filter;
  final Lock _lock = Lock();

  BloomService({String? hash}) {
    _updateFilterSafe(hash);
  }

  bool get _hashAvailable => _hash != null && _hash!.isNotEmpty;

  BloomFilter? get filter => _hashAvailable ? _filter : null;

  Future<void> _updateFilterSafe(String? hash) async {
    return _lock.run(() => _updateFilter(hash));
  }

  Future<void> _updateFilter(String? hash) async {
    _hash = hash;
    if (_hashAvailable) {
      // I assumed that setFilter works. But it doesn't work.
      // if (_filter == null) {
      _filter = await BloomFilter.load(hash!);
      // } else {
      //   _filter!.setFilter(hash!);
      // }
    }
  }

  Future<void> updateFilter(String? hash) => _updateFilterSafe(hash);

  Future<bool> has(String objectId) {
    return _lock.run(() => _has(objectId));
  }

  Future<bool> _has(String objectId) async {
    final filter = this.filter;
    if (filter != null) {
      // return filter.has(objectId);
      final result = await BloomFilter.has(
          objectId); // The current version of bloom filter use  static method instead.
      return result;
    }
    debugPrint("Bloom filter is not ready yet");
    return false;
  }
}
