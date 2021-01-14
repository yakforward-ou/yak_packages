# yak_error_handler

This is small and lightweight package based on `riverpod`
to handle the typical `void Function(Object,Stacktrace)` from `try / catch`
and easy to integrate with `yak_runner`

# Get Started

add to your `pubspec.yaml`

```yaml
dependencies: 
  yak_error_handler: <latest version>
```

here is an example using `yak_error_handler` & `yak_runner`

```dart
import 'dart:math' as math;

import 'package:riverpod/riverpod.dart';
import 'package:yak_error_handler/yak_error_handler.dart';
import 'package:yak_runner/yak_runner.dart';

final _random = math.Random();

void veryBadAPI() => _random.nextBool() ? {} : throw 'ops';

void main() {
  final container = ProviderContainer();
  final _runner = YakRunner(veryBadAPI, container.read(catchError));
  final _handleError = container.read(handleError);

  _handleError.listen(
      (error) => print('****** ERRROR COUGHT *******\n${error.e}\n${error.s}'));

  for (var i = 0; i < 10; ++i) {
    _runner().when(
      success: (_) {},
      failure: (_, __) {},
    );
  }
}

```

## Buy me a coffee

Whether you use this package, have learned something from it, or just like it, please consider supporting it by buying me a coffee, so I can dedicate more time on open-source projects like this :)

<a href="https://www.buymeacoffee.com/yakforward" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: auto !important;width: auto !important;" ></a>

---