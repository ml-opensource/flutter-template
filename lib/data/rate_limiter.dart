class RateLimiter {
  final Duration timeout;
  final Map<String, DateTime> timestamps = Map();

  RateLimiter(this.timeout);

  bool shouldFetch(String key) {
    final DateTime lastFetched = timestamps[key];
    final DateTime now = DateTime.now();

    if (lastFetched == null) {
      timestamps[key] = now;
      return true;
    }

    if (now.difference(lastFetched) > timeout) {
      timestamps[key] = now;
      return true;
    }

    return false;
  }

  void reset(String key) {
    timestamps.remove(key);
  }

  void resetAll() {
    timestamps.clear();
  }
}
