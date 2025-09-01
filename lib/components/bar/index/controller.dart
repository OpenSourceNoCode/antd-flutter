import 'package:antd_flutter_mobile/components/widgets/list/controller.dart';
import 'package:flutter/material.dart';

import 'index.dart';

class AntdIndexBarSectionItem<T extends AntdSectionProvider> {
  final T data;
  final String section;
  final bool isSectionHeader;
  final bool isLastInSection;

  const AntdIndexBarSectionItem({
    required this.data,
    required this.section,
    required this.isSectionHeader,
    required this.isLastInSection,
  });

  AntdIndexBarSectionItem<T> markAsLast() {
    return AntdIndexBarSectionItem(
      data: data,
      section: section,
      isSectionHeader: isSectionHeader,
      isLastInSection: true,
    );
  }
}

class AntdIndexBarController<T extends AntdSectionProvider>
    extends AntdScrollPositionController<T> {
  final List<AntdIndexBarSectionItem<T>> _sectionItems = [];
  final Map<String, int> _sectionPositions = {};
  Map<String, int> get sectionPositions => _sectionPositions;
  bool isDrag = false;

  final ValueNotifier<int> activeIndexBarIndex = ValueNotifier(-1);
  final ValueNotifier<int> activeSectionIndex = ValueNotifier(-1);
  String? get activeSection {
    final index = activeSectionIndex.value;
    return (index >= 0 && index < _sectionItems.length)
        ? _sectionItems[index].section
        : null;
  }

  AntdIndexBarSectionItem<T> getSectionItem(int index) => _sectionItems[index];

  void init(List<T>? data) {
    if (data == null) {
      return;
    }

    _sectionItems.clear();
    _sectionPositions.clear();
    activeSectionIndex.value = -1;
    activeIndexBarIndex.value = -1;

    int idx = 0;
    for (var item in data) {
      final section = item.section;
      if (!_sectionPositions.containsKey(section)) {
        if (_sectionItems.isNotEmpty) {
          _sectionItems[_sectionItems.length - 1] =
              _sectionItems.last.markAsLast();
        }

        _sectionItems.add(AntdIndexBarSectionItem(
          data: item,
          section: section,
          isSectionHeader: true,
          isLastInSection: false,
        ));
        _sectionPositions[section] = idx;
        idx += 1;
        continue;
      }

      _sectionItems.add(AntdIndexBarSectionItem(
        data: item,
        section: section,
        isSectionHeader: false,
        isLastInSection: false,
      ));
      idx += 1;
    }

    if (_sectionItems.isNotEmpty) {
      _sectionItems[_sectionItems.length - 1] = _sectionItems.last.markAsLast();
    }
  }

  Future<void> toSection(String section,
      {AntdScrollToIndexConfig config =
          const AntdScrollToIndexConfig()}) async {
    var index = _sectionPositions[section];
    if (index == null) {
      return;
    }

    toIndex(index, config: config);
  }
}
