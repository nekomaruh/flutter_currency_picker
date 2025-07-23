import 'package:flutter/material.dart';

import 'currency.dart';
import 'currency_list_view.dart';
import 'currency_picker_theme_data.dart';

void showCurrencyListBottomSheet({
  required BuildContext context,
  required ValueChanged<Currency> onSelect,
  List<String>? favorite,
  List<String>? currencyFilter,
  String? searchHint,
  bool showSearchField = true,
  bool showFlag = true,
  bool showCurrencyName = true,
  bool showCurrencyCode = true,
  bool useRootNavigator = false,
  bool showDragHandle = false,
  ScrollPhysics? physics,
  CurrencyPickerThemeData? theme,
}) {
  final ShapeBorder shape = theme?.shape ??
      const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      );

  showModalBottomSheet<dynamic>(
    context: context,
    isScrollControlled: true,
    useRootNavigator: useRootNavigator,
    shape: shape,
    backgroundColor: theme?.backgroundColor,
    showDragHandle: showDragHandle,
    builder: (_) => DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) {
        return _builder(
          context,
          onSelect,
          favorite,
          currencyFilter,
          searchHint,
          physics,
          showSearchField,
          showFlag,
          showCurrencyName,
          showCurrencyCode,
          theme,
          scrollController, // 👈 nuevo parámetro
        );
      },
    ),
  );
}

Widget _builder(
    BuildContext context,
    ValueChanged<Currency> onSelect,
    List<String>? favorite,
    List<String>? currencyFilter,
    String? searchHint,
    ScrollPhysics? physics,
    bool showSearchField,
    bool showFlag,
    bool showCurrencyName,
    bool showCurrencyCode,
    CurrencyPickerThemeData? theme,
    ScrollController scrollController, // 👈 nuevo parámetro
    ) {
  return CurrencyListView(
    onSelect: onSelect,
    searchHint: searchHint,
    showSearchField: showSearchField,
    showFlag: showFlag,
    showCurrencyName: showCurrencyName,
    showCurrencyCode: showCurrencyCode,
    favorite: favorite,
    currencyFilter: currencyFilter,
    physics: physics,
    controller: scrollController, // 👈 pasa el controller
    theme: theme,
  );
}
