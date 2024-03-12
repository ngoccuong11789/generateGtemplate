class AreaType {
    String? countryId;
    String? countryName;
    int? code;
    String? codeName;
    String? supportType;
    String? status;
    int? createdAt;
    int? updatedAt;
    dynamic provinces;
    double? longitude;
    double? latitude;

    AreaType({
        this.countryId,
        this.countryName,
        this.code,
        this.codeName,
        this.supportType,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.provinces,
        this.longitude,
        this.latitude,
    });

    factory AreaType.fromJson(Map<String, dynamic> json) => AreaType(
        countryId: json["country_id"],
        countryName: json["country_name"],
        code: json["code"],
        codeName: json["code_name"],
        supportType: json["support_type"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        provinces: json["provinces"],
        longitude: json["longitude"]?.toDouble(),
        latitude: json["latitude"]?.toDouble(),
    );
}