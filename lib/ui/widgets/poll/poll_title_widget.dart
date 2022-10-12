import 'package:flutter/material.dart';

import '../../../domain/datasources/database/entities/poll_repo.dart';
import '../../../ui/actions.dart';
import '../../../ui/widgets/circle_image.dart';

class PollTitleWidget extends StatelessWidget {
  final Poll poll;
  final VoidCallBack<Poll>? onMoreOptionsClick;
  final VoidCallBack<Poll>? onPollClick;

  PollTitleWidget({
    required this.poll,
    this.onMoreOptionsClick = null,
    this.onPollClick = null,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4.0,
      runSpacing: 4.0,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Container(
            color: Colors.black12,
            child: CircleImage(url: poll.createdBy?.photo ?? '', size: 40)),
        Text(poll.title ?? ''),
      ],
    );
  }
}
