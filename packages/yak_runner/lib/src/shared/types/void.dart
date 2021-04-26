Type _type<T>() => T;

/// if you are wondering why this `nonsense`
/// [https://stackoverflow.com/a/65671199/9836706]
Type get typeVoid => _type<void>();
