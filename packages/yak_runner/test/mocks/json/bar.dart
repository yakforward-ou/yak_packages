class Bar {
  const Bar(this.data);
  final double data;
  factory Bar.fromJson(Map<String, Object?> json) {
    return Bar(json['data'] as double);
  }
}

extension BarToJsonX on Bar {
  Map<String, Object?> toJson() {
    return {"data": data};
  }
}
