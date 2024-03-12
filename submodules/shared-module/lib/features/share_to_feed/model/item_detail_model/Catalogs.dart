class Catalogs {
  Catalogs({
      this.id, 
      this.globalId, 
      this.referenceGlobalId, 
      this.referenceGlobal, 
      this.referenceId, 
      this.reference, 
      this.nameFinal, 
      this.nameGlobal,});

  Catalogs.fromJson(dynamic json) {
    id = json['id'];
    globalId = json['global_id'];
    referenceGlobalId = json['reference_global_id'];
    referenceGlobal = json['reference_global'];
    referenceId = json['reference_id'];
    reference = json['reference'];
    nameFinal = json['name_final'];
    nameGlobal = json['name_global'];
  }
  String? id;
  String? globalId;
  String? referenceGlobalId;
  String? referenceGlobal;
  String? referenceId;
  String? reference;
  String? nameFinal;
  String? nameGlobal;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['global_id'] = globalId;
    map['reference_global_id'] = referenceGlobalId;
    map['reference_global'] = referenceGlobal;
    map['reference_id'] = referenceId;
    map['reference'] = reference;
    map['name_final'] = nameFinal;
    map['name_global'] = nameGlobal;
    return map;
  }

  Catalogs copyWith({
    String? id,
    String? globalId,
    String? referenceGlobalId,
    String? referenceGlobal,
    String? referenceId,
    String? reference,
    String? nameFinal,
    String? nameGlobal,
  }) {
    return Catalogs(
      id: id ?? this.id,
      globalId: globalId ?? this.globalId,
      referenceGlobalId: referenceGlobalId ?? this.referenceGlobalId,
      referenceGlobal: referenceGlobal ?? this.referenceGlobal,
      referenceId: referenceId ?? this.referenceId,
      reference: reference ?? this.reference,
      nameFinal: nameFinal ?? this.nameFinal,
      nameGlobal: nameGlobal ?? this.nameGlobal,
    );
  }
  @override
  String toString() {
    return toJson().toString();
  }
}