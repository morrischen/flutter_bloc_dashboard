import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_dashboard/l10n/app_localizations.dart';
import 'package:flutter_bloc_dashboard/extension/ext_build_context.dart';

class BottomSheetPicker<T> extends StatefulWidget {
  const BottomSheetPicker({
    required this.items,
    this.selectedItem,
    this.height = 240,
    this.titleText,
    this.confirmText,
    this.cancelText,
    super.key,
  });

  /// 選擇器項目
  final List<T> items;

  /// 選擇器項目值
  final T? selectedItem;

  /// 選擇器高度
  final double height;

  /// 標題文字
  final String? titleText;

  /// 確定文字
  final String? confirmText;

  /// 取消文字
  final String? cancelText;

  @override
  State<BottomSheetPicker> createState() => _BottomSheetPickerState();
}

class _BottomSheetPickerState extends State<BottomSheetPicker> {
  /// 滾輪控制器
  late final FixedExtentScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = FixedExtentScrollController(
      initialItem: getInitialIndex(),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Column(
        children: [
          // 標題列
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color: context.isDarkMode ? Colors.teal : Colors.grey.shade200,
              border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 取消按鈕
                CupertinoButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    widget.cancelText ?? AppLocalizations.of(context)!.cancel,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  widget.titleText ??
                      AppLocalizations.of(context)!.selectOption,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(fontSize: 18),
                ),
                // 確定按鈕
                CupertinoButton(
                  onPressed:
                      () => Navigator.pop(
                        context,
                        widget.items[_scrollController.selectedItem],
                      ),
                  child: Text(
                    widget.confirmText ?? AppLocalizations.of(context)!.confirm,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: context.isDarkMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // 選擇器
          Expanded(
            child: CupertinoPicker(
              scrollController: _scrollController,
              itemExtent: 44,
              onSelectedItemChanged: (index) {},
              children:
                  widget.items
                      .map(
                        (e) => Center(
                          child: Text(
                            e.toString(),
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      )
                      .toList(),
            ),
          ),
        ],
      ),
    );
  }

  /// 取得初始索引
  int getInitialIndex() {
    return widget.items.contains(widget.selectedItem)
        ? widget.items.indexOf(widget.selectedItem)
        : 0;
  }
}
