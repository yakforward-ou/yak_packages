typedef LockStatus = ({
  /// the current attempt number
  int attempts,

  ///  Date Time UTC until the
  int lockedUntil,
});

abstract class LockService {
  LockStatus status(String email);
}
