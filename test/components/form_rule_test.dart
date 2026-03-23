import 'package:antd_flutter_mobile/components/form/item.dart';
import 'package:antd_flutter_mobile/components/form/rule.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

/// 用于测试的最小 AntdFormItem 实例（validator 内部不实际使用 item 参数）
final _testItem = AntdFormItem(
  name: 'test',
  builder: (_) => const SizedBox(),
);

void main() {
  group('Bug1: required 规则 message 字段被忽略', () {
    test('规则命中时，应返回用户设置的 message，而非硬编码"不能为空"', () async {
      const rule = AntdFormRule(
        required: true,
        message: '请输入用户名',
      );

      final validator = rule.buildValidList().first.buildValidator()!;

      // 空字符串触发 required 校验
      final result = await validator(_testItem, '', null);

      // ❌ BUG：实际返回 "不能为空"，不是 "请输入用户名"
      expect(result, equals('请输入用户名'),
          reason: '应使用自定义 message，而非硬编码文本');
    });

    test('value 为 null 时，也应返回用户设置的 message', () async {
      const rule = AntdFormRule(
        required: true,
        message: '此项不能为空',
      );

      final validator = rule.buildValidList().first.buildValidator()!;
      final result = await validator(_testItem, null, null);

      // ❌ BUG：实际返回 "不能为空"，不是 "此项不能为空"
      expect(result, equals('此项不能为空'),
          reason: '应使用自定义 message，而非硬编码文本');
    });

    test('有值时规则不触发，应返回 null', () async {
      const rule = AntdFormRule(
        required: true,
        message: '请输入用户名',
      );

      final validator = rule.buildValidList().first.buildValidator()!;
      final result = await validator(_testItem, '张三', null);

      expect(result, isNull, reason: '有值时不应报错');
    });
  });

  group('Bug2: pattern 匹配逻辑反转', () {
    test('pattern 匹配成功时，校验应通过（返回 null）', () async {
      // 只允许数字
      final rule = AntdFormRule(
        pattern: RegExp(r'^\d+$'),
        message: '只能输入数字',
      );

      final validator = rule.buildValidList().first.buildValidator()!;

      // "12345" 符合正则，应通过
      final result = await validator(_testItem, '12345', null);

      // ❌ BUG：当前 hasMatch==true 时返回错误，实际会报错
      expect(result, isNull,
          reason: '"12345" 符合 r"^\\d+\$"，应通过校验返回 null');
    });

    test('pattern 不匹配时，校验应失败（返回错误信息）', () async {
      final rule = AntdFormRule(
        pattern: RegExp(r'^\d+$'),
        message: '只能输入数字',
      );

      final validator = rule.buildValidList().first.buildValidator()!;

      // "abc" 不符合正则，应失败
      final result = await validator(_testItem, 'abc', null);

      // ❌ BUG：当前 hasMatch==false 时返回 null，实际会放过非法值
      expect(result, isNotNull,
          reason: '"abc" 不符合 r"^\\d+\$"，应校验失败返回错误信息');
    });
  });
}
