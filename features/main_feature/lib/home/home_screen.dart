import 'package:common/components/text_style/text_tyle_constants.dart';
import 'package:common/core/constans/routes_constans.dart';
import 'package:common/state/view_data_state.dart';
import 'package:dependencies/get/get.dart';
import 'package:flutter/material.dart';
import 'package:main_domain/domain/entities/user_entity.dart';
import 'package:main_domain/domain/params/user_params.dart';
import 'package:main_feature/home/getx/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeScreenController controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Get.toNamed(
              RoutesConstans.createScreen,
            );
          }),
      body: Obx(
        () {
          final userState = controller.userState.value;

          if (userState.status.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (userState.status.isHasData) {
            List<UserEntity> data = userState.data;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                UserEntity user = userState.data[index];
                return ListTile(
                  onTap: () {
                    Get.toNamed(
                      RoutesConstans.detailScreen,
                      arguments: UserParams(
                        id: user.id,
                        name: user.name,
                      ),
                    );
                  },
                  title: Text(
                    user.name,
                    style: TextStyleConstants.listTitles,
                  ),
                  subtitle: Text(
                    user.email,
                    style: TextStyleConstants.paragraphText,
                  ),
                  leading: CircleAvatar(
                    foregroundImage: NetworkImage(user.avatar),
                  ),
                );
              },
            );
          }

          if (userState.status.isError) {
            final errorMessage = userState.message;
            return Text(errorMessage);
          }

          return const SizedBox();
        },
      ),
    );
  }
}
