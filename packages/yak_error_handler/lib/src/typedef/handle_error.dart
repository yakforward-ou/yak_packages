/// a typedef for ` void Function(Error e)`
typedef HandleError<T extends Error> = void Function(T e);
