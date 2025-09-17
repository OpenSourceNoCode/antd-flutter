import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/material.dart';

///结果样式
///@l [AntdResultStyle]
class AntdResultStyle extends AntdStyle {
  /// 结果页整体内容区域样式（包含图标、标题、描述等）
  final AntdBoxStyle? bodyStyle;

  /// 轴样式
  final AntdFlexStyle? columnStyle;

  /// 结果图标的自定义样式（颜色、大小等）
  final AntdIconStyle? iconStyle;

  /// 结果标题文本的样式（字体、颜色、间距等）
  final AntdBoxStyle? titleStyle;

  /// 结果描述文本的样式（字体、颜色、间距等）
  final AntdBoxStyle? descStyle;

  AntdResultStyle({
    super.inherit,
    this.bodyStyle,
    this.columnStyle,
    this.iconStyle,
    this.titleStyle,
    this.descStyle,
  });

  @override
  AntdResultStyle copyFrom(covariant AntdResultStyle? style) {
    return AntdResultStyle(
      bodyStyle: bodyStyle.merge(style?.bodyStyle),
      columnStyle: columnStyle.merge(style?.columnStyle),
      iconStyle: iconStyle.merge(style?.iconStyle),
      titleStyle: titleStyle.merge(style?.titleStyle),
      descStyle: descStyle.merge(style?.descStyle),
    );
  }
}

enum AntdResultStatus {
  success(
      AntdIcon(
        icon: AntdIcons.checkCircle,
      ),
      Text("操作成功"),
      null),
  error(
      AntdIcon(
        icon: AntdIcons.closeCircle,
      ),
      Text("无法完成操作"),
      null),
  info(
      AntdIcon(
        icon: AntdIcons.exclamationCircle,
      ),
      Text("信息提示"),
      null),
  waiting(
      AntdIcon(
        icon: AntdIcons.clockCircle,
      ),
      Text("警告提示"),
      null),
  warning(
      AntdIcon(
        icon: AntdIcons.exclamationCircle,
      ),
      Text("警告提示"),
      null);

  final Widget? icon;
  final Widget? title;
  final Widget? desc;

  const AntdResultStatus(this.icon, this.title, this.desc);
}

///@t 结果
///@g 反馈
///@o 68
///@d 对前一步操作的结果进行反馈。
///@u 当有重要操作需告知用户处理结果，且反馈内容较为复杂时使用。
class AntdResult extends AntdComponent<AntdResultStyle, AntdResult> {
  const AntdResult({
    super.key,
    super.style,
    super.styleBuilder,
    this.title,
    this.desc,
    this.icon,
    this.status = AntdResultStatus.info,
  });

  ///标题
  final Widget? title;

  ///描述
  final Widget? desc;

  ///图标
  final Widget? icon;

  ///状态类型
  final AntdResultStatus? status;

  @override
  Widget render(BuildContext context, AntdResultStyle style) {
    var childList = <Widget>[];
    var showIcon = icon ?? status?.icon;
    if (showIcon != null) {
      childList.add(AntdIconWrap(style: style.iconStyle, child: showIcon));
    }

    var showTitle = title ?? status?.title;
    if (showTitle != null) {
      childList.add(AntdBox(
        style: style.titleStyle,
        child: showTitle,
      ));
    }

    var showDesc = desc ?? status?.desc;
    if (showDesc != null) {
      childList.add(AntdBox(
        style: style.descStyle,
        child: showDesc,
      ));
    }

    return AntdBox(
      style: style.bodyStyle,
      child: AntdColumn(
        style: style.columnStyle,
        children: childList,
      ),
    );
  }

  Color getColor(AntdMapToken token) {
    switch (status) {
      case AntdResultStatus.success:
        return token.colorPrimary;
      case AntdResultStatus.error:
        return token.colorError;
      case AntdResultStatus.info:
        return token.colorPrimary;
      case AntdResultStatus.warning:
        return token.colorWarning;
      case AntdResultStatus.waiting:
        return token.colorSuccess;
      case null:
        return token.colorPrimary;
    }
  }

  @override
  AntdResultStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdMapToken token) {
    return AntdResultStyle(
        bodyStyle: AntdBoxStyle(
          width: double.infinity,
          padding: token.size.xxl.vertical.marge(token.size.md.horizontal),
        ),
        iconStyle: AntdIconStyle(
            size: 64,
            color: getColor(token),
            bodyStyle: AntdBoxStyle(
                padding: token.size.sm.all, margin: token.size.xl.bottom)),
        titleStyle: AntdBoxStyle(
          textStyle: token.font.xxl,
        ),
        descStyle: AntdBoxStyle(
            alignment: Alignment.center,
            margin: token.size.seed.top,
            textStyle: token.font.sm.copyWith(color: token.colorText.tertiary)),
        columnStyle: const AntdFlexStyle(
          mainAxisSize: MainAxisSize.min,
        ));
  }

  @override
  AntdResultStyle margeStyle(
      AntdResultStyle defaultStyle, AntdResultStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  AntdStyleBuilder<AntdResultStyle, AntdResult>? getThemeStyle(
      BuildContext context, AntdTheme theme) {
    return theme.resultStyle;
  }

  @override
  AntdResult getWidget(BuildContext context) {
    return this;
  }
}
