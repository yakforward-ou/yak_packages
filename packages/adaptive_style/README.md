
[![melos badge][]][melos]
[![license badge][]][license]


### adaptive_style

a collection of widgets to build scalable UI

# WARNING
this package is an early release and under development
breaking changes are most likely to occur

### how does it work?

- wrap your app in a `ScaleRefProvider`
- provide a list of supported sizes
``` dart
ScaleRefProvider(
    deviceSizes: const [DeviceSize.iphoneSE],
///...
```
- use `SizeRef` to get 
  - the closest supported size
  - the scale between the device size and the supported size

### what's included?

- `AdaptiveWidget`: the base to build your own custom adaptive widget
- `AdaptiveStack`: just like a `Stack` but builds it's children as an `AdaptiveWidget`
- `AdaptivePositioned`: a `Positioned` that place itself at one of the parent's edges



[melos badge]: https://img.shields.io/badge/maintained%20with-melos-f700ff.svg
[melos]: https://github.com/invertase/melos
[license]: https://opensource.org/licenses/MIT
[license badge]: https://img.shields.io/badge/license-MIT-blue.svg

