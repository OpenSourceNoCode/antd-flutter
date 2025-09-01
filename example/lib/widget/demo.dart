import 'package:antd_flutter/index.dart';
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
          margin: token.size.lg.top,
          color: token.colorWhite,
          padding: token.size.lg.all),
      child: child,
    );
  }
}

class Blocks extends StatelessWidget {
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
  Widget build(BuildContext context) {
    var token = AntdTheme.ofToken(context);
    var child = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AntdBox(
          style: AntdBoxStyle(
              color: token.colorTransparent,
              padding: token.size.lg.horizontal.marge(token.size.lg.top)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title ?? '',
                style: token.font.xl.copyWith(color: token.colorPrimary),
              ),
              if (usage != null || description != null)
                AntdBox(
                  style: AntdBoxStyle(
                      margin: token.size.default_.top,
                      padding: token.size.default_.top,
                      textStyle: token.font.default_
                          .copyWith(color: token.colorTextTertiary)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (description != null)
                        Text(
                          description!,
                          style: token.font.default_
                              .copyWith(color: token.colorTextTertiary),
                        ),
                      Text(
                        usage ?? "",
                        overflow: TextOverflow.fade,
                      )
                    ],
                  ),
                )
            ],
          ),
        ),
        ...items
      ],
    );
    return axis == Axis.horizontal
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
            DefaultTextStyle(style: token.font.xl, child: widget.title),
            if (widget.desc != null)
              Text(
                widget.desc!,
                style: token.font.xs.copyWith(color: token.colorTextTertiary),
              ),
            AntdBox(
              style: AntdBoxStyle(
                padding: token.size.md.vertical,
              ),
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
                          textStyle: token.font.default_
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
                                    margin: token.size.lg.top,
                                    padding: token.size.default_.all,
                                    radius: token.radius.default_.radius.all,
                                    color: token.colorFillContent),
                                child: Text(
                                  widget.demo!,
                                  style: token.font.default_,
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
      {super.key, required this.child, super.style, this.outline = false});

  @override
  AntdBoxStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdAliasToken token) {
    return AntdBoxStyle(
      alignment: Alignment.centerLeft,
      width: double.infinity,
      color: outline ? token.colorWarning : token.colorWhite,
      padding: outline ? token.size.lg.all : null,
    );
  }

  @override
  AntdBoxStyle margeStyle(AntdBoxStyle defaultStyle, AntdBoxStyle? style) {
    return defaultStyle.copyFrom(style);
  }

  @override
  Widget render(BuildContext context, AntdBoxStyle style) {
    return AntdBox(
      style: style,
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: child,
      ),
    );
  }

  @override
  DemoWrapper getWidget(BuildContext context) {
    return this;
  }
}
