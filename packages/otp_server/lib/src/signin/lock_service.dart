typedef LockStatus = ({
  /// the current attempt number
  int attempts,

  ///
  int lockedUntil,
});

abstract class LockService {
  LockStatus status(String email);
}
