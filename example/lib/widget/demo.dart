import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/material.dart';

class Block extends StatelessWidget {
  final Widget child;

  const Block({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);

    return AntdBox(
      style: AntdBoxStyle(
        radius: 4.radius.all,
        margin: token.size.xxl.top,
        color: token.colorBgContainer,
      ),
      child: child,
    );
  }
}

class Blocks extends StatefulWidget {
  final String? title;

  final String? description;

  final String? usage;

  final List<Widget> items;

  final Axis axis;

  const Blocks(
      {super.key,
      this.title,
      this.description,
      this.usage,
      required this.items,
      required this.axis});

  @override
  State<StatefulWidget> createState() {
    return _BlocksState();
  }
}

class _BlocksState extends State<Blocks> {
  String? activeValue;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var mode = AntdTheme.ofMode(context);
    activeValue = mode.name;
  }

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    var child = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AntdBox(
          style: AntdBoxStyle(margin: 8.vertical),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  AntdSegmented(
                      value: activeValue,
                      onChange: (value) {
                        setState(() {
                          activeValue = value;
                          AntdTheme.configure(
                              context,
                              AntdThemeMode.values
                                      .where((mode) => mode.name == activeValue)
                                      .firstOrNull ??
                                  AntdTheme.ofMode(context));
                        });
                      },
                      items: [
                        AntdSegmentedItem(
                          value: AntdThemeMode.light.name,
                          child: const Text("亮色"),
                        ),
                        AntdSegmentedItem(
                          value: AntdThemeMode.dark.name,
                          child: const Text("暗色"),
                        ),
                      ]),
                ],
              )
            ],
          ),
        ),
        AntdBox(
          style: AntdBoxStyle(
              color: token.colorTransparent,
              padding: token.size.lg.horizontal.marge(token.size.lg.top)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title ?? '',
                style: token.font.xl.copyWith(color: token.colorPrimary),
              ),
              if (widget.usage != null || widget.description != null)
                AntdBox(
                  style: AntdBoxStyle(
                      margin: token.size.seed.top,
                      padding: token.size.seed.top,
                      textStyle: token.font.ms
                          .copyWith(color: token.colorText.tertiary)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.description != null)
                        Text(
                          widget.description!,
                          style: token.font.ms
                              .copyWith(color: token.colorText.tertiary),
                        ),
                      Text(
                        widget.usage ?? "",
                        overflow: TextOverflow.fade,
                      )
                    ],
                  ),
                )
            ],
          ),
        ),
        ...widget.items
      ],
    );
    return widget.axis == Axis.horizontal
        ? SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: child,
          )
        : child;
  }
}

class DemoBlock extends StatefulWidget {
  final Widget child;
  final Widget title;
  final String? desc;
  final String? demo;

  const DemoBlock(
      {super.key,
      required this.child,
      required this.title,
      this.desc,
      this.demo});

  @override
  State<StatefulWidget> createState() {
    return _DemoBlockState();
  }
}

class _DemoBlockState extends State<DemoBlock> {
  ValueNotifier<bool> show = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return AnimatedSize(
      alignment: Alignment.topCenter,
      duration: const Duration(milliseconds: 200),
      reverseDuration: const Duration(milliseconds: 200),
      child: Block(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AntdBox(
              style: AntdBoxStyle(padding: 12.horizontal.marge(8.vertical)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultTextStyle(style: token.font.xl, child: widget.title),
                  if (widget.desc != null)
                    Text(
                      widget.desc!,
                      style: token.font.xs
                          .copyWith(color: token.colorText.tertiary),
                    )
                ],
              ),
            ),
            AntdBox(
              child: widget.child,
            ),
            if (widget.demo != null)
              AntdBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AntdBox(
                      style: AntdBoxStyle(
                          alignment: Alignment.center,
                          width: double.infinity,
                          padding: token.size.lg.vertical,
                          textStyle: token.font.ms
                              .copyWith(color: token.colorPrimary)),
                      child: AntdBox(
                        onTap: () {
                          show.value = !show.value;
                        },
                        child: const Text('代码'),
                      ),
                    ),
                    if (widget.demo != null)
                      ValueListenableBuilder(
                          valueListenable: show,
                          builder: (context, value, _) {
                            if (value) {
                              return AntdBox(
                                style: AntdBoxStyle(
                                    width: double.infinity,
                                    padding: token.size.lg.all,
                                    radius: token.radius.all,
                                    color: token.colorBgContainer),
                                child: Text(
                                  widget.demo!,
                                  style: token.font.ms,
                                ),
                              );
                            }
                            return const AntdBox();
                          })
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}

class DemoWrapper extends AntdComponent<AntdBoxStyle, DemoWrapper> {
  final List<Widget> child;
  final bool outline;

  const DemoWrapper(
      {super.key, required this.child, super.style, this.outline = true});

  @override
  AntdBoxStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdMapToken token) {
    return AntdBoxStyle(
      alignment: Alignment.centerLeft,
      width: double.infinity,
      padding: outline ? token.size.lg.all : null,
    );
  }

  @override
  AntdBoxStyle margeStyle(AntdBoxStyle defaultStyle, AntdBoxStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  Widget render(BuildContext context, AntdBoxStyle style) {
    var token = AntdTheme.ofToken(context);
    return AntdBox(
      style: style,
      child: AntdBox(
        style: AntdBoxStyle(margin: token.size.lg.top),
        child: Wrap(
          spacing: 12,
          runSpacing: 12,
          children: child,
        ),
      ),
    );
  }

  @override
  DemoWrapper getWidget(BuildContext context) {
    return this;
  }
}

class DemoTitle extends StatelessWidget {
  final Widget child;

  final String? title;

  final Widget? extra;

  final bool outline;

  const DemoTitle(
      {super.key,
      this.title,
      this.extra,
      required this.child,
      this.outline = true});

  @override
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          AntdBox(
            style: AntdBoxStyle(
                margin: 8.horizontal,
                textStyle:
                    token.font.sm.copyWith(color: token.colorText.secondary)),
            child: Text(title!),
          ),
        if (extra != null)
          AntdBox(
            style: AntdBoxStyle(
                margin:
                    title != null ? 8.horizontal.marge(4.top) : 8.horizontal),
            child: extra,
          ),
        AntdBox(
          style: AntdBoxStyle(
              margin: 8.top, padding: outline ? 8.horizontal : 0.all),
          child: AntdBox(
            style: AntdBoxStyle(
                color: outline ? token.colorFill : null,
                radius: token.radius.lg.all),
            child: child,
          ),
        )
      ],
    );
  }
}
