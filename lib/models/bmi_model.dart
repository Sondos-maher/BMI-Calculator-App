class BmiResponse {
  final String status;
  final dynamic error;
  final BmiData data;
  final Premium premium;

  BmiResponse({
    required this.status,
    required this.error,
    required this.data,
    required this.premium,
  });

  factory BmiResponse.fromJson(Map<String, dynamic> json) {
    return BmiResponse(
      status: json['status'],
      error: json['error'],
      data: BmiData.fromJson(json['data']),
      premium: Premium.fromJson(json['premium']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'error': error,
      'data': data.toJson(),
      'premium': premium.toJson(),
    };
  }
}
class BmiData {
  final String height;
  final String weight;
  final double bmi;
  final dynamic bmiPrime;
  final String category;
  final dynamic risk;
  final dynamic summary;
  final IdealWeightRange idealWeightRange;
  final dynamic weightToChange;

  BmiData({
    required this.height,
    required this.weight,
    required this.bmi,
    required this.bmiPrime,
    required this.category,
    required this.risk,
    required this.summary,
    required this.idealWeightRange,
    required this.weightToChange,
  });

  factory BmiData.fromJson(Map<String, dynamic> json) {
    return BmiData(
      height: json['height'],
      weight: json['weight'],
      bmi: (json['bmi'] as num).toDouble(),
      bmiPrime: json['bmiPrime'],
      category: json['category'],
      risk: json['risk'],
      summary: json['summary'],
      idealWeightRange:
      IdealWeightRange.fromJson(json['idealWeightRange']),
      weightToChange: json['weightToChange'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'height': height,
      'weight': weight,
      'bmi': bmi,
      'bmiPrime': bmiPrime,
      'category': category,
      'risk': risk,
      'summary': summary,
      'idealWeightRange': idealWeightRange.toJson(),
      'weightToChange': weightToChange,
    };
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