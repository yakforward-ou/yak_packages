class Foo {
  const Foo(this.data);
  final int data;
  factory Foo.fromJson(Map<String, Object?> json) {
    return Foo(json['data'] as int);
  }
}

extension FooToJsonX on Foo {
  Map<String, Object?> toJson() {
    return {"data": data};
  }
}
