class BmiResponse {
  final String? status;
  final dynamic error;

  final String? name;
  final String? birthDate;
  final String? gender;

  final BmiData? data;
  final Premium? premium;

  BmiResponse({
    this.status,
    this.error,
    this.name,
    this.birthDate,
    this.gender,
    this.data,
    this.premium,
  });

  factory BmiResponse.fromJson(Map<String, dynamic> json) {
    return BmiResponse(
      status: json['status'],
      error: json['error'],

      name: json['name'],
      birthDate: json['birthDate'],
      gender: json['gender'],

      data: json['data'] != null
          ? BmiData.fromJson(json['data'])
          : null,

      premium: json['premium'] != null
          ? Premium.fromJson(json['premium'])
          : null,
    );
  }
}
class BmiData {
  final String? height;
  final String? weight;
  final double? bmi;
  final dynamic bmiPrime;
  final String? category;
  final dynamic risk;
  final dynamic summary;
  final IdealWeightRange? idealWeightRange;
  final dynamic weightToChange;

  BmiData({
    this.height,
    this.weight,
    this.bmi,
    this.bmiPrime,
    this.category,
    this.risk,
    this.summary,
    this.idealWeightRange,
    this.weightToChange,
  });

  factory BmiData.fromJson(Map<String, dynamic> json) {
    return BmiData(
      height: json['height'],
      weight: json['weight'],
      bmi: (json['bmi'] as num?)?.toDouble(),
      bmiPrime: json['bmiPrime'],
      category: json['category'],
      risk: json['risk'],
      summary: json['summary'],
      idealWeightRange: json['idealWeightRange'] != null
          ? IdealWeightRange.fromJson(json['idealWeightRange'])
          : null,
      weightToChange: json['weightToChange'],
    );
  }
}
class IdealWeightRange {
  final double min;
  final double max;
  final String unit;

  IdealWeightRange({
    required this.min,
    required this.max,
    required this.unit,
  });

  factory IdealWeightRange.fromJson(Map<String, dynamic> json) {
    return IdealWeightRange(
      min: (json['min'] as num).toDouble(),
      max: (json['max'] as num).toDouble(),
      unit: json['unit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'min': min,
      'max': max,
      'unit': unit,
    };
  }
}
class Premium {
  final String message;
  final String upgradeUrl;
  final List<String> lockedFields;

  Premium({
    required this.message,
    required this.upgradeUrl,
    required this.lockedFields,
  });

  factory Premium.fromJson(Map<String, dynamic> json) {
    return Premium(
      message: json['message'],
      upgradeUrl: json['upgrade_url'],
      lockedFields: List<String>.from(json['locked_fields']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'upgrade_url': upgradeUrl,
      'locked_fields': lockedFields,
    };
  }
}