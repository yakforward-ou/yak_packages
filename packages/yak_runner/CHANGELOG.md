### 3.0.3
- update dependencies
- rework due to yak_result v3
- add "run bypass"

### 2.1.1
- update dependency
- remove delegates to avoid implicit_call_tearoffs

### 2.0.3
- example link and readme update
- update dependency
- update to dart 3

### 1.0.2
- update `run...` functions
- add `runCallback...` functions
- add `callback`, `...FutureOr` extensions
- add `letRun` and  re-add`thenRun`
- add `ForEachRunX` and `ForEachRunStreamX`
- update existing extensions
- update tests
- update dependencies
- remove `thenRun` extesion in favor of `yak_result`'s `onResult` 
- update dependencies
- clean up tests
- major release
- fix export of external packages
- update dependencies

###  0.5.0
- rework everything as pure function and extension
- export `yak_result`
- update readme
- moved `ErrorHandler` to `yak_error_handler`
- moved `Result` to `yak_reason`

###  0.4.0
- fix analysis
- removed `buildTest` mixin
- add custom json runner
- breaking change on `errorReport` and `errorHandlers`
- versions up-to-date

###  0.3.1
- added `extension` family `RunnerAppendX`
- added `OnSuccessCallback`
- bump `stub` version
- updated tests
- `example` updated
- renamed `Runner` and `NullaryDelegate`
- added `typedef` for `Delegate`s and `Runner`s
- added `IterableRunner`
- `readme` updated
- updated `stub` to 0.2.0
- removed redundancies with `yak_error_handler`
- migrated to `null-safety`

###  0.2.2
- implemented `IterableContains` and `TypeAsType`
  with extensions and tests 
- breaking change: 
  - sepatarate handling between `Exception` and `Error`
  - `"runners"` have now optional named constructor arguments
  - `HandleError` has optional constructor argument
- `HandleError` has new factory constructor and extensions
- updated `readme` and `pubspec` description
- added `melos` and `coverage`
- added `effective_dart` to `dev_dependencies`
- updated `readme`
- updated `example`
- updated `tests`
- `yak_error_handler` friendly
- fixed `Type` for `test mixin`
- added `assert` for runners and `typeVoid`
- rewrite example
- rewrite tests
- major refactor without freezed

###  0.1.0
- implemented `test_factory_mixin` with tests
- removed `async freezed` 
- implemented `delegates` for testing
- complete rework based on `freezed`

###  0.0.3
- breaking changes in the validation
- added `mockito` for testing
- full re-design with mixin based classes
- test passing
- `alpha` release