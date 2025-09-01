import 'package:antd_flutter/components/form/index.dart';
import 'package:antd_flutter/components/form/item.dart';

typedef AntdFormRuleValidator<T> = Future<String?> Function(
    AntdFormItem item, T? value, Map<String, dynamic>? formValue);

class AntdFormRuleMessage {
  final String message;
  final bool warningOnly;

  const AntdFormRuleMessage({required this.message, required this.warningOnly});
}

class AntdFormRuleResult {
  final List<AntdFormRuleMessage>? errorMessages;
  final dynamic value;
  final String name;

  const AntdFormRuleResult(
      {this.errorMessages, this.value, required this.name});

  List<AntdFormRuleMessage> getMessages([bool warningOnly = false]) {
    return errorMessages?.where((value) {
          return value.warningOnly == warningOnly;
        }).toList() ??
        [];
  }

  bool isPass() {
    return errorMessages == null ||
        errorMessages!.isEmpty ||
        getMessages().isEmpty;
  }

  String? get firstMessage => isPass() ? null : errorMessages![0].message;
}

enum AntdFormRuleType { string, number }

/// 检验规则
/// @l [AntdFormItem]
class AntdFormRule extends AntdFormRuleValid {
  ///是否匹配枚举中的值（需要将 type 设置为 enum）
  final List<String>? enums;

  ///string 类型时为字符串长度；number 类型时为确定数字； array 类型时为数组长度
  final int? len;

  ///必须设置 type：string 类型为字符串最大长度；number 类型时为最大值；array 类型时为数组最大长度
  final int? max;

  ///必须设置 type：string 类型为字符串最小长度；number 类型时为最小值；array 类型时为数组最小长度
  final int? min;

  ///正则表达式匹配
  final RegExp? pattern;

  ///是否为必选字段
  final bool? required;

  ///如果字段仅包含空格则校验不通过
  final bool? whitespace;

  ///类型
  final AntdFormRuleType? type;

  const AntdFormRule(
      {this.enums,
      this.len,
      this.max,
      super.message,
      this.min,
      this.pattern,
      this.required,
      super.validator,
      super.trigger,
      super.warningOnly,
      this.whitespace,
      this.type});

  List<AntdFormRuleValid> buildValidList() {
    List<AntdFormRuleValid> data = [];
    if (required != null) {
      data.add(AntdFormRuleRequiredValid(
          message: message, warningOnly: warningOnly, trigger: trigger));
    }
    if (pattern != null) {
      data.add(AntdFormRulePatternValid(
          pattern: pattern!,
          message: message,
          warningOnly: warningOnly,
          trigger: trigger));
    }

    var validator = buildValidator();
    if (validator != null) {
      data.add(this);
    }

    if (type == AntdFormRuleType.string) {
      if (enums != null) {
        data.add(AntdFormRuleEnumsValid(
            enums: enums!,
            message: message,
            warningOnly: warningOnly,
            trigger: trigger));
      }
      if (whitespace != null) {
        data.add(AntdFormRuleWhitespaceValid(
            message: message, warningOnly: warningOnly, trigger: trigger));
      }
    }
    if (len != null) {
      data.add(AntdFormRuleLenValid(
          len: len!,
          message: message,
          warningOnly: warningOnly,
          trigger: trigger));
    }
    if (max != null || min != null) {
      data.add(AntdFormRuleRangeValid(
          max: max,
          min: min,
          message: message,
          warningOnly: warningOnly,
          trigger: trigger));
    }
    return data;
  }
}

class AntdFormRuleValid {
  ///错误信息，不设置时会通过模板自动生成
  final String? message;

  ///自定义校验
  final AntdFormRuleValidator? validator;

  ///设置触发验证时机
  final AntdFormTrigger? trigger;

  ///仅警告，不阻塞表单提交
  final bool warningOnly;

  const AntdFormRuleValid(
      {this.message, this.validator, this.trigger, this.warningOnly = false});

  AntdFormRuleValidator? buildValidator() {
    return validator;
  }
}

class AntdFormRuleRequiredValid extends AntdFormRuleValid {
  const AntdFormRuleRequiredValid(
      {super.message, super.trigger, super.warningOnly});

  @override
  AntdFormRuleValidator? buildValidator() {
    return <T>(item, value, formValue) async {
      return value == null || (value is String && value.isEmpty)
          ? "不能为空"
          : null;
    };
  }
}

class AntdFormRuleEnumsValid extends AntdFormRuleValid {
  final List<String> enums;

  const AntdFormRuleEnumsValid(
      {required this.enums, super.message, super.trigger, super.warningOnly});

  @override
  AntdFormRuleValidator? buildValidator() {
    return <T>(item, value, formValue) async {
      return enums.isNotEmpty && (value == null || enums.contains(value))
          ? "必须是其中${enums.join(",")}之一"
          : null;
    };
  }
}

class AntdFormRuleWhitespaceValid extends AntdFormRuleValid {
  const AntdFormRuleWhitespaceValid(
      {super.message, super.trigger, super.warningOnly});

  @override
  AntdFormRuleValidator? buildValidator() {
    return (item, value, formValue) async {
      if (value is String) {
        return value.contains(" ") == true ? "不能存在空白字符串" : null;
      }
      return "";
    };
  }
}

class AntdFormRulePatternValid extends AntdFormRuleValid {
  final RegExp pattern;

  const AntdFormRulePatternValid(
      {required this.pattern, super.message, super.trigger, super.warningOnly});

  @override
  AntdFormRuleValidator? buildValidator() {
    return (item, value, formValue) async {
      return pattern.hasMatch(value.toString()) ? "不能与$pattern匹配" : null;
    };
  }
}

class AntdFormRuleLenValid extends AntdFormRuleValid {
  final int len;

  const AntdFormRuleLenValid(
      {required this.len, super.message, super.trigger, super.warningOnly});

  @override
  AntdFormRuleValidator? buildValidator() {
    return (item, value, formValue) async {
      return _getLen(value) > len ? "长度不能大于$len" : null;
    };
  }
}

int _getLen<T>(T? value) {
  var currentLen = 0;
  if (value is String) {
    currentLen = value.length;
  }
  if (value is num) {
    currentLen = value.toString().length;
  }
  if (value is List) {
    currentLen = value.length;
  }
  if (value is Map) {
    currentLen = value.length;
  }
  return currentLen;
}

class AntdFormRuleRangeValid extends AntdFormRuleValid {
  final int? max;
  final int? min;

  const AntdFormRuleRangeValid(
      {this.max, this.min, super.message, super.trigger, super.warningOnly});

  @override
  AntdFormRuleValidator? buildValidator() {
    return (item, value, formValue) async {
      var currentLen = _getLen(value);
      if (max != null && currentLen > max!) {
        return "长度不能大于$max";
      }
      if (min != null && currentLen < min!) {
        return "长度不能小于$min";
      }
      return null;
    };
  }
}
