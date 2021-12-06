class RateLimiter {
  final Duration timeout;
  final Map<String, DateTime> timestamps = {};

  RateLimiter(this.timeout);

  bool shouldFetch(String key) {
    final lastFetched = timestamps[key];
    final now = DateTime.now();

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
