import 'package:flutter_svg/svg.dart';
import 'package:grambix/core/utils/extensions.dart';
import 'package:grambix/routes/routes.dart';
import '../../../core/api/end_point/api_end_points.dart';
import '../../../core/utils/basic_import.dart';
import '../../../res/assets.dart' hide Icons;
import '../../navigations/navigation/controller/navigation_controller.dart';
import '../../navigations/profile/controller/profile_controller.dart';

class AppHaderWidget extends StatelessWidget {
  const AppHaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            Assets.logo.appLogo,
            height: Dimensions.heightSize * 4.5,
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () => Get.toNamed(Routes.searchSongScreen),
                child: SvgPicture.asset(
                  Assets.icons.search,
                  color: CustomColor.secondary,
                  height: Dimensions.heightSize * 2,
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () => Get.find<NavigationController>().goToProfile(),
                child: Padding(
                  padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
                  child: Obx(() {
                    final profile =
                        Get.find<ProfileController>().profileInfo.value?.user.profilePicture;

                    final hasImage = profile != null && profile.isNotEmpty;

                    return CircleAvatar(
                      backgroundColor: Colors.grey.shade300,
                      radius: 20,
                      backgroundImage: hasImage ? NetworkImage(profile) : null,
                      child: hasImage
                          ? null
                          : const Icon(Icons.person, color: Colors.white, size: 20),
                    );
                  }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
