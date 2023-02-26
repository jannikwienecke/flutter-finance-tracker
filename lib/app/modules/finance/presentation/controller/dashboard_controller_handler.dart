
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:notes/app/modules/finance/presentation/constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dashboard_controller_handler.g.dart';

class DashboardControllerState extends Equatable {
  const DashboardControllerState({
    required this.showCommandbar,
    required this.opacity,
    required this.totalDeltaY,
    required this.started,
  });

  final bool showCommandbar;
  final double opacity;
  final int totalDeltaY;
  final bool started;

  @override
  List<Object> get props => [showCommandbar, opacity, totalDeltaY, started];

  DashboardControllerState copyWith({
    bool? showCommandbar,
    double? opacity,
    int? totalDeltaY,
    bool? started,
  }) {
    return DashboardControllerState(
      showCommandbar: showCommandbar ?? this.showCommandbar,
      opacity: opacity ?? this.opacity,
      totalDeltaY: totalDeltaY ?? this.totalDeltaY,
      started: started ?? this.started,
    );
  }
}

@riverpod
class DashboardControllerHandler extends _$DashboardControllerHandler {
  @override
  DashboardControllerState build() {
    return const DashboardControllerState(
      showCommandbar: false,
      opacity: 1,
      totalDeltaY: 0,
      started: false,
    );
  }

  void toggleShowCommandbar() {
    if (state.showCommandbar) {
      state = state.copyWith(
        showCommandbar: false,
        opacity: 1,
        totalDeltaY: 0,
        started: false,
      );
    } else {
      state = state.copyWith(
        showCommandbar: true,
        opacity: 1,
        totalDeltaY: 0,
        started: true,
      );

      final timer = Timer.periodic(const Duration(milliseconds: 5), (timer) {
        if (state.opacity - 0.0333 <= 0) {
          timer.cancel();
          return;
        }

        state = state.copyWith(
          opacity: state.opacity - 0.0333,
          totalDeltaY: state.totalDeltaY + 5,
          showCommandbar: true,
          started: true,
        );
      });
    }
  }

  void handlePanDown(DragDownDetails _) {
    state = state.copyWith(started: !state.started);
  }

  void handlePanEnd(DragEndDetails _) {
    if (state.totalDeltaY < CBConfig.scrollThreshold) {
      state = state.copyWith(
        started: false,
        totalDeltaY: 0,
        opacity: 1,
        showCommandbar: false,
      );
    }
  }

  void handlePanUpdate(DragUpdateDetails details) {
    final totalDelya = details.delta.dy.toInt() + state.totalDeltaY;
    var newTotalDeltaValue = totalDelya;

    if (totalDelya < 0) {
      newTotalDeltaValue = 0;
    } else if (totalDelya > CBConfig.scrollThreshold) {
      newTotalDeltaValue = CBConfig.height;
    }

    state = state.copyWith(
      totalDeltaY: newTotalDeltaValue,
      opacity: interpolateTotalDeltaYToOpacity(newTotalDeltaValue),
      showCommandbar: newTotalDeltaValue > CBConfig.showCommandbarThreshold,
    );
  }
}

double interpolateTotalDeltaYToOpacity(int totalDeltaY) {
  final opacity = 1 - (totalDeltaY / CBConfig.height);
  if (opacity < 0) {
    return 0;
  } else if (opacity > 1) {
    return 1;
  } else {
    return opacity;
  }
}
