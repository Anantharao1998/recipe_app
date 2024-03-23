import 'package:recipe_app/core/core.dart';

/// Generic Item tile for the use of Events. Events can be
/// WU, CPWU, TP, ABP and GY33.
class ItemTile extends StatelessWidget {
  /// ItemTile constructor
  const ItemTile({required this.item, this.onClick, super.key});

  /// Item for ItemTile
  final ItemTileEntity item;

  /// OnClick function, defines what happen when tile has been clicked
  final VoidCallback? onClick;

  Color _getColor(final ItemState state) {
    switch (state) {
      case ItemState.cancelled:
        return AppColors.redPrimary;
      case ItemState.initial:
        return AppColors.primaryColor;
      case ItemState.inProgress:
        return AppColors.yellowPrimary;
      case ItemState.completed:
        return AppColors.greenPrimary;
      case ItemState.delayed:
        return AppColors.orangePrimary;
      case ItemState.pending:
        return AppColors.bluePrimary;
      case ItemState.rescheduled:
        return AppColors.greyPrimary;
    }
  }

  @override
  Widget build(final BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppValues.double_10),
      child: Card(
        margin: const EdgeInsets.only(top: AppValues.double_5),
        shadowColor: AppColors.blackPrimary,
        color: AppColors.whitePrimary,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: AppValues.double_5,
            horizontal: AppValues.double_20,
          ),
          height: AppValues.double_50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: _getColor(item.state),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    item.name,
                    style: AppStyles.h5.white(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  if (item.eventDate != null)
                    Text(
                      item.eventDate!.ddMMyyyy(),
                      style: AppStyles.italic_6.white(),
                    ),
                ],
              ),
              if (item.description != null)
                SizedBox(
                  width: screenWidth - AppValues.double_50,
                  child: Text(
                    item.description!,
                    maxLines: 1,
                    style: AppStyles.norm_6.black(),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
            ],
          ),
        ).onTap(onTap: onClick),
      ),
    );
  }
}
