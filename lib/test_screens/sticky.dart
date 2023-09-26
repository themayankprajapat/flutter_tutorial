// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

/// Alignment for cell contents.
class CellAlignments {
  static const CellAlignments base = CellAlignments.uniform(Alignment.center);

  /// Same alignment for each cell.
  const CellAlignments.uniform(Alignment alignment)
      : this.fixed(
          contentCellAlignment: alignment,
          stickyColumnAlignment: alignment,
          stickyRowAlignment: alignment,
          stickyLegendAlignment: alignment,
        );

  /// Same alignment for each content cell, but different alignment for the
  /// sticky column, row and legend.
  const CellAlignments.fixed({
    /// Same alignment for each content cell.
    required this.contentCellAlignment,

    /// Same alignment for each sticky column cell.
    required this.stickyColumnAlignment,

    /// Same alignment for each sticky row cell.
    required this.stickyRowAlignment,

    /// Alignment for the sticky legend cell.
    required this.stickyLegendAlignment,
  })  : columnAlignments = null,
        rowAlignments = null,
        contentCellAlignments = null,
        stickyColumnAlignments = null,
        stickyRowAlignments = null;

  /// Different alignment for each column.
  const CellAlignments.variableColumnAlignment({
    /// Different alignment for each column (for content only).
    /// Length of list must match columnsLength.
    required this.columnAlignments,

    /// Different alignment for each sticky row cell.
    /// Length of list must match columnsLength.
    required this.stickyRowAlignments,

    /// Same alignment for each sticky column cell.
    required this.stickyColumnAlignment,

    /// Alignment for the sticky legend cell.
    required this.stickyLegendAlignment,
  })  : contentCellAlignment = null,
        rowAlignments = null,
        contentCellAlignments = null,
        stickyColumnAlignments = null,
        stickyRowAlignment = null;

  /// Different alignment for each row.
  const CellAlignments.variableRowAlignment({
    /// Different alignment for each row (for content only).
    /// Length of list must match rowsLength.
    required this.rowAlignments,

    /// Different alignment for each sticky column cell.
    /// Length of list must match rowsLength.
    required this.stickyColumnAlignments,

    /// Same alignment for each sticky row cell.
    required this.stickyRowAlignment,

    /// Alignment for the sticky legend cell.
    required this.stickyLegendAlignment,
  })  : contentCellAlignment = null,
        columnAlignments = null,
        contentCellAlignments = null,
        stickyRowAlignments = null,
        stickyColumnAlignment = null;

  /// Different alignment for every cell.
  const CellAlignments.variable({
    /// Different alignment for each content cell.
    /// Dimensions of array must match rowsLength x columnsLength.
    required this.contentCellAlignments,

    /// Different alignment for each sticky column cell.
    /// Length of list must match rowsLength.
    required this.stickyColumnAlignments,

    /// Different alignment for each sticky row cell.
    /// Length of list must match columnsLength.
    required this.stickyRowAlignments,

    /// Alignment for the sticky legend cell.
    required this.stickyLegendAlignment,
  })  : contentCellAlignment = null,
        columnAlignments = null,
        rowAlignments = null,
        stickyColumnAlignment = null,
        stickyRowAlignment = null;

  final Alignment? contentCellAlignment;
  final List<Alignment>? columnAlignments;
  final List<Alignment>? rowAlignments;
  final List<List<Alignment>>? contentCellAlignments;
  final Alignment? stickyColumnAlignment;
  final List<Alignment>? stickyColumnAlignments;
  final Alignment? stickyRowAlignment;
  final List<Alignment>? stickyRowAlignments;
  final Alignment stickyLegendAlignment;

  Alignment contentAlignment(int i, int j) {
    final _contentCellAlignment = contentCellAlignment;
    if (_contentCellAlignment != null) return _contentCellAlignment;

    final _columnAlignments = columnAlignments;
    if (_columnAlignments != null) return _columnAlignments[j];

    final _rowAlignments = rowAlignments;
    if (_rowAlignments != null) return _rowAlignments[i];

    final _contentCellAlignments = contentCellAlignments;
    if (_contentCellAlignments != null) return _contentCellAlignments[i][j];

    return Alignment.center;
  }

  Alignment? rowAlignment(int i) {
    return stickyRowAlignments != null
        ? stickyRowAlignments![i]
        : stickyRowAlignment;
  }

  Alignment? columnAlignment(int i) {
    return stickyColumnAlignments != null
        ? stickyColumnAlignments![i]
        : stickyColumnAlignment;
  }

  void runAssertions(int rowsLength, int columnsLength) {
    assert(contentCellAlignment != null ||
        columnAlignments != null ||
        rowAlignments != null ||
        contentCellAlignments != null);
    assert(stickyColumnAlignment != null || stickyColumnAlignments != null);
    assert(stickyRowAlignment != null || stickyRowAlignments != null);
    if (columnAlignments != null) {
      assert(columnAlignments!.length == columnsLength);
    }
    if (rowAlignments != null) {
      assert(rowAlignments!.length == rowsLength);
    }
    if (contentCellAlignments != null) {
      assert(contentCellAlignments!.length == rowsLength);
      for (int i = 0; i < contentCellAlignments!.length; i++) {
        assert(contentCellAlignments![i].length == columnsLength);
      }
    }
    if (stickyColumnAlignments != null) {
      assert(stickyColumnAlignments!.length == rowsLength);
    }
    if (stickyRowAlignments != null) {
      assert(stickyRowAlignments!.length == columnsLength);
    }
  }
}

/// Dimensions for table.
class CellDimensions {
  static const CellDimensions base = CellDimensions.fixed(
    contentCellWidth: 80.0,
    contentCellHeight: 50.0,
    stickyLegendWidth: 120.0,
    stickyLegendHeight: 50.0,
  );

  /// Same dimensions for each cell.
  const CellDimensions.uniform({
    required double width,
    required double height,
  }) : this.fixed(
          contentCellWidth: width,
          contentCellHeight: height,
          stickyLegendWidth: width,
          stickyLegendHeight: height,
        );

  /// Same dimensions for each content cell, but different dimensions for the
  /// sticky legend, column and row.
  const CellDimensions.fixed({
    /// Content cell width. Also applied to sticky row width.
    required this.contentCellWidth,

    /// Content cell height. Also applied to sticky column height.
    required this.contentCellHeight,

    /// Sticky legend width. Also applied to sticky column width.
    required this.stickyLegendWidth,

    /// Sticky legend height. Also applied to sticky row height.
    required this.stickyLegendHeight,
  })  : columnWidths = null,
        rowHeights = null;

  /// Different width for each column.
  const CellDimensions.variableColumnWidth({
    /// Column widths (for content only). Also applied to sticky row widths.
    /// Length of list needs to match columnsLength.
    required this.columnWidths,

    /// Content cell height. Also applied to sticky column height.
    required this.contentCellHeight,

    /// Sticky legend width. Also applied to sticky column width.
    required this.stickyLegendWidth,

    /// Sticky legend height. Also applied to sticky row height.
    required this.stickyLegendHeight,
  })  : contentCellWidth = null,
        rowHeights = null;

  /// Different height for each row.
  const CellDimensions.variableRowHeight({
    /// Content cell width. Also applied to sticky row width.
    required this.contentCellWidth,

    /// Row heights (for content only). Also applied to sticky row heights.
    /// Length of list needs to match rowsLength.
    required this.rowHeights,

    /// Sticky legend width. Also applied to sticky column width.
    required this.stickyLegendWidth,

    /// Sticky legend height. Also applied to sticky row height.
    required this.stickyLegendHeight,
  })  : columnWidths = null,
        contentCellHeight = null;

  /// Different width for each column and different height for each row.
  const CellDimensions.variableColumnWidthAndRowHeight({
    /// Column widths (for content only). Also applied to sticky row widths.
    /// Length of list needs to match columnsLength.
    required this.columnWidths,

    /// Row heights (for content only). Also applied to sticky row heights.
    /// Length of list needs to match rowsLength.
    required this.rowHeights,

    /// Sticky legend width. Also applied to sticky column width.
    required this.stickyLegendWidth,

    /// Sticky legend height. Also applied to sticky row height.
    required this.stickyLegendHeight,
  })  : contentCellWidth = null,
        contentCellHeight = null;

  final double? contentCellWidth;
  final double? contentCellHeight;
  final List<double>? columnWidths;
  final List<double>? rowHeights;
  final double stickyLegendWidth;
  final double stickyLegendHeight;

  Size contentSize(int i, int j) {
    final width =
        (columnWidths != null ? columnWidths![j] : contentCellWidth) ??
            base.contentCellWidth!;
    final height = (rowHeights != null ? rowHeights![i] : contentCellHeight) ??
        base.contentCellHeight!;
    return Size(width, height);
  }

  double stickyWidth(int i) =>
      (columnWidths != null ? columnWidths![i] : contentCellWidth) ??
      base.contentCellWidth!;

  double stickyHeight(int i) =>
      (rowHeights != null ? rowHeights![i] : contentCellHeight) ??
      base.contentCellHeight!;

  void runAssertions(int rowsLength, int columnsLength) {
    assert(contentCellWidth != null || columnWidths != null);
    assert(contentCellHeight != null || rowHeights != null);
    if (columnWidths != null) {
      assert(columnWidths!.length == columnsLength);
    }
    if (rowHeights != null) {
      assert(rowHeights!.length == rowsLength);
    }
  }
}

class ScrollControllers {
  ScrollControllers({
    ScrollController? verticalTitleController,
    ScrollController? verticalBodyController,
    ScrollController? horizontalBodyController,
    ScrollController? horizontalTitleController,
  })  : verticalTitleController = verticalTitleController ?? ScrollController(),
        verticalBodyController = verticalBodyController ?? ScrollController(),
        horizontalBodyController =
            horizontalBodyController ?? ScrollController(),
        horizontalTitleController =
            horizontalTitleController ?? ScrollController();

  final ScrollController verticalTitleController;
  final ScrollController verticalBodyController;

  final ScrollController horizontalBodyController;
  final ScrollController horizontalTitleController;

  void dispose() {
    verticalBodyController.dispose();
    verticalTitleController.dispose();

    horizontalBodyController.dispose();
    horizontalTitleController.dispose();
  }
}

class CustomScrollPhysics {
  CustomScrollPhysics({
    this.stickyRow,
    this.stickyColumn,
    this.contentVertical,
    this.contentHorizontal,
  });

  final ScrollPhysics? stickyRow;
  final ScrollPhysics? stickyColumn;
  final ScrollPhysics? contentVertical;
  final ScrollPhysics? contentHorizontal;
}

/// Table with sticky headers. Whenever you scroll content horizontally
/// or vertically - top and left headers always stay.
class StickyTable extends StatefulWidget {
  StickyTable({
    Key? key,

    /// Number of Columns (for content only)
    required this.columnsLength,

    /// Number of Rows (for content only)
    required this.rowsLength,

    /// Title for Top Left cell (always visible)
    this.legendCell = const Text(''),

    /// Builder for column titles. Takes index of content column as parameter
    /// and returns String for column title
    required this.columnsTitleBuilder,

    /// Builder for row titles. Takes index of content row as parameter
    /// and returns String for row title
    required this.rowsTitleBuilder,

    /// Builder for content cell. Takes index for content column first,
    /// index for content row second and returns String for cell
    required this.contentCellBuilder,

    /// Table cell dimensions
    this.cellDimensions = CellDimensions.base,

    /// Alignments for cell contents
    this.cellAlignments = CellAlignments.base,

    /// Callbacks for when pressing a cell
    Function()? onStickyLegendPressed,
    Function(int columnIndex)? onColumnTitlePressed,
    Function(int rowIndex)? onRowTitlePressed,
    Function(int columnIndex, int rowIndex)? onContentCellPressed,

    /// Called when scrolling has ended, passing the current offset position
    this.onEndScrolling,

    /// Scroll controllers for the table. Make sure that you dispose ScrollControllers inside when you don't need table_sticky_headers anymore.
    ScrollControllers? scrollControllers,

    /// Custom Scroll physics for table
    CustomScrollPhysics? scrollPhysics,

    /// Table Direction to support RTL languages
    this.tableDirection = TextDirection.ltr,

    /// Initial scroll offsets in X and Y directions. Specified in points. Overrides scroll Offset in index if both are present.
    this.initialScrollOffsetX,
    this.initialScrollOffsetY,

    /// Initial scroll offsets in X and Y directions. Specified in index.
    this.scrollOffsetIndexX,
    this.scrollOffsetIndexY,

    /// Turn scrollbars
    this.showVerticalScrollbar,
    this.showHorizontalScrollbar,
  })  : shouldDisposeScrollControllers = scrollControllers == null,
        scrollControllers = scrollControllers ?? ScrollControllers(),
        onStickyLegendPressed = onStickyLegendPressed ?? (() {}),
        onColumnTitlePressed = onColumnTitlePressed ?? ((_) {}),
        onRowTitlePressed = onRowTitlePressed ?? ((_) {}),
        onContentCellPressed = onContentCellPressed ?? ((_, __) {}),
        scrollPhysics = scrollPhysics ?? CustomScrollPhysics(),
        super(key: key) {
    cellDimensions.runAssertions(rowsLength, columnsLength);
    cellAlignments.runAssertions(rowsLength, columnsLength);
  }

  final int rowsLength;
  final int columnsLength;
  final Widget legendCell;
  final Widget Function(int columnIndex) columnsTitleBuilder;
  final Widget Function(int rowIndex) rowsTitleBuilder;
  final Widget Function(int columnIndex, int rowIndex) contentCellBuilder;
  final CellDimensions cellDimensions;
  final CellAlignments cellAlignments;
  final Function() onStickyLegendPressed;
  final Function(int columnIndex) onColumnTitlePressed;
  final Function(int rowIndex) onRowTitlePressed;
  final Function(int columnIndex, int rowIndex) onContentCellPressed;
  final Function(double x, double y)? onEndScrolling;
  final ScrollControllers scrollControllers;
  final CustomScrollPhysics scrollPhysics;
  final TextDirection tableDirection;
  final int? scrollOffsetIndexY;
  final int? scrollOffsetIndexX;
  final double? initialScrollOffsetX;
  final double? initialScrollOffsetY;
  final bool? showVerticalScrollbar;
  final bool? showHorizontalScrollbar;

  final bool shouldDisposeScrollControllers;

  @override
  State<StickyTable> createState() => _StickyTableState();
}

class _StickyTableState extends State<StickyTable> {
  final globalRowTitleKeys = <int, GlobalKey>{};
  final globalColumnTitleKeys = <int, GlobalKey>{};

  late _SyncScrollController _horizontalSyncController;
  late _SyncScrollController _verticalSyncController;

  late double _scrollOffsetX;
  late double _scrollOffsetY;

  bool _onHorizontalScrollingNotification({
    required ScrollNotification notification,
    required ScrollController controller,
  }) {
    final didEndScrolling = _horizontalSyncController.processNotification(
      notification,
      controller,
    );
    final onEndScrolling = widget.onEndScrolling;
    if (didEndScrolling && onEndScrolling != null) {
      _scrollOffsetX = controller.offset;
      onEndScrolling(_scrollOffsetX, _scrollOffsetY);
    }
    return true;
  }

  bool _onVerticalScrollingNotification({
    required ScrollNotification notification,
    required ScrollController controller,
  }) {
    final didEndScrolling = _verticalSyncController.processNotification(
      notification,
      controller,
    );
    final onEndScrolling = widget.onEndScrolling;
    if (didEndScrolling && onEndScrolling != null) {
      _scrollOffsetY = controller.offset;
      onEndScrolling(_scrollOffsetX, _scrollOffsetY);
    }
    return true;
  }

  void _shiftUsingOffsets() {
    void jumpToIndex(GlobalKey key) {
      final context = key.currentContext;
      if (context != null) {
        Scrollable.ensureVisible(context);
      }
    }

    final scrollOffsetX = widget.initialScrollOffsetX;
    if (scrollOffsetX != null) {
      // Try to use natural offset first
      widget.scrollControllers.horizontalTitleController.jumpTo(scrollOffsetX);
    } else {
      // Try to use index offset second
      final scrollOffsetIndexX = widget.scrollOffsetIndexX;
      final keyX = globalRowTitleKeys[scrollOffsetIndexX];
      if (scrollOffsetIndexX != null && keyX != null) jumpToIndex(keyX);
    }

    final scrollOffsetY = widget.initialScrollOffsetY;
    if (scrollOffsetY != null) {
      // Try to use natural offset first
      widget.scrollControllers.verticalTitleController.jumpTo(scrollOffsetY);
    } else {
      // Try to use index offset second
      final scrollOffsetIndexY = widget.scrollOffsetIndexY;
      final keyY = globalColumnTitleKeys[scrollOffsetIndexY];
      if (scrollOffsetIndexY != null && keyY != null) jumpToIndex(keyY);
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollOffsetX = widget.initialScrollOffsetX ?? 0;
    _scrollOffsetY = widget.initialScrollOffsetY ?? 0;
  }

  @override
  void dispose() {
    if (widget.shouldDisposeScrollControllers) {
      widget.scrollControllers.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _verticalSyncController = _SyncScrollController(
      widget.scrollControllers.verticalTitleController,
      widget.scrollControllers.verticalBodyController,
    );
    _horizontalSyncController = _SyncScrollController(
      widget.scrollControllers.horizontalTitleController,
      widget.scrollControllers.horizontalBodyController,
    );
    SchedulerBinding.instance.addPostFrameCallback((_) => _shiftUsingOffsets());
    return Column(
      children: <Widget>[
        Row(
          textDirection: widget.tableDirection,
          children: <Widget>[
            /// STICKY LEGEND
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: widget.onStickyLegendPressed,
              child: Container(
                width: widget.cellDimensions.stickyLegendWidth,
                // TODO: Changed this
                height: 110,
                // height: widget.cellDimensions.stickyLegendHeight,
                alignment: widget.cellAlignments.stickyLegendAlignment,
                child: widget.legendCell,
              ),
            ),

            /// STICKY ROW
            Expanded(
              child: NotificationListener<ScrollNotification>(
                child: Scrollbar(
                  // Key is required to avoid 'The Scrollbar's ScrollController has no ScrollPosition attached.
                  key: Key('Row ${widget.showVerticalScrollbar}'),
                  thumbVisibility: widget.showVerticalScrollbar ?? false,
                  controller:
                      widget.scrollControllers.horizontalTitleController,
                  child: SingleChildScrollView(
                    reverse: widget.tableDirection == TextDirection.rtl,
                    physics: widget.scrollPhysics.stickyRow,
                    scrollDirection: Axis.horizontal,
                    controller:
                        widget.scrollControllers.horizontalTitleController,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      textDirection: widget.tableDirection,
                      children: List.generate(
                        widget.columnsLength,
                        (i) => GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () => widget.onColumnTitlePressed(i),
                          child: Container(
                            key: globalRowTitleKeys[i] ??= GlobalKey(),
                            width: widget.cellDimensions.stickyWidth(i),
                            // TODO: Changed this
                            height: 110,
                            // height: widget.cellDimensions.stickyLegendHeight,
                            alignment: widget.cellAlignments.rowAlignment(i),
                            child: widget.columnsTitleBuilder(i),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                onNotification: (notification) =>
                    _onHorizontalScrollingNotification(
                  notification: notification,
                  controller:
                      widget.scrollControllers.horizontalTitleController,
                ),
              ),
            )
          ],
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            textDirection: widget.tableDirection,
            children: <Widget>[
              /// STICKY COLUMN
              NotificationListener<ScrollNotification>(
                child: Scrollbar(
                  // Key is required to avoid 'The Scrollbar's ScrollController has no ScrollPosition attached.
                  key: Key('Column ${widget.showHorizontalScrollbar}'),
                  thumbVisibility: widget.showHorizontalScrollbar ?? false,
                  controller: widget.scrollControllers.verticalBodyController,
                  child: SingleChildScrollView(
                    physics: widget.scrollPhysics.stickyColumn,
                    controller:
                        widget.scrollControllers.verticalTitleController,
                    child: Column(
                      children: List.generate(
                        widget.rowsLength,
                        (i) => GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () => widget.onRowTitlePressed(i),
                          child: Container(
                            key: globalColumnTitleKeys[i] ??= GlobalKey(),
                            width: widget.cellDimensions.stickyLegendWidth,
                            height: widget.cellDimensions.stickyHeight(i),
                            alignment: widget.cellAlignments.columnAlignment(i),
                            child: widget.rowsTitleBuilder(i),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                onNotification: (notification) =>
                    _onVerticalScrollingNotification(
                  notification: notification,
                  controller: widget.scrollControllers.verticalTitleController,
                ),
              ),
              // CONTENT
              Expanded(
                child: NotificationListener<ScrollNotification>(
                  child: SingleChildScrollView(
                    reverse: widget.tableDirection == TextDirection.rtl,
                    physics: widget.scrollPhysics.contentHorizontal,
                    scrollDirection: Axis.horizontal,
                    controller:
                        widget.scrollControllers.horizontalBodyController,
                    child: NotificationListener<ScrollNotification>(
                      child: SingleChildScrollView(
                        physics: widget.scrollPhysics.contentVertical,
                        controller:
                            widget.scrollControllers.verticalBodyController,
                        child: Column(
                          children: List.generate(
                            widget.rowsLength,
                            (int rowIdx) => Row(
                              textDirection: widget.tableDirection,
                              children: List.generate(
                                widget.columnsLength,
                                (int columnIdx) => GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () => widget.onContentCellPressed(
                                      columnIdx, rowIdx),
                                  child: Container(
                                    width: widget.cellDimensions
                                        .contentSize(rowIdx, columnIdx)
                                        .width,
                                    height: widget.cellDimensions
                                        .contentSize(rowIdx, columnIdx)
                                        .height,
                                    alignment: widget.cellAlignments
                                        .contentAlignment(rowIdx, columnIdx),
                                    child: widget.contentCellBuilder(
                                        columnIdx, rowIdx),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      onNotification: (notification) =>
                          _onVerticalScrollingNotification(
                        notification: notification,
                        controller:
                            widget.scrollControllers.verticalBodyController,
                      ),
                    ),
                  ),
                  onNotification: (notification) =>
                      _onHorizontalScrollingNotification(
                    notification: notification,
                    controller:
                        widget.scrollControllers.horizontalBodyController,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// SyncScrollController keeps scroll controllers in sync.
class _SyncScrollController {
  _SyncScrollController(
    this._titleController,
    this._bodyController,
  );

  final ScrollController _titleController;
  final ScrollController _bodyController;

  ScrollController? _scrollingController;
  bool _scrollingActive = false;

  /// Returns true if reached scroll end
  bool processNotification(
    ScrollNotification notification,
    ScrollController controller, {
    Function(double x, double y)? onEndScrolling,
  }) {
    if (notification is ScrollStartNotification && !_scrollingActive) {
      _scrollingController = controller;
      _scrollingActive = true;
      return false;
    }

    if (identical(controller, _scrollingController) && _scrollingActive) {
      if (notification is ScrollEndNotification) {
        _scrollingController = null;
        _scrollingActive = false;
        return true;
      }

      if (notification is ScrollUpdateNotification) {
        for (final controller in [_titleController, _bodyController]) {
          if (identical(_scrollingController, controller)) continue;
          if (controller.positions.isEmpty) continue;
          final offset = _scrollingController?.offset;
          if (offset != null) {
            controller.jumpTo(offset);
          }
        }
      }
    }
    return false;
  }
}
