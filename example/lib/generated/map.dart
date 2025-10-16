import 'package:antd_flutter_mobile/index.dart';
import 'package:example/doc/map/custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';import 'package:flutter/rendering.dart';
Widget formMap(String name,Map<String,dynamic> properties){
if (name == 'AntdFlex'){
return antdFlexFormMap(properties);
}
if (name == 'AntdTour'){
return antdTourFormMap(properties);
}
if (name == 'AntdBox'){
return antdBoxFormMap(properties);
}
if (name == 'AntdButton'){
return antdButtonFormMap(properties);
}
if (name == 'AntdActionSheet'){
return antdActionSheetFormMap(properties);
}
if (name == 'AntdIcon'){
return antdIconFormMap(properties);
}
if (name == 'AntdDivider'){
return antdDividerFormMap(properties);
}
if (name == 'AntdDialog'){
return antdDialogFormMap(properties);
}
if (name == 'AntdCapsuleTabs'){
return antdCapsuleTabsFormMap(properties);
}
if (name == 'AntdEmpty'){
return antdEmptyFormMap(properties);
}
if (name == 'AntdErrorBlock'){
return antdErrorBlockFormMap(properties);
}
if (name == 'AntdIndexBar'){
return antdIndexBarFormMap(properties);
}
if (name == 'AntdJumboTabs'){
return antdJumboTabsFormMap(properties);
}
if (name == 'AntdLoading'){
return antdLoadingFormMap(properties);
}
if (name == 'AntdNavBar'){
return antdNavBarFormMap(properties);
}
if (name == 'AntdSliderBar'){
return antdSliderBarFormMap(properties);
}
if (name == 'AntdAvatar'){
return antdAvatarFormMap(properties);
}
if (name == 'AntdTabBar'){
return antdTabBarFormMap(properties);
}
if (name == 'AntdCard'){
return antdCardFormMap(properties);
}
if (name == 'AntdTabs'){
return antdTabsFormMap(properties);
}
if (name == 'AntdCollapse'){
return antdCollapseFormMap(properties);
}
if (name == 'AntdModal'){
return antdModalFormMap(properties);
}
if (name == 'AntdFloatingPanel'){
return antdFloatingPanelFormMap(properties);
}
if (name == 'AntdEllipsis'){
return antdEllipsisFormMap(properties);
}
if (name == 'AntdMask'){
return antdMaskFormMap(properties);
}
if (name == 'AntdPopover'){
return antdPopoverFormMap(properties);
}
if (name == 'AntdImage'){
return antdImageFormMap(properties);
}
if (name == 'AntdPageIndicator'){
return antdPageIndicatorFormMap(properties);
}
if (name == 'AntdList'){
return antdListFormMap(properties);
}
if (name == 'AntdPopup'){
return antdPopupFormMap(properties);
}
if (name == 'AntdProgressBar'){
return antdProgressBarFormMap(properties);
}
if (name == 'AntdProgressCircle'){
return antdProgressCircleFormMap(properties);
}
if (name == 'AntdSteps'){
return antdStepsFormMap(properties);
}
if (name == 'AntdSegmented'){
return antdSegmentedFormMap(properties);
}
if (name == 'AntdPullToRefresh'){
return antdPullToRefreshFormMap(properties);
}
if (name == 'AntdDropdown'){
return antdDropdownFormMap(properties);
}
if (name == 'AntdSwiper'){
return antdSwiperFormMap(properties);
}
if (name == 'AntdTag'){
return antdTagFormMap(properties);
}
if (name == 'AntdFooter'){
return antdFooterFormMap(properties);
}
if (name == 'AntdSkeleton'){
return antdSkeletonFormMap(properties);
}
if (name == 'AntdSwipeAction'){
return antdSwipeActionFormMap(properties);
}
if (name == 'AntdResult'){
return antdResultFormMap(properties);
}
if (name == 'AntdToast'){
return antdToastFormMap(properties);
}
if (name == 'AntdCascader'){
return antdCascaderFormMap(properties);
}
if (name == 'AntdCascaderView'){
return antdCascaderViewFormMap(properties);
}
if (name == 'AntdCheckList'){
return antdCheckListFormMap(properties);
}
if (name == 'AntdFormItem'){
return antdFormItemFormMap(properties);
}
if (name == 'AntdForm'){
return antdFormFormMap(properties);
}
if (name == 'AntdCheckbox'){
return antdCheckboxFormMap(properties);
}
if (name == 'AntdInput'){
return antdInputFormMap(properties);
}
if (name == 'AntdRadio'){
return antdRadioFormMap(properties);
}
if (name == 'AntdSearchBar'){
return antdSearchBarFormMap(properties);
}
if (name == 'AntdSelector'){
return antdSelectorFormMap(properties);
}
if (name == 'AntdSlider'){
return antdSliderFormMap(properties);
}
if (name == 'AntdSwitch'){
return antdSwitchFormMap(properties);
}
if (name == 'AntdTextArea'){
return antdTextAreaFormMap(properties);
}
if (name == 'AntdBadge'){
return antdBadgeFormMap(properties);
}
if (name == 'AntdNoticeBar'){
return antdNoticeBarFormMap(properties);
}
return const AntdBox();
}
Widget antdFlexFormMap(Map<String,dynamic> atr){
return AntdFlex(
key:_resolveValue(atr,'AntdFlex','key','Key',null),
style:_resolveValue(atr,'AntdFlex','style','AntdFlexStyle',null),
styleBuilder:_resolveValue(atr,'AntdFlex','styleBuilder','AntdStyleBuilder<AntdFlexStyle, AntdFlex>',null),
direction:_resolveValue(atr,'AntdFlex','direction','Axis',null),
children:_resolveValue(atr,'AntdFlex','children','List<Widget>',null),
);
}

Widget antdTourFormMap(Map<String,dynamic> atr){
return AntdTour(
key:_resolveValue(atr,'AntdTour','key','Key',null),
style:_resolveValue(atr,'AntdTour','style','AntdTourStyle',null),
styleBuilder:_resolveValue(atr,'AntdTour','styleBuilder','AntdStyleBuilder<AntdTourStyle, AntdTour>',null),
onClosed:_resolveValue(atr,'AntdTour','onClosed','VoidCallback',null),
onOpened:_resolveValue(atr,'AntdTour','onOpened','VoidCallback',null),
onMaskTap:_resolveValue(atr,'AntdTour','onMaskTap','VoidCallback',null),
builder:_resolveValue(atr,'AntdTour','builder','AntdMaskBuilder<AntdTourState>',null),
opacity:_resolveValue(atr,'AntdTour','opacity','AntdMaskOpacity',AntdMaskOpacity.thin),
dismissOnMaskTap:_resolveValue(atr,'AntdTour','dismissOnMaskTap','bool',true),
showMask:_resolveValue(atr,'AntdTour','showMask','bool',true),
child:_resolveValue(atr,'AntdTour','child','Widget',null),
controller:_resolveValue(atr,'AntdTour','controller','AntdTourController',null),
animation:_resolveValue(atr,'AntdTour','animation','AntdTourAnimation',null),
);
}

Widget antdBoxFormMap(Map<String,dynamic> atr){
return AntdBox(
key:_resolveValue(atr,'AntdBox','key','Key',null),
style:_resolveValue(atr,'AntdBox','style','AntdBoxStyle',null),
styleBuilder:_resolveValue(atr,'AntdBox','styleBuilder','AntdStyleBuilder<AntdBoxStyle, AntdBox>',null),
outerSafeArea:_resolveValue(atr,'AntdBox','outerSafeArea','AntdPosition',null),
innerSafeArea:_resolveValue(atr,'AntdBox','innerSafeArea','AntdPosition',null),
onLayout:_resolveValue(atr,'AntdBox','onLayout','AntdOnLayout',null),
onFocus:_resolveValue(atr,'AntdBox','onFocus','AntdOnFocus',null),
onTap:_resolveValue(atr,'AntdBox','onTap','VoidCallback',null),
onDoubleTap:_resolveValue(atr,'AntdBox','onDoubleTap','VoidCallback',null),
onLongPress:_resolveValue(atr,'AntdBox','onLongPress','VoidCallback',null),
disabled:_resolveValue(atr,'AntdBox','disabled','bool',null),
options:_resolveValue(atr,'AntdBox','options','AntdTapOptions',null),
child:_resolveValue(atr,'AntdBox','child','Widget',null),
focusNode:_resolveValue(atr,'AntdBox','focusNode','FocusNode',null),
);
}

Widget antdButtonFormMap(Map<String,dynamic> atr){
return AntdButton(
key:_resolveValue(atr,'AntdButton','key','Key',null),
style:_resolveValue(atr,'AntdButton','style','AntdButtonStyle',null),
styleBuilder:_resolveValue(atr,'AntdButton','styleBuilder','AntdStyleBuilder<AntdButtonStyle, AntdButton>',null),
block:_resolveValue(atr,'AntdButton','block','bool',null),
color:_resolveValue(atr,'AntdButton','color','AntdColor',AntdColor.primary),
disabled:_resolveValue(atr,'AntdButton','disabled','bool',null),
fill:_resolveValue(atr,'AntdButton','fill','AntdButtonFill',AntdButtonFill.solid),
shape:_resolveValue(atr,'AntdButton','shape','AntdButtonShape',null),
size:_resolveValue(atr,'AntdButton','size','AntdSize',AntdSize.middle),
onTap:_resolveValue(atr,'AntdButton','onTap','GestureTapCallback',null),
onLoadingTap:_resolveValue(atr,'AntdButton','onLoadingTap','FutureVoidCallback',null),
icon:_resolveValue(atr,'AntdButton','icon','Widget',null),
child:_resolveValue(atr,'AntdButton','child','Widget',null),
loading:_resolveValue(atr,'AntdButton','loading','bool',null),
throttle:_resolveValue(atr,'AntdButton','throttle','Duration',null),
debounce:_resolveValue(atr,'AntdButton','debounce','Duration',null),
behavior:_resolveValue(atr,'AntdButton','behavior','HitTestBehavior',null),
);
}

Widget antdActionSheetFormMap(Map<String,dynamic> atr){
return AntdActionSheet(
key:_resolveValue(atr,'AntdActionSheet','key','Key',null),
style:_resolveValue(atr,'AntdActionSheet','style','AntdActionSheetStyle',null),
styleBuilder:_resolveValue(atr,'AntdActionSheet','styleBuilder','AntdStyleBuilder<AntdActionSheetStyle, AntdActionSheet>',null),
onClosed:_resolveValue(atr,'AntdActionSheet','onClosed','VoidCallback',null),
onOpened:_resolveValue(atr,'AntdActionSheet','onOpened','VoidCallback',null),
onMaskTap:_resolveValue(atr,'AntdActionSheet','onMaskTap','VoidCallback',null),
dismissOnMaskTap:_resolveValue(atr,'AntdActionSheet','dismissOnMaskTap','bool',true),
opacity:_resolveValue(atr,'AntdActionSheet','opacity','AntdMaskOpacity',null),
showMask:_resolveValue(atr,'AntdActionSheet','showMask','bool',true),
actions:_resolveValue(atr,'AntdActionSheet','actions','List<AntdSheetAction>',null),
cancelText:_resolveValue(atr,'AntdActionSheet','cancelText','Widget',null),
dismissOnAction:_resolveValue(atr,'AntdActionSheet','dismissOnAction','bool',true),
extra:_resolveValue(atr,'AntdActionSheet','extra','Widget',null),
onAction:_resolveValue(atr,'AntdActionSheet','onAction','AntdActionCallback',null),
safeArea:_resolveValue(atr,'AntdActionSheet','safeArea','bool',true),
animation:_resolveValue(atr,'AntdActionSheet','animation','AntdActionSheetAnimation',null),
);
}

Widget antdIconFormMap(Map<String,dynamic> atr){
return AntdIcon(
key:_resolveValue(atr,'AntdIcon','key','Key',null),
style:_resolveValue(atr,'AntdIcon','style','AntdIconStyle',null),
styleBuilder:_resolveValue(atr,'AntdIcon','styleBuilder','AntdStyleBuilder<AntdIconStyle, AntdIcon>',null),
icon:_resolveValue(atr,'AntdIcon','icon','IconData',null),
child:_resolveValue(atr,'AntdIcon','child','Widget',null),
row:_resolveValue(atr,'AntdIcon','row','bool',true),
reversed:_resolveValue(atr,'AntdIcon','reversed','bool',false),
onTap:_resolveValue(atr,'AntdIcon','onTap','VoidCallback',null),
);
}

Widget antdDividerFormMap(Map<String,dynamic> atr){
return AntdDivider(
key:_resolveValue(atr,'AntdDivider','key','Key',null),
style:_resolveValue(atr,'AntdDivider','style','AntdDividerStyle',null),
styleBuilder:_resolveValue(atr,'AntdDivider','styleBuilder','AntdStyleBuilder<AntdDividerStyle, AntdDivider>',null),
color:_resolveValue(atr,'AntdDivider','color','AntdColor',null),
child:_resolveValue(atr,'AntdDivider','child','Widget',null),
vertical:_resolveValue(atr,'AntdDivider','vertical','bool',false),
position:_resolveValue(atr,'AntdDivider','position','AntdDividerPosition',null),
);
}

Widget antdDialogFormMap(Map<String,dynamic> atr){
return AntdDialog(
key:_resolveValue(atr,'AntdDialog','key','Key',null),
style:_resolveValue(atr,'AntdDialog','style','AntdDialogStyle',null),
styleBuilder:_resolveValue(atr,'AntdDialog','styleBuilder','AntdStyleBuilder<AntdDialogStyle, AntdDialog>',null),
onClosed:_resolveValue(atr,'AntdDialog','onClosed','VoidCallback',null),
onOpened:_resolveValue(atr,'AntdDialog','onOpened','VoidCallback',null),
onMaskTap:_resolveValue(atr,'AntdDialog','onMaskTap','VoidCallback',null),
opacity:_resolveValue(atr,'AntdDialog','opacity','AntdMaskOpacity',null),
dismissOnMaskTap:_resolveValue(atr,'AntdDialog','dismissOnMaskTap','bool',true),
showMask:_resolveValue(atr,'AntdDialog','showMask','bool',true),
actions:_resolveValue(atr,'AntdDialog','actions','List<AntdDialogAction>',null),
dismissOnAction:_resolveValue(atr,'AntdDialog','dismissOnAction','bool',null),
builder:_resolveValue(atr,'AntdDialog','builder','AntdMaskBuilder<AntdDialogState>',null),
closeIcon:_resolveValue(atr,'AntdDialog','closeIcon','Widget',null),
header:_resolveValue(atr,'AntdDialog','header','Widget',null),
title:_resolveValue(atr,'AntdDialog','title','Widget',null),
type:_resolveValue(atr,'AntdDialog','type','AntdDialogType',AntdDialogType.normal),
animation:_resolveValue(atr,'AntdDialog','animation','AntdDialogAnimation',null),
);
}

Widget antdCapsuleTabsFormMap(Map<String,dynamic> atr){
return AntdCapsuleTabs(
key:_resolveValue(atr,'AntdCapsuleTabs','key','Key',null),
style:_resolveValue(atr,'AntdCapsuleTabs','style','AntdTabsStyle',null),
styleBuilder:_resolveValue(atr,'AntdCapsuleTabs','styleBuilder','AntdStyleBuilder<AntdTabsStyle, AntdTabs>',null),
leftExtra:_resolveValue(atr,'AntdCapsuleTabs','leftExtra','Widget',null),
rightExtra:_resolveValue(atr,'AntdCapsuleTabs','rightExtra','Widget',null),
controller:_resolveValue(atr,'AntdCapsuleTabs','controller','AntdTabController<AntdTab>',null),
activeValue:_resolveValue(atr,'AntdCapsuleTabs','activeValue','dynamic',null),
onChange:_resolveValue(atr,'AntdCapsuleTabs','onChange','AntdTabsOnChange<AntdTab>',null),
tabAlignment:_resolveValue(atr,'AntdCapsuleTabs','tabAlignment','AntdTabAlignment',AntdTabAlignment.center),
tabs:_resolveValue(atr,'AntdCapsuleTabs','tabs','List<AntdTab>',null),
hapticFeedback:_resolveValue(atr,'AntdCapsuleTabs','hapticFeedback','AntdHapticFeedback',null),
);
}

Widget antdEmptyFormMap(Map<String,dynamic> atr){
return AntdEmpty(
key:_resolveValue(atr,'AntdEmpty','key','Key',null),
style:_resolveValue(atr,'AntdEmpty','style','AntdEmptyStyle',null),
styleBuilder:_resolveValue(atr,'AntdEmpty','styleBuilder','AntdStyleBuilder<AntdEmptyStyle, AntdEmpty>',null),
image:_resolveValue(atr,'AntdEmpty','image','Widget',null),
description:_resolveValue(atr,'AntdEmpty','description','Widget',null),
);
}

Widget antdErrorBlockFormMap(Map<String,dynamic> atr){
return AntdErrorBlock(
key:_resolveValue(atr,'AntdErrorBlock','key','Key',null),
style:_resolveValue(atr,'AntdErrorBlock','style','AntdErrorBlockStyle',null),
styleBuilder:_resolveValue(atr,'AntdErrorBlock','styleBuilder','AntdStyleBuilder<AntdErrorBlockStyle, AntdErrorBlock>',null),
image:_resolveValue(atr,'AntdErrorBlock','image','Widget',null),
status:_resolveValue(atr,'AntdErrorBlock','status','AntdErrorBlockStatus',null),
title:_resolveValue(atr,'AntdErrorBlock','title','Widget',null),
desc:_resolveValue(atr,'AntdErrorBlock','desc','Widget',null),
fullPage:_resolveValue(atr,'AntdErrorBlock','fullPage','bool',null),
extra:_resolveValue(atr,'AntdErrorBlock','extra','Widget',null),
);
}

Widget antdIndexBarFormMap(Map<String,dynamic> atr){
return AntdIndexBar(
key:_resolveValue(atr,'AntdIndexBar','key','Key',null),
style:_resolveValue(atr,'AntdIndexBar','style','AntdIndexBarStyle',null),
styleBuilder:_resolveValue(atr,'AntdIndexBar','styleBuilder','AntdStyleBuilder<AntdIndexBarStyle, AntdIndexBar<T>>',null),
controller:_resolveValue(atr,'AntdIndexBar','controller','AntdIndexBarController<T>',null),
headers:_resolveValue(atr,'AntdIndexBar','headers','List<Widget>',null),
footers:_resolveValue(atr,'AntdIndexBar','footers','List<Widget>',null),
physics:_resolveValue(atr,'AntdIndexBar','physics','ScrollPhysics',null),
virtual:_resolveValue(atr,'AntdIndexBar','virtual','bool',true),
shrinkWrap:_resolveValue(atr,'AntdIndexBar','shrinkWrap','bool',null),
items:_resolveValue(atr,'AntdIndexBar','items','List<T>',null),
itemBuilder:_resolveValue(atr,'AntdIndexBar','itemBuilder','AntdScrollItemBuilder<T, AntdIndexBarController<T>>',null),
viewportOffset:_resolveValue(atr,'AntdIndexBar','viewportOffset','double',null),
onItemPosition:_resolveValue(atr,'AntdIndexBar','onItemPosition','AntdItemPositionListener<T>',null),
headerBuilder:_resolveValue(atr,'AntdIndexBar','headerBuilder','AntdIndexBarIndexBuilder',null),
indexBuilder:_resolveValue(atr,'AntdIndexBar','indexBuilder','AntdIndexBarIndexBuilder',null),
headerFloatBuilder:_resolveValue(atr,'AntdIndexBar','headerFloatBuilder','AntdIndexBarIndexBuilder',null),
onIndexChange:_resolveValue(atr,'AntdIndexBar','onIndexChange','AntdIndexBarOnIndexChange',null),
hapticFeedback:_resolveValue(atr,'AntdIndexBar','hapticFeedback','AntdHapticFeedback',null),
);
}

Widget antdJumboTabsFormMap(Map<String,dynamic> atr){
return AntdJumboTabs(
key:_resolveValue(atr,'AntdJumboTabs','key','Key',null),
style:_resolveValue(atr,'AntdJumboTabs','style','AntdJumboStyle',null),
styleBuilder:_resolveValue(atr,'AntdJumboTabs','styleBuilder','AntdStyleBuilder<AntdJumboStyle, AntdJumboTabs>',null),
leftExtra:_resolveValue(atr,'AntdJumboTabs','leftExtra','Widget',null),
rightExtra:_resolveValue(atr,'AntdJumboTabs','rightExtra','Widget',null),
controller:_resolveValue(atr,'AntdJumboTabs','controller','AntdTabController<AntdJumboTab>',null),
activeValue:_resolveValue(atr,'AntdJumboTabs','activeValue','dynamic',null),
onChange:_resolveValue(atr,'AntdJumboTabs','onChange','AntdTabsOnChange<AntdJumboTab>',null),
tabAlignment:_resolveValue(atr,'AntdJumboTabs','tabAlignment','AntdTabAlignment',AntdTabAlignment.center),
tabs:_resolveValue(atr,'AntdJumboTabs','tabs','List<AntdJumboTab>',null),
hapticFeedback:_resolveValue(atr,'AntdJumboTabs','hapticFeedback','AntdHapticFeedback',null),
);
}

Widget antdLoadingFormMap(Map<String,dynamic> atr){
return AntdLoading(
key:_resolveValue(atr,'AntdLoading','key','Key',null),
style:_resolveValue(atr,'AntdLoading','style','AntdLoadingStyle',null),
styleBuilder:_resolveValue(atr,'AntdLoading','styleBuilder','AntdStyleBuilder<AntdLoadingStyle, AntdLoading>',null),
size:_resolveValue(atr,'AntdLoading','size','double',null),
color:_resolveValue(atr,'AntdLoading','color','AntdColor',null),
text:_resolveValue(atr,'AntdLoading','text','Widget',null),
circular:_resolveValue(atr,'AntdLoading','circular','bool',false),
child:_resolveValue(atr,'AntdLoading','child','Widget',null),
spinning:_resolveValue(atr,'AntdLoading','spinning','bool',true),
);
}

Widget antdNavBarFormMap(Map<String,dynamic> atr){
return AntdNavBar(
key:_resolveValue(atr,'AntdNavBar','key','Key',null),
style:_resolveValue(atr,'AntdNavBar','style','AntdNavBarStyle',null),
styleBuilder:_resolveValue(atr,'AntdNavBar','styleBuilder','AntdStyleBuilder<AntdNavBarStyle, AntdNavBar>',null),
back:_resolveValue(atr,'AntdNavBar','back','Widget',null),
backIcon:_resolveValue(atr,'AntdNavBar','backIcon','Widget',null),
title:_resolveValue(atr,'AntdNavBar','title','Widget',null),
subTitle:_resolveValue(atr,'AntdNavBar','subTitle','Widget',null),
left:_resolveValue(atr,'AntdNavBar','left','Widget',null),
right:_resolveValue(atr,'AntdNavBar','right','Widget',null),
safeArea:_resolveValue(atr,'AntdNavBar','safeArea','AntdPosition',null),
onTap:_resolveValue(atr,'AntdNavBar','onTap','VoidCallback',null),
onBack:_resolveValue(atr,'AntdNavBar','onBack','VoidCallback',null),
);
}

Widget antdSliderBarFormMap(Map<String,dynamic> atr){
return AntdSliderBar(
key:_resolveValue(atr,'AntdSliderBar','key','Key',null),
style:_resolveValue(atr,'AntdSliderBar','style','AntdSliderBarStyle',null),
styleBuilder:_resolveValue(atr,'AntdSliderBar','styleBuilder','AntdStyleBuilder<AntdSliderBarStyle, AntdSliderBar>',null),
physics:_resolveValue(atr,'AntdSliderBar','physics','ScrollPhysics',const BouncingScrollPhysics()),
shrinkWrap:_resolveValue(atr,'AntdSliderBar','shrinkWrap','bool',null),
controller:_resolveValue(atr,'AntdSliderBar','controller','AntdSliderBarController',null),
onItemPosition:_resolveValue(atr,'AntdSliderBar','onItemPosition','AntdItemPositionListener<AntdSliderBarItem>',null),
throttle:_resolveValue(atr,'AntdSliderBar','throttle','Duration',null),
edgeThreshold:_resolveValue(atr,'AntdSliderBar','edgeThreshold','double',null),
onEdgeReached:_resolveValue(atr,'AntdSliderBar','onEdgeReached','AntdOnScrollEdge',null),
virtual:_resolveValue(atr,'AntdSliderBar','virtual','bool',false),
alignment:_resolveValue(atr,'AntdSliderBar','alignment','AntdEdge',null),
fit:_resolveValue(atr,'AntdSliderBar','fit','AntdScrollItemFit',AntdScrollItemFit.child),
scrollBehavior:_resolveValue(atr,'AntdSliderBar','scrollBehavior','ScrollBehavior',null),
cacheExtent:_resolveValue(atr,'AntdSliderBar','cacheExtent','double',1.5),
cacheExtentStyle:_resolveValue(atr,'AntdSliderBar','cacheExtentStyle','CacheExtentStyle',CacheExtentStyle.viewport),
items:_resolveValue(atr,'AntdSliderBar','items','List<AntdSliderBarItem>',null),
contentFit:_resolveValue(atr,'AntdSliderBar','contentFit','AntdScrollItemFit',null),
onChange:_resolveValue(atr,'AntdSliderBar','onChange','AntdSliderBarOnChange',null),
titlePlacement:_resolveValue(atr,'AntdSliderBar','titlePlacement','AntdEdge',AntdEdge.center),
hapticFeedback:_resolveValue(atr,'AntdSliderBar','hapticFeedback','AntdHapticFeedback',AntdHapticFeedback.light),
);
}

Widget antdAvatarFormMap(Map<String,dynamic> atr){
return AntdAvatar(
key:_resolveValue(atr,'AntdAvatar','key','Key',null),
style:_resolveValue(atr,'AntdAvatar','style','AntdImageStyle',null),
styleBuilder:_resolveValue(atr,'AntdAvatar','styleBuilder','AntdStyleBuilder<AntdImageStyle, AntdImage>',null),
image:_resolveValue(atr,'AntdAvatar','image','ImageProvider',null),
fit:_resolveValue(atr,'AntdAvatar','fit','BoxFit',null),
scale:_resolveValue(atr,'AntdAvatar','scale','double',1.0),
alignment:_resolveValue(atr,'AntdAvatar','alignment','AlignmentGeometry',Alignment.center),
repeat:_resolveValue(atr,'AntdAvatar','repeat','ImageRepeat',ImageRepeat.noRepeat),
filterQuality:_resolveValue(atr,'AntdAvatar','filterQuality','FilterQuality',FilterQuality.medium),
size:_resolveValue(atr,'AntdAvatar','size','double',45.0),
radius:_resolveValue(atr,'AntdAvatar','radius','double',null),
);
}

Widget antdTabBarFormMap(Map<String,dynamic> atr){
return AntdTabBar(
key:_resolveValue(atr,'AntdTabBar','key','Key',null),
style:_resolveValue(atr,'AntdTabBar','style','AntdTabBarStyle',null),
styleBuilder:_resolveValue(atr,'AntdTabBar','styleBuilder','AntdStyleBuilder<AntdTabBarStyle, AntdTabBar>',null),
activeIndex:_resolveValue(atr,'AntdTabBar','activeIndex','int',1),
onChange:_resolveValue(atr,'AntdTabBar','onChange','AntdTabBarOnChange',null),
safeArea:_resolveValue(atr,'AntdTabBar','safeArea','AntdPosition',null),
items:_resolveValue(atr,'AntdTabBar','items','List<AntdTabBarItem>',null),
);
}

Widget antdCardFormMap(Map<String,dynamic> atr){
return AntdCard(
key:_resolveValue(atr,'AntdCard','key','Key',null),
style:_resolveValue(atr,'AntdCard','style','AntdCardStyle',null),
styleBuilder:_resolveValue(atr,'AntdCard','styleBuilder','AntdStyleBuilder<AntdCardStyle, AntdCard>',null),
icon:_resolveValue(atr,'AntdCard','icon','Widget',null),
extra:_resolveValue(atr,'AntdCard','extra','Widget',null),
title:_resolveValue(atr,'AntdCard','title','Widget',null),
child:_resolveValue(atr,'AntdCard','child','Widget',null),
footer:_resolveValue(atr,'AntdCard','footer','Widget',null),
);
}

Widget antdTabsFormMap(Map<String,dynamic> atr){
return AntdTabs(
key:_resolveValue(atr,'AntdTabs','key','Key',null),
style:_resolveValue(atr,'AntdTabs','style','AntdTabsStyle',null),
styleBuilder:_resolveValue(atr,'AntdTabs','styleBuilder','AntdStyleBuilder<AntdTabsStyle, AntdTabs>',null),
leftExtra:_resolveValue(atr,'AntdTabs','leftExtra','Widget',null),
rightExtra:_resolveValue(atr,'AntdTabs','rightExtra','Widget',null),
controller:_resolveValue(atr,'AntdTabs','controller','AntdTabController<AntdTab>',null),
activeValue:_resolveValue(atr,'AntdTabs','activeValue','dynamic',null),
onChange:_resolveValue(atr,'AntdTabs','onChange','AntdTabsOnChange<AntdTab>',null),
tabAlignment:_resolveValue(atr,'AntdTabs','tabAlignment','AntdTabAlignment',AntdTabAlignment.center),
tabs:_resolveValue(atr,'AntdTabs','tabs','List<AntdTab>',null),
indicatorPosition:_resolveValue(atr,'AntdTabs','indicatorPosition','AntdIndicatorPosition',AntdIndicatorPosition.bottom),
indicatorMode:_resolveValue(atr,'AntdTabs','indicatorMode','AntdIndicatorMode',AntdIndicatorMode.fixed),
hapticFeedback:_resolveValue(atr,'AntdTabs','hapticFeedback','AntdHapticFeedback',null),
);
}

Widget antdCollapseFormMap(Map<String,dynamic> atr){
return AntdCollapse(
key:_resolveValue(atr,'AntdCollapse','key','Key',null),
style:_resolveValue(atr,'AntdCollapse','style','AntdCollapseStyle',null),
styleBuilder:_resolveValue(atr,'AntdCollapse','styleBuilder','AntdStyleBuilder<AntdCollapseStyle, AntdCollapse>',null),
items:_resolveValue(atr,'AntdCollapse','items','List<AntdCollapseItem>',null),
itemBuilder:_resolveValue(atr,'AntdCollapse','itemBuilder','AntdScrollItemBuilder<AntdCollapseItem, AntdCollapseController>',null),
shrinkWrap:_resolveValue(atr,'AntdCollapse','shrinkWrap','bool',true),
controller:_resolveValue(atr,'AntdCollapse','controller','AntdCollapseController',null),
value:_resolveValue(atr,'AntdCollapse','value','List<int>',null),
onChange:_resolveValue(atr,'AntdCollapse','onChange','AntdCollapseChange',null),
);
}

Widget antdModalFormMap(Map<String,dynamic> atr){
return AntdModal(
key:_resolveValue(atr,'AntdModal','key','Key',null),
style:_resolveValue(atr,'AntdModal','style','AntdModalStyle',null),
styleBuilder:_resolveValue(atr,'AntdModal','styleBuilder','AntdStyleBuilder<AntdModalStyle, AntdModal>',null),
onClosed:_resolveValue(atr,'AntdModal','onClosed','VoidCallback',null),
onOpened:_resolveValue(atr,'AntdModal','onOpened','VoidCallback',null),
onMaskTap:_resolveValue(atr,'AntdModal','onMaskTap','VoidCallback',null),
opacity:_resolveValue(atr,'AntdModal','opacity','AntdMaskOpacity',null),
dismissOnMaskTap:_resolveValue(atr,'AntdModal','dismissOnMaskTap','bool',true),
showMask:_resolveValue(atr,'AntdModal','showMask','bool',true),
actions:_resolveValue(atr,'AntdModal','actions','List<AntdModalAction>',null),
dismissOnAction:_resolveValue(atr,'AntdModal','dismissOnAction','bool',null),
builder:_resolveValue(atr,'AntdModal','builder','AntdMaskBuilder<AntdModalState>',null),
closeIcon:_resolveValue(atr,'AntdModal','closeIcon','Widget',null),
header:_resolveValue(atr,'AntdModal','header','Widget',null),
title:_resolveValue(atr,'AntdModal','title','Widget',null),
type:_resolveValue(atr,'AntdModal','type','AntdModalType',AntdModalType.normal),
animation:_resolveValue(atr,'AntdModal','animation','AntdModalAnimation',null),
);
}

Widget antdFloatingPanelFormMap(Map<String,dynamic> atr){
return AntdFloatingPanel(
key:_resolveValue(atr,'AntdFloatingPanel','key','Key',null),
style:_resolveValue(atr,'AntdFloatingPanel','style','AntdFloatingPanelStyle',null),
styleBuilder:_resolveValue(atr,'AntdFloatingPanel','styleBuilder','AntdStyleBuilder<AntdFloatingPanelStyle, AntdFloatingPanel>',null),
child:_resolveValue(atr,'AntdFloatingPanel','child','Widget',null),
content:_resolveValue(atr,'AntdFloatingPanel','content','Widget',null),
anchors:_resolveValue(atr,'AntdFloatingPanel','anchors','List<double>',null),
indicator:_resolveValue(atr,'AntdFloatingPanel','indicator','Widget',null),
onHeightChange:_resolveValue(atr,'AntdFloatingPanel','onHeightChange','AntdFloatingPanelHeightCallback',null),
position:_resolveValue(atr,'AntdFloatingPanel','position','AntdFloatingPanelPosition',AntdFloatingPanelPosition.bottom),
);
}

Widget antdEllipsisFormMap(Map<String,dynamic> atr){
return AntdEllipsis(
key:_resolveValue(atr,'AntdEllipsis','key','Key',null),
style:_resolveValue(atr,'AntdEllipsis','style','AntdEllipsisStyle',null),
styleBuilder:_resolveValue(atr,'AntdEllipsis','styleBuilder','AntdStyleBuilder<AntdEllipsisStyle, AntdEllipsis>',null),
content:_resolveValue(atr,'AntdEllipsis','content','String',null),
collapseText:_resolveValue(atr,'AntdEllipsis','collapseText','String',"收起"),
expandText:_resolveValue(atr,'AntdEllipsis','expandText','String',"展开"),
onTextTap:_resolveValue(atr,'AntdEllipsis','onTextTap','VoidCallback',null),
onExpandTap:_resolveValue(atr,'AntdEllipsis','onExpandTap','VoidCallback',null),
onCollapseTap:_resolveValue(atr,'AntdEllipsis','onCollapseTap','VoidCallback',null),
defaultExpanded:_resolveValue(atr,'AntdEllipsis','defaultExpanded','bool',false),
rows:_resolveValue(atr,'AntdEllipsis','rows','int',1),
);
}

Widget antdMaskFormMap(Map<String,dynamic> atr){
return AntdMask(
key:_resolveValue(atr,'AntdMask','key','Key',null),
style:_resolveValue(atr,'AntdMask','style','AntdMaskStyle',null),
styleBuilder:_resolveValue(atr,'AntdMask','styleBuilder','AntdStyleBuilder<AntdMaskStyle, AntdMask>',null),
onClosed:_resolveValue(atr,'AntdMask','onClosed','VoidCallback',null),
onOpened:_resolveValue(atr,'AntdMask','onOpened','VoidCallback',null),
onMaskTap:_resolveValue(atr,'AntdMask','onMaskTap','VoidCallback',null),
builder:_resolveValue(atr,'AntdMask','builder','AntdMaskBuilder<AntdMaskState>',null),
opacity:_resolveValue(atr,'AntdMask','opacity','AntdMaskOpacity',null),
dismissOnMaskTap:_resolveValue(atr,'AntdMask','dismissOnMaskTap','bool',true),
showMask:_resolveValue(atr,'AntdMask','showMask','bool',true),
hole:_resolveValue(atr,'AntdMask','hole','AntdMaskHole',null),
animation:_resolveValue(atr,'AntdMask','animation','AntdMaskAnimation',null),
);
}

Widget antdPopoverFormMap(Map<String,dynamic> atr){
return AntdPopover(
key:_resolveValue(atr,'AntdPopover','key','Key',null),
style:_resolveValue(atr,'AntdPopover','style','AntdPopoverStyle',null),
styleBuilder:_resolveValue(atr,'AntdPopover','styleBuilder','AntdStyleBuilder<AntdPopoverStyle, AntdPopover>',null),
onClosed:_resolveValue(atr,'AntdPopover','onClosed','VoidCallback',null),
onOpened:_resolveValue(atr,'AntdPopover','onOpened','VoidCallback',null),
onMaskTap:_resolveValue(atr,'AntdPopover','onMaskTap','VoidCallback',null),
builder:_resolveValue(atr,'AntdPopover','builder','AntdMaskBuilder<AntdPopoverState>',null),
opacity:_resolveValue(atr,'AntdPopover','opacity','AntdMaskOpacity',AntdMaskOpacity.transparent),
dismissOnMaskTap:_resolveValue(atr,'AntdPopover','dismissOnMaskTap','bool',true),
showMask:_resolveValue(atr,'AntdPopover','showMask','bool',true),
child:_resolveValue(atr,'AntdPopover','child','Widget',null),
dismissOnAction:_resolveValue(atr,'AntdPopover','dismissOnAction','bool',true),
actions:_resolveValue(atr,'AntdPopover','actions','List<AntdPopoverAction>',null),
placement:_resolveValue(atr,'AntdPopover','placement','AntdPlacement',AntdPlacement.top),
mode:_resolveValue(atr,'AntdPopover','mode','AntdPopoverMode',AntdPopoverMode.light),
controller:_resolveValue(atr,'AntdPopover','controller','AntdPopoverController',null),
trigger:_resolveValue(atr,'AntdPopover','trigger','AntdPopoverTrigger',AntdPopoverTrigger.tap),
hapticFeedback:_resolveValue(atr,'AntdPopover','hapticFeedback','AntdHapticFeedback',AntdHapticFeedback.light),
animation:_resolveValue(atr,'AntdPopover','animation','AntdPopoverAnimation',null),
);
}

Widget antdImageFormMap(Map<String,dynamic> atr){
return AntdImage(
key:_resolveValue(atr,'AntdImage','key','Key',null),
style:_resolveValue(atr,'AntdImage','style','AntdImageStyle',null),
styleBuilder:_resolveValue(atr,'AntdImage','styleBuilder','AntdStyleBuilder<AntdImageStyle, AntdImage>',null),
height:_resolveValue(atr,'AntdImage','height','double',null),
width:_resolveValue(atr,'AntdImage','width','double',null),
image:_resolveValue(atr,'AntdImage','image','ImageProvider',null),
fit:_resolveValue(atr,'AntdImage','fit','BoxFit',null),
scale:_resolveValue(atr,'AntdImage','scale','double',1.0),
alignment:_resolveValue(atr,'AntdImage','alignment','AlignmentGeometry',Alignment.center),
repeat:_resolveValue(atr,'AntdImage','repeat','ImageRepeat',ImageRepeat.noRepeat),
filterQuality:_resolveValue(atr,'AntdImage','filterQuality','FilterQuality',FilterQuality.medium),
);
}

Widget antdPageIndicatorFormMap(Map<String,dynamic> atr){
return AntdPageIndicator(
key:_resolveValue(atr,'AntdPageIndicator','key','Key',null),
style:_resolveValue(atr,'AntdPageIndicator','style','AntdPageIndicatorStyle',null),
styleBuilder:_resolveValue(atr,'AntdPageIndicator','styleBuilder','AntdStyleBuilder<AntdPageIndicatorStyle, AntdPageIndicator>',null),
color:_resolveValue(atr,'AntdPageIndicator','color','AntdColor',AntdColor.primary),
total:_resolveValue(atr,'AntdPageIndicator','total','int',0),
current:_resolveValue(atr,'AntdPageIndicator','current','int',0),
vertical:_resolveValue(atr,'AntdPageIndicator','vertical','bool',false),
);
}

Widget antdListFormMap(Map<String,dynamic> atr){
return AntdList(
key:_resolveValue(atr,'AntdList','key','Key',null),
style:_resolveValue(atr,'AntdList','style','AntdListStyle',null),
styleBuilder:_resolveValue(atr,'AntdList','styleBuilder','AntdStyleBuilder<AntdListStyle, AntdList<T>>',null),
edgeThreshold:_resolveValue(atr,'AntdList','edgeThreshold','double',null),
onEdgeReached:_resolveValue(atr,'AntdList','onEdgeReached','AntdOnScrollEdge',null),
controller:_resolveValue(atr,'AntdList','controller','AntdListController<T>',null),
cacheExtent:_resolveValue(atr,'AntdList','cacheExtent','double',1.5),
cacheExtentStyle:_resolveValue(atr,'AntdList','cacheExtentStyle','CacheExtentStyle',CacheExtentStyle.viewport),
physics:_resolveValue(atr,'AntdList','physics','ScrollPhysics',const BouncingScrollPhysics()),
dragStartBehavior:_resolveValue(atr,'AntdList','dragStartBehavior','DragStartBehavior',DragStartBehavior.start),
scrollBehavior:_resolveValue(atr,'AntdList','scrollBehavior','ScrollBehavior',const CupertinoScrollBehavior()),
vertical:_resolveValue(atr,'AntdList','vertical','bool',true),
reversed:_resolveValue(atr,'AntdList','reversed','bool',false),
shrinkWrap:_resolveValue(atr,'AntdList','shrinkWrap','bool',false),
virtual:_resolveValue(atr,'AntdList','virtual','bool',false),
fit:_resolveValue(atr,'AntdList','fit','AntdScrollItemFit',AntdScrollItemFit.child),
items:_resolveValue(atr,'AntdList','items','List<T>',null),
itemBuilder:_resolveValue(atr,'AntdList','itemBuilder','AntdScrollItemBuilder<T, AntdListController<T>>',null),
alignment:_resolveValue(atr,'AntdList','alignment','AntdEdge',null),
onItemPosition:_resolveValue(atr,'AntdList','onItemPosition','AntdItemPositionListener<T>',null),
throttle:_resolveValue(atr,'AntdList','throttle','Duration',null),
headers:_resolveValue(atr,'AntdList','headers','List<Widget>',null),
footers:_resolveValue(atr,'AntdList','footers','List<Widget>',null),
header:_resolveValue(atr,'AntdList','header','Widget',null),
footer:_resolveValue(atr,'AntdList','footer','Widget',null),
card:_resolveValue(atr,'AntdList','card','bool',null),
feedback:_resolveValue(atr,'AntdList','feedback','bool',true),
);
}

Widget antdPopupFormMap(Map<String,dynamic> atr){
return AntdPopup(
key:_resolveValue(atr,'AntdPopup','key','Key',null),
style:_resolveValue(atr,'AntdPopup','style','AntdPopupStyle',null),
styleBuilder:_resolveValue(atr,'AntdPopup','styleBuilder','AntdStyleBuilder<AntdPopupStyle, AntdPopup>',null),
onClosed:_resolveValue(atr,'AntdPopup','onClosed','VoidCallback',null),
onOpened:_resolveValue(atr,'AntdPopup','onOpened','VoidCallback',null),
onMaskTap:_resolveValue(atr,'AntdPopup','onMaskTap','VoidCallback',null),
opacity:_resolveValue(atr,'AntdPopup','opacity','AntdMaskOpacity',null),
dismissOnMaskTap:_resolveValue(atr,'AntdPopup','dismissOnMaskTap','bool',true),
showMask:_resolveValue(atr,'AntdPopup','showMask','bool',true),
builder:_resolveValue(atr,'AntdPopup','builder','AntdMaskBuilder<AntdPopupState>',null),
closeIcon:_resolveValue(atr,'AntdPopup','closeIcon','Widget',null),
position:_resolveValue(atr,'AntdPopup','position','AntdPosition',AntdPosition.bottom),
avoidKeyboard:_resolveValue(atr,'AntdPopup','avoidKeyboard','bool',true),
animation:_resolveValue(atr,'AntdPopup','animation','AntdPopupAnimation',null),
);
}

Widget antdProgressBarFormMap(Map<String,dynamic> atr){
return AntdProgressBar(
key:_resolveValue(atr,'AntdProgressBar','key','Key',null),
style:_resolveValue(atr,'AntdProgressBar','style','AntdProgressBarStyle',null),
styleBuilder:_resolveValue(atr,'AntdProgressBar','styleBuilder','AntdStyleBuilder<AntdProgressBarStyle, W>',null),
child:_resolveValue(atr,'AntdProgressBar','child','Widget',null),
color:_resolveValue(atr,'AntdProgressBar','color','AntdColor',null),
percent:_resolveValue(atr,'AntdProgressBar','percent','double',0.0),
stroke:_resolveValue(atr,'AntdProgressBar','stroke','double',8.0),
duration:_resolveValue(atr,'AntdProgressBar','duration','Duration',const Duration(milliseconds: 1000)),
onChange:_resolveValue(atr,'AntdProgressBar','onChange','void Function(double percent)',null),
onFinish:_resolveValue(atr,'AntdProgressBar','onFinish','VoidCallback',null),
);
}

Widget antdProgressCircleFormMap(Map<String,dynamic> atr){
return AntdProgressCircle(
key:_resolveValue(atr,'AntdProgressCircle','key','Key',null),
style:_resolveValue(atr,'AntdProgressCircle','style','AntdProgressCircleStyle',null),
styleBuilder:_resolveValue(atr,'AntdProgressCircle','styleBuilder','AntdStyleBuilder<AntdProgressCircleStyle, W>',null),
child:_resolveValue(atr,'AntdProgressCircle','child','Widget',null),
color:_resolveValue(atr,'AntdProgressCircle','color','AntdColor',null),
percent:_resolveValue(atr,'AntdProgressCircle','percent','double',0.0),
stroke:_resolveValue(atr,'AntdProgressCircle','stroke','double',3.0),
duration:_resolveValue(atr,'AntdProgressCircle','duration','Duration',const Duration(milliseconds: 1000)),
onChange:_resolveValue(atr,'AntdProgressCircle','onChange','void Function(double percent)',null),
onFinish:_resolveValue(atr,'AntdProgressCircle','onFinish','VoidCallback',null),
size:_resolveValue(atr,'AntdProgressCircle','size','double',47.0),
);
}

Widget antdStepsFormMap(Map<String,dynamic> atr){
return AntdSteps(
key:_resolveValue(atr,'AntdSteps','key','Key',null),
style:_resolveValue(atr,'AntdSteps','style','AntdStepsStyle',null),
styleBuilder:_resolveValue(atr,'AntdSteps','styleBuilder','AntdStyleBuilder<AntdStepsStyle, AntdSteps>',null),
current:_resolveValue(atr,'AntdSteps','current','int',0),
vertical:_resolveValue(atr,'AntdSteps','vertical','bool',false),
steps:_resolveValue(atr,'AntdSteps','steps','List<AntdStep>',null),
);
}

Widget antdSegmentedFormMap(Map<String,dynamic> atr){
return AntdSegmented(
key:_resolveValue(atr,'AntdSegmented','key','Key',null),
style:_resolveValue(atr,'AntdSegmented','style','AntdSegmentedStyle',null),
styleBuilder:_resolveValue(atr,'AntdSegmented','styleBuilder','AntdStyleBuilder<AntdSegmentedStyle, AntdSegmented>',null),
disabled:_resolveValue(atr,'AntdSegmented','disabled','bool',null),
readOnly:_resolveValue(atr,'AntdSegmented','readOnly','bool',null),
value:_resolveValue(atr,'AntdSegmented','value','dynamic',null),
autoCollect:_resolveValue(atr,'AntdSegmented','autoCollect','bool',null),
onChange:_resolveValue(atr,'AntdSegmented','onChange','ValueChanged<dynamic>',null),
shouldTriggerChange:_resolveValue(atr,'AntdSegmented','shouldTriggerChange','bool',null),
hapticFeedback:_resolveValue(atr,'AntdSegmented','hapticFeedback','AntdHapticFeedback',null),
manual:_resolveValue(atr,'AntdSegmented','manual','bool',null),
items:_resolveValue(atr,'AntdSegmented','items','List<AntdSegmentedItem>',null),
duration:_resolveValue(atr,'AntdSegmented','duration','Duration',const Duration(milliseconds: 200)),
);
}

Widget antdPullToRefreshFormMap(Map<String,dynamic> atr){
return AntdPullToRefresh(
key:_resolveValue(atr,'AntdPullToRefresh','key','Key',null),
style:_resolveValue(atr,'AntdPullToRefresh','style','AntdBoxStyle',null),
styleBuilder:_resolveValue(atr,'AntdPullToRefresh','styleBuilder','AntdStyleBuilder<AntdBoxStyle, AntdPullToRefresh>',null),
initialPrompt:_resolveValue(atr,'AntdPullToRefresh','initialPrompt','Widget',const Text("用力下拉触发刷新")),
initialDelay:_resolveValue(atr,'AntdPullToRefresh','initialDelay','Duration',null),
child:_resolveValue(atr,'AntdPullToRefresh','child','Widget',null),
releasePrompt:_resolveValue(atr,'AntdPullToRefresh','releasePrompt','Widget',const Text("释放立即刷新")),
completionDelay:_resolveValue(atr,'AntdPullToRefresh','completionDelay','Duration',const Duration(milliseconds: 1000)),
completionPrompt:_resolveValue(atr,'AntdPullToRefresh','completionPrompt','Widget',const Text("刷新成功")),
onRefresh:_resolveValue(atr,'AntdPullToRefresh','onRefresh','FutureVoidCallback',null),
pullingPrompt:_resolveValue(atr,'AntdPullToRefresh','pullingPrompt','Widget',const Text("用力下拉触发刷新")),
refreshingPrompt:_resolveValue(atr,'AntdPullToRefresh','refreshingPrompt','Widget',const Text("加载中...")),
duration:_resolveValue(atr,'AntdPullToRefresh','duration','Duration',const Duration(milliseconds: 200)),
onChange:_resolveValue(atr,'AntdPullToRefresh','onChange','AntdPullToRefreshOnChange',null),
);
}

Widget antdDropdownFormMap(Map<String,dynamic> atr){
return AntdDropdown(
key:_resolveValue(atr,'AntdDropdown','key','Key',null),
style:_resolveValue(atr,'AntdDropdown','style','AntdDropdownStyle',null),
styleBuilder:_resolveValue(atr,'AntdDropdown','styleBuilder','AntdStyleBuilder<AntdDropdownStyle, AntdDropdown>',null),
onClosed:_resolveValue(atr,'AntdDropdown','onClosed','VoidCallback',null),
onOpened:_resolveValue(atr,'AntdDropdown','onOpened','VoidCallback',null),
onMaskTap:_resolveValue(atr,'AntdDropdown','onMaskTap','VoidCallback',null),
builder:_resolveValue(atr,'AntdDropdown','builder','AntdMaskBuilder<AntdDropdownState>',null),
opacity:_resolveValue(atr,'AntdDropdown','opacity','AntdMaskOpacity',AntdMaskOpacity.thin),
dismissOnMaskTap:_resolveValue(atr,'AntdDropdown','dismissOnMaskTap','bool',true),
showMask:_resolveValue(atr,'AntdDropdown','showMask','bool',true),
items:_resolveValue(atr,'AntdDropdown','items','List<AntdDropdownItem>',null),
icon:_resolveValue(atr,'AntdDropdown','icon','Widget',null),
activeIcon:_resolveValue(atr,'AntdDropdown','activeIcon','Widget',null),
extra:_resolveValue(atr,'AntdDropdown','extra','AntdMaskBuilder<AntdDropdownState>',null),
animation:_resolveValue(atr,'AntdDropdown','animation','AntdDropdownAnimation',null),
);
}

Widget antdSwiperFormMap(Map<String,dynamic> atr){
return AntdSwiper(
key:_resolveValue(atr,'AntdSwiper','key','Key',null),
style:_resolveValue(atr,'AntdSwiper','style','AntdSwiperStyle',null),
styleBuilder:_resolveValue(atr,'AntdSwiper','styleBuilder','AntdStyleBuilder<AntdSwiperStyle, AntdSwiper>',null),
edgeThreshold:_resolveValue(atr,'AntdSwiper','edgeThreshold','double',null),
onEdgeReached:_resolveValue(atr,'AntdSwiper','onEdgeReached','AntdOnScrollEdge',null),
controller:_resolveValue(atr,'AntdSwiper','controller','AntdSwiperController',null),
cacheExtent:_resolveValue(atr,'AntdSwiper','cacheExtent','double',1.5),
cacheExtentStyle:_resolveValue(atr,'AntdSwiper','cacheExtentStyle','CacheExtentStyle',CacheExtentStyle.viewport),
dragStartBehavior:_resolveValue(atr,'AntdSwiper','dragStartBehavior','DragStartBehavior',DragStartBehavior.start),
scrollBehavior:_resolveValue(atr,'AntdSwiper','scrollBehavior','ScrollBehavior',const CupertinoScrollBehavior()),
vertical:_resolveValue(atr,'AntdSwiper','vertical','bool',true),
reversed:_resolveValue(atr,'AntdSwiper','reversed','bool',false),
shrinkWrap:_resolveValue(atr,'AntdSwiper','shrinkWrap','bool',false),
virtual:_resolveValue(atr,'AntdSwiper','virtual','bool',false),
items:_resolveValue(atr,'AntdSwiper','items','List<Widget>',null),
itemBuilder:_resolveValue(atr,'AntdSwiper','itemBuilder','AntdScrollItemBuilder<Widget, AntdSwiperController>',null),
headers:_resolveValue(atr,'AntdSwiper','headers','List<Widget>',null),
footers:_resolveValue(atr,'AntdSwiper','footers','List<Widget>',null),
onItemPosition:_resolveValue(atr,'AntdSwiper','onItemPosition','AntdItemPositionListener<Widget>',null),
throttle:_resolveValue(atr,'AntdSwiper','throttle','Duration',null),
allowTouchMove:_resolveValue(atr,'AntdSwiper','allowTouchMove','bool',true),
autoplay:_resolveValue(atr,'AntdSwiper','autoplay','bool',false),
autoplayInterval:_resolveValue(atr,'AntdSwiper','autoplayInterval','Duration',const Duration(milliseconds: 3000)),
activeIndex:_resolveValue(atr,'AntdSwiper','activeIndex','int',0),
loop:_resolveValue(atr,'AntdSwiper','loop','bool',false),
indicatorBuilder:_resolveValue(atr,'AntdSwiper','indicatorBuilder','AntdSwiperIndicatorBuilder',null),
onChange:_resolveValue(atr,'AntdSwiper','onChange','AntdSwiperOnIndexChange',null),
);
}

Widget antdTagFormMap(Map<String,dynamic> atr){
return AntdTag(
key:_resolveValue(atr,'AntdTag','key','Key',null),
style:_resolveValue(atr,'AntdTag','style','AntdTagStyle',null),
styleBuilder:_resolveValue(atr,'AntdTag','styleBuilder','AntdStyleBuilder<AntdTagStyle, AntdTag>',null),
color:_resolveValue(atr,'AntdTag','color','AntdColor',AntdColor.primary),
fill:_resolveValue(atr,'AntdTag','fill','AntdTagFill',AntdTagFill.solid),
round:_resolveValue(atr,'AntdTag','round','bool',false),
close:_resolveValue(atr,'AntdTag','close','Widget',null),
onClose:_resolveValue(atr,'AntdTag','onClose','VoidCallback',null),
onTap:_resolveValue(atr,'AntdTag','onTap','VoidCallback',null),
child:_resolveValue(atr,'AntdTag','child','Widget',null),
);
}

Widget antdFooterFormMap(Map<String,dynamic> atr){
return AntdFooter(
key:_resolveValue(atr,'AntdFooter','key','Key',null),
style:_resolveValue(atr,'AntdFooter','style','AntdFooterStyle',null),
styleBuilder:_resolveValue(atr,'AntdFooter','styleBuilder','AntdStyleBuilder<AntdFooterStyle, AntdFooter>',null),
label:_resolveValue(atr,'AntdFooter','label','Widget',null),
links:_resolveValue(atr,'AntdFooter','links','List<Widget>',null),
content:_resolveValue(atr,'AntdFooter','content','Widget',null),
chips:_resolveValue(atr,'AntdFooter','chips','List<AntdFooterChip>',null),
);
}

Widget antdSkeletonFormMap(Map<String,dynamic> atr){
return AntdSkeleton(
key:_resolveValue(atr,'AntdSkeleton','key','Key',null),
style:_resolveValue(atr,'AntdSkeleton','style','AntdSkeletonStyle',null),
styleBuilder:_resolveValue(atr,'AntdSkeleton','styleBuilder','AntdStyleBuilder<AntdSkeletonStyle, AntdSkeleton>',null),
animated:_resolveValue(atr,'AntdSkeleton','animated','bool',true),
title:_resolveValue(atr,'AntdSkeleton','title','bool',true),
rows:_resolveValue(atr,'AntdSkeleton','rows','int',3),
duration:_resolveValue(atr,'AntdSkeleton','duration','Duration',const Duration(milliseconds: 1200)),
spin:_resolveValue(atr,'AntdSkeleton','spin','bool',null),
child:_resolveValue(atr,'AntdSkeleton','child','Widget',null),
);
}

Widget antdSwipeActionFormMap(Map<String,dynamic> atr){
return AntdSwipeAction(
key:_resolveValue(atr,'AntdSwipeAction','key','Key',null),
style:_resolveValue(atr,'AntdSwipeAction','style','AntdSwipeActionStyle',null),
styleBuilder:_resolveValue(atr,'AntdSwipeAction','styleBuilder','AntdStyleBuilder<AntdSwipeActionStyle, AntdSwipeAction>',null),
items:_resolveValue(atr,'AntdSwipeAction','items','List<AntdSwipeItem>',null),
child:_resolveValue(atr,'AntdSwipeAction','child','Widget',null),
openThreshold:_resolveValue(atr,'AntdSwipeAction','openThreshold','double',0.01),
duration:_resolveValue(atr,'AntdSwipeAction','duration','Duration',const Duration(milliseconds: 200)),
closeOnAction:_resolveValue(atr,'AntdSwipeAction','closeOnAction','bool',true),
onChange:_resolveValue(atr,'AntdSwipeAction','onChange','AntdSwipeActionOnChange',null),
controller:_resolveValue(atr,'AntdSwipeAction','controller','AntdSwipeActionController',null),
);
}

Widget antdResultFormMap(Map<String,dynamic> atr){
return AntdResult(
key:_resolveValue(atr,'AntdResult','key','Key',null),
style:_resolveValue(atr,'AntdResult','style','AntdResultStyle',null),
styleBuilder:_resolveValue(atr,'AntdResult','styleBuilder','AntdStyleBuilder<AntdResultStyle, AntdResult>',null),
title:_resolveValue(atr,'AntdResult','title','Widget',null),
desc:_resolveValue(atr,'AntdResult','desc','Widget',null),
icon:_resolveValue(atr,'AntdResult','icon','Widget',null),
status:_resolveValue(atr,'AntdResult','status','AntdResultStatus',AntdResultStatus.info),
);
}

Widget antdToastFormMap(Map<String,dynamic> atr){
return AntdToast(
key:_resolveValue(atr,'AntdToast','key','Key',null),
style:_resolveValue(atr,'AntdToast','style','AntdToastStyle',null),
styleBuilder:_resolveValue(atr,'AntdToast','styleBuilder','AntdStyleBuilder<AntdToastStyle, AntdToast>',null),
onClosed:_resolveValue(atr,'AntdToast','onClosed','VoidCallback',null),
onOpened:_resolveValue(atr,'AntdToast','onOpened','VoidCallback',null),
onMaskTap:_resolveValue(atr,'AntdToast','onMaskTap','VoidCallback',null),
builder:_resolveValue(atr,'AntdToast','builder','AntdMaskBuilder<AntdToastState>',null),
opacity:_resolveValue(atr,'AntdToast','opacity','AntdMaskOpacity',AntdMaskOpacity.transparent),
dismissOnMaskTap:_resolveValue(atr,'AntdToast','dismissOnMaskTap','bool',true),
showMask:_resolveValue(atr,'AntdToast','showMask','bool',false),
duration:_resolveValue(atr,'AntdToast','duration','Duration',const Duration(milliseconds: 2000)),
icon:_resolveValue(atr,'AntdToast','icon','AntdIcon',null),
position:_resolveValue(atr,'AntdToast','position','AntdToastPosition',null),
dismissOnTap:_resolveValue(atr,'AntdToast','dismissOnTap','bool',true),
type:_resolveValue(atr,'AntdToast','type','AntdToastType',null),
animation:_resolveValue(atr,'AntdToast','animation','AntdToastAnimation',null),
);
}

Widget antdCascaderFormMap(Map<String,dynamic> atr){
return AntdCascader(
key:_resolveValue(atr,'AntdCascader','key','Key',null),
style:_resolveValue(atr,'AntdCascader','style','AntdCascaderStyle',null),
styleBuilder:_resolveValue(atr,'AntdCascader','styleBuilder','AntdStyleBuilder<AntdCascaderStyle, AntdCascader>',null),
onClosed:_resolveValue(atr,'AntdCascader','onClosed','VoidCallback',null),
onOpened:_resolveValue(atr,'AntdCascader','onOpened','VoidCallback',null),
onMaskTap:_resolveValue(atr,'AntdCascader','onMaskTap','VoidCallback',null),
dismissOnMaskTap:_resolveValue(atr,'AntdCascader','dismissOnMaskTap','bool',true),
showMask:_resolveValue(atr,'AntdCascader','showMask','bool',true),
closeIcon:_resolveValue(atr,'AntdCascader','closeIcon','Widget',null),
position:_resolveValue(atr,'AntdCascader','position','AntdPosition',AntdPosition.bottom),
avoidKeyboard:_resolveValue(atr,'AntdCascader','avoidKeyboard','bool',true),
cancelWidget:_resolveValue(atr,'AntdCascader','cancelWidget','Widget',const Text("取消")),
confirmWidget:_resolveValue(atr,'AntdCascader','confirmWidget','Widget',const Text("确定")),
titleWidget:_resolveValue(atr,'AntdCascader','titleWidget','Widget',null),
onConfirm:_resolveValue(atr,'AntdCascader','onConfirm','ValueChanged<List<dynamic>?>',null),
onCancel:_resolveValue(atr,'AntdCascader','onCancel','ValueChanged<List<dynamic>?>',null),
cascaderView:_resolveValue(atr,'AntdCascader','cascaderView','AntdCascaderView',null),
animation:_resolveValue(atr,'AntdCascader','animation','AntdCascaderAnimation',null),
);
}

Widget antdCascaderViewFormMap(Map<String,dynamic> atr){
return AntdCascaderView(
key:_resolveValue(atr,'AntdCascaderView','key','Key',null),
style:_resolveValue(atr,'AntdCascaderView','style','AntdCascaderViewStyle',null),
styleBuilder:_resolveValue(atr,'AntdCascaderView','styleBuilder','AntdStyleBuilder<AntdCascaderViewStyle, AntdCascaderView>',null),
disabled:_resolveValue(atr,'AntdCascaderView','disabled','bool',null),
readOnly:_resolveValue(atr,'AntdCascaderView','readOnly','bool',null),
value:_resolveValue(atr,'AntdCascaderView','value','List<dynamic>',null),
autoCollect:_resolveValue(atr,'AntdCascaderView','autoCollect','bool',null),
onChange:_resolveValue(atr,'AntdCascaderView','onChange','ValueChanged<List<dynamic>>',null),
shouldTriggerChange:_resolveValue(atr,'AntdCascaderView','shouldTriggerChange','bool',null),
hapticFeedback:_resolveValue(atr,'AntdCascaderView','hapticFeedback','AntdHapticFeedback',null),
manual:_resolveValue(atr,'AntdCascaderView','manual','bool',null),
placeholder:_resolveValue(atr,'AntdCascaderView','placeholder','Widget',const Text("请选择")),
options:_resolveValue(atr,'AntdCascaderView','options','List<AntdCascaderOption>',null),
onTabsChange:_resolveValue(atr,'AntdCascaderView','onTabsChange','AntdTabsOnChange<AntdTab>',null),
);
}

Widget antdCheckListFormMap(Map<String,dynamic> atr){
return AntdCheckList(
key:_resolveValue(atr,'AntdCheckList','key','Key',null),
disabled:_resolveValue(atr,'AntdCheckList','disabled','bool',null),
readOnly:_resolveValue(atr,'AntdCheckList','readOnly','bool',null),
value:_resolveValue(atr,'AntdCheckList','value','T',null),
autoCollect:_resolveValue(atr,'AntdCheckList','autoCollect','bool',null),
onChange:_resolveValue(atr,'AntdCheckList','onChange','ValueChanged<T>',null),
shouldTriggerChange:_resolveValue(atr,'AntdCheckList','shouldTriggerChange','bool',null),
hapticFeedback:_resolveValue(atr,'AntdCheckList','hapticFeedback','AntdHapticFeedback',null),
manual:_resolveValue(atr,'AntdCheckList','manual','bool',null),
items:_resolveValue(atr,'AntdCheckList','items','List<AntdCheckItem>',null),
builder:_resolveValue(atr,'AntdCheckList','builder','Widget? Function(List<AntdCheckItem>? items)',null),
);
}

Widget antdFormItemFormMap(Map<String,dynamic> atr){
return AntdFormItem(
key:_resolveValue(atr,'AntdFormItem','key','Key',null),
style:_resolveValue(atr,'AntdFormItem','style','AntdFormItemStyle',null),
styleBuilder:_resolveValue(atr,'AntdFormItem','styleBuilder','AntdStyleBuilder<AntdFormItemStyle, AntdFormItem>',null),
readOnly:_resolveValue(atr,'AntdFormItem','readOnly','bool',null),
disabled:_resolveValue(atr,'AntdFormItem','disabled','bool',null),
hasFeedback:_resolveValue(atr,'AntdFormItem','hasFeedback','bool',null),
layout:_resolveValue(atr,'AntdFormItem','layout','AntdFormLayout',null),
preserve:_resolveValue(atr,'AntdFormItem','preserve','bool',null),
required:_resolveValue(atr,'AntdFormItem','required','bool',null),
trigger:_resolveValue(atr,'AntdFormItem','trigger','AntdFormTrigger',null),
validateFirst:_resolveValue(atr,'AntdFormItem','validateFirst','bool',null),
validateTrigger:_resolveValue(atr,'AntdFormItem','validateTrigger','AntdFormTrigger',null),
help:_resolveValue(atr,'AntdFormItem','help','Widget',null),
helpIcon:_resolveValue(atr,'AntdFormItem','helpIcon','Widget',const AntdIcon(icon: AntdIcons.questionCircle)),
hidden:_resolveValue(atr,'AntdFormItem','hidden','bool',null),
initialValue:_resolveValue(atr,'AntdFormItem','initialValue','dynamic',null),
onChange:_resolveValue(atr,'AntdFormItem','onChange','AntdFormItemChange',null),
label:_resolveValue(atr,'AntdFormItem','label','Widget',null),
name:_resolveValue(atr,'AntdFormItem','name','String',null),
dependencies:_resolveValue(atr,'AntdFormItem','dependencies','List<String>',null),
normalize:_resolveValue(atr,'AntdFormItem','normalize','AntdFormItemNormalize',null),
rules:_resolveValue(atr,'AntdFormItem','rules','List<AntdFormRule>',null),
extra:_resolveValue(atr,'AntdFormItem','extra','Widget',null),
builder:_resolveValue(atr,'AntdFormItem','builder','AntdFormItemBuilder',null),
layoutBuilder:_resolveValue(atr,'AntdFormItem','layoutBuilder','AntdFormItemLayoutBuilder',null),
shouUpdate:_resolveValue(atr,'AntdFormItem','shouUpdate','AntdFormItemShouUpdate',null),
);
}

Widget antdFormFormMap(Map<String,dynamic> atr){
return AntdForm(
key:_resolveValue(atr,'AntdForm','key','Key',null),
style:_resolveValue(atr,'AntdForm','style','AntdBoxStyle',null),
styleBuilder:_resolveValue(atr,'AntdForm','styleBuilder','AntdStyleBuilder<AntdBoxStyle, AntdForm>',null),
readOnly:_resolveValue(atr,'AntdForm','readOnly','bool',null),
disabled:_resolveValue(atr,'AntdForm','disabled','bool',null),
hasFeedback:_resolveValue(atr,'AntdForm','hasFeedback','bool',null),
layout:_resolveValue(atr,'AntdForm','layout','AntdFormLayout',null),
preserve:_resolveValue(atr,'AntdForm','preserve','bool',null),
required:_resolveValue(atr,'AntdForm','required','bool',null),
trigger:_resolveValue(atr,'AntdForm','trigger','AntdFormTrigger',null),
validateFirst:_resolveValue(atr,'AntdForm','validateFirst','bool',null),
validateTrigger:_resolveValue(atr,'AntdForm','validateTrigger','AntdFormTrigger',null),
controller:_resolveValue(atr,'AntdForm','controller','AntdFormController',null),
initialValues:_resolveValue(atr,'AntdForm','initialValues','Map<String, dynamic>',null),
builder:_resolveValue(atr,'AntdForm','builder','AntdFormBuilder',null),
onFieldsChange:_resolveValue(atr,'AntdForm','onFieldsChange','AntdFormFieldsChange',null),
onFinish:_resolveValue(atr,'AntdForm','onFinish','AntdFormFinish',null),
onValuesChange:_resolveValue(atr,'AntdForm','onValuesChange','AntdFormValuesChange',null),
);
}

Widget antdCheckboxFormMap(Map<String,dynamic> atr){
return AntdCheckbox(
key:_resolveValue(atr,'AntdCheckbox','key','Key',null),
style:_resolveValue(atr,'AntdCheckbox','style','AntdCheckboxStyle',null),
styleBuilder:_resolveValue(atr,'AntdCheckbox','styleBuilder','AntdStyleBuilder<AntdCheckboxStyle, AntdCheckbox>',null),
disabled:_resolveValue(atr,'AntdCheckbox','disabled','bool',null),
readOnly:_resolveValue(atr,'AntdCheckbox','readOnly','bool',null),
value:_resolveValue(atr,'AntdCheckbox','value','dynamic',null),
autoCollect:_resolveValue(atr,'AntdCheckbox','autoCollect','bool',null),
onChange:_resolveValue(atr,'AntdCheckbox','onChange','ValueChanged<dynamic>',null),
shouldTriggerChange:_resolveValue(atr,'AntdCheckbox','shouldTriggerChange','bool',null),
hapticFeedback:_resolveValue(atr,'AntdCheckbox','hapticFeedback','AntdHapticFeedback',null),
manual:_resolveValue(atr,'AntdCheckbox','manual','bool',null),
indeterminate:_resolveValue(atr,'AntdCheckbox','indeterminate','bool',null),
extra:_resolveValue(atr,'AntdCheckbox','extra','Widget',null),
);
}

Widget antdInputFormMap(Map<String,dynamic> atr){
return AntdInput(
key:_resolveValue(atr,'AntdInput','key','Key',null),
style:_resolveValue(atr,'AntdInput','style','AntdInputStyle',null),
styleBuilder:_resolveValue(atr,'AntdInput','styleBuilder','AntdStyleBuilder<AntdInputStyle, AntdInput>',null),
focusNode:_resolveValue(atr,'AntdInput','focusNode','FocusNode',null),
clearable:_resolveValue(atr,'AntdInput','clearable','bool',true),
value:_resolveValue(atr,'AntdInput','value','String',null),
disabled:_resolveValue(atr,'AntdInput','disabled','bool',false),
onChange:_resolveValue(atr,'AntdInput','onChange','ValueChanged<String>',null),
onEditingComplete:_resolveValue(atr,'AntdInput','onEditingComplete','VoidCallback',null),
onSubmitted:_resolveValue(atr,'AntdInput','onSubmitted','ValueChanged<String>',null),
onClear:_resolveValue(atr,'AntdInput','onClear','VoidCallback',null),
placeholder:_resolveValue(atr,'AntdInput','placeholder','Widget',null),
readOnly:_resolveValue(atr,'AntdInput','readOnly','bool',false),
controller:_resolveValue(atr,'AntdInput','controller','AntdInputController',null),
textAlign:_resolveValue(atr,'AntdInput','textAlign','TextAlign',TextAlign.start),
obscureIcon:_resolveValue(atr,'AntdInput','obscureIcon','bool',true),
obscureText:_resolveValue(atr,'AntdInput','obscureText','bool',false),
autocorrect:_resolveValue(atr,'AntdInput','autocorrect','bool',false),
maxLines:_resolveValue(atr,'AntdInput','maxLines','int',null),
minLines:_resolveValue(atr,'AntdInput','minLines','int',null),
maxLength:_resolveValue(atr,'AntdInput','maxLength','int',null),
keyboardType:_resolveValue(atr,'AntdInput','keyboardType','TextInputType',TextInputType.text),
inputAction:_resolveValue(atr,'AntdInput','inputAction','TextInputAction',null),
onSelectionChanged:_resolveValue(atr,'AntdInput','onSelectionChanged','SelectionChangedCallback',null),
formatters:_resolveValue(atr,'AntdInput','formatters','List<TextInputFormatter>',null),
prefix:_resolveValue(atr,'AntdInput','prefix','Widget',null),
suffix:_resolveValue(atr,'AntdInput','suffix','Widget',null),
onTap:_resolveValue(atr,'AntdInput','onTap','VoidCallback',null),
contextMenuBuilder:_resolveValue(atr,'AntdInput','contextMenuBuilder','EditableTextContextMenuBuilder',null),
undoController:_resolveValue(atr,'AntdInput','undoController','UndoHistoryController',null),
spellCheckConfiguration:_resolveValue(atr,'AntdInput','spellCheckConfiguration','SpellCheckConfiguration',null),
magnifierConfiguration:_resolveValue(atr,'AntdInput','magnifierConfiguration','TextMagnifierConfiguration',null),
onAppPrivateCommand:_resolveValue(atr,'AntdInput','onAppPrivateCommand','AppPrivateCommandCallback',null),
dragStartBehavior:_resolveValue(atr,'AntdInput','dragStartBehavior','DragStartBehavior',DragStartBehavior.start),
scrollController:_resolveValue(atr,'AntdInput','scrollController','ScrollController',null),
scrollPhysics:_resolveValue(atr,'AntdInput','scrollPhysics','ScrollPhysics',const NeverScrollableScrollPhysics()),
clipBehavior:_resolveValue(atr,'AntdInput','clipBehavior','Clip',Clip.hardEdge),
onFocus:_resolveValue(atr,'AntdInput','onFocus','AntdOnFocus',null),
shouldTriggerChange:_resolveValue(atr,'AntdInput','shouldTriggerChange','bool',false),
hapticFeedback:_resolveValue(atr,'AntdInput','hapticFeedback','AntdHapticFeedback',null),
autoCollect:_resolveValue(atr,'AntdInput','autoCollect','bool',null),
);
}

Widget antdRadioFormMap(Map<String,dynamic> atr){
return AntdRadio(
key:_resolveValue(atr,'AntdRadio','key','Key',null),
style:_resolveValue(atr,'AntdRadio','style','AntdRadioStyle',null),
styleBuilder:_resolveValue(atr,'AntdRadio','styleBuilder','AntdStyleBuilder<AntdRadioStyle, AntdRadio>',null),
disabled:_resolveValue(atr,'AntdRadio','disabled','bool',null),
readOnly:_resolveValue(atr,'AntdRadio','readOnly','bool',null),
value:_resolveValue(atr,'AntdRadio','value','dynamic',null),
autoCollect:_resolveValue(atr,'AntdRadio','autoCollect','bool',null),
onChange:_resolveValue(atr,'AntdRadio','onChange','ValueChanged<dynamic>',null),
shouldTriggerChange:_resolveValue(atr,'AntdRadio','shouldTriggerChange','bool',null),
manual:_resolveValue(atr,'AntdRadio','manual','bool',null),
indeterminate:_resolveValue(atr,'AntdRadio','indeterminate','bool',null),
extra:_resolveValue(atr,'AntdRadio','extra','Widget',null),
hapticFeedback:_resolveValue(atr,'AntdRadio','hapticFeedback','AntdHapticFeedback',null),
);
}

Widget antdSearchBarFormMap(Map<String,dynamic> atr){
return AntdSearchBar(
key:_resolveValue(atr,'AntdSearchBar','key','Key',null),
style:_resolveValue(atr,'AntdSearchBar','style','AntdSearchBarStyle',null),
styleBuilder:_resolveValue(atr,'AntdSearchBar','styleBuilder','AntdStyleBuilder<AntdSearchBarStyle, AntdSearchBar>',null),
extra:_resolveValue(atr,'AntdSearchBar','extra','Widget',null),
autoClear:_resolveValue(atr,'AntdSearchBar','autoClear','bool',true),
autoFocus:_resolveValue(atr,'AntdSearchBar','autoFocus','bool',true),
showExtra:_resolveValue(atr,'AntdSearchBar','showExtra','bool',false),
clearable:_resolveValue(atr,'AntdSearchBar','clearable','bool',true),
prefix:_resolveValue(atr,'AntdSearchBar','prefix','Widget',null),
onClear:_resolveValue(atr,'AntdSearchBar','onClear','VoidCallback',null),
onChange:_resolveValue(atr,'AntdSearchBar','onChange','ValueChanged<String?>',null),
onExtraTap:_resolveValue(atr,'AntdSearchBar','onExtraTap','VoidCallback',null),
placeholder:_resolveValue(atr,'AntdSearchBar','placeholder','Widget',null),
readOnly:_resolveValue(atr,'AntdSearchBar','readOnly','bool',false),
controller:_resolveValue(atr,'AntdSearchBar','controller','AntdSearchBarController',null),
lazy:_resolveValue(atr,'AntdSearchBar','lazy','bool',false),
duration:_resolveValue(atr,'AntdSearchBar','duration','Duration',const Duration(milliseconds: 200)),
);
}

Widget antdSelectorFormMap(Map<String,dynamic> atr){
return AntdSelector(
key:_resolveValue(atr,'AntdSelector','key','Key',null),
style:_resolveValue(atr,'AntdSelector','style','AntdSelectorStyle',null),
styleBuilder:_resolveValue(atr,'AntdSelector','styleBuilder','AntdStyleBuilder<AntdSelectorStyle, AntdSelector>',null),
disabled:_resolveValue(atr,'AntdSelector','disabled','bool',null),
readOnly:_resolveValue(atr,'AntdSelector','readOnly','bool',null),
value:_resolveValue(atr,'AntdSelector','value','List<dynamic>',null),
autoCollect:_resolveValue(atr,'AntdSelector','autoCollect','bool',null),
onChange:_resolveValue(atr,'AntdSelector','onChange','ValueChanged<List<dynamic>>',null),
shouldTriggerChange:_resolveValue(atr,'AntdSelector','shouldTriggerChange','bool',null),
hapticFeedback:_resolveValue(atr,'AntdSelector','hapticFeedback','AntdHapticFeedback',null),
manual:_resolveValue(atr,'AntdSelector','manual','bool',null),
items:_resolveValue(atr,'AntdSelector','items','List<AntdSelectorItem>',null),
builder:_resolveValue(atr,'AntdSelector','builder','Widget? Function(List<AntdSelectorItem>? items)',null),
columns:_resolveValue(atr,'AntdSelector','columns','int',2),
);
}

Widget antdSliderFormMap(Map<String,dynamic> atr){
return AntdSlider(
key:_resolveValue(atr,'AntdSlider','key','Key',null),
style:_resolveValue(atr,'AntdSlider','style','AntdSliderStyle',null),
styleBuilder:_resolveValue(atr,'AntdSlider','styleBuilder','AntdStyleBuilder<AntdSliderStyle, AntdSlider>',null),
disabled:_resolveValue(atr,'AntdSlider','disabled','bool',null),
readOnly:_resolveValue(atr,'AntdSlider','readOnly','bool',null),
value:_resolveValue(atr,'AntdSlider','value','AntdSliderValue',null),
autoCollect:_resolveValue(atr,'AntdSlider','autoCollect','bool',null),
onChange:_resolveValue(atr,'AntdSlider','onChange','ValueChanged<AntdSliderValue>',null),
shouldTriggerChange:_resolveValue(atr,'AntdSlider','shouldTriggerChange','bool',null),
hapticFeedback:_resolveValue(atr,'AntdSlider','hapticFeedback','AntdHapticFeedback',null),
manual:_resolveValue(atr,'AntdSlider','manual','bool',null),
slider:_resolveValue(atr,'AntdSlider','slider','Widget',null),
max:_resolveValue(atr,'AntdSlider','max','int',null),
min:_resolveValue(atr,'AntdSlider','min','int',null),
length:_resolveValue(atr,'AntdSlider','length','int',100),
range:_resolveValue(atr,'AntdSlider','range','bool',false),
step:_resolveValue(atr,'AntdSlider','step','int',1),
ticks:_resolveValue(atr,'AntdSlider','ticks','bool',false),
renderTicks:_resolveValue(atr,'AntdSlider','renderTicks','AntdSliderRenderTicks',null),
);
}

Widget antdSwitchFormMap(Map<String,dynamic> atr){
return AntdSwitch(
key:_resolveValue(atr,'AntdSwitch','key','Key',null),
style:_resolveValue(atr,'AntdSwitch','style','AntdSwitchStyle',null),
styleBuilder:_resolveValue(atr,'AntdSwitch','styleBuilder','AntdStyleBuilder<AntdSwitchStyle, AntdSwitch>',null),
disabled:_resolveValue(atr,'AntdSwitch','disabled','bool',null),
readOnly:_resolveValue(atr,'AntdSwitch','readOnly','bool',null),
value:_resolveValue(atr,'AntdSwitch','value','dynamic',null),
autoCollect:_resolveValue(atr,'AntdSwitch','autoCollect','bool',null),
onChange:_resolveValue(atr,'AntdSwitch','onChange','ValueChanged<dynamic>',null),
shouldTriggerChange:_resolveValue(atr,'AntdSwitch','shouldTriggerChange','bool',null),
hapticFeedback:_resolveValue(atr,'AntdSwitch','hapticFeedback','AntdHapticFeedback',null),
manual:_resolveValue(atr,'AntdSwitch','manual','bool',null),
content:_resolveValue(atr,'AntdSwitch','content','Widget',null),
activeContent:_resolveValue(atr,'AntdSwitch','activeContent','Widget',null),
duration:_resolveValue(atr,'AntdSwitch','duration','Duration',const Duration(milliseconds: 200)),
);
}

Widget antdTextAreaFormMap(Map<String,dynamic> atr){
return AntdTextArea(
key:_resolveValue(atr,'AntdTextArea','key','Key',null),
style:_resolveValue(atr,'AntdTextArea','style','AntdInputStyle',null),
styleBuilder:_resolveValue(atr,'AntdTextArea','styleBuilder','AntdStyleBuilder<AntdInputStyle, AntdTextArea>',null),
focusNode:_resolveValue(atr,'AntdTextArea','focusNode','FocusNode',null),
clearable:_resolveValue(atr,'AntdTextArea','clearable','bool',true),
value:_resolveValue(atr,'AntdTextArea','value','String',null),
disabled:_resolveValue(atr,'AntdTextArea','disabled','bool',null),
onChange:_resolveValue(atr,'AntdTextArea','onChange','ValueChanged<String>',null),
onEditingComplete:_resolveValue(atr,'AntdTextArea','onEditingComplete','VoidCallback',null),
onSubmitted:_resolveValue(atr,'AntdTextArea','onSubmitted','ValueChanged<String>',null),
onClear:_resolveValue(atr,'AntdTextArea','onClear','VoidCallback',null),
placeholder:_resolveValue(atr,'AntdTextArea','placeholder','Widget',null),
readOnly:_resolveValue(atr,'AntdTextArea','readOnly','bool',null),
controller:_resolveValue(atr,'AntdTextArea','controller','AntdInputController',null),
autoCollect:_resolveValue(atr,'AntdTextArea','autoCollect','bool',null),
autocorrect:_resolveValue(atr,'AntdTextArea','autocorrect','bool',false),
maxLines:_resolveValue(atr,'AntdTextArea','maxLines','int',null),
minLines:_resolveValue(atr,'AntdTextArea','minLines','int',null),
maxLength:_resolveValue(atr,'AntdTextArea','maxLength','int',null),
keyboardType:_resolveValue(atr,'AntdTextArea','keyboardType','TextInputType',TextInputType.text),
inputAction:_resolveValue(atr,'AntdTextArea','inputAction','TextInputAction',null),
onSelectionChanged:_resolveValue(atr,'AntdTextArea','onSelectionChanged','SelectionChangedCallback',null),
formatters:_resolveValue(atr,'AntdTextArea','formatters','List<TextInputFormatter>',null),
prefix:_resolveValue(atr,'AntdTextArea','prefix','Widget',null),
suffix:_resolveValue(atr,'AntdTextArea','suffix','Widget',null),
onTap:_resolveValue(atr,'AntdTextArea','onTap','VoidCallback',null),
contextMenuBuilder:_resolveValue(atr,'AntdTextArea','contextMenuBuilder','EditableTextContextMenuBuilder',null),
undoController:_resolveValue(atr,'AntdTextArea','undoController','UndoHistoryController',null),
spellCheckConfiguration:_resolveValue(atr,'AntdTextArea','spellCheckConfiguration','SpellCheckConfiguration',null),
magnifierConfiguration:_resolveValue(atr,'AntdTextArea','magnifierConfiguration','TextMagnifierConfiguration',null),
onAppPrivateCommand:_resolveValue(atr,'AntdTextArea','onAppPrivateCommand','AppPrivateCommandCallback',null),
dragStartBehavior:_resolveValue(atr,'AntdTextArea','dragStartBehavior','DragStartBehavior',DragStartBehavior.start),
scrollController:_resolveValue(atr,'AntdTextArea','scrollController','ScrollController',null),
scrollPhysics:_resolveValue(atr,'AntdTextArea','scrollPhysics','ScrollPhysics',const NeverScrollableScrollPhysics()),
clipBehavior:_resolveValue(atr,'AntdTextArea','clipBehavior','Clip',Clip.hardEdge),
onFocus:_resolveValue(atr,'AntdTextArea','onFocus','AntdOnFocus',null),
shouldTriggerChange:_resolveValue(atr,'AntdTextArea','shouldTriggerChange','bool',true),
hapticFeedback:_resolveValue(atr,'AntdTextArea','hapticFeedback','AntdHapticFeedback',null),
showCount:_resolveValue(atr,'AntdTextArea','showCount','bool',true),
countBuilder:_resolveValue(atr,'AntdTextArea','countBuilder','AntdTextAreaCountBuilder',null),
);
}

Widget antdBadgeFormMap(Map<String,dynamic> atr){
return AntdBadge(
key:_resolveValue(atr,'AntdBadge','key','Key',null),
style:_resolveValue(atr,'AntdBadge','style','AntdBadgeStyle',null),
styleBuilder:_resolveValue(atr,'AntdBadge','styleBuilder','AntdStyleBuilder<AntdBadgeStyle, AntdBadge>',null),
bordered:_resolveValue(atr,'AntdBadge','bordered','bool',null),
color:_resolveValue(atr,'AntdBadge','color','AntdColor',AntdColor.danger),
badge:_resolveValue(atr,'AntdBadge','badge','Widget',null),
dot:_resolveValue(atr,'AntdBadge','dot','bool',null),
position:_resolveValue(atr,'AntdBadge','position','AntdBadgePosition',AntdBadgePosition.topRight),
child:_resolveValue(atr,'AntdBadge','child','Widget',null),
offset:_resolveValue(atr,'AntdBadge','offset','Offset',null),
);
}

Widget antdNoticeBarFormMap(Map<String,dynamic> atr){
return AntdNoticeBar(
key:_resolveValue(atr,'AntdNoticeBar','key','Key',null),
style:_resolveValue(atr,'AntdNoticeBar','style','AntdNoticeBarStyle',null),
styleBuilder:_resolveValue(atr,'AntdNoticeBar','styleBuilder','AntdStyleBuilder<AntdNoticeBarStyle, AntdNoticeBar>',null),
closeable:_resolveValue(atr,'AntdNoticeBar','closeable','bool',null),
closeIcon:_resolveValue(atr,'AntdNoticeBar','closeIcon','Widget',const AntdIcon(icon: AntdIcons.close)),
color:_resolveValue(atr,'AntdNoticeBar','color','AntdColor',null),
content:_resolveValue(atr,'AntdNoticeBar','content','String',null),
delay:_resolveValue(atr,'AntdNoticeBar','delay','Duration',const Duration(milliseconds: 1000)),
speed:_resolveValue(atr,'AntdNoticeBar','speed','double',50.0),
extra:_resolveValue(atr,'AntdNoticeBar','extra','Widget',null),
icon:_resolveValue(atr,'AntdNoticeBar','icon','Widget',const AntdIcon(icon: AntdIcons.sound)),
onClose:_resolveValue(atr,'AntdNoticeBar','onClose','VoidCallback',null),
onClick:_resolveValue(atr,'AntdNoticeBar','onClick','VoidCallback',null),
wrap:_resolveValue(atr,'AntdNoticeBar','wrap','bool',true),
);
}

List<AntdFormItem> _getAntdFlexItemList(){return [
AntdFormItem(
name: "direction",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('direction(Axis)'),
            Text('null')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
];}
List<AntdFormItem> _getAntdTourItemList(){return [
AntdFormItem(
name: "opacity",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('opacity(AntdMaskOpacity)'),
            Text('透明度,mask为true才有效')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdMaskOpacity.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('transparent'), value: 'transparent'), AntdSelectorItem(label: Text('thin'), value: 'thin'), AntdSelectorItem(label: Text('thick'), value: 'thick')]);
            
},
),
AntdFormItem(
name: "showMask",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('showMask(bool)'),
            Text('是否显示背景蒙版')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "child",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('child(Widget)'),
            Text('需要被引导的高亮目标组件')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "animation",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('animation(AntdTourAnimation)'),
            Text('动画')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
];}
List<AntdFormItem> _getAntdBoxItemList(){return [
AntdFormItem(
name: "outerSafeArea",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('outerSafeArea(AntdPosition)'),
            Text('外部安全区域边距（通常用于避开系统UI如刘海屏）')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdPosition.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('top'), value: 'top'), AntdSelectorItem(label: Text('bottom'), value: 'bottom'), AntdSelectorItem(label: Text('left'), value: 'left'), AntdSelectorItem(label: Text('right'), value: 'right'), AntdSelectorItem(label: Text('horizontal'), value: 'horizontal'), AntdSelectorItem(label: Text('vertical'), value: 'vertical'), AntdSelectorItem(label: Text('all'), value: 'all')]);
            
},
),
AntdFormItem(
name: "innerSafeArea",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('innerSafeArea(AntdPosition)'),
            Text('内部安全区域边距（内容与边界的保留间距）')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdPosition.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('top'), value: 'top'), AntdSelectorItem(label: Text('bottom'), value: 'bottom'), AntdSelectorItem(label: Text('left'), value: 'left'), AntdSelectorItem(label: Text('right'), value: 'right'), AntdSelectorItem(label: Text('horizontal'), value: 'horizontal'), AntdSelectorItem(label: Text('vertical'), value: 'vertical'), AntdSelectorItem(label: Text('all'), value: 'all')]);
            
},
),
AntdFormItem(
name: "disabled",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('disabled(bool)'),
            Text('禁用')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "options",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('options(AntdTapOptions)'),
            Text('包括：双击间隔、长按时长、触觉反馈等')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "child",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('child(Widget)'),
            Text('子组件（通常为需要应用这些交互和布局约束的内容）')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "focusNode",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('focusNode(FocusNode)'),
            Text('焦点')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
];}
List<AntdFormItem> _getAntdButtonItemList(){return [
AntdFormItem(
name: "block",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('block(bool)'),
            Text('是否充满父容器宽度')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "color",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('color(AntdColor)'),
            Text('按钮主题色')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdColor.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('fill'), value: 'fill'), AntdSelectorItem(label: Text('primary'), value: 'primary'), AntdSelectorItem(label: Text('success'), value: 'success'), AntdSelectorItem(label: Text('warning'), value: 'warning'), AntdSelectorItem(label: Text('danger'), value: 'danger'), AntdSelectorItem(label: Text('info'), value: 'info'), AntdSelectorItem(label: Text('link'), value: 'link')]);
            
},
),
AntdFormItem(
name: "disabled",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('disabled(bool)'),
            Text('是否禁用状态')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "fill",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('fill(AntdButtonFill)'),
            Text('按钮填充模式')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdButtonFill.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('solid'), value: 'solid'), AntdSelectorItem(label: Text('outline'), value: 'outline'), AntdSelectorItem(label: Text('none'), value: 'none')]);
            
},
),
AntdFormItem(
name: "shape",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('shape(AntdButtonShape)'),
            Text('按钮形状样式')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdButtonShape.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('rounded'), value: 'rounded'), AntdSelectorItem(label: Text('rectangular'), value: 'rectangular')]);
            
},
),
AntdFormItem(
name: "size",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('size(AntdSize)'),
            Text('按钮尺寸规格')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdSize.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('mini'), value: 'mini'), AntdSelectorItem(label: Text('small'), value: 'small'), AntdSelectorItem(label: Text('middle'), value: 'middle'), AntdSelectorItem(label: Text('large'), value: 'large')]);
            
},
),
AntdFormItem(
name: "icon",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('icon(Widget)'),
            Text('前缀图标组件')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "child",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('child(Widget)'),
            Text('按钮内容组件')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "loading",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('loading(bool)'),
            Text('是否显示加载状态')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "throttle",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('throttle(Duration)'),
            Text('点击事件节流间隔（默认开启）')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "debounce",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('debounce(Duration)'),
            Text('点击事件防抖间隔（默认关闭）')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "behavior",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('behavior(HitTestBehavior)'),
            Text('点击事件命中测试行为')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
];}
List<AntdFormItem> _getAntdActionSheetItemList(){return [
AntdFormItem(
name: "opacity",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('opacity(AntdMaskOpacity)'),
            Text('透明度,mask为true才有效')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdMaskOpacity.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('transparent'), value: 'transparent'), AntdSelectorItem(label: Text('thin'), value: 'thin'), AntdSelectorItem(label: Text('thick'), value: 'thick')]);
            
},
),
AntdFormItem(
name: "showMask",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('showMask(bool)'),
            Text('是否显示背景蒙版')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "cancelText",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('cancelText(Widget)'),
            Text('取消按钮文字，如果设置为空则不显示取消按钮')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "dismissOnAction",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('dismissOnAction(bool)'),
            Text('点击选项后是否关闭')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "extra",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('extra(Widget)'),
            Text('顶部的额外区域')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "safeArea",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('safeArea(bool)'),
            Text('安全区')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "animation",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('animation(AntdActionSheetAnimation)'),
            Text('动作面板动画')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
];}
List<AntdFormItem> _getAntdIconItemList(){return [
AntdFormItem(
name: "icon",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('icon(IconData)'),
            Text('图标')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "child",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('child(Widget)'),
            Text('和图标在一起的内容')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "row",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('row(bool)'),
            Text('child和icon按行还是按列布局')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "reversed",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('reversed(bool)'),
            Text('反转图标和child的位置')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
];}
List<AntdFormItem> _getAntdDividerItemList(){return [
AntdFormItem(
name: "color",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('color(AntdColor)'),
            Text('线的颜色')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdColor.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('fill'), value: 'fill'), AntdSelectorItem(label: Text('primary'), value: 'primary'), AntdSelectorItem(label: Text('success'), value: 'success'), AntdSelectorItem(label: Text('warning'), value: 'warning'), AntdSelectorItem(label: Text('danger'), value: 'danger'), AntdSelectorItem(label: Text('info'), value: 'info'), AntdSelectorItem(label: Text('link'), value: 'link')]);
            
},
),
AntdFormItem(
name: "child",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('child(Widget)'),
            Text('内容')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "vertical",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('vertical(bool)'),
            Text('垂直还是水平')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "position",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('position(AntdDividerPosition)'),
            Text('文字位置')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdDividerPosition.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('left'), value: 'left'), AntdSelectorItem(label: Text('center'), value: 'center'), AntdSelectorItem(label: Text('right'), value: 'right')]);
            
},
),
];}
List<AntdFormItem> _getAntdDialogItemList(){return [
AntdFormItem(
name: "opacity",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('opacity(AntdMaskOpacity)'),
            Text('透明度,mask为true才有效')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdMaskOpacity.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('transparent'), value: 'transparent'), AntdSelectorItem(label: Text('thin'), value: 'thin'), AntdSelectorItem(label: Text('thick'), value: 'thick')]);
            
},
),
AntdFormItem(
name: "showMask",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('showMask(bool)'),
            Text('是否显示背景蒙版')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "dismissOnAction",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('dismissOnAction(bool)'),
            Text('点击选项后是否关闭')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "closeIcon",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('closeIcon(Widget)'),
            Text('自定义关闭按钮图标')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "header",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('header(Widget)'),
            Text('顶部区域')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "title",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('title(Widget)'),
            Text('标题')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "type",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('type(AntdDialogType)'),
            Text('dialog的类型，一般用作全局主题的动态样式')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdDialogType.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('alert'), value: 'alert'), AntdSelectorItem(label: Text('confirm'), value: 'confirm'), AntdSelectorItem(label: Text('normal'), value: 'normal')]);
            
},
),
AntdFormItem(
name: "animation",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('animation(AntdDialogAnimation)'),
            Text('弹出层动画')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
];}
List<AntdFormItem> _getAntdCapsuleTabsItemList(){return [
AntdFormItem(
name: "leftExtra",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('leftExtra(Widget)'),
            Text('标签栏左侧扩展内容区域')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "rightExtra",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('rightExtra(Widget)'),
            Text('标签栏右侧扩展内容区域')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "activeValue",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('activeValue(dynamic)'),
            Text('默认选中的标签key（为空时不激活任何一个）')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "tabAlignment",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('tabAlignment(AntdTabAlignment)'),
            Text('标签对齐方式（居中时会自动启用滚动或填充）')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdTabAlignment.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('left'), value: 'left'), AntdSelectorItem(label: Text('center'), value: 'center')]);
            
},
),
AntdFormItem(
name: "hapticFeedback",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('hapticFeedback(AntdHapticFeedback)'),
            Text('开启反馈')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdHapticFeedback.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('light'), value: 'light'), AntdSelectorItem(label: Text('medium'), value: 'medium'), AntdSelectorItem(label: Text('heavy'), value: 'heavy'), AntdSelectorItem(label: Text('none'), value: 'none')]);
            
},
),
];}
List<AntdFormItem> _getAntdEmptyItemList(){return [
AntdFormItem(
name: "image",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('image(Widget)'),
            Text('自定义图标')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "description",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('description(Widget)'),
            Text('描述')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
];}
List<AntdFormItem> _getAntdErrorBlockItemList(){return [
AntdFormItem(
name: "image",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('image(Widget)'),
            Text('占位内容')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "status",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('status(AntdErrorBlockStatus)'),
            Text('自定义图标')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdErrorBlockStatus.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('none'), value: 'none'), AntdSelectorItem(label: Text('disconnected'), value: 'disconnected'), AntdSelectorItem(label: Text('empty'), value: 'empty'), AntdSelectorItem(label: Text('busy'), value: 'busy')]);
            
},
),
AntdFormItem(
name: "title",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('title(Widget)'),
            Text('描述')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "desc",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('desc(Widget)'),
            Text('描述')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "fullPage",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('fullPage(bool)'),
            Text('自动铺满')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "extra",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('extra(Widget)'),
            Text('扩展操作')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
];}
List<AntdFormItem> _getAntdIndexBarItemList(){return [
AntdFormItem(
name: "physics",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('physics(ScrollPhysics)'),
            Text('滚动物理效果')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "virtual",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('virtual(bool)'),
            Text('启动虚拟滚动')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "shrinkWrap",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('shrinkWrap(bool)'),
            Text('自动扩展高度')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "viewportOffset",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('viewportOffset(double)'),
            Text('偏移位置')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "hapticFeedback",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('hapticFeedback(AntdHapticFeedback)'),
            Text('索引变更时震动反馈')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdHapticFeedback.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('light'), value: 'light'), AntdSelectorItem(label: Text('medium'), value: 'medium'), AntdSelectorItem(label: Text('heavy'), value: 'heavy'), AntdSelectorItem(label: Text('none'), value: 'none')]);
            
},
),
];}
List<AntdFormItem> _getAntdJumboTabsItemList(){return [
AntdFormItem(
name: "leftExtra",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('leftExtra(Widget)'),
            Text('标签栏左侧扩展内容区域')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "rightExtra",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('rightExtra(Widget)'),
            Text('标签栏右侧扩展内容区域')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "activeValue",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('activeValue(dynamic)'),
            Text('默认选中的标签key（为空时不激活任何一个）')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "tabAlignment",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('tabAlignment(AntdTabAlignment)'),
            Text('标签对齐方式（居中时会自动启用滚动或填充）')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdTabAlignment.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('left'), value: 'left'), AntdSelectorItem(label: Text('center'), value: 'center')]);
            
},
),
AntdFormItem(
name: "hapticFeedback",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('hapticFeedback(AntdHapticFeedback)'),
            Text('开启反馈')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdHapticFeedback.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('light'), value: 'light'), AntdSelectorItem(label: Text('medium'), value: 'medium'), AntdSelectorItem(label: Text('heavy'), value: 'heavy'), AntdSelectorItem(label: Text('none'), value: 'none')]);
            
},
),
];}
List<AntdFormItem> _getAntdLoadingItemList(){return [
AntdFormItem(
name: "size",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('size(double)'),
            Text('加载指示器尺寸')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "color",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('color(AntdColor)'),
            Text('加点的颜色')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdColor.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('fill'), value: 'fill'), AntdSelectorItem(label: Text('primary'), value: 'primary'), AntdSelectorItem(label: Text('success'), value: 'success'), AntdSelectorItem(label: Text('warning'), value: 'warning'), AntdSelectorItem(label: Text('danger'), value: 'danger'), AntdSelectorItem(label: Text('info'), value: 'info'), AntdSelectorItem(label: Text('link'), value: 'link')]);
            
},
),
AntdFormItem(
name: "text",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('text(Widget)'),
            Text('加载中文案')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "circular",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('circular(bool)'),
            Text('圆形加载中')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "child",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('child(Widget)'),
            Text('被包裹的widget')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "spinning",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('spinning(bool)'),
            Text('是否是加载中')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
];}
List<AntdFormItem> _getAntdNavBarItemList(){return [
AntdFormItem(
name: "back",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('back(Widget)'),
            Text('返回区域的文字，如果为 null 的话，backIcon 也不会渲染')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "backIcon",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('backIcon(Widget)'),
            Text('返回图标')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "title",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('title(Widget)'),
            Text('标题')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "subTitle",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('subTitle(Widget)'),
            Text('子标题')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "left",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('left(Widget)'),
            Text('左侧区域')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "right",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('right(Widget)'),
            Text('右侧区域')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "safeArea",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('safeArea(AntdPosition)'),
            Text('安全区')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdPosition.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('top'), value: 'top'), AntdSelectorItem(label: Text('bottom'), value: 'bottom'), AntdSelectorItem(label: Text('left'), value: 'left'), AntdSelectorItem(label: Text('right'), value: 'right'), AntdSelectorItem(label: Text('horizontal'), value: 'horizontal'), AntdSelectorItem(label: Text('vertical'), value: 'vertical'), AntdSelectorItem(label: Text('all'), value: 'all')]);
            
},
),
];}
List<AntdFormItem> _getAntdSliderBarItemList(){return [
AntdFormItem(
name: "physics",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('physics(ScrollPhysics)'),
            Text('滚动物理效果')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "shrinkWrap",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('shrinkWrap(bool)'),
            Text('自动扩展高度')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "throttle",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('throttle(Duration)'),
            Text('滚动事件节流时长')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "edgeThreshold",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('edgeThreshold(double)'),
            Text('触边阈值 (0-1表示百分比)')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "virtual",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('virtual(bool)'),
            Text('启动虚拟滚动')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "alignment",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('alignment(AntdEdge)'),
            Text('根据方向自动优化视图边界')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdEdge.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('start'), value: 'start'), AntdSelectorItem(label: Text('center'), value: 'center'), AntdSelectorItem(label: Text('end'), value: 'end')]);
            
},
),
AntdFormItem(
name: "fit",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('fit(AntdScrollItemFit)'),
            Text('自动适配策略')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdScrollItemFit.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('fill'), value: 'fill'), AntdSelectorItem(label: Text('split'), value: 'split'), AntdSelectorItem(label: Text('child'), value: 'child')]);
            
},
),
AntdFormItem(
name: "scrollBehavior",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('scrollBehavior(ScrollBehavior)'),
            Text('滚动行为')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "cacheExtent",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('cacheExtent(double)'),
            Text('预渲染区域大小')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "cacheExtentStyle",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('cacheExtentStyle(CacheExtentStyle)'),
            Text('预渲染区域计算方式')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "contentFit",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('contentFit(AntdScrollItemFit)'),
            Text('内容如何填充')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdScrollItemFit.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('fill'), value: 'fill'), AntdSelectorItem(label: Text('split'), value: 'split'), AntdSelectorItem(label: Text('child'), value: 'child')]);
            
},
),
AntdFormItem(
name: "titlePlacement",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('titlePlacement(AntdEdge)'),
            Text('标题和视图的对齐方式')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdEdge.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('start'), value: 'start'), AntdSelectorItem(label: Text('center'), value: 'center'), AntdSelectorItem(label: Text('end'), value: 'end')]);
            
},
),
AntdFormItem(
name: "hapticFeedback",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('hapticFeedback(AntdHapticFeedback)'),
            Text('开启反馈')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdHapticFeedback.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('light'), value: 'light'), AntdSelectorItem(label: Text('medium'), value: 'medium'), AntdSelectorItem(label: Text('heavy'), value: 'heavy'), AntdSelectorItem(label: Text('none'), value: 'none')]);
            
},
),
];}
List<AntdFormItem> _getAntdAvatarItemList(){return [
AntdFormItem(
name: "image",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('image(ImageProvider)'),
            Text('图片')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "fit",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('fit(BoxFit)'),
            Text('图片填充模式')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "scale",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('scale(double)'),
            Text('缩放')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "alignment",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('alignment(AlignmentGeometry)'),
            Text('对齐方式')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "repeat",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('repeat(ImageRepeat)'),
            Text('重复方式')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "filterQuality",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('filterQuality(FilterQuality)'),
            Text('过滤质量')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "size",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('size(double)'),
            Text('大小')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "radius",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('radius(double)'),
            Text('圆角')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
];}
List<AntdFormItem> _getAntdTabBarItemList(){return [
AntdFormItem(
name: "activeIndex",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('activeIndex(int)'),
            Text('激活的索引')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "safeArea",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('safeArea(AntdPosition)'),
            Text('是否开启安全区适配')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdPosition.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('top'), value: 'top'), AntdSelectorItem(label: Text('bottom'), value: 'bottom'), AntdSelectorItem(label: Text('left'), value: 'left'), AntdSelectorItem(label: Text('right'), value: 'right'), AntdSelectorItem(label: Text('horizontal'), value: 'horizontal'), AntdSelectorItem(label: Text('vertical'), value: 'vertical'), AntdSelectorItem(label: Text('all'), value: 'all')]);
            
},
),
];}
List<AntdFormItem> _getAntdCardItemList(){return [
AntdFormItem(
name: "icon",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('icon(Widget)'),
            Text('标题右边的扩展区')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "extra",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('extra(Widget)'),
            Text('标题左边的扩展区')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "title",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('title(Widget)'),
            Text('标题')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "child",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('child(Widget)'),
            Text('卡片内容')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "footer",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('footer(Widget)'),
            Text('底部内容')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
];}
List<AntdFormItem> _getAntdTabsItemList(){return [
AntdFormItem(
name: "leftExtra",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('leftExtra(Widget)'),
            Text('标签栏左侧扩展内容区域')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "rightExtra",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('rightExtra(Widget)'),
            Text('标签栏右侧扩展内容区域')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "activeValue",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('activeValue(dynamic)'),
            Text('默认选中的标签key（为空时不激活任何一个）')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "tabAlignment",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('tabAlignment(AntdTabAlignment)'),
            Text('标签对齐方式（居中时会自动启用滚动或填充）')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdTabAlignment.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('left'), value: 'left'), AntdSelectorItem(label: Text('center'), value: 'center')]);
            
},
),
AntdFormItem(
name: "indicatorPosition",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('indicatorPosition(AntdIndicatorPosition)'),
            Text('指示器位置（顶部/底部）')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdIndicatorPosition.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('top'), value: 'top'), AntdSelectorItem(label: Text('bottom'), value: 'bottom')]);
            
},
),
AntdFormItem(
name: "indicatorMode",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('indicatorMode(AntdIndicatorMode)'),
            Text('指示器宽度模式（固定/自适应标签宽度）')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdIndicatorMode.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('full'), value: 'full'), AntdSelectorItem(label: Text('fixed'), value: 'fixed')]);
            
},
),
AntdFormItem(
name: "hapticFeedback",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('hapticFeedback(AntdHapticFeedback)'),
            Text('开启反馈')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdHapticFeedback.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('light'), value: 'light'), AntdSelectorItem(label: Text('medium'), value: 'medium'), AntdSelectorItem(label: Text('heavy'), value: 'heavy'), AntdSelectorItem(label: Text('none'), value: 'none')]);
            
},
),
];}
List<AntdFormItem> _getAntdCollapseItemList(){return [
AntdFormItem(
name: "shrinkWrap",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('shrinkWrap(bool)'),
            Text('自动扩展高度')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
];}
List<AntdFormItem> _getAntdModalItemList(){return [
AntdFormItem(
name: "opacity",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('opacity(AntdMaskOpacity)'),
            Text('透明度,mask为true才有效')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdMaskOpacity.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('transparent'), value: 'transparent'), AntdSelectorItem(label: Text('thin'), value: 'thin'), AntdSelectorItem(label: Text('thick'), value: 'thick')]);
            
},
),
AntdFormItem(
name: "showMask",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('showMask(bool)'),
            Text('是否显示背景蒙版')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "dismissOnAction",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('dismissOnAction(bool)'),
            Text('点击选项后是否关闭')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "closeIcon",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('closeIcon(Widget)'),
            Text('自定义关闭按钮图标')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "header",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('header(Widget)'),
            Text('顶部区域')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "title",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('title(Widget)'),
            Text('标题')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "type",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('type(AntdModalType)'),
            Text('modal的类型，一般用作全局主题的动态样式')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdModalType.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('alert'), value: 'alert'), AntdSelectorItem(label: Text('confirm'), value: 'confirm'), AntdSelectorItem(label: Text('normal'), value: 'normal')]);
            
},
),
AntdFormItem(
name: "animation",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('animation(AntdModalAnimation)'),
            Text('弹出层动画')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
];}
List<AntdFormItem> _getAntdFloatingPanelItemList(){return [
AntdFormItem(
name: "child",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('child(Widget)'),
            Text('子类')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "content",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('content(Widget)'),
            Text('内容')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "indicator",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('indicator(Widget)'),
            Text('指示灯')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "position",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('position(AntdFloatingPanelPosition)'),
            Text('面板的位置')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdFloatingPanelPosition.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('top'), value: 'top'), AntdSelectorItem(label: Text('bottom'), value: 'bottom')]);
            
},
),
];}
List<AntdFormItem> _getAntdEllipsisItemList(){return [
AntdFormItem(
name: "content",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('content(String)'),
            Text('文本内容')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "collapseText",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('collapseText(String)'),
            Text('收起操作的文案')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "expandText",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('expandText(String)'),
            Text('展开操作的文案')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "defaultExpanded",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('defaultExpanded(bool)'),
            Text('是否默认展开')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "rows",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('rows(int)'),
            Text('展示几行')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
];}
List<AntdFormItem> _getAntdMaskItemList(){return [
AntdFormItem(
name: "opacity",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('opacity(AntdMaskOpacity)'),
            Text('透明度,mask为true才有效')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdMaskOpacity.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('transparent'), value: 'transparent'), AntdSelectorItem(label: Text('thin'), value: 'thin'), AntdSelectorItem(label: Text('thick'), value: 'thick')]);
            
},
),
AntdFormItem(
name: "showMask",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('showMask(bool)'),
            Text('是否显示背景蒙版')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "hole",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('hole(AntdMaskHole)'),
            Text('镂空的区域')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "animation",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('animation(AntdMaskAnimation)'),
            Text('mask内容动画')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
];}
List<AntdFormItem> _getAntdPopoverItemList(){return [
AntdFormItem(
name: "opacity",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('opacity(AntdMaskOpacity)'),
            Text('透明度,mask为true才有效')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdMaskOpacity.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('transparent'), value: 'transparent'), AntdSelectorItem(label: Text('thin'), value: 'thin'), AntdSelectorItem(label: Text('thick'), value: 'thick')]);
            
},
),
AntdFormItem(
name: "showMask",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('showMask(bool)'),
            Text('是否显示背景蒙版')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "child",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('child(Widget)'),
            Text('弹出内容，比actions优先级更高')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "dismissOnAction",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('dismissOnAction(bool)'),
            Text('当执行action后关闭')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "placement",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('placement(AntdPlacement)'),
            Text('弹出的位置')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdPlacement.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('top'), value: 'top'), AntdSelectorItem(label: Text('topLeft'), value: 'topLeft'), AntdSelectorItem(label: Text('topRight'), value: 'topRight'), AntdSelectorItem(label: Text('bottom'), value: 'bottom'), AntdSelectorItem(label: Text('bottomLeft'), value: 'bottomLeft'), AntdSelectorItem(label: Text('bottomRight'), value: 'bottomRight'), AntdSelectorItem(label: Text('left'), value: 'left'), AntdSelectorItem(label: Text('leftTop'), value: 'leftTop'), AntdSelectorItem(label: Text('leftBottom'), value: 'leftBottom'), AntdSelectorItem(label: Text('right'), value: 'right'), AntdSelectorItem(label: Text('rightTop'), value: 'rightTop'), AntdSelectorItem(label: Text('rightBottom'), value: 'rightBottom')]);
            
},
),
AntdFormItem(
name: "mode",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('mode(AntdPopoverMode)'),
            Text('设置亮色模式或者黑色模式')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdPopoverMode.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('light'), value: 'light'), AntdSelectorItem(label: Text('dark'), value: 'dark')]);
            
},
),
AntdFormItem(
name: "trigger",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('trigger(AntdPopoverTrigger)'),
            Text('如何触发气泡')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdPopoverTrigger.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('tap'), value: 'tap'), AntdSelectorItem(label: Text('longPress'), value: 'longPress'), AntdSelectorItem(label: Text('show'), value: 'show')]);
            
},
),
AntdFormItem(
name: "hapticFeedback",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('hapticFeedback(AntdHapticFeedback)'),
            Text('开启反馈')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdHapticFeedback.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('light'), value: 'light'), AntdSelectorItem(label: Text('medium'), value: 'medium'), AntdSelectorItem(label: Text('heavy'), value: 'heavy'), AntdSelectorItem(label: Text('none'), value: 'none')]);
            
},
),
AntdFormItem(
name: "animation",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('animation(AntdPopoverAnimation)'),
            Text('popover内容动画')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
];}
List<AntdFormItem> _getAntdImageItemList(){return [
AntdFormItem(
name: "height",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('height(double)'),
            Text('高度')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "width",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('width(double)'),
            Text('宽度')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "image",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('image(ImageProvider)'),
            Text('图片')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "fit",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('fit(BoxFit)'),
            Text('图片填充模式')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "scale",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('scale(double)'),
            Text('缩放')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "alignment",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('alignment(AlignmentGeometry)'),
            Text('对齐方式')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "repeat",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('repeat(ImageRepeat)'),
            Text('重复方式')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "filterQuality",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('filterQuality(FilterQuality)'),
            Text('过滤质量')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
];}
List<AntdFormItem> _getAntdPageIndicatorItemList(){return [
AntdFormItem(
name: "color",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('color(AntdColor)'),
            Text('颜色')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdColor.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('fill'), value: 'fill'), AntdSelectorItem(label: Text('primary'), value: 'primary'), AntdSelectorItem(label: Text('success'), value: 'success'), AntdSelectorItem(label: Text('warning'), value: 'warning'), AntdSelectorItem(label: Text('danger'), value: 'danger'), AntdSelectorItem(label: Text('info'), value: 'info'), AntdSelectorItem(label: Text('link'), value: 'link')]);
            
},
),
AntdFormItem(
name: "total",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('total(int)'),
            Text('总页数')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "current",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('current(int)'),
            Text('当前页（从 0 开始计数）')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "vertical",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('vertical(bool)'),
            Text('方向，默认是水平方向')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
];}
List<AntdFormItem> _getAntdListItemList(){return [
AntdFormItem(
name: "edgeThreshold",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('edgeThreshold(double)'),
            Text('触边阈值 (0-1表示百分比)')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "cacheExtent",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('cacheExtent(double)'),
            Text('预渲染区域大小')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "cacheExtentStyle",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('cacheExtentStyle(CacheExtentStyle)'),
            Text('预渲染区域计算方式')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "physics",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('physics(ScrollPhysics)'),
            Text('滚动物理效果')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "dragStartBehavior",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('dragStartBehavior(DragStartBehavior)'),
            Text('拖动开始行为')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "scrollBehavior",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('scrollBehavior(ScrollBehavior)'),
            Text('滚动行为')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "vertical",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('vertical(bool)'),
            Text('滚动方向')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "reversed",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('reversed(bool)'),
            Text('是否反向滚动')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "shrinkWrap",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('shrinkWrap(bool)'),
            Text('自动扩展高度')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "virtual",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('virtual(bool)'),
            Text('启动虚拟滚动')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "fit",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('fit(AntdScrollItemFit)'),
            Text('自动适配策略')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdScrollItemFit.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('fill'), value: 'fill'), AntdSelectorItem(label: Text('split'), value: 'split'), AntdSelectorItem(label: Text('child'), value: 'child')]);
            
},
),
AntdFormItem(
name: "alignment",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('alignment(AntdEdge)'),
            Text('根据方向自动优化视图边界')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdEdge.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('start'), value: 'start'), AntdSelectorItem(label: Text('center'), value: 'center'), AntdSelectorItem(label: Text('end'), value: 'end')]);
            
},
),
AntdFormItem(
name: "throttle",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('throttle(Duration)'),
            Text('滚动事件节流时长')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "header",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('header(Widget)'),
            Text('标题内容')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "footer",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('footer(Widget)'),
            Text('标题内容')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "card",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('card(bool)'),
            Text('卡片式列表')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "feedback",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('feedback(bool)'),
            Text('按下效果')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
];}
List<AntdFormItem> _getAntdPopupItemList(){return [
AntdFormItem(
name: "opacity",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('opacity(AntdMaskOpacity)'),
            Text('透明度,mask为true才有效')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdMaskOpacity.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('transparent'), value: 'transparent'), AntdSelectorItem(label: Text('thin'), value: 'thin'), AntdSelectorItem(label: Text('thick'), value: 'thick')]);
            
},
),
AntdFormItem(
name: "showMask",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('showMask(bool)'),
            Text('是否显示背景蒙版')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "closeIcon",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('closeIcon(Widget)'),
            Text('自定义关闭按钮图标')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "position",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('position(AntdPosition)'),
            Text('弹出位置')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdPosition.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('top'), value: 'top'), AntdSelectorItem(label: Text('bottom'), value: 'bottom'), AntdSelectorItem(label: Text('left'), value: 'left'), AntdSelectorItem(label: Text('right'), value: 'right'), AntdSelectorItem(label: Text('horizontal'), value: 'horizontal'), AntdSelectorItem(label: Text('vertical'), value: 'vertical'), AntdSelectorItem(label: Text('all'), value: 'all')]);
            
},
),
AntdFormItem(
name: "avoidKeyboard",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('avoidKeyboard(bool)'),
            Text('当底部弹出式 避免键盘遮挡')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "animation",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('animation(AntdPopupAnimation)'),
            Text('弹出层动画')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
];}
List<AntdFormItem> _getAntdProgressBarItemList(){return [
AntdFormItem(
name: "child",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('child(Widget)'),
            Text('子组件')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "color",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('color(AntdColor)'),
            Text('颜色')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdColor.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('fill'), value: 'fill'), AntdSelectorItem(label: Text('primary'), value: 'primary'), AntdSelectorItem(label: Text('success'), value: 'success'), AntdSelectorItem(label: Text('warning'), value: 'warning'), AntdSelectorItem(label: Text('danger'), value: 'danger'), AntdSelectorItem(label: Text('info'), value: 'info'), AntdSelectorItem(label: Text('link'), value: 'link')]);
            
},
),
AntdFormItem(
name: "percent",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('percent(double)'),
            Text('百分比')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "stroke",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('stroke(double)'),
            Text('线的宽度')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "duration",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('duration(Duration)'),
            Text('周期')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
];}
List<AntdFormItem> _getAntdProgressCircleItemList(){return [
AntdFormItem(
name: "child",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('child(Widget)'),
            Text('子组件')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "color",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('color(AntdColor)'),
            Text('颜色')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdColor.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('fill'), value: 'fill'), AntdSelectorItem(label: Text('primary'), value: 'primary'), AntdSelectorItem(label: Text('success'), value: 'success'), AntdSelectorItem(label: Text('warning'), value: 'warning'), AntdSelectorItem(label: Text('danger'), value: 'danger'), AntdSelectorItem(label: Text('info'), value: 'info'), AntdSelectorItem(label: Text('link'), value: 'link')]);
            
},
),
AntdFormItem(
name: "percent",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('percent(double)'),
            Text('百分比')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "stroke",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('stroke(double)'),
            Text('线的宽度')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "duration",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('duration(Duration)'),
            Text('周期')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "size",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('size(double)'),
            Text('大小')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
];}
List<AntdFormItem> _getAntdStepsItemList(){return [
AntdFormItem(
name: "current",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('current(int)'),
            Text('指定当前步骤，从 0 开始记数。在子 Step 元素中，可以通过 status 属性覆盖状态')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "vertical",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('vertical(bool)'),
            Text('指定步骤条方向。目前支持水平（horizontal）和竖直（vertical）两种方向')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
];}
List<AntdFormItem> _getAntdSegmentedItemList(){return [
AntdFormItem(
name: "disabled",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('disabled(bool)'),
            Text('禁用')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "readOnly",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('readOnly(bool)'),
            Text('只读')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "value",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('value(dynamic)'),
            Text('值')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "autoCollect",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('autoCollect(bool)'),
            Text('自动同步值到表单')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "shouldTriggerChange",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('shouldTriggerChange(bool)'),
            Text('当value手动控制的时候 是否应该触发onChange')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "hapticFeedback",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('hapticFeedback(AntdHapticFeedback)'),
            Text('开启反馈')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdHapticFeedback.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('light'), value: 'light'), AntdSelectorItem(label: Text('medium'), value: 'medium'), AntdSelectorItem(label: Text('heavy'), value: 'heavy'), AntdSelectorItem(label: Text('none'), value: 'none')]);
            
},
),
AntdFormItem(
name: "manual",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('manual(bool)'),
            Text('受控模式 value的值必须手动更新 默认不开启')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "duration",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('duration(Duration)'),
            Text('选项切换时的动画过渡时长')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
];}
List<AntdFormItem> _getAntdPullToRefreshItemList(){return [
AntdFormItem(
name: "initialPrompt",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('initialPrompt(Widget)'),
            Text('初始状态下显示的提示内容')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "initialDelay",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('initialDelay(Duration)'),
            Text('初始提示内容的展示持续时间')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "child",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('child(Widget)'),
            Text('主要内容区域')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "releasePrompt",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('releasePrompt(Widget)'),
            Text('可释放刷新时显示的提示内容')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "completionDelay",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('completionDelay(Duration)'),
            Text('刷新完成后提示内容的展示持续时间')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "completionPrompt",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('completionPrompt(Widget)'),
            Text('刷新完成时显示的提示内容')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "pullingPrompt",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('pullingPrompt(Widget)'),
            Text('下拉过程中显示的提示内容')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "refreshingPrompt",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('refreshingPrompt(Widget)'),
            Text('正在刷新时显示的提示内容')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "duration",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('duration(Duration)'),
            Text('动画周期')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
];}
List<AntdFormItem> _getAntdDropdownItemList(){return [
AntdFormItem(
name: "opacity",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('opacity(AntdMaskOpacity)'),
            Text('透明度,mask为true才有效')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdMaskOpacity.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('transparent'), value: 'transparent'), AntdSelectorItem(label: Text('thin'), value: 'thin'), AntdSelectorItem(label: Text('thick'), value: 'thick')]);
            
},
),
AntdFormItem(
name: "showMask",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('showMask(bool)'),
            Text('是否显示背景蒙版')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "icon",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('icon(Widget)'),
            Text('默认的图标')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "activeIcon",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('activeIcon(Widget)'),
            Text('激活后的图标')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "animation",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('animation(AntdDropdownAnimation)'),
            Text('动画')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
];}
List<AntdFormItem> _getAntdSwiperItemList(){return [
AntdFormItem(
name: "edgeThreshold",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('edgeThreshold(double)'),
            Text('触边阈值 (0-1表示百分比)')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "cacheExtent",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('cacheExtent(double)'),
            Text('预渲染区域大小')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "cacheExtentStyle",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('cacheExtentStyle(CacheExtentStyle)'),
            Text('预渲染区域计算方式')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "dragStartBehavior",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('dragStartBehavior(DragStartBehavior)'),
            Text('拖动开始行为')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "scrollBehavior",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('scrollBehavior(ScrollBehavior)'),
            Text('滚动行为')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "vertical",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('vertical(bool)'),
            Text('滚动方向')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "reversed",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('reversed(bool)'),
            Text('是否反向滚动')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "shrinkWrap",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('shrinkWrap(bool)'),
            Text('自动扩展高度')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "virtual",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('virtual(bool)'),
            Text('启动虚拟滚动')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "throttle",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('throttle(Duration)'),
            Text('滚动事件节流时长')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "allowTouchMove",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('allowTouchMove(bool)'),
            Text('是否允许手势滑动')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "autoplay",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('autoplay(bool)'),
            Text('是否自动切换')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "autoplayInterval",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('autoplayInterval(Duration)'),
            Text('自动切换的间隔，单位为 ms')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "activeIndex",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('activeIndex(int)'),
            Text('初始位置')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "loop",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('loop(bool)'),
            Text('是否循环')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
];}
List<AntdFormItem> _getAntdTagItemList(){return [
AntdFormItem(
name: "color",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('color(AntdColor)'),
            Text('标签色')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdColor.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('fill'), value: 'fill'), AntdSelectorItem(label: Text('primary'), value: 'primary'), AntdSelectorItem(label: Text('success'), value: 'success'), AntdSelectorItem(label: Text('warning'), value: 'warning'), AntdSelectorItem(label: Text('danger'), value: 'danger'), AntdSelectorItem(label: Text('info'), value: 'info'), AntdSelectorItem(label: Text('link'), value: 'link')]);
            
},
),
AntdFormItem(
name: "fill",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('fill(AntdTagFill)'),
            Text('填充模式')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdTagFill.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('solid'), value: 'solid'), AntdSelectorItem(label: Text('outline'), value: 'outline')]);
            
},
),
AntdFormItem(
name: "round",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('round(bool)'),
            Text('是否圆角')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "close",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('close(Widget)'),
            Text('关闭区域')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "child",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('child(Widget)'),
            Text('内容')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
];}
List<AntdFormItem> _getAntdFooterItemList(){return [
AntdFormItem(
name: "label",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('label(Widget)'),
            Text('带分割线的顶部内容')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "content",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('content(Widget)'),
            Text('普通的内容部分')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
];}
List<AntdFormItem> _getAntdSkeletonItemList(){return [
AntdFormItem(
name: "animated",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('animated(bool)'),
            Text('是否开启动画')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "title",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('title(bool)'),
            Text('展示标题')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "rows",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('rows(int)'),
            Text('行数')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "duration",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('duration(Duration)'),
            Text('动画周期')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "spin",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('spin(bool)'),
            Text('加载中')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "child",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('child(Widget)'),
            Text('内容')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
];}
List<AntdFormItem> _getAntdSwipeActionItemList(){return [
AntdFormItem(
name: "child",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('child(Widget)'),
            Text('内容')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "openThreshold",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('openThreshold(double)'),
            Text('滑动到达阈值直接打开')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "duration",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('duration(Duration)'),
            Text('动画周期')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "closeOnAction",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('closeOnAction(bool)'),
            Text('是否在点击操作按钮时自动归位')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
];}
List<AntdFormItem> _getAntdResultItemList(){return [
AntdFormItem(
name: "title",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('title(Widget)'),
            Text('标题')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "desc",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('desc(Widget)'),
            Text('描述')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "icon",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('icon(Widget)'),
            Text('图标')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "status",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('status(AntdResultStatus)'),
            Text('状态类型')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdResultStatus.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('success'), value: 'success'), AntdSelectorItem(label: Text('error'), value: 'error'), AntdSelectorItem(label: Text('info'), value: 'info'), AntdSelectorItem(label: Text('waiting'), value: 'waiting'), AntdSelectorItem(label: Text('warning'), value: 'warning')]);
            
},
),
];}
List<AntdFormItem> _getAntdToastItemList(){return [
AntdFormItem(
name: "opacity",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('opacity(AntdMaskOpacity)'),
            Text('透明度,mask为true才有效')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdMaskOpacity.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('transparent'), value: 'transparent'), AntdSelectorItem(label: Text('thin'), value: 'thin'), AntdSelectorItem(label: Text('thick'), value: 'thick')]);
            
},
),
AntdFormItem(
name: "showMask",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('showMask(bool)'),
            Text('是否显示背景蒙版')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "duration",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('duration(Duration)'),
            Text('提示持续时间，若为 0 则不会自动关闭')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "icon",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('icon(AntdIcon)'),
            Text('Toast 图标')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "position",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('position(AntdToastPosition)'),
            Text('垂直方向显示位置')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdToastPosition.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('top'), value: 'top'), AntdSelectorItem(label: Text('bottom'), value: 'bottom'), AntdSelectorItem(label: Text('center'), value: 'center')]);
            
},
),
AntdFormItem(
name: "type",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('type(AntdToastType)'),
            Text('toast的类型')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdToastType.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('success'), value: 'success'), AntdSelectorItem(label: Text('fail'), value: 'fail'), AntdSelectorItem(label: Text('normal'), value: 'normal')]);
            
},
),
AntdFormItem(
name: "animation",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('animation(AntdToastAnimation)'),
            Text('自定义动画')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
];}
List<AntdFormItem> _getAntdCascaderItemList(){return [
AntdFormItem(
name: "showMask",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('showMask(bool)'),
            Text('是否显示背景蒙版')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "closeIcon",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('closeIcon(Widget)'),
            Text('自定义关闭按钮图标')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "position",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('position(AntdPosition)'),
            Text('弹出位置')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdPosition.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('top'), value: 'top'), AntdSelectorItem(label: Text('bottom'), value: 'bottom'), AntdSelectorItem(label: Text('left'), value: 'left'), AntdSelectorItem(label: Text('right'), value: 'right'), AntdSelectorItem(label: Text('horizontal'), value: 'horizontal'), AntdSelectorItem(label: Text('vertical'), value: 'vertical'), AntdSelectorItem(label: Text('all'), value: 'all')]);
            
},
),
AntdFormItem(
name: "avoidKeyboard",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('avoidKeyboard(bool)'),
            Text('当底部弹出式 避免键盘遮挡')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "cancelWidget",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('cancelWidget(Widget)'),
            Text('取消按钮')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "confirmWidget",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('confirmWidget(Widget)'),
            Text('确认按钮')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "titleWidget",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('titleWidget(Widget)'),
            Text('标题')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "cascaderView",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('cascaderView(AntdCascaderView)'),
            Text('选择器')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "animation",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('animation(AntdCascaderAnimation)'),
            Text('弹出层动画')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
];}
List<AntdFormItem> _getAntdCascaderViewItemList(){return [
AntdFormItem(
name: "disabled",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('disabled(bool)'),
            Text('禁用')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "readOnly",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('readOnly(bool)'),
            Text('只读')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "autoCollect",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('autoCollect(bool)'),
            Text('自动同步值到表单')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "shouldTriggerChange",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('shouldTriggerChange(bool)'),
            Text('当value手动控制的时候 是否应该触发onChange')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "hapticFeedback",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('hapticFeedback(AntdHapticFeedback)'),
            Text('开启反馈')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdHapticFeedback.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('light'), value: 'light'), AntdSelectorItem(label: Text('medium'), value: 'medium'), AntdSelectorItem(label: Text('heavy'), value: 'heavy'), AntdSelectorItem(label: Text('none'), value: 'none')]);
            
},
),
AntdFormItem(
name: "manual",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('manual(bool)'),
            Text('受控模式 value的值必须手动更新 默认不开启')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "placeholder",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('placeholder(Widget)'),
            Text('未选中时的提示文案')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
];}
List<AntdFormItem> _getAntdCheckListItemList(){return [
AntdFormItem(
name: "disabled",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('disabled(bool)'),
            Text('禁用')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "readOnly",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('readOnly(bool)'),
            Text('只读')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "value",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('value(T)'),
            Text('值')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "autoCollect",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('autoCollect(bool)'),
            Text('自动同步值到表单')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "shouldTriggerChange",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('shouldTriggerChange(bool)'),
            Text('当value手动控制的时候 是否应该触发onChange')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "hapticFeedback",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('hapticFeedback(AntdHapticFeedback)'),
            Text('开启反馈')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdHapticFeedback.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('light'), value: 'light'), AntdSelectorItem(label: Text('medium'), value: 'medium'), AntdSelectorItem(label: Text('heavy'), value: 'heavy'), AntdSelectorItem(label: Text('none'), value: 'none')]);
            
},
),
AntdFormItem(
name: "manual",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('manual(bool)'),
            Text('受控模式 value的值必须手动更新 默认不开启')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
];}
List<AntdFormItem> _getAntdFormItemItemList(){return [
AntdFormItem(
name: "readOnly",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('readOnly(bool)'),
            Text('只读')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "disabled",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('disabled(bool)'),
            Text('禁用')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "hasFeedback",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('hasFeedback(bool)'),
            Text('是否展示错误反馈')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "layout",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('layout(AntdFormLayout)'),
            Text('布局模式')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdFormLayout.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('vertical'), value: 'vertical'), AntdSelectorItem(label: Text('horizontal'), value: 'horizontal')]);
            
},
),
AntdFormItem(
name: "preserve",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('preserve(bool)'),
            Text('当字段被删除时保留字段值')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "required",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('required(bool)'),
            Text('是否必选，需要注意的是这个属性仅仅用来控制外观，并不包含校验逻辑')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "trigger",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('trigger(AntdFormTrigger)'),
            Text('设置收集字段值变更的时机')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdFormTrigger.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('onChange'), value: 'onChange'), AntdSelectorItem(label: Text('onFocus'), value: 'onFocus'), AntdSelectorItem(label: Text('any'), value: 'any')]);
            
},
),
AntdFormItem(
name: "validateFirst",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('validateFirst(bool)'),
            Text('当某一规则校验不通过时，是否停止剩下的规则的校验。设置 parallel 时会并行校验')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "validateTrigger",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('validateTrigger(AntdFormTrigger)'),
            Text('设置字段校验的时机')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdFormTrigger.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('onChange'), value: 'onChange'), AntdSelectorItem(label: Text('onFocus'), value: 'onFocus'), AntdSelectorItem(label: Text('any'), value: 'any')]);
            
},
),
AntdFormItem(
name: "help",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('help(Widget)'),
            Text('提示文本')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "helpIcon",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('helpIcon(Widget)'),
            Text('提示图标')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "hidden",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('hidden(bool)'),
            Text('是否隐藏整个字段')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "initialValue",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('initialValue(dynamic)'),
            Text('设置子元素默认值，如果与 Form 的 initialValues 冲突则以 Form 为准')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "label",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('label(Widget)'),
            Text('标签名')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "name",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('name(String)'),
            Text('字段名,嵌套的路径如 "user.address.city"')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "extra",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('extra(Widget)'),
            Text('右侧扩展区')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
];}
List<AntdFormItem> _getAntdFormItemList(){return [
AntdFormItem(
name: "readOnly",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('readOnly(bool)'),
            Text('只读')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "disabled",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('disabled(bool)'),
            Text('禁用')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "hasFeedback",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('hasFeedback(bool)'),
            Text('是否展示错误反馈')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "layout",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('layout(AntdFormLayout)'),
            Text('布局模式')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdFormLayout.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('vertical'), value: 'vertical'), AntdSelectorItem(label: Text('horizontal'), value: 'horizontal')]);
            
},
),
AntdFormItem(
name: "preserve",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('preserve(bool)'),
            Text('当字段被删除时保留字段值')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "required",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('required(bool)'),
            Text('是否必选，需要注意的是这个属性仅仅用来控制外观，并不包含校验逻辑')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "trigger",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('trigger(AntdFormTrigger)'),
            Text('设置收集字段值变更的时机')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdFormTrigger.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('onChange'), value: 'onChange'), AntdSelectorItem(label: Text('onFocus'), value: 'onFocus'), AntdSelectorItem(label: Text('any'), value: 'any')]);
            
},
),
AntdFormItem(
name: "validateFirst",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('validateFirst(bool)'),
            Text('当某一规则校验不通过时，是否停止剩下的规则的校验。设置 parallel 时会并行校验')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "validateTrigger",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('validateTrigger(AntdFormTrigger)'),
            Text('设置字段校验的时机')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdFormTrigger.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('onChange'), value: 'onChange'), AntdSelectorItem(label: Text('onFocus'), value: 'onFocus'), AntdSelectorItem(label: Text('any'), value: 'any')]);
            
},
),
AntdFormItem(
name: "initialValues",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('initialValues(Map<String, dynamic>)'),
            Text('表单默认值，只有初始化以及重置时生效')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
];}
List<AntdFormItem> _getAntdCheckboxItemList(){return [
AntdFormItem(
name: "disabled",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('disabled(bool)'),
            Text('禁用')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "readOnly",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('readOnly(bool)'),
            Text('只读')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "value",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('value(dynamic)'),
            Text('值')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "autoCollect",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('autoCollect(bool)'),
            Text('自动同步值到表单')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "shouldTriggerChange",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('shouldTriggerChange(bool)'),
            Text('当value手动控制的时候 是否应该触发onChange')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "hapticFeedback",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('hapticFeedback(AntdHapticFeedback)'),
            Text('开启反馈')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdHapticFeedback.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('light'), value: 'light'), AntdSelectorItem(label: Text('medium'), value: 'medium'), AntdSelectorItem(label: Text('heavy'), value: 'heavy'), AntdSelectorItem(label: Text('none'), value: 'none')]);
            
},
),
AntdFormItem(
name: "manual",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('manual(bool)'),
            Text('受控模式 value的值必须手动更新 默认不开启')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "indeterminate",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('indeterminate(bool)'),
            Text('半选')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "extra",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('extra(Widget)'),
            Text('内容')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
];}
List<AntdFormItem> _getAntdInputItemList(){return [
AntdFormItem(
name: "focusNode",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('focusNode(FocusNode)'),
            Text('控制输入框的焦点状态')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "clearable",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('clearable(bool)'),
            Text('是否显示清除按钮（点击会清空输入内容）')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "value",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('value(String)'),
            Text('值')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "disabled",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('disabled(bool)'),
            Text('禁用')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "placeholder",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('placeholder(Widget)'),
            Text('输入框为空时显示的提示文本')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "readOnly",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('readOnly(bool)'),
            Text('只读')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "textAlign",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('textAlign(TextAlign)'),
            Text('文本对齐方式（左/中/右）')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "obscureIcon",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('obscureIcon(bool)'),
            Text('是否显示密码可见性切换图标（仅当obscureText=true时有效）')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "obscureText",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('obscureText(bool)'),
            Text('是否以密码形式隐藏输入内容（显示为圆点），默认为false')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "autocorrect",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('autocorrect(bool)'),
            Text('是否自动校正拼写错误（如iOS键盘的自动修正），默认为true')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "maxLines",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('maxLines(int)'),
            Text('输入框的最大行数（多行文本时生效）')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "minLines",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('minLines(int)'),
            Text('输入框的最小行数（多行文本时生效）')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "maxLength",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('maxLength(int)'),
            Text('允许输入的最大字符数')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "keyboardType",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('keyboardType(TextInputType)'),
            Text('键盘类型（如数字键盘、邮箱键盘等）')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "inputAction",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('inputAction(TextInputAction)'),
            Text('键盘动作按钮类型（如搜索、发送等）')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "prefix",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('prefix(Widget)'),
            Text('输入框前缀部件（如图标、标签等）')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "suffix",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('suffix(Widget)'),
            Text('输入框后缀部件（如图标、按钮等）')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "contextMenuBuilder",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('contextMenuBuilder(EditableTextContextMenuBuilder)'),
            Text('自定义上下文菜单构建器（长按文本时弹出的菜单）')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "spellCheckConfiguration",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('spellCheckConfiguration(SpellCheckConfiguration)'),
            Text('拼写检查配置（如启用/禁用、错误文本样式等）')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "magnifierConfiguration",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('magnifierConfiguration(TextMagnifierConfiguration)'),
            Text('文本放大镜配置（长按选中文本时的放大效果）')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "dragStartBehavior",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('dragStartBehavior(DragStartBehavior)'),
            Text('拖动行为的起始方式（如立即响应或延迟响应）')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "scrollPhysics",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('scrollPhysics(ScrollPhysics)'),
            Text('滚动物理效果（如滚动边界行为）')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "clipBehavior",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('clipBehavior(Clip)'),
            Text('内容裁剪方式（如抗锯齿裁剪）')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "shouldTriggerChange",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('shouldTriggerChange(bool)'),
            Text('当value手动控制的时候 是否应该触发onChange')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "hapticFeedback",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('hapticFeedback(AntdHapticFeedback)'),
            Text('开启反馈')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdHapticFeedback.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('light'), value: 'light'), AntdSelectorItem(label: Text('medium'), value: 'medium'), AntdSelectorItem(label: Text('heavy'), value: 'heavy'), AntdSelectorItem(label: Text('none'), value: 'none')]);
            
},
),
AntdFormItem(
name: "autoCollect",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('autoCollect(bool)'),
            Text('自动同步值到表单')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
];}
List<AntdFormItem> _getAntdRadioItemList(){return [
AntdFormItem(
name: "disabled",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('disabled(bool)'),
            Text('禁用')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "readOnly",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('readOnly(bool)'),
            Text('只读')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "value",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('value(dynamic)'),
            Text('值')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "autoCollect",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('autoCollect(bool)'),
            Text('自动同步值到表单')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "shouldTriggerChange",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('shouldTriggerChange(bool)'),
            Text('当value手动控制的时候 是否应该触发onChange')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "manual",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('manual(bool)'),
            Text('受控模式 value的值必须手动更新 默认不开启')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "indeterminate",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('indeterminate(bool)'),
            Text('半选')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "extra",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('extra(Widget)'),
            Text('内容')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "hapticFeedback",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('hapticFeedback(AntdHapticFeedback)'),
            Text('开启反馈')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdHapticFeedback.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('light'), value: 'light'), AntdSelectorItem(label: Text('medium'), value: 'medium'), AntdSelectorItem(label: Text('heavy'), value: 'heavy'), AntdSelectorItem(label: Text('none'), value: 'none')]);
            
},
),
];}
List<AntdFormItem> _getAntdSearchBarItemList(){return [
AntdFormItem(
name: "extra",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('extra(Widget)'),
            Text('取消按钮的文案')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "autoClear",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('autoClear(bool)'),
            Text('点击取消按钮后是否清空输入框')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "autoFocus",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('autoFocus(bool)'),
            Text('自动获取焦点')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "showExtra",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('showExtra(bool)'),
            Text('点击取消按钮后是否清空输入框')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "clearable",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('clearable(bool)'),
            Text('是否启用清除图标，点击清除图标后会清空输入框')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "prefix",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('prefix(Widget)'),
            Text('前缀')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "placeholder",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('placeholder(Widget)'),
            Text('提示文本')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "readOnly",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('readOnly(bool)'),
            Text('只读模式')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "lazy",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('lazy(bool)'),
            Text('只有当激活后才出现输入框')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "duration",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('duration(Duration)'),
            Text('动画时长')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
];}
List<AntdFormItem> _getAntdSelectorItemList(){return [
AntdFormItem(
name: "disabled",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('disabled(bool)'),
            Text('禁用')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "readOnly",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('readOnly(bool)'),
            Text('只读')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "autoCollect",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('autoCollect(bool)'),
            Text('自动同步值到表单')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "shouldTriggerChange",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('shouldTriggerChange(bool)'),
            Text('当value手动控制的时候 是否应该触发onChange')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "hapticFeedback",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('hapticFeedback(AntdHapticFeedback)'),
            Text('开启反馈')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdHapticFeedback.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('light'), value: 'light'), AntdSelectorItem(label: Text('medium'), value: 'medium'), AntdSelectorItem(label: Text('heavy'), value: 'heavy'), AntdSelectorItem(label: Text('none'), value: 'none')]);
            
},
),
AntdFormItem(
name: "manual",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('manual(bool)'),
            Text('受控模式 value的值必须手动更新 默认不开启')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "columns",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('columns(int)'),
            Text('列数')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
];}
List<AntdFormItem> _getAntdSliderItemList(){return [
AntdFormItem(
name: "disabled",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('disabled(bool)'),
            Text('禁用')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "readOnly",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('readOnly(bool)'),
            Text('只读')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "value",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('value(AntdSliderValue)'),
            Text('值')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "autoCollect",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('autoCollect(bool)'),
            Text('自动同步值到表单')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "shouldTriggerChange",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('shouldTriggerChange(bool)'),
            Text('当value手动控制的时候 是否应该触发onChange')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "hapticFeedback",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('hapticFeedback(AntdHapticFeedback)'),
            Text('开启反馈')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdHapticFeedback.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('light'), value: 'light'), AntdSelectorItem(label: Text('medium'), value: 'medium'), AntdSelectorItem(label: Text('heavy'), value: 'heavy'), AntdSelectorItem(label: Text('none'), value: 'none')]);
            
},
),
AntdFormItem(
name: "manual",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('manual(bool)'),
            Text('受控模式 value的值必须手动更新 默认不开启')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "slider",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('slider(Widget)'),
            Text('滑块的图标')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "max",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('max(int)'),
            Text('最大值')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "min",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('min(int)'),
            Text('最小值')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "length",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('length(int)'),
            Text('长度')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "range",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('range(bool)'),
            Text('是否为双滑块')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "step",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('step(int)'),
            Text('步距，取值必须大于 0，并且 (max - min) 可被 step 整除。当 marks 不为空对象时，step 的配置失效')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "ticks",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('ticks(bool)'),
            Text('是否显示刻度')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
];}
List<AntdFormItem> _getAntdSwitchItemList(){return [
AntdFormItem(
name: "disabled",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('disabled(bool)'),
            Text('禁用')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "readOnly",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('readOnly(bool)'),
            Text('只读')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "value",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('value(dynamic)'),
            Text('值')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "autoCollect",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('autoCollect(bool)'),
            Text('自动同步值到表单')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "shouldTriggerChange",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('shouldTriggerChange(bool)'),
            Text('当value手动控制的时候 是否应该触发onChange')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "hapticFeedback",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('hapticFeedback(AntdHapticFeedback)'),
            Text('开启反馈')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdHapticFeedback.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('light'), value: 'light'), AntdSelectorItem(label: Text('medium'), value: 'medium'), AntdSelectorItem(label: Text('heavy'), value: 'heavy'), AntdSelectorItem(label: Text('none'), value: 'none')]);
            
},
),
AntdFormItem(
name: "manual",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('manual(bool)'),
            Text('受控模式 value的值必须手动更新 默认不开启')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "content",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('content(Widget)'),
            Text('选中时的内容')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "activeContent",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('activeContent(Widget)'),
            Text('未选中时的内容')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "duration",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('duration(Duration)'),
            Text('动画周期')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
];}
List<AntdFormItem> _getAntdTextAreaItemList(){return [
AntdFormItem(
name: "focusNode",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('focusNode(FocusNode)'),
            Text('控制输入框的焦点状态')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "clearable",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('clearable(bool)'),
            Text('是否显示清除按钮（点击会清空输入内容）')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "value",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('value(String)'),
            Text('值')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "disabled",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('disabled(bool)'),
            Text('禁用')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "placeholder",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('placeholder(Widget)'),
            Text('输入框为空时显示的提示文本')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "readOnly",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('readOnly(bool)'),
            Text('只读')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "autoCollect",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('autoCollect(bool)'),
            Text('自动同步值到表单')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "autocorrect",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('autocorrect(bool)'),
            Text('是否自动校正拼写错误（如iOS键盘的自动修正），默认为true')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "maxLines",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('maxLines(int)'),
            Text('输入框的最大行数（多行文本时生效）')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "minLines",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('minLines(int)'),
            Text('输入框的最小行数（多行文本时生效）')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "maxLength",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('maxLength(int)'),
            Text('允许输入的最大字符数')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "keyboardType",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('keyboardType(TextInputType)'),
            Text('键盘类型（如数字键盘、邮箱键盘等）')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "inputAction",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('inputAction(TextInputAction)'),
            Text('键盘动作按钮类型（如搜索、发送等）')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "prefix",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('prefix(Widget)'),
            Text('输入框前缀部件（如图标、标签等）')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "suffix",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('suffix(Widget)'),
            Text('输入框后缀部件（如图标、按钮等）')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "contextMenuBuilder",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('contextMenuBuilder(EditableTextContextMenuBuilder)'),
            Text('自定义上下文菜单构建器（长按文本时弹出的菜单）')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "spellCheckConfiguration",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('spellCheckConfiguration(SpellCheckConfiguration)'),
            Text('拼写检查配置（如启用/禁用、错误文本样式等）')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "magnifierConfiguration",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('magnifierConfiguration(TextMagnifierConfiguration)'),
            Text('文本放大镜配置（长按选中文本时的放大效果）')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "dragStartBehavior",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('dragStartBehavior(DragStartBehavior)'),
            Text('拖动行为的起始方式（如立即响应或延迟响应）')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "scrollPhysics",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('scrollPhysics(ScrollPhysics)'),
            Text('滚动物理效果（如滚动边界行为）')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "clipBehavior",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('clipBehavior(Clip)'),
            Text('内容裁剪方式（如抗锯齿裁剪）')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "shouldTriggerChange",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('shouldTriggerChange(bool)'),
            Text('当value手动控制的时候 是否应该触发onChange')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "hapticFeedback",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('hapticFeedback(AntdHapticFeedback)'),
            Text('开启反馈')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdHapticFeedback.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('light'), value: 'light'), AntdSelectorItem(label: Text('medium'), value: 'medium'), AntdSelectorItem(label: Text('heavy'), value: 'heavy'), AntdSelectorItem(label: Text('none'), value: 'none')]);
            
},
),
AntdFormItem(
name: "showCount",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('showCount(bool)'),
            Text('是否展示字数统计')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
];}
List<AntdFormItem> _getAntdBadgeItemList(){return [
AntdFormItem(
name: "bordered",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('bordered(bool)'),
            Text('是否显示边框（默认false）')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "color",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('color(AntdColor)'),
            Text('徽标背景色/小圆点颜色')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdColor.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('fill'), value: 'fill'), AntdSelectorItem(label: Text('primary'), value: 'primary'), AntdSelectorItem(label: Text('success'), value: 'success'), AntdSelectorItem(label: Text('warning'), value: 'warning'), AntdSelectorItem(label: Text('danger'), value: 'danger'), AntdSelectorItem(label: Text('info'), value: 'info'), AntdSelectorItem(label: Text('link'), value: 'link')]);
            
},
),
AntdFormItem(
name: "badge",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('badge(Widget)'),
            Text('徽标显示内容（数字/文字等）')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "dot",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('dot(bool)'),
            Text('是否显示为小红点而非内容（默认false）')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "position",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('position(AntdBadgePosition)'),
            Text('徽标相对于子组件的位置')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdBadgePosition.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('topLeft'), value: 'topLeft'), AntdSelectorItem(label: Text('topRight'), value: 'topRight'), AntdSelectorItem(label: Text('bottomLeft'), value: 'bottomLeft'), AntdSelectorItem(label: Text('bottomRight'), value: 'bottomRight')]);
            
},
),
AntdFormItem(
name: "child",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('child(Widget)'),
            Text('徽标包裹的子组件')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "offset",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('offset(Offset)'),
            Text('徽标自定义偏移量（相对默认位置调整）')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
];}
List<AntdFormItem> _getAntdNoticeBarItemList(){return [
AntdFormItem(
name: "closeable",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('closeable(bool)'),
            Text('是否可关闭')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
AntdFormItem(
name: "closeIcon",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('closeIcon(Widget)'),
            Text('自定义关闭按钮图标')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "color",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('color(AntdColor)'),
            Text('通告栏的类型')
          ],),
              
builder: (ctx) {
              return AntdSelector(
              autoCollect:false,
              value:ctx.value != null ? [ctx.value.toString().split('.').last] : [],
                onChange: (values) async {
                  ctx.onChange(AntdColor.values
                      .firstWhere((value) => value.name == values?.lastOrNull));
                },
                items: const [ AntdSelectorItem(label: Text('fill'), value: 'fill'), AntdSelectorItem(label: Text('primary'), value: 'primary'), AntdSelectorItem(label: Text('success'), value: 'success'), AntdSelectorItem(label: Text('warning'), value: 'warning'), AntdSelectorItem(label: Text('danger'), value: 'danger'), AntdSelectorItem(label: Text('info'), value: 'info'), AntdSelectorItem(label: Text('link'), value: 'link')]);
            
},
),
AntdFormItem(
name: "content",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('content(String)'),
            Text('公告内容')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "delay",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('delay(Duration)'),
            Text('开始滚动的延迟，单位 ms')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "speed",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('speed(double)'),
            Text('滚动的速度')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "extra",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('extra(Widget)'),
            Text('额外操作区域，显示在关闭按钮左侧')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "icon",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('icon(Widget)'),
            Text('额外操作区域，显示在关闭按钮左侧')
          ],),
              
builder: (ctx) {
              return  const AntdInput();
            
},
),
AntdFormItem(
name: "wrap",
                label: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('wrap(bool)'),
            Text('是否多行展示')
          ],),
              
builder: (ctx) {
                return AntdSwitch(value: ctx.value ?? false, onChange: (check) {
                ctx.onChange(check);
          },);
                
},
),
];}

List<AntdFormItem> getFormItem(String name){
if (name == 'AntdFlex'){
return _getAntdFlexItemList();
}
if (name == 'AntdTour'){
return _getAntdTourItemList();
}
if (name == 'AntdBox'){
return _getAntdBoxItemList();
}
if (name == 'AntdButton'){
return _getAntdButtonItemList();
}
if (name == 'AntdActionSheet'){
return _getAntdActionSheetItemList();
}
if (name == 'AntdIcon'){
return _getAntdIconItemList();
}
if (name == 'AntdDivider'){
return _getAntdDividerItemList();
}
if (name == 'AntdDialog'){
return _getAntdDialogItemList();
}
if (name == 'AntdCapsuleTabs'){
return _getAntdCapsuleTabsItemList();
}
if (name == 'AntdEmpty'){
return _getAntdEmptyItemList();
}
if (name == 'AntdErrorBlock'){
return _getAntdErrorBlockItemList();
}
if (name == 'AntdIndexBar'){
return _getAntdIndexBarItemList();
}
if (name == 'AntdJumboTabs'){
return _getAntdJumboTabsItemList();
}
if (name == 'AntdLoading'){
return _getAntdLoadingItemList();
}
if (name == 'AntdNavBar'){
return _getAntdNavBarItemList();
}
if (name == 'AntdSliderBar'){
return _getAntdSliderBarItemList();
}
if (name == 'AntdAvatar'){
return _getAntdAvatarItemList();
}
if (name == 'AntdTabBar'){
return _getAntdTabBarItemList();
}
if (name == 'AntdCard'){
return _getAntdCardItemList();
}
if (name == 'AntdTabs'){
return _getAntdTabsItemList();
}
if (name == 'AntdCollapse'){
return _getAntdCollapseItemList();
}
if (name == 'AntdModal'){
return _getAntdModalItemList();
}
if (name == 'AntdFloatingPanel'){
return _getAntdFloatingPanelItemList();
}
if (name == 'AntdEllipsis'){
return _getAntdEllipsisItemList();
}
if (name == 'AntdMask'){
return _getAntdMaskItemList();
}
if (name == 'AntdPopover'){
return _getAntdPopoverItemList();
}
if (name == 'AntdImage'){
return _getAntdImageItemList();
}
if (name == 'AntdPageIndicator'){
return _getAntdPageIndicatorItemList();
}
if (name == 'AntdList'){
return _getAntdListItemList();
}
if (name == 'AntdPopup'){
return _getAntdPopupItemList();
}
if (name == 'AntdProgressBar'){
return _getAntdProgressBarItemList();
}
if (name == 'AntdProgressCircle'){
return _getAntdProgressCircleItemList();
}
if (name == 'AntdSteps'){
return _getAntdStepsItemList();
}
if (name == 'AntdSegmented'){
return _getAntdSegmentedItemList();
}
if (name == 'AntdPullToRefresh'){
return _getAntdPullToRefreshItemList();
}
if (name == 'AntdDropdown'){
return _getAntdDropdownItemList();
}
if (name == 'AntdSwiper'){
return _getAntdSwiperItemList();
}
if (name == 'AntdTag'){
return _getAntdTagItemList();
}
if (name == 'AntdFooter'){
return _getAntdFooterItemList();
}
if (name == 'AntdSkeleton'){
return _getAntdSkeletonItemList();
}
if (name == 'AntdSwipeAction'){
return _getAntdSwipeActionItemList();
}
if (name == 'AntdResult'){
return _getAntdResultItemList();
}
if (name == 'AntdToast'){
return _getAntdToastItemList();
}
if (name == 'AntdCascader'){
return _getAntdCascaderItemList();
}
if (name == 'AntdCascaderView'){
return _getAntdCascaderViewItemList();
}
if (name == 'AntdCheckList'){
return _getAntdCheckListItemList();
}
if (name == 'AntdFormItem'){
return _getAntdFormItemItemList();
}
if (name == 'AntdForm'){
return _getAntdFormItemList();
}
if (name == 'AntdCheckbox'){
return _getAntdCheckboxItemList();
}
if (name == 'AntdInput'){
return _getAntdInputItemList();
}
if (name == 'AntdRadio'){
return _getAntdRadioItemList();
}
if (name == 'AntdSearchBar'){
return _getAntdSearchBarItemList();
}
if (name == 'AntdSelector'){
return _getAntdSelectorItemList();
}
if (name == 'AntdSlider'){
return _getAntdSliderItemList();
}
if (name == 'AntdSwitch'){
return _getAntdSwitchItemList();
}
if (name == 'AntdTextArea'){
return _getAntdTextAreaItemList();
}
if (name == 'AntdBadge'){
return _getAntdBadgeItemList();
}
if (name == 'AntdNoticeBar'){
return _getAntdNoticeBarItemList();
}
return [];
}
dynamic _resolveValue(Map<String, dynamic> atr,String componentName,String name,String type,dynamic defaultValue){
    var fullName = "$componentName-$name";
  if (customFull.containsKey(fullName)) {
    return customFull[fullName];
  }
    var val = atr[name];
    if (type == 'Widget') {
      return val != null ? Text(val) : null;
    } 
    if (val == null  || (val is String  && val.isEmpty)){
      return defaultValue;
    }
       if (type == 'double') {
      return double.tryParse(val);
    } else if (type == 'int') {
      return int.tryParse(val);
    } else if (type == 'Duration' && int.tryParse(val) != null) {
      return Duration(microseconds: int.tryParse(val)!);
    } else {
      return val;
    }
    
}
