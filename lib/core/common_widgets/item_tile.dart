import 'package:pokemondb/core/core.dart';

/// Generic Item tile for the use of Events. Events can be
/// WU, CPWU, TP, ABP and GY33.
class ItemTile extends StatelessWidget {
  /// ItemTile constructor
  const ItemTile({required this.item, this.onClick, super.key});

  /// Item for ItemTile
  final ItemTileEntity item;

  /// OnClick function, defines what happen when tile has been clicked
  final VoidCallback? onClick;

  @override
  Widget build(final BuildContext context) => Material(
        elevation: AppValues.double_5,
        child: ListTile(
          title: Text(item.title),
        ),
      );
}
