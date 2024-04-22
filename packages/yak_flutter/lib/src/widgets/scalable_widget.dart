import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/rendering.dart';

import 'media_query_widget.dart';

class ScalebleWidget extends SingleChildRenderObjectWidget {
  final double scale;

  ScalebleWidget({
    super.key,
    required this.scale,
    required Widget child,
  }) : super(
          child: ScalableMediaQueryWidget(
            scale: scale,
            child: child,
          ),
        );

  @override
  ScaleTransform createRenderObject(context) => ScaleTransform(
        scale: scale,
        textDirection: Directionality.maybeOf(context),
      );

  @override
  void updateRenderObject(context, ScaleTransform renderObject) =>
      renderObject.scale(scale);
}

class ScaleTransform extends RenderProxyBox {
  ScaleTransform({
    TextDirection? textDirection,
    required double scale,
  })  : _scale = scale,
        _transform = _scaleToMatrix(scale);

  @override
  bool get alwaysNeedsCompositing => child != null;

  static Matrix4 _scaleToMatrix(double scale) =>
      Matrix4.diagonal3Values(scale, scale, 1.0);

  Matrix4 _transform;
  double _scale;
  void scale(double value) {
    if (_scale == value) {
      return;
    }
    _scale = value;
    _transform = _scaleToMatrix(value);
    markNeedsPaint();
    markNeedsSemanticsUpdate();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null) {
      return;
    }
    final transform = _effectiveTransform;

    final Offset? childOffset = MatrixUtils.getAsTranslation(transform);
    if (childOffset != null) {
      super.paint(context, offset + childOffset);
      layer = null;
      return;
    }

    final determinant = transform.determinant();
    if (determinant == 0 || !determinant.isFinite) {
      layer = null;
      return;
    }
    layer = context.pushTransform(
      needsCompositing,
      offset,
      transform,
      super.paint,
      oldLayer: layer is TransformLayer ? layer as TransformLayer? : null,
    );
  }

  void setIdentity() {
    _transform.setIdentity();
    markNeedsPaint();
    markNeedsSemanticsUpdate();
  }

  Matrix4 get _effectiveTransform => Matrix4.identity()..multiply(_transform);

  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) {
    return hitTestChildren(result, position: position);
  }

  @override
  bool hitTestChildren(result, {required Offset position}) =>
      result.addWithPaintTransform(
        transform: _effectiveTransform,
        position: position,
        hitTest: (result, position) => super.hitTestChildren(
          result,
          position: position,
        ),
      );

  @override
  void applyPaintTransform(child, transform) =>
      transform.multiply(_effectiveTransform);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('scale', _scale));
  }
}

class ScalableMediaQueryWidget extends MediaQueryWidget {
  final double scale;
  final Widget child;

  const ScalableMediaQueryWidget({
    required this.child,
    required this.scale,
    super.key,
  });

  @override
  Widget build(context) => child;

  @override
  @nonVirtual
  MediaQueryData mediaQueryFrom(mediaQuery) => mediaQuery.copyWith(
        size: mediaQuery.size * scale,
        viewInsets: mediaQuery.viewInsets * scale,
        systemGestureInsets: mediaQuery.systemGestureInsets * scale,
        viewPadding: mediaQuery.viewPadding * scale,
        padding: mediaQuery.padding * scale,
        devicePixelRatio: mediaQuery.devicePixelRatio * scale,
        displayFeatures: [
          for (final feature in mediaQuery.displayFeatures)
            ui.DisplayFeature(
              type: feature.type,
              state: feature.state,
              bounds: Rect.fromPoints(
                feature.bounds.topLeft * scale,
                feature.bounds.bottomRight * scale,
              ),
            ),
        ],
      );
}
