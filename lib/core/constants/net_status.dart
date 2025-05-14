sealed class NetStatus {
  const NetStatus();
}

class NetIdle extends NetStatus {
  const NetIdle();
}

class NetLoading extends NetStatus {
  const NetLoading();
}

class NetError extends NetStatus {
  final Object error;
  final StackTrace stackTrace;

  const NetError(this.error, this.stackTrace);
}