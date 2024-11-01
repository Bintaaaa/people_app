import 'package:common/state/view_data_state.dart';
import 'package:dependencies/get/get.dart';
import 'package:flutter/material.dart';
import 'package:main_domain/domain/entities/user_entity.dart';
import 'package:main_feature/home/getx/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeScreenController controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Obx(
          () {
            final userState = controller.userState.value;

            if (userState.status.isLoading) {
              return const CircularProgressIndicator();
            }

            if (userState.status.isHasData) {
              List<UserEntity> data = userState.data;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  UserEntity user = userState.data[index];
                  return ListTile(
                    title: Text(user.firstName),
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
      ),
    );
  }
}
