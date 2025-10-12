library antd_flutter_mobile;

import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/material.dart';

const defaultLightToken = AntdSeedToken(
    radius: 4,
    colorError: Color(0xffff3141),
    colorInfo: Color(0xff1677ff),
    colorLink: Color(0xff1677ff),
    colorPrimary: Color(0xff1677ff),
    colorSuccess: Color(0xff00b578),
    colorText: Color(0xff333333),
    colorBgBase: Color(0xffffffff),
    colorWarning: Color(0xffff8f1f),
    fontSize: 14,
    lineWidth: 1,
    sizeStep: 4,
    sizeUnit: 2,
    arrow: Size(16, 8));

const defaultLightTheme = AntdTheme(token: defaultLightToken);

const defaultDartOpacity = AntdOpacityDefine(
    colorFillSecondary: 0.12,
    colorFillTertiary: 0.086,
    colorFillQuaternary: 0.04,
    colorBorder: 6.6,
    colorBorderSecondary: 4);
const defaultDartToken = AntdSeedToken(
    radius: 4,
    colorError: Color(0xffff4a58),
    colorInfo: Color(0xff3086ff),
    colorLink: Color(0xff3086ff),
    colorPrimary: Color(0xff3086ff),
    colorSuccess: Color(0xff34b368),
    colorText: Color(0xffe6e6e6),
    colorBgBase: Color(0xff1a1a1a),
    colorWarning: Color(0xffffa930),
    fontSize: 14,
    lineWidth: 1,
    sizeStep: 4,
    sizeUnit: 2,
    opacityDefine: defaultDartOpacity,
    arrow: Size(16, 8));

const defaultDartTheme = AntdTheme(token: defaultDartToken);

enum AntdThemeMode { light, dark }

typedef AntdThemeConfigurator = void Function(
  AntdThemeMode mode, {
  List<AntdThemeAlgorithm>? algorithms,
  AntdSeedToken? seedToken,
});

class AntdThemeProvider extends InheritedWidget {
  final AntdTheme theme;
  final AntdThemeConfigurator? configure;

  const AntdThemeProvider(
      {super.key, required super.child, required this.theme, this.configure});

  @override
  bool updateShouldNotify(AntdThemeProvider oldWidget) {
    return theme != oldWidget.theme;
  }
}

class AntdMapTokenProvider extends InheritedWidget {
  final AntdMapToken mapToken;

  const AntdMapTokenProvider(
      {super.key, required super.child, required this.mapToken});

  @override
  bool updateShouldNotify(AntdMapTokenProvider oldWidget) {
    return mapToken != oldWidget.mapToken;
  }
}

/// theme
class AntdTheme {
  ///亮或者暗主题
  final AntdThemeMode mode;

  ///基础Token
  final AntdSeedToken? token;

  ///主题算法
  final List<AntdThemeAlgorithm> algorithms;

  ///[AntdBox]样式
  final AntdStyleBuilder<AntdBoxStyle, AntdBox>? boxStyle;

  ///[AntdBox]样式
  final AntdStyleBuilder<AntdTabsStyle, AntdCapsuleTabs>? capsuleTabsStyle;

  ///[AntdBox]样式
  final AntdStyleBuilder<AntdBoxStyle, AntdPullToRefresh>? pullToRefreshStyle;

  ///[AntdTabs]样式
  final AntdStyleBuilder<AntdTabsStyle, AntdTabs>? tabsStyle;

  ///[AntdJumboTabs]样式
  final AntdStyleBuilder<AntdJumboStyle, AntdJumboTabs>? jumboStyle;

  ///[AntdSwitch]样式
  final AntdStyleBuilder<AntdSwitchStyle, AntdSwitch>? switchStyle;

  ///[AntdSwiper]样式
  final AntdStyleBuilder<AntdSwiperStyle, AntdSwiper>? swiperStyle;

  ///[AntdSwipeAction]样式
  final AntdStyleBuilder<AntdSwipeActionStyle, AntdSwipeAction>?
      swipeActionStyle;

  ///[AntdForm]样式
  final AntdStyleBuilder<AntdBoxStyle, AntdForm>? formStyle;

  ///[AntdSteps]样式
  final AntdStyleBuilder<AntdStepsStyle, AntdSteps>? stepsStyle;

  ///[AntdSlider]样式
  final AntdStyleBuilder<AntdSliderStyle, AntdSlider>? sliderStyle;

  ///[AntdSkeleton]样式
  final AntdStyleBuilder<AntdSkeletonStyle, AntdSkeleton>? skeletonStyle;

  ///[AntdActionSheet]样式
  final AntdStyleBuilder<AntdActionSheetStyle, AntdActionSheet>?
      actionSheetStyle;

  ///[AntdSheetAction]样式
  final AntdStyleBuilder<AntdActionStyle, AntdSheetAction>? sheetActionStyle;

  ///[AntdSelector]样式
  final AntdStyleBuilder<AntdSelectorStyle, AntdSelector>? selectorStyle;

  ///[AntdSegmented]样式
  final AntdStyleBuilder<AntdSegmentedStyle, AntdSegmented>? segmentedStyle;

  ///[AntdResult]样式
  final AntdStyleBuilder<AntdResultStyle, AntdResult>? resultStyle;

  ///[AntdRadio]样式
  final AntdStyleBuilder<AntdRadioStyle, AntdRadio>? radioStyle;

  ///[AntdProgressCircle]样式
  final AntdStyleBuilder<AntdProgressCircleStyle, AntdProgressCircle>?
      progressCircleStyle;

  ///[AntdProgressBar]样式
  final AntdStyleBuilder<AntdProgressBarStyle, AntdProgressBar>?
      progressBarStyle;

  ///[AntdPopup]样式
  final AntdStyleBuilder<AntdPopupStyle, AntdPopup>? popupStyle;

  ///[AntdPopover]样式
  final AntdStyleBuilder<AntdPopoverStyle, AntdPopover>? popoverStyle;

  ///[AntdMask]样式
  final AntdStyleBuilder<AntdMaskStyle, AntdMask>? maskStyle;

  /// [AntdLoading] 样式
  final AntdStyleBuilder<AntdLoadingStyle, AntdLoading>? loadingStyle;

  /// [AntdList] 样式
  final AntdStyleBuilder<AntdListStyle, AntdList>? listStyle;

  /// [AntdInput] 样式
  final AntdStyleBuilder<AntdInputStyle, AntdInput>? inputStyle;

  /// [AntdInput] 样式
  final AntdStyleBuilder<AntdInputStyle, AntdTextArea>? textAreaStyle;

  /// [AntdPageIndicator] 样式
  final AntdStyleBuilder<AntdPageIndicatorStyle, AntdPageIndicator>?
      pageIndicatorStyle;

  /// [AntdImage] 样式
  final AntdStyleBuilder<AntdImageStyle, AntdImage>? imageStyle;

  /// [AntdIcon] 样式
  final AntdStyleBuilder<AntdIconStyle, AntdIcon>? iconStyle;

  /// [AntdFormItem] 样式
  final AntdStyleBuilder<AntdFormItemStyle, AntdFormItem>? formItemStyle;

  /// [AntdFooter] 样式
  final AntdStyleBuilder<AntdFooterStyle, AntdFooter>? footerStyle;

  /// [AntdFloatingPanel] 样式
  final AntdStyleBuilder<AntdFloatingPanelStyle, AntdFloatingPanel>?
      floatingPanelStyle;

  /// [AntdEmpty] 样式
  final AntdStyleBuilder<AntdEmptyStyle, AntdEmpty>? emptyStyle;

  /// [AntdEllipsis] 样式
  final AntdStyleBuilder<AntdEllipsisStyle, AntdEllipsis>? ellipsisStyle;

  /// [AntdDivider] 样式
  final AntdStyleBuilder<AntdDividerStyle, AntdDivider>? dividerStyle;

  /// [AntdCollapse] 样式
  final AntdStyleBuilder<AntdCollapseStyle, AntdCollapse>? collapseStyle;

  /// [AntdCheckbox] 样式
  final AntdStyleBuilder<AntdCheckboxStyle, AntdCheckbox>? checkboxStyle;

  /// [AntdCascader] 样式
  final AntdStyleBuilder<AntdCascaderStyle, AntdCascader>? cascaderStyle;

  /// [AntdCascaderView] 样式
  final AntdStyleBuilder<AntdCascaderViewStyle, AntdCascaderView>?
      cascaderViewStyle;

  /// [AntdCard] 样式
  final AntdStyleBuilder<AntdCardStyle, AntdCard>? cardStyle;

  /// [AntdButton] 样式
  final AntdStyleBuilder<AntdButtonStyle, AntdButton>? buttonStyle;

  /// [AntdErrorBlock] 样式
  final AntdStyleBuilder<AntdErrorBlockStyle, AntdErrorBlock>? errorBlockStyle;

  /// [AntdIndexBar] 样式
  final AntdStyleBuilder<AntdIndexBarStyle, AntdIndexBar>? indexBarStyle;

  /// [AntdNavBar] 样式
  final AntdStyleBuilder<AntdNavBarStyle, AntdNavBar>? navBarStyle;

  /// [AntdNoticeBar] 样式
  final AntdStyleBuilder<AntdNoticeBarStyle, AntdNoticeBar>? noticeBarStyle;

  /// [AntdSearchBar] 样式
  final AntdStyleBuilder<AntdSearchBarStyle, AntdSearchBar>? searchBarStyle;

  /// [AntdSliderBar] 样式
  final AntdStyleBuilder<AntdSliderBarStyle, AntdSliderBar>? sliderBarStyle;

  /// [AntdTabBar] 样式
  final AntdStyleBuilder<AntdTabBarStyle, AntdTabBar>? tabBarStyle;

  /// [AntdBadge] 样式
  final AntdStyleBuilder<AntdBadgeStyle, AntdBadge>? badgeStyle;

  /// [AntdTag] 样式
  final AntdStyleBuilder<AntdTagStyle, AntdTag>? tagStyle;

  /// [AntdAvatar] 样式
  final AntdStyleBuilder<AntdImageStyle, AntdAvatar>? avatarStyle;

  /// [AntdToast] 样式
  final AntdStyleBuilder<AntdToastStyle, AntdToast>? toastStyle;

  /// [AntdDialog] 样式
  final AntdStyleBuilder<AntdDialogStyle, AntdDialog>? dialogStyle;

  /// [AntdDialogAction] 样式
  final AntdStyleBuilder<AntdActionStyle, AntdDialogAction>? dialogActionStyle;

  /// [AntdModal] 样式
  final AntdStyleBuilder<AntdModalStyle, AntdModal>? modalStyle;

  /// [AntdModalAction] 样式
  final AntdStyleBuilder<AntdActionStyle, AntdModalAction>? modalActionStyle;

  /// [AntdTour] 样式
  final AntdStyleBuilder<AntdTourStyle, AntdTour>? tourStyle;

  const AntdTheme(
      {this.mode = AntdThemeMode.light,
      this.token,
      this.algorithms = const [],
      this.boxStyle,
      this.capsuleTabsStyle,
      this.pullToRefreshStyle,
      this.dialogStyle,
      this.dialogActionStyle,
      this.tabsStyle,
      this.jumboStyle,
      this.switchStyle,
      this.swiperStyle,
      this.swipeActionStyle,
      this.formStyle,
      this.stepsStyle,
      this.sliderStyle,
      this.skeletonStyle,
      this.actionSheetStyle,
      this.sheetActionStyle,
      this.selectorStyle,
      this.segmentedStyle,
      this.resultStyle,
      this.radioStyle,
      this.progressCircleStyle,
      this.progressBarStyle,
      this.popupStyle,
      this.popoverStyle,
      this.maskStyle,
      this.loadingStyle,
      this.listStyle,
      this.inputStyle,
      this.textAreaStyle,
      this.pageIndicatorStyle,
      this.imageStyle,
      this.iconStyle,
      this.formItemStyle,
      this.footerStyle,
      this.floatingPanelStyle,
      this.emptyStyle,
      this.ellipsisStyle,
      this.dividerStyle,
      this.collapseStyle,
      this.checkboxStyle,
      this.cascaderStyle,
      this.cascaderViewStyle,
      this.cardStyle,
      this.buttonStyle,
      this.errorBlockStyle,
      this.indexBarStyle,
      this.navBarStyle,
      this.noticeBarStyle,
      this.searchBarStyle,
      this.sliderBarStyle,
      this.tabBarStyle,
      this.badgeStyle,
      this.tagStyle,
      this.avatarStyle,
      this.toastStyle,
      this.modalStyle,
      this.modalActionStyle,
      this.tourStyle});

  AntdTheme copyWith({
    AntdThemeMode? mode,
    AntdSeedToken? token,
    List<AntdThemeAlgorithm>? algorithms,
    AntdStyleBuilder<AntdBoxStyle, AntdBox>? boxStyle,
    AntdStyleBuilder<AntdTabsStyle, AntdCapsuleTabs>? capsuleTabsStyle,
    AntdStyleBuilder<AntdBoxStyle, AntdPullToRefresh>? pullToRefreshStyle,
    AntdStyleBuilder<AntdTabsStyle, AntdTabs>? tabsStyle,
    AntdStyleBuilder<AntdJumboStyle, AntdJumboTabs>? jumboStyle,
    AntdStyleBuilder<AntdSwitchStyle, AntdSwitch>? switchStyle,
    AntdStyleBuilder<AntdSwiperStyle, AntdSwiper>? swiperStyle,
    AntdStyleBuilder<AntdSwipeActionStyle, AntdSwipeAction>? swipeActionStyle,
    AntdStyleBuilder<AntdBoxStyle, AntdForm>? formStyle,
    AntdStyleBuilder<AntdStepsStyle, AntdSteps>? stepsStyle,
    AntdStyleBuilder<AntdSliderStyle, AntdSlider>? sliderStyle,
    AntdStyleBuilder<AntdSkeletonStyle, AntdSkeleton>? skeletonStyle,
    AntdStyleBuilder<AntdActionSheetStyle, AntdActionSheet>? actionSheetStyle,
    AntdStyleBuilder<AntdActionStyle, AntdSheetAction>? sheetActionStyle,
    AntdStyleBuilder<AntdSelectorStyle, AntdSelector>? selectorStyle,
    AntdStyleBuilder<AntdSegmentedStyle, AntdSegmented>? segmentedStyle,
    AntdStyleBuilder<AntdResultStyle, AntdResult>? resultStyle,
    AntdStyleBuilder<AntdRadioStyle, AntdRadio>? radioStyle,
    AntdStyleBuilder<AntdProgressCircleStyle, AntdProgressCircle>?
        progressCircleStyle,
    AntdStyleBuilder<AntdProgressBarStyle, AntdProgressBar>? progressBarStyle,
    AntdStyleBuilder<AntdPopupStyle, AntdPopup>? popupStyle,
    AntdStyleBuilder<AntdPopoverStyle, AntdPopover>? popoverStyle,
    AntdStyleBuilder<AntdMaskStyle, AntdMask>? maskStyle,
    AntdStyleBuilder<AntdLoadingStyle, AntdLoading>? loadingStyle,
    AntdStyleBuilder<AntdListStyle, AntdList>? listStyle,
    AntdStyleBuilder<AntdInputStyle, AntdInput>? inputStyle,
    AntdStyleBuilder<AntdInputStyle, AntdTextArea>? textAreaStyle,
    AntdStyleBuilder<AntdPageIndicatorStyle, AntdPageIndicator>?
        pageIndicatorStyle,
    AntdStyleBuilder<AntdImageStyle, AntdImage>? imageStyle,
    AntdStyleBuilder<AntdIconStyle, AntdIcon>? iconStyle,
    AntdStyleBuilder<AntdFormItemStyle, AntdFormItem>? formItemStyle,
    AntdStyleBuilder<AntdFooterStyle, AntdFooter>? footerStyle,
    AntdStyleBuilder<AntdFloatingPanelStyle, AntdFloatingPanel>?
        floatingPanelStyle,
    AntdStyleBuilder<AntdEmptyStyle, AntdEmpty>? emptyStyle,
    AntdStyleBuilder<AntdEllipsisStyle, AntdEllipsis>? ellipsisStyle,
    AntdStyleBuilder<AntdDividerStyle, AntdDivider>? dividerStyle,
    AntdStyleBuilder<AntdCollapseStyle, AntdCollapse>? collapseStyle,
    AntdStyleBuilder<AntdCheckboxStyle, AntdCheckbox>? checkboxStyle,
    AntdStyleBuilder<AntdCascaderStyle, AntdCascader>? cascaderStyle,
    AntdStyleBuilder<AntdCascaderViewStyle, AntdCascaderView>?
        cascaderViewStyle,
    AntdStyleBuilder<AntdCardStyle, AntdCard>? cardStyle,
    AntdStyleBuilder<AntdButtonStyle, AntdButton>? buttonStyle,
    AntdStyleBuilder<AntdErrorBlockStyle, AntdErrorBlock>? errorBlockStyle,
    AntdStyleBuilder<AntdIndexBarStyle, AntdIndexBar>? indexBarStyle,
    AntdStyleBuilder<AntdNavBarStyle, AntdNavBar>? navBarStyle,
    AntdStyleBuilder<AntdNoticeBarStyle, AntdNoticeBar>? noticeBarStyle,
    AntdStyleBuilder<AntdSearchBarStyle, AntdSearchBar>? searchBarStyle,
    AntdStyleBuilder<AntdSliderBarStyle, AntdSliderBar>? sliderBarStyle,
    AntdStyleBuilder<AntdTabBarStyle, AntdTabBar>? tabBarStyle,
    AntdStyleBuilder<AntdBadgeStyle, AntdBadge>? badgeStyle,
    AntdStyleBuilder<AntdTagStyle, AntdTag>? tagStyle,
    AntdStyleBuilder<AntdImageStyle, AntdAvatar>? avatarStyle,
    AntdStyleBuilder<AntdToastStyle, AntdToast>? toastStyle,
    AntdStyleBuilder<AntdDialogStyle, AntdDialog>? dialogStyle,
    AntdStyleBuilder<AntdActionStyle, AntdDialogAction>? dialogActionStyle,
    AntdStyleBuilder<AntdModalStyle, AntdModal>? modalStyle,
    AntdStyleBuilder<AntdActionStyle, AntdModalAction>? modalActionStyle,
    AntdStyleBuilder<AntdTourStyle, AntdTour>? tourStyle,
  }) {
    return AntdTheme(
      mode: mode ?? this.mode,
      token: token ?? this.token,
      algorithms: algorithms ?? this.algorithms,
      boxStyle: boxStyle ?? this.boxStyle,
      capsuleTabsStyle: capsuleTabsStyle ?? this.capsuleTabsStyle,
      pullToRefreshStyle: pullToRefreshStyle ?? this.pullToRefreshStyle,
      tabsStyle: tabsStyle ?? this.tabsStyle,
      jumboStyle: jumboStyle ?? this.jumboStyle,
      switchStyle: switchStyle ?? this.switchStyle,
      swiperStyle: swiperStyle ?? this.swiperStyle,
      swipeActionStyle: swipeActionStyle ?? this.swipeActionStyle,
      formStyle: formStyle ?? this.formStyle,
      stepsStyle: stepsStyle ?? this.stepsStyle,
      sliderStyle: sliderStyle ?? this.sliderStyle,
      skeletonStyle: skeletonStyle ?? this.skeletonStyle,
      actionSheetStyle: actionSheetStyle ?? this.actionSheetStyle,
      sheetActionStyle: sheetActionStyle ?? this.sheetActionStyle,
      selectorStyle: selectorStyle ?? this.selectorStyle,
      segmentedStyle: segmentedStyle ?? this.segmentedStyle,
      resultStyle: resultStyle ?? this.resultStyle,
      radioStyle: radioStyle ?? this.radioStyle,
      progressCircleStyle: progressCircleStyle ?? this.progressCircleStyle,
      progressBarStyle: progressBarStyle ?? this.progressBarStyle,
      popupStyle: popupStyle ?? this.popupStyle,
      popoverStyle: popoverStyle ?? this.popoverStyle,
      maskStyle: maskStyle ?? this.maskStyle,
      loadingStyle: loadingStyle ?? this.loadingStyle,
      listStyle: listStyle ?? this.listStyle,
      inputStyle: inputStyle ?? this.inputStyle,
      textAreaStyle: textAreaStyle ?? this.textAreaStyle,
      pageIndicatorStyle: pageIndicatorStyle ?? this.pageIndicatorStyle,
      imageStyle: imageStyle ?? this.imageStyle,
      iconStyle: iconStyle ?? this.iconStyle,
      formItemStyle: formItemStyle ?? this.formItemStyle,
      footerStyle: footerStyle ?? this.footerStyle,
      floatingPanelStyle: floatingPanelStyle ?? this.floatingPanelStyle,
      emptyStyle: emptyStyle ?? this.emptyStyle,
      ellipsisStyle: ellipsisStyle ?? this.ellipsisStyle,
      dividerStyle: dividerStyle ?? this.dividerStyle,
      collapseStyle: collapseStyle ?? this.collapseStyle,
      checkboxStyle: checkboxStyle ?? this.checkboxStyle,
      cascaderStyle: cascaderStyle ?? this.cascaderStyle,
      cascaderViewStyle: cascaderViewStyle ?? this.cascaderViewStyle,
      cardStyle: cardStyle ?? this.cardStyle,
      buttonStyle: buttonStyle ?? this.buttonStyle,
      errorBlockStyle: errorBlockStyle ?? this.errorBlockStyle,
      indexBarStyle: indexBarStyle ?? this.indexBarStyle,
      navBarStyle: navBarStyle ?? this.navBarStyle,
      noticeBarStyle: noticeBarStyle ?? this.noticeBarStyle,
      searchBarStyle: searchBarStyle ?? this.searchBarStyle,
      sliderBarStyle: sliderBarStyle ?? this.sliderBarStyle,
      tabBarStyle: tabBarStyle ?? this.tabBarStyle,
      badgeStyle: badgeStyle ?? this.badgeStyle,
      tagStyle: tagStyle ?? this.tagStyle,
      avatarStyle: avatarStyle ?? this.avatarStyle,
      toastStyle: toastStyle ?? this.toastStyle,
      dialogStyle: dialogStyle ?? this.dialogStyle,
      dialogActionStyle: dialogActionStyle ?? this.dialogActionStyle,
      modalStyle: modalStyle ?? this.modalStyle,
      modalActionStyle: modalActionStyle ?? this.modalActionStyle,
      tourStyle: tourStyle ?? this.tourStyle,
    );
  }

  static AntdThemeProvider? _of(BuildContext context) {
    var provider =
        context.dependOnInheritedWidgetOfExactType<AntdThemeProvider>();
    if (provider == null) {
      _log();
      return null;
    }
    return provider;
  }

  static AntdTheme of(BuildContext context) {
    var provider = _of(context);
    if (provider == null) {
      return defaultLightTheme;
    }
    return provider.theme;
  }

  static AntdThemeMode ofMode(BuildContext context) {
    var provider = _of(context);
    if (provider == null) {
      return AntdThemeMode.light;
    }
    return provider.theme.mode;
  }

  static AntdMapToken ofToken(BuildContext context) {
    var provider =
        context.dependOnInheritedWidgetOfExactType<AntdMapTokenProvider>();
    if (provider?.mapToken == null) {
      _log();
      return light(defaultLightToken, null);
    }
    return provider!.mapToken;
  }

  static void configure(
    BuildContext context,
    AntdThemeMode mode, {
    List<AntdThemeAlgorithm>? algorithms,
    AntdSeedToken? seedToken,
  }) {
    var provider = _of(context);
    if (provider == null || provider.configure == null) {
      return;
    }

    provider.configure
        ?.call(mode, algorithms: algorithms, seedToken: seedToken);
  }

  static void _log() {
    AntdLogs.i(
        msg: "Root not wrapped with AntdProvider. Using default theme.",
        docUrl: "guide",
        biz: "AntdTheme");
  }
}
