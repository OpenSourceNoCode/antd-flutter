import 'dart:math';

import 'package:antd_flutter_mobile/components/form/rule.dart';
import 'package:flutter/widgets.dart';

import 'index.dart';
import 'item.dart';

class _Value {
  dynamic _beforeValue;
  dynamic _value;

  _Value(dynamic value) : _value = value;

  set value(dynamic setValue) {
    _beforeValue = _value;
    _value = setValue;
  }

  dynamic get beforeValue => _beforeValue;

  dynamic get value => _value;

  bool get isChanged => !_deepEquals(_value, _beforeValue);

  static bool _deepEquals(dynamic a, dynamic b) {
    // 快速路径：相同引用或都是null
    if (identical(a, b)) return true;

    // 其中一个为null
    if (a == null || b == null) return false;

    // 处理基础类型（性能优化）
    if (_isBasicType(a) && _isBasicType(b)) {
      return a == b;
    }

    // 处理List
    if (a is List && b is List) {
      return _listEquals(a, b);
    }

    // 处理Map
    if (a is Map && b is Map) {
      return _mapEquals(a, b);
    }

    // 处理Set
    if (a is Set && b is Set) {
      return _setEquals(a, b);
    }

    // 处理DateTime
    if (a is DateTime && b is DateTime) {
      return a.isAtSameMomentAs(b);
    }

    // 处理其他引用类型
    return a == b;
  }

  // 判断是否为基本类型
  static bool _isBasicType(dynamic value) {
    return value is num ||
        value is bool ||
        value is String ||
        value is DateTime;
  }

  // 列表比较
  static bool _listEquals(List<dynamic> a, List<dynamic> b) {
    if (a.length != b.length) return false;

    // 快速检查前几个元素
    final int quickCheckLength = min(a.length, 5);
    for (int i = 0; i < quickCheckLength; i++) {
      if (!_deepEquals(a[i], b[i])) return false;
    }

    // 如果快速检查通过，进行完整比较
    for (int i = quickCheckLength; i < a.length; i++) {
      if (!_deepEquals(a[i], b[i])) return false;
    }

    return true;
  }

  // Map比较
  static bool _mapEquals(Map<dynamic, dynamic> a, Map<dynamic, dynamic> b) {
    if (a.length != b.length) return false;

    // 先检查key集合是否相同
    if (!_setEquals(a.keys.toSet(), b.keys.toSet())) return false;

    // 然后检查每个key对应的value
    for (var key in a.keys) {
      if (!_deepEquals(a[key], b[key])) return false;
    }

    return true;
  }

  // Set比较（优化版本）
  static bool _setEquals(Set<dynamic> a, Set<dynamic> b) {
    if (a.length != b.length) return false;

    // 如果Set包含基本类型，使用更快的比较方式
    if (a.isNotEmpty && _isBasicType(a.first)) {
      return a.containsAll(b) && b.containsAll(a);
    }

    // 对于复杂类型的Set，使用原来的深度比较
    for (var item in a) {
      if (!b.any((bItem) => _deepEquals(item, bItem))) return false;
    }

    return true;
  }
}

class AntdFormStore extends ChangeNotifier {
  bool _dispose = false;
  final Set<String> _preserveNames = {};
  final Map<String, AntdFormItemState> _items = {};
  final Map<String, ValueNotifier<bool>> _itemRebuildMark = {};
  final Map<String, List<String>> _dependencies = {};

  List<AntdFormFieldsChange> fieldsChanges = [];

  ///尚未被初始过的原始数据
  final Map<String, dynamic> _setInitValue = {};
  final Map<String, dynamic> _initValue = {};
  final Map<String, _Value> _value = {};
  final Map<String, AntdFormRuleResult> _ruleResult = {};
  final Map<String, ValueNotifier<bool>> _feedbackRebuildMark = {};
  final Set<String> _isChanged = {};
  final Set<String> _isTouched = {};

  void addFieldsChangeListener(AntdFormFieldsChange? listener) {
    if (listener == null) {
      return;
    }
    fieldsChanges.add(listener);
  }

  void removeFieldsChangeListener(AntdFormFieldsChange? listener) {
    if (listener == null) {
      return;
    }
    fieldsChanges.remove(listener);
  }

  void clearFieldsChangeListeners() {
    fieldsChanges.clear();
  }

  void _notifyFieldsChanges(
      List<String> newNames, bool add, List<String> names) {
    for (var listener in fieldsChanges) {
      listener(newNames, add, names);
    }
    notifyListeners();
  }

  @override
  void dispose() {
    _dispose = true;
    clearFieldsChangeListeners();
    for (var notifier in _itemRebuildMark.values) {
      notifier.dispose();
    }
    for (var notifier in _feedbackRebuildMark.values) {
      notifier.dispose();
    }
    _preserveNames.clear();
    _items.clear();
    _itemRebuildMark.clear();
    _dependencies.clear();
    _setInitValue.clear();
    _initValue.clear();
    _value.clear();
    _ruleResult.clear();
    _feedbackRebuildMark.clear();
    _isChanged.clear();
    _isTouched.clear();
    super.dispose();
  }

  void addItem<T>(String name, AntdFormItemState state) {
    if (_items.containsKey(name) && _items[name] == state) {
      return;
    }

    AntdFormItemState? oldState = _items[name];
    _items[name] = state;
    _itemRebuildMark[name] = ValueNotifier(false);
    _feedbackRebuildMark[name] = ValueNotifier(false);

    if (!_items.containsKey(name) ||
        oldState?.widget.initialValue != state.widget.initialValue) {
      dynamic initValue;
      if (state.widget.initialValue is Map<String, dynamic>) {
        initValue =
            _findValueByPath(state.widget.initialValue, name.split("."));
      } else {
        initValue = state.widget.initialValue;
      }
      initValue ??= _findValueByPath(_setInitValue, name.split("."));
      _initValue[name] = initValue;
      _value[name] = _Value(initValue);
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_dispose) {
        return;
      }
      _notifyFieldsChanges([name], true, [..._items.keys]);
    });
  }

  bool removeItem(String name, AntdFormItemState state, bool preserve) {
    if (!_items.containsKey(name) || _items[name] != state) {
      return false;
    }

    _items.remove(name);
    _itemRebuildMark[name]?.dispose();
    _itemRebuildMark.remove(name);
    _feedbackRebuildMark[name]?.dispose();
    _feedbackRebuildMark.remove(name);
    _ruleResult.remove(name);
    _isChanged.remove(name);
    _isTouched.remove(name);
    if (preserve) {
      _preserveNames.add(name);
    } else {
      _initValue.remove(name);
      _value.remove(name);
    }

    _dependencies.removeWhere((key, value) => value.contains(name));
    for (var entry in _dependencies.entries) {
      entry.value.remove(name);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_dispose) {
        return;
      }
      _notifyFieldsChanges([name], false, [..._items.keys]);
    });
    return true;
  }

  void addTouched(String name) {
    _isTouched.add(name);
  }

  ValueNotifier<bool> getItemRebuildMark(String name) {
    return _itemRebuildMark[name]!;
  }

  ValueNotifier<bool> getFeedbackRebuildMark(String name) {
    return _feedbackRebuildMark[name]!;
  }

  void _addRuleResult(String name, AntdFormRuleResult result) {
    _ruleResult[name] = result;
    _feedbackRebuildMark[name]!.value = !_feedbackRebuildMark[name]!.value;
  }

  void _removeRuleResult(String name) {
    if (_ruleResult.containsKey(name)) {
      _ruleResult.remove(name);
      _feedbackRebuildMark[name]!.value = !_feedbackRebuildMark[name]!.value;
    }
  }

  void addDependencies(String name, List<String>? dependencies) {
    if (dependencies == null) {
      return;
    }

    for (var value in dependencies) {
      var values = _dependencies[value];
      if (values == null) {
        _dependencies[value] = [name];
        return;
      } else {
        if (!values.contains(name)) {
          values.add(name);
        }
      }
    }
  }

  T? _normalizeValue<T>(String name, T? value) {
    var normalize = _items[name]?.widget.normalize;
    if (normalize == null) {
      return value;
    }
    return normalize(value);
  }

  T? _setValue<T>(String name, T? value) {
    var normalizeValue = _normalizeValue(name, value);
    late _Value innerValue;
    if (_value.containsKey(name)) {
      innerValue = _value[name]!;
      innerValue.value = normalizeValue;
    } else {
      innerValue = _Value(normalizeValue);
    }

    _value[name] = innerValue;

    var beDependencies = _dependencies[name];
    if (beDependencies != null) {
      for (var dependenciesName in beDependencies) {
        _itemRebuildMark[dependenciesName]!.value =
            !_itemRebuildMark[dependenciesName]!.value;
      }
    }

    if (innerValue.isChanged) {
      for (var item in _items.values) {
        var name = item.widget.name;
        if ((item.widget.dependencies == null &&
                item.widget.shouUpdate == null) ||
            item.widget.shouUpdate
                    ?.call(_getValues(), _getValues(before: true)) ==
                true) {
          _itemRebuildMark[name]!.value = !_itemRebuildMark[name]!.value;
        }
      }

      _isChanged.add(name);
    } else {
      _isChanged.remove(name);
    }
    return innerValue.beforeValue;
  }

  dynamic _findValueByPath(Map<String, dynamic> nestedMap, List<String> path) {
    // 空值安全校验
    if (path.isEmpty || nestedMap.isEmpty) return null;

    dynamic currentNode = nestedMap;

    // 逐层遍历路径
    for (var i = 0; i < path.length; i++) {
      final key = path[i];

      // 类型校验（必须为 Map 类型）
      if (currentNode is! Map<String, dynamic>) return null;

      // 获取当前层 Map 引用
      final currentMap = currentNode;

      // 键存在性检查
      if (!currentMap.containsKey(key)) return null;

      // 移动到下一层级
      currentNode = currentMap[key];

      // 提前终止条件检查（非末层的非 Map 类型）
      if (i != path.length - 1 && currentNode is! Map<String, dynamic>) {
        return null;
      }
    }

    // 最终返回结果过滤 Map 类型
    return currentNode is Map<String, dynamic> ? null : currentNode;
  }

  T? _getValue<T>(String name, {bool before = false}) {
    var data = _value[name];
    if (data != null) {
      return before ? data.beforeValue : data.value;
    }
    return null;
  }

  void init(Map<String, dynamic>? initValue) {
    _setInitValue.clear();

    if (initValue != null) {
      _setInitValue.addAll(initValue);
    }
  }

  void _reset() {
    _value.clear();
    _initValue.forEach((name, value) {
      _value[name] = _Value(_value);
    });
    _isChanged.clear();
    _isTouched.clear();
    _ruleResult.clear();
  }

  void _resetFields(List<String> name) {
    for (var value in name) {
      _value[value] = _Value(_initValue[value]);
    }
  }

  Set<String> _setValues(Map<String, dynamic> map) {
    Set<String> changeNames = {};
    for (var name in _items.keys) {
      _setValue(name, _findValueByPath(map, name.split(".")));
      if (_isChanged.contains(name)) {
        changeNames.add(name);
      }
    }
    return changeNames;
  }

  Map<String, dynamic> _getValues(
      {List<String>? nameList, bool preserve = true, bool before = false}) {
    final Map<String, dynamic> result = {};

    void buildNode(
        List<String> keys, dynamic value, Map<String, dynamic> node) {
      final currentKey = keys.first;

      if (keys.length == 1) {
        node[currentKey] = value;
      } else {
        final childNode = node.containsKey(currentKey)
            ? (node[currentKey] as Map<String, dynamic>)
            : <String, dynamic>{};

        buildNode(keys.sublist(1), value, childNode);
        node[currentKey] = childNode;
      }
    }

    nameList ??= _items.keys.toList();
    if (preserve) {
      nameList.addAll(_preserveNames);
    }
    for (var name in nameList) {
      var keys = name.split(".");
      if (keys.isNotEmpty) {
        buildNode(keys, _value[name]?.value, result);
      }
    }

    return result;
  }
}

class AntdFormController extends AntdFormStore {
  final List<AntdFormFinish> _finishListener = [];
  final List<AntdFormValuesChange> _valuesChangeListener = [];

  void addFinishListener(AntdFormFinish? listener) {
    if (listener == null) {
      return;
    }
    _finishListener.add(listener);
  }

  void removeFinishListener(AntdFormFinish? listener) {
    if (listener == null) {
      return;
    }
    _finishListener.remove(listener);
  }

  void addValuesChangeListener(AntdFormValuesChange? listener) {
    if (listener == null) {
      return;
    }

    _valuesChangeListener.add(listener);
  }

  void removeValuesChangeListener(AntdFormValuesChange? listener) {
    if (listener == null) {
      return;
    }
    _valuesChangeListener.remove(listener);
  }

  void _notifyValuesChangeListeners(Map<String, dynamic> changedValues) {
    for (var listener in _valuesChangeListener) {
      listener(this, changedValues);
    }
    notifyListeners();
  }

  void _notifyFinishListeners(dynamic value, List<AntdFormRuleResult> errors) {
    for (var listener in _finishListener) {
      listener(value, errors);
    }
  }

  @override
  void dispose() {
    _finishListener.clear();
    _valuesChangeListener.clear();
    super.dispose();
  }

  AntdFormRuleResult? getFieldError(String name) {
    return _ruleResult[name];
  }

  T? getFieldValue<T>({required String name, bool before = false}) {
    return _getValue<T>(name, before: before);
  }

  Map<String, dynamic> getFieldsValue(
      {List<String>? nameList,
      bool? isTouched,
      bool? isChanged,
      bool preserve = true,
      bool before = false}) {
    return _getValues(
        nameList: (nameList ?? _items.keys).where((name) {
          return (isChanged == null || isFieldChanged(name) == isChanged) &&
              (isTouched == null || isFieldTouched(name) == isTouched);
        }).toList(),
        preserve: preserve,
        before: before);
  }

  List<AntdFormRuleResult> getFieldErrors({List<String>? nameList}) {
    var rules = <AntdFormRuleResult?>[];
    if (nameList == null) {
      rules = _ruleResult.values.toList();
    } else {
      rules = nameList.map((value) {
        return _ruleResult[value];
      }).toList();
    }
    return rules.where((value) {
      return value != null && !value.isPass();
    }).toList() as List<AntdFormRuleResult>;
  }

  bool isFieldChanged(String name) {
    return _isChanged.contains(name);
  }

  bool isFieldsChanged(List<String> name) {
    var result = true;
    for (var d in name) {
      if (!result || !isFieldChanged(d)) {
        break;
      }
    }
    return result;
  }

  bool isFieldTouched(String name) {
    return _isTouched.contains(name);
  }

  bool isFieldsTouched(List<String> name) {
    var result = true;
    for (var d in name) {
      if (!result || !isFieldTouched(d)) {
        break;
      }
    }
    return result;
  }

  void resetFields({List<String>? name}) {
    if (name != null) {
      _resetFields(name);
      return;
    }

    _reset();
  }

  void setFieldValue<T>(String name, T? value) {
    _setValue(name, value);
    _notifyValuesChangeListeners({name: value});
  }

  void setFieldsValue<T>(dynamic value) {
    var changeNames = _setValues(value);

    Map<String, dynamic> changeValue = {};
    for (var name in changeNames) {
      changeValue[name] = _getValue(name);
    }
    _notifyValuesChangeListeners(changeValue);
  }

  Future<bool> submit() async {
    dynamic value = _getValues();
    var res = await validateFields();
    if (!res) {
      _notifyFinishListeners(value, getFieldErrors());
    }
    return res;
  }

  Future<bool> validateFields(
      {List<String>? name,
      bool validateFirst = false,
      AntdFormTrigger? trigger}) async {
    var keys = _items.keys.where((value) {
      return name == null || name.contains(value);
    }).toList();

    var pass = true;
    for (var key in keys) {
      var action = _items[key];
      if (action != null) {
        var result =
            await action.validator(_getValue(key), _getValues(), trigger);
        if (result != null) {
          _addRuleResult(key, result);
          pass = pass && result.isPass();
          if (!pass && validateFirst) {
            break;
          }
        } else {
          _removeRuleResult(key);
        }
      }
    }
    return pass;
  }
}
