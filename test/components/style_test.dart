import 'package:antd_flutter_mobile/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class TestStyle extends AntdStyle {
  final Color? color;
  final double? size;

  const TestStyle({this.color, this.size, super.inherit});

  @override
  TestStyle copyFrom(covariant TestStyle? style) {
    return TestStyle(
      color: style?.color ?? color,
      size: style?.size ?? size,
      inherit: style?.inherit ?? inherit,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TestStyle &&
          runtimeType == other.runtimeType &&
          color == other.color &&
          size == other.size &&
          inherit == other.inherit;

  @override
  int get hashCode => Object.hash(color, size, inherit);
}

class TestWidget {
  final String id;
  const TestWidget(this.id);
}

class TestStyleMixin with AntdStyleMixin<TestStyle, TestWidget> {
  final TestWidget widget;

  TestStyleMixin(this.widget);

  @override
  TestWidget getWidget(BuildContext context) => widget;

  @override
  TestStyle? getInputStyle(BuildContext context) {
    return AntdStyleUse.maybeOf<TestStyle>(context);
  }

  @override
  AntdStyleBuilder<TestStyle, TestWidget>? getStyleBuilder(
      BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<
            AntdStyleBuilderProvider<TestStyle, TestWidget>>()
        ?.builder;
  }

  @override
  TestStyle getDefaultStyle(
      BuildContext context, AntdTheme theme, AntdMapToken token) {
    return const TestStyle(color: Colors.red, size: 16.0);
  }

  @override
  TestStyle margeStyle(TestStyle defaultStyle, TestStyle? style) {
    if (style == null) return defaultStyle;
    return defaultStyle.copyFrom(style);
  }
}

AntdTheme createTestTheme() {
  return AntdTheme(
    algorithms: [light],
    token: const AntdSeedToken(
        radius: 6,
        colorPrimary: Colors.blue,
        colorText: Colors.black,
        colorSuccess: Colors.green,
        colorWarning: Colors.orange,
        colorInfo: Colors.blue,
        colorLink: Colors.blue,
        colorBgBase: Colors.white,
        lineWidth: 1,
        fontSize: 14,
        sizeStep: 4,
        sizeUnit: 2,
        colorError: Colors.red,
        arrow: Size(16, 8)),
  );
}

void main() {
  group('AntdStyle Basic Tests', () {
    test('AntdStyle should have correct inherit default value', () {
      const style = AntdStyle();
      expect(style.inherit, isTrue);
    });

    test('AntdStyle should accept custom inherit value', () {
      const style = AntdStyle(inherit: false);
      expect(style.inherit, isFalse);
    });

    test('TestStyle copyFrom should work correctly', () {
      const original = TestStyle(color: Colors.red, size: 16.0);
      const newStyle = TestStyle(color: Colors.blue, size: 20.0);

      final copied = original.copyFrom(newStyle);
      expect(copied.color, Colors.blue);
      expect(copied.size, 20.0);
      expect(copied.inherit, isTrue);
    });

    test('TestStyle copyFrom with null should return original', () {
      const original = TestStyle(color: Colors.red, size: 16.0);
      final copied = original.copyFrom(null);
      expect(copied.color, Colors.red);
      expect(copied.size, 16.0);
    });

    test('TestStyle equality and hashCode', () {
      const style1 = TestStyle(color: Colors.red, size: 16.0);
      const style2 = TestStyle(color: Colors.red, size: 16.0);
      const style3 = TestStyle(color: Colors.blue, size: 16.0);

      expect(style1, equals(style2));
      expect(style1, isNot(equals(style3)));
      expect(style1.hashCode, equals(style2.hashCode));
    });
  });

  group('AntdStyleProvider Tests', () {
    testWidgets('AntdStyleProvider should provide style to children',
        (WidgetTester tester) async {
      const testStyle = TestStyle(color: Colors.green, size: 24.0);

      await tester.pumpWidget(
        MaterialApp(
          home: AntdStyleProvider<TestStyle>(
            style: testStyle,
            child: Builder(
              builder: (context) {
                final providedStyle = context
                    .dependOnInheritedWidgetOfExactType<
                        AntdStyleProvider<TestStyle>>()
                    ?.style;
                return Text('Color: ${providedStyle?.color}');
              },
            ),
          ),
        ),
      );

      expect(find.text('Color: ${testStyle.color}'), findsOneWidget);
    });

    testWidgets('AntdStyleProvider should update when style changes',
        (WidgetTester tester) async {
      TestStyle currentStyle = const TestStyle(color: Colors.red, size: 16.0);
      late StateSetter setStateFn;

      await tester.pumpWidget(
        MaterialApp(
          home: StatefulBuilder(
            builder: (context, setState) {
              setStateFn = setState; // 保存 setState 引用
              return AntdStyleProvider<TestStyle>(
                style: currentStyle,
                child: Builder(
                  builder: (context) {
                    final providedStyle = context
                        .dependOnInheritedWidgetOfExactType<
                            AntdStyleProvider<TestStyle>>()
                        ?.style;
                    return Text('Size: ${providedStyle?.size}');
                  },
                ),
              );
            },
          ),
        ),
      );

      expect(find.text('Size: 16.0'), findsOneWidget);

      setStateFn(() {
        currentStyle = const TestStyle(color: Colors.blue, size: 20.0);
      });
      await tester.pump();

      expect(find.text('Size: 20.0'), findsOneWidget);
    });
  });

  group('AntdStyleBuilderProvider Tests', () {
    testWidgets('AntdStyleBuilderProvider should provide builder to children',
        (WidgetTester tester) async {
      TestStyle builder(BuildContext context, TestWidget widget,
          TestStyle defaultStyle, AntdMapToken token) {
        return TestStyle(color: Colors.purple, size: defaultStyle.size! + 4.0);
      }

      await tester.pumpWidget(
        MaterialApp(
          home: AntdStyleBuilderProvider<TestStyle, TestWidget>(
            builder: builder,
            child: Builder(
              builder: (context) {
                final providedBuilder = context
                    .dependOnInheritedWidgetOfExactType<
                        AntdStyleBuilderProvider<TestStyle, TestWidget>>()
                    ?.builder;
                return Text('Builder provided: ${providedBuilder != null}');
              },
            ),
          ),
        ),
      );

      expect(find.text('Builder provided: true'), findsOneWidget);
    });
  });

  group('AntdStyleUse Tests', () {
    testWidgets('AntdStyleUse should provide style to children',
        (WidgetTester tester) async {
      const testStyle = TestStyle(color: Colors.orange, size: 18.0);

      await tester.pumpWidget(
        MaterialApp(
          home: AntdStyleUse<TestStyle>(
            style: testStyle,
            child: Builder(
              builder: (context) {
                final providedStyle = AntdStyleUse.maybeOf<TestStyle>(context);
                return Text('Used color: ${providedStyle?.color}');
              },
            ),
          ),
        ),
      );

      expect(find.text('Used color: ${testStyle.color}'), findsOneWidget);
    });

    testWidgets('AntdStyleUse.maybeOf should return null when not found',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              final providedStyle = AntdStyleUse.maybeOf<TestStyle>(context);
              return Text('Style found: ${providedStyle != null}');
            },
          ),
        ),
      );

      expect(find.text('Style found: false'), findsOneWidget);
    });
  });

  group('Style Priority Tests', () {
    testWidgets('should respect inherit false in style builder',
        (WidgetTester tester) async {
      final mixin = TestStyleMixin(const TestWidget('test'));
      late TestStyle resultStyle;

      TestStyle styleBuilder(BuildContext context, TestWidget widget,
          TestStyle defaultStyle, AntdMapToken token) {
        return const TestStyle(
            color: Colors.purple, size: 50.0, inherit: false);
      }

      // Also provide input style that should be ignored due to inherit=false
      const inputStyle = TestStyle(color: Colors.green);

      await tester.pumpWidget(
        MaterialApp(
          home: AntdProvider(
            theme: createTestTheme(),
            builder: (context, theme) {
              return AntdStyleProvider<TestStyle>(
                style: inputStyle,
                child: AntdStyleBuilderProvider<TestStyle, TestWidget>(
                  builder: styleBuilder,
                  child: Builder(
                    builder: (context) {
                      resultStyle = mixin.getStyle(context);
                      return Container();
                    },
                  ),
                ),
              );
            },
          ),
        ),
      );

      // Should only use style builder values since inherit=false
      expect(resultStyle.color, Colors.purple);
      expect(resultStyle.size, 50.0);
    });

    testWidgets('should merge multiple styles in correct order',
        (WidgetTester tester) async {
      final mixin = TestStyleMixin(const TestWidget('test'));
      late TestStyle resultStyle;

      const inputStyle = TestStyle(color: Colors.green);
      TestStyle styleBuilder(BuildContext context, TestWidget widget,
          TestStyle defaultStyle, AntdMapToken token) {
        return const TestStyle(size: 24.0);
      }

      const styleProviderStyle =
          TestStyle(color: Colors.orange); // This should override inputStyle

      await tester.pumpWidget(
        MaterialApp(
          home: AntdProvider(
            theme: createTestTheme(),
            builder: (context, theme) {
              return AntdStyleProvider<TestStyle>(
                style: styleProviderStyle,
                child: AntdStyleUse<TestStyle>(
                  style: inputStyle,
                  child: AntdStyleBuilderProvider<TestStyle, TestWidget>(
                    builder: styleBuilder,
                    child: Builder(
                      builder: (context) {
                        resultStyle = mixin.getStyle(context);
                        return Container();
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );

      // Color from styleProviderStyle (highest priority), size from styleBuilder
      expect(resultStyle.color, Colors.green);
      expect(resultStyle.size, 24.0);
    });
  });
}
