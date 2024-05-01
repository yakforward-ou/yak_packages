import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

import 'adaptive_widget.dart';
import 'adaptive_widget_builder.dart';
import 'scale_ref.dart';

class AdaptiveStack extends AdaptiveWidget {
  final AlignmentDirectional alignment;
  final AdaptiveChildrenBuilder _builder;
  final Clip clipBehavior;
  final StackFit fit;
  final TextDirection? textDirection;

  const AdaptiveStack({
    required AdaptiveChildrenBuilder builder,
    required this.parentSize,
    this.alignment = AlignmentDirectional.topStart,
    this.clipBehavior = Clip.hardEdge,
    this.fit = StackFit.loose,
    this.textDirection,
    super.key,
  }) : _builder = builder;

  @override
  Widget builder(context, scaleRef, parentSize) => SizedBox.fromSize(
        size: parentSize,
        child: AdaptiveStackLayout(
          parentSize: parentSize,
          scaleRef: scaleRef,
          context: context,
          builder: _builder,
          alignment: alignment,
          textDirection: textDirection,
          fit: fit,
          clipBehavior: clipBehavior,
        ),
      );

  @override
  final Size parentSize;
}

class AdaptiveStackLayout extends Stack {
  final AdaptiveChildrenBuilder builder;
  final Size parentSize;
  final ScaleRef scaleRef;
  final BuildContext context;
  const AdaptiveStackLayout({
    super.key,
    super.alignment = AlignmentDirectional.topStart,
    super.textDirection,
    super.fit = StackFit.loose,
    super.clipBehavior = Clip.hardEdge,
    required this.builder,
    required this.parentSize,
    required this.context,
    required this.scaleRef,
  });

  @override
  @nonVirtual
  List<Widget> get children => builder(context, scaleRef, parentSize);
}

class AdaptiveStackBuilder extends LayoutBuilder {
  final AlignmentDirectional alignment;
  final Clip clipBehavior;
  final StackFit fit;
  final TextDirection? textDirection;
  AdaptiveStackBuilder({
    required AdaptiveChildrenBuilder builder,
    this.alignment = AlignmentDirectional.topStart,
    this.clipBehavior = Clip.hardEdge,
    this.fit = StackFit.loose,
    this.textDirection,
    super.key,
  }) : super(
            builder: (context, contraints) => AdaptiveStack(
                  alignment: alignment,
                  builder: builder,
                  clipBehavior: clipBehavior,
                  fit: fit,
                  parentSize: contraints.biggest,
                  textDirection: textDirection,
                ));
}
