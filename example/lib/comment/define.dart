class ComponentDefine {
  final CommentDefine comment;
  final List<PropertiesDefine>? properties;
  final List<CommentDefine> demos;
  final List<ComponentDefine> relates;

  const ComponentDefine(
      {required this.comment,
      this.properties,
      this.demos = const [],
      this.relates = const []});

  ComponentDefine copyWith(
      {CommentDefine? comment,
      List<PropertiesDefine>? properties,
      List<CommentDefine>? demos,
      List<ComponentDefine>? relates}) {
    return ComponentDefine(
        comment: comment ?? this.comment,
        properties: properties ?? this.properties,
        demos: demos ?? this.demos,
        relates: relates ?? this.relates);
  }

  Map<String, dynamic> toJson() {
    return {
      'comment': comment.toJson(),
      'properties': properties?.map((p) => p.toJson()).toList(),
      'demos': demos.map((d) => d.toJson()).toList(),
      'relate': relates.map((d) => d.toJson()).toList(),
    };
  }

  factory ComponentDefine.fromJson(Map<String, dynamic> json) {
    return ComponentDefine(
      comment: CommentDefine.fromJson(json['comment'] ?? {}),
      properties: _parseList<PropertiesDefine>(
          json['properties'], (e) => PropertiesDefine.fromJson(e)),
      demos: _parseList<CommentDefine>(
              json['demos'], (e) => CommentDefine.fromJson(e)) ??
          [],
      relates: _parseList<ComponentDefine>(
              json['relates'], (e) => ComponentDefine.fromJson(e)) ??
          [],
    );
  }

  static List<T>? _parseList<T>(dynamic data, T Function(dynamic) parser) {
    if (data == null) return null;
    return (data as List).map(parser).toList();
  }
}

class CommentDefine {
  final String name;
  final String filePath;
  final String? title;
  final String? description;
  final String? usage;
  final String? version;
  final String? group;
  final int order;
  final List<String>? links;
  final String? body;

  const CommentDefine({
    required this.name,
    required this.filePath,
    this.title,
    this.description,
    this.usage,
    this.version,
    this.group,
    this.order = 9999,
    this.links,
    this.body,
  });

  CommentDefine copyWith({
    String? name,
    String? filePath,
    String? title,
    String? description,
    String? usage,
    String? version,
    String? group,
    int? order,
    List<String>? links,
    String? body,
    String? ref,
  }) {
    return CommentDefine(
      name: name ?? this.name,
      filePath: filePath ?? this.filePath,
      title: title ?? this.title,
      description: description ?? this.description,
      usage: usage ?? this.usage,
      version: version ?? this.version,
      group: group ?? this.group,
      order: order ?? this.order,
      links: links ?? this.links,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'filePath': filePath,
      'title': title,
      'description': description,
      'usage': usage,
      'version': version,
      'group': group,
      'order': order,
      'links': links,
      'body': body,
    };
  }

  factory CommentDefine.fromJson(Map<String, dynamic> json) {
    return CommentDefine(
      name: json['name'] as String,
      filePath: json['filePath'] as String,
      title: json['title'] as String?,
      description: json['description'] as String?,
      usage: json['usage'] as String?,
      version: json['version'] as String?,
      group: json['group'] as String?,
      order: json['order'] as int? ?? 9999,
      links: (json['links'] as List?)?.cast<String>(),
      body: json['body'] as String?,
    );
  }
}

class PropertiesDefine {
  final String name;
  final String? type;
  final String? description;
  final String? version;
  final String? defaultValue;
  final bool? isOptional;
  final List<String>? enums;
  final String? funcSig;
  final List<String>? links;

  const PropertiesDefine(
      {required this.name,
      this.type,
      this.description,
      this.version,
      this.defaultValue,
      this.isOptional,
      this.enums,
      this.funcSig,
      this.links});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type,
      'description': description,
      'version': version,
      'defaultValue': defaultValue,
      'isOptional': isOptional,
      'enums': enums,
      'funcSig': funcSig,
      'links': links,
    };
  }

  PropertiesDefine copyWith({
    String? name,
    String? type,
    String? description,
    String? version,
    String? defaultValue,
    bool? isOptional,
    List<String>? enums,
    String? funcSig,
    List<String>? links,
  }) {
    return PropertiesDefine(
      name: name ?? this.name,
      type: type ?? this.type,
      description: description ?? this.description,
      version: version ?? this.version,
      defaultValue: defaultValue ?? this.defaultValue,
      isOptional: isOptional ?? this.isOptional,
      enums: enums ?? this.enums,
      funcSig: funcSig ?? this.funcSig,
      links: links ?? this.links,
    );
  }

  factory PropertiesDefine.fromJson(Map<String, dynamic> json) {
    return PropertiesDefine(
      name: json['name'] as String,
      type: json['type'] as String?,
      description: json['description'] as String?,
      version: json['version'] as String?,
      defaultValue: json['defaultValue'] as String?,
      isOptional: json['isOptional'] as bool?,
      enums: (json['enums'] as List?)?.cast<String>(),
      funcSig: json['funcSig'] as String?,
      links: (json['links'] as List?)?.cast<String>(),
    );
  }
}
