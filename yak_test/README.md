
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

/// STEP 1 - use  `yak_runner` from [https://pub.dev/packages/yak_runner]

final _runner = YakRunner<int>(() => 2);

/// STEP 2 - create a test with  `yak_test` from [https://pub.dev/packages/yak_test]

final _tester = _runner.buildTest(_runner.buildTestFactory('description here'));

/// STEP 3 - run the test

void main() => _tester(0);

```

## Buy me a coffee

Whether you use this package, have learned something from it, or just like it, please consider supporting it by buying me a coffee, so I can dedicate more time on open-source projects like this :)

<a href="https://www.buymeacoffee.com/yakforward" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: auto !important;width: auto !important;" ></a>

---