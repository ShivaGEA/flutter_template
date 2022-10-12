import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../app.dart';
import '../../../domain/datasources/database/entities/poll_repo.dart';
import '../../../ui/pages/dashboard/poll_controller.dart';
import '../../../ui/widgets/poll/poll_widget.dart';

class PollsPage extends GetView<PollController> {
  final _controller = Get.put(PollController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Polls'),
      ),
      body: _body(),
    );
  }

  Widget _body() => Obx(
        () => Container(
          child: _controller.polls.isNotEmpty
              ? ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: _controller.polls.length + 1,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return envWidget();
                    } else {
                      return pollWidget(_controller.polls[index - 1]);
                    }
                  })
              : const Text('loading'),
        ),
      );

  Widget pollWidget(Poll poll) {
    return PollWidget(
      poll: poll,
      onPollClick: (item) {
        debugPrint('onPollClick: ${item.title}- ${item.id}');
      },
      onTagClick: (item) {
        debugPrint('onTagClick: ${item.id}- ${tag.toString()}');
      },
      onOptionClick: (poll, pollOption) {
        debugPrint('onOptionClick: ${poll.title}- ${pollOption.name}');
      },
      onMoreOptionsClick: (item) {
        debugPrint('more: ${item.title}- ${item.id}');
      },
    );
  }

  Widget envWidget() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text('${Provider.of<MyAppController>(Get.context!).env.name} '),
      ),
    );
  }
}
