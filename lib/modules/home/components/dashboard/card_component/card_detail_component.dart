import 'package:flutter/material.dart';

import '../../../../../authentification/models/user_model.dart';
import '../../../../../core/styles/sizes.dart';
import '../../../../../core/widgets/cached_network_image_circular.dart';

class CardUserDetailsComponent extends StatelessWidget {
  final UserModel user;

  const CardUserDetailsComponent({
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CachedNetworkImageCircular(
          imageUrl: user.image,
          radius: Sizes.userImageSmallRadius,
        ),
        SizedBox(
          width: Sizes.hMarginSmallest,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CustomText.h5(
              //   context,
              //   user.name.isEmpty
              //       ? tr('user') + user.userId.substring(0, 6)
              //       : user.userName,
              //   color: context.textTheme.headline4!.color,
              //   weight: FontStyles.fontWeightBold,
              //   overflow: TextOverflow.ellipsis,
              // ),
              // CustomText.h6(
              //   context,
              //   user.addressModel!.state +
              //       ', ' +
              //       user.addressModel!.city +
              //       ', ' +
              //       user.addressModel!.street,
              //   maxLines: 1,
              //   overflow: TextOverflow.ellipsis,
              // ),
              // CustomText.h6(
              //   context,
              //   user.addressModel!.mobile,
              //   maxLines: 1,
              //   overflow: TextOverflow.ellipsis,
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
