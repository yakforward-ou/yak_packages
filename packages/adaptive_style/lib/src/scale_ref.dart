import 'size_scale.dart';
import 'device_size.dart';

/// a record representing the closest supported size
/// and the scale between the real size and the supported size
typedef ScaleRef = ({DeviceSize idealSize, SizeScale scale});
