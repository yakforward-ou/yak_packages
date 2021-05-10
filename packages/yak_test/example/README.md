# Example

```dart

String greet() => 'hello';

final runner = Runner<String>(greet);

void main() => runner.tester(description: 'runner test', example: greet);

```

