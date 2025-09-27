# Changelog

## 5.0.7-alpha.1
- Refactored the `AntdBox` event model, fixing the issue where long press would accidentally trigger click events. Removed the `AntdTapAccepter` property and added `alwaysReceiveTap`.
- Fixed the issue where `AntdAnimation` was not merging correctly.
- Improved the context menu for `AntdInput`.
- Added `AntdScrollControllerProvider` to allow accessing scroll information in the context.
- Updated `AntdSelector's` value from Set to List because Set does not support serialization.
- Fixed the style priority issue for `AntdAction`.
- Updated animations for `AntdSwipeAction`.

## 5.0.6-alpha.1
- Added a `hapticFeedback` option to `AntdIndexBar`, supporting configuration at both the `Style` and property levels.
- Changed the default behavior of `AntdButton` to be non-click-through.
- Renamed `AntdCheckboxStyle`'s `defaultIconStyle` to `iconStyle` and `defaultIcon` to `icon`.
- Fixed the issue where `AntdEllipsis` ignored the length of the `...` ellipsis.
- Simplified `AntdForm` properties by removing `header` and `footer`, as they were of limited practical use and complicated implementation due to the use of `Column`.
- Updated `AntdPageIndicatorStyle`'s `bodyStyle` to `style`.
- Removed the default `obscureIcon` and `activeObscureIcon` from `AntdInputStyle`.
- Added `headers` and `footers` options to `AntdList` to facilitate customization with Slivers-based widgets.
- Fixed the issue where `AntdPopup` did not apply the global styles from `AntdTheme`.
- Added a new `fill` option to `AntdColor`.
- Adjusted the `Style` priority order. The new priority is: `styleBuilder` on the component > `style` on the component > `AntdStyleProvider` > `AntdStyleBuilderProvider`.
- Optimized the performance of `AntdProvider`.


## 5.0.5-alpha.1
- `AntdPopover`, `AntdDropdown`, `AntdToast`, `AntdTour`, `AntdMask`, `AntdPopup`, `AntdCascader`, `AntdActionSheet`, `AntdModal`, and `AntdDialog` now support custom `animations` via the animation property.
- `AntdMaskHole` now supports clipping using `AntdMaskHoleClipper`.
- Fixed animation performance issues with `AntdSwitch`.
- Updated animations for `AntdDropdown`.

## 5.0.4-alpha.1

- Fully adapted for dark mode
- Removed `DoubleExtensions`
- Removed default`_` properties from `AntdSize` and `AntdColor`
- Added dark/light theme switching in Examples
- Improved API documentation for Theme-related features

## 5.0.3-alpha.1

- `AntdTheme` added support for `actionSheetStyle`, `dialogActionStyle`, and `modalActionStyle`
- `AntdProvider` removed support for default Overlay
- Added `AntdIconWrap` to support mixed usage of `IconData` and `AntdBox`
- Optimized style naming for `AntdPopoverStyle`
- Added `AntdModalType` for `AntdModal` and `AntdDialogType` for `AntdDialog`, allowing customization of different styles in dynamic styling
- Fixed an issue where the default state of `AntdSwitch` might be incorrect

## 5.0.2-alpha.1

- Added new `AntdDropdown` component
- Improved test cases for Style.dart
- Optimized the display effect of `AntdSlider` when min and max values are set
- Changed onCancel to `onExtraTap` in `AntdSearchBar`
- Added `feedbackDuration` and accepter properties to `AntdBox`
- Added optional haptic feedback (enabled by default with light feedback) for interactive components
- `AntdMaskHole` now supports controllable hit testing

## 5.0.1-alpha.1

- Added fully property-supported static methods for `Toast`, `Mask`, `Popup`, `Dialog`, `Modal`, `ActionSheet`, and included corresponding demos
- Improved documentation information in Readme
- Style system now supports inheritance property merging
- Fixed incorrect initial value display issue in Form
- Enhanced `AntdLog` functionality
- Added support for using `AntdProvider` without wrapping the root directory
- Demo improvements and refinements

## 5.0.0-alpha

- Initial version release
- Includes basic component system
