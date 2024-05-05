typedef SigninConfig = ({
  /// max attempts before being locked
  int maxAttempts,

  /// duration of the lock in seconds
  int lockDuration,
});

const SigninConfig defaultSigninConfig = (maxAttempts: 5, lockDuration: 300);
