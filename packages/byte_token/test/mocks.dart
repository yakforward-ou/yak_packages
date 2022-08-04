const oneDay = Duration(days: 1);
const oneYear = Duration(days: 365);
final aYearAgo = DateTime.now().toUtc().add(-oneYear).millisecondsSinceEpoch;
final yesterday = DateTime.now().toUtc().add(-oneDay).millisecondsSinceEpoch;
final tomorrow = DateTime.now().toUtc().add(oneDay).millisecondsSinceEpoch;
