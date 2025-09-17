# Changelog

## 5.0.0-alpha

- Initial version release
- Includes basic component system

## 5.0.0-alpha.1

- Removed dart:io dependency
- Added additional code comments and improved documentation

## 5.0.0-alpha.2

- Modify the documentation.

## 5.0.0-alpha.3

- Modify the documentation.

## 5.0.1-alpha.1

- Added fully property-supported static methods for `Toast`, `Mask`, `Popup`, `Dialog`, `Modal`, `ActionSheet`, and included corresponding demos
- Improved documentation information in Readme
- Style system now supports inheritance property merging
- Fixed incorrect initial value display issue in Form
- Enhanced `AntdLog` functionality
- Added support for using `AntdProvider` without wrapping the root directory
- Demo improvements and refinements

## 5.0.2-alpha.1

- Added new `AntdDropdown` component
- Improved test cases for Style.dart
- Optimized the display effect of `AntdSlider` when min and max values are set
- Changed onCancel to `onExtraTap` in `AntdSearchBar`
- Added `feedbackDuration` and accepter properties to `AntdBox`
- Added optional haptic feedback (enabled by default with light feedback) for interactive components
- `AntdMaskHole` now supports controllable hit testing

## 5.0.3-alpha.1

- `AntdTheme` added support for `actionSheetStyle`, `dialogActionStyle`, and `modalActionStyle`
- `AntdProvider` removed support for default Overlay
- Added `AntdIconWrap` to support mixed usage of `IconData` and `AntdBox`
- Optimized style naming for `AntdPopoverStyle`
- Added `AntdModalType` for `AntdModal` and `AntdDialogType` for `AntdDialog`, allowing customization of different styles in dynamic styling
- Fixed an issue where the default state of `AntdSwitch` might be incorrect

## 5.0.4-alpha.1

- Fully adapted for dark mode
- Removed `DoubleExtensions`
- Removed default`_` properties from `AntdSize` and `AntdColor`
- Added dark/light theme switching in Examples
- Improved API documentation for Theme-related features
