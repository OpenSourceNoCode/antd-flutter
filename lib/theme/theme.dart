import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/material.dart';

class AntdThemeProvider extends InheritedWidget {
  final AntdTheme theme;

  const AntdThemeProvider(
      {super.key, required super.child, required this.theme});

  @override
  bool updateShouldNotify(AntdThemeProvider oldWidget) {
    return theme != oldWidget.theme;
  }
}

class AntdTheme {
  final AntdAliasToken token;

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
  final AntdStyleBuilder<AntdFormStyle, AntdForm>? formStyle;

  ///[AntdSteps]样式
  final AntdStyleBuilder<AntdStepsStyle, AntdSteps>? stepsStyle;

  ///[AntdSlider]样式
  final AntdStyleBuilder<AntdSliderStyle, AntdSlider>? sliderStyle;

  ///[AntdSkeleton]样式
  final AntdStyleBuilder<AntdSkeletonStyle, AntdSkeleton>? skeletonStyle;

  ///[AntdActionSheet]样式
  final AntdStyleBuilder<AntdActionSheetStyle, AntdActionSheet>?
      actionSheetStyle;

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
  final AntdStyleBuilder<AntdPopupStyle, AntdPopupInner>? popupStyle;

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

  /// [AntdCheckList] 样式
  final AntdStyleBuilder<AntdCheckListStyle, AntdCheckList>? checkListStyle;

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

  /// [AntdModal] 样式
  final AntdStyleBuilder<AntdDialogStyle, AntdModal>? modalStyle;

  /// [AntdTour] 样式
  final AntdStyleBuilder<AntdTourStyle, AntdTour>? tourStyle;

  const AntdTheme(
      {required this.token,
      this.boxStyle,
      this.capsuleTabsStyle,
      this.pullToRefreshStyle,
      this.dialogStyle,
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
      this.checkListStyle,
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
      this.tourStyle});

  static AntdTheme of(BuildContext context) {
    var provider =
        context.dependOnInheritedWidgetOfExactType<AntdThemeProvider>();
    if (provider?.theme == null) {
      AntdLogs.i(
          msg: "Root not wrapped with AntdProvider. Using default theme.",
          docUrl: "guide",
          biz: "AntdTheme");
      return defaultTheme;
    }
    return provider!.theme;
  }

  static AntdAliasToken ofToken(BuildContext context) {
    return of(context).token;
  }
}
