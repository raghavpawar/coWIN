class District {
  District({
    this.districtId,
    this.districtName,
  });

  int districtId;
  String districtName;

  factory District.fromJson(Map<String, dynamic> json) => District(
        districtId: json["district_id"],
        districtName: json["district_name"],
      );

  Map<String, dynamic> toJson() => {
        "district_id": districtId,
        "district_name": districtName,
      };
}
