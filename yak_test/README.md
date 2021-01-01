
# yak_test

Use this package to create tests for packages in the `yak_packages` family

---

## Getting Started

* Add to your `pubspec.yaml`

```yaml
dev_dependencies: 
  yak_test: <latest version>
```

* Create a test with the following steps

```dart
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/yak_test.dart';

/// [step 1] import the `yak_runner` you want to test or equivalent
final runner = TryAnyRunArgAsync<int, String>((_) => throw '');

/// [step 2] *when required* provide generic `argument` and `resul`
/// those are meant only for `Type` check, does not matter the content
final argument = 'hello';
final result = 4;

/// [step 3] build your tester with one line of code
final tester = runner.buildTest(runner.buildTestFactory(''));

/// [step 4] run your test
void main() => tester(result, argument);
```

## Buy me a coffee

Whether you use this package, have learned something from it, or just like it, please consider supporting it by buying me a coffee, so I can dedicate more time on open-source projects like this :)

<a href="https://www.buymeacoffee.com/yakforward" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: auto !important;width: auto !important;" ></a>

---