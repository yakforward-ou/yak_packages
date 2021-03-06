/// simply a typedef

typedef HandleExactError<T extends Error> = void Function(T e);
