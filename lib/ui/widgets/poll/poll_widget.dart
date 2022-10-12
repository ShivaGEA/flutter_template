import 'package:flutter/material.dart';
import 'package:shqs_util/utilities/extensions/date_time_extension.dart';

import '../../../domain/datasources/database/entities/poll_options.dart';
import '../../../domain/datasources/database/entities/poll_repo.dart';
import '../../../domain/datasources/database/entities/tags.dart';
import '../../../ui/widgets/poll/poll_option_widget.dart';
import '../../actions.dart';
import 'poll_title_widget.dart';

class PollWidget extends StatelessWidget {
  final Poll poll;
  final VoidCallBack<Poll>? onMoreOptionsClick;
  final VoidCallBack<Tag>? onTagClick;
  final VoidCallBack<Poll>? onPollClick;
  final VoidCallBack2<Poll, PollOption>? onOptionClick;

  PollWidget({
    required this.poll,
    this.onPollClick,
    this.onOptionClick,
    this.onTagClick,
    this.onMoreOptionsClick,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.all(8.0),
        color: Colors.white,
        child: InkWell(
          onTap: () {
            if (onPollClick != null) onPollClick!(poll);
          },
          child: Column(
            children: [
              PollTitleWidget(
                poll: poll,
                onPollClick: onPollClick,
                onMoreOptionsClick: onMoreOptionsClick,
              ),
              dateAndTags(poll),
              ...pollOptionsWidget(poll)
            ],
          ),
        ),
      ),
    );
  }

  Widget dateAndTags(Poll? poll) {
    return Wrap(
      spacing: 5.0, // horizontal gap between chips
      runSpacing: 2.0,
      children: [
        dateTimeWidget(poll?.createdAt),
        ...?tagWidgets(poll?.tags),
      ],
    );
  }

  Widget dateTimeWidget(DateTime? createdAt) {
    final data = createdAt != null ? TimeAgo.timeAgoSinceDate(createdAt) : 'NA';
    return Container(
      margin: const EdgeInsets.all(3.0),
      padding: const EdgeInsets.all(3.0),
      child: Text(
        data,
        style: const TextStyle(fontSize: 12.0),
      ),
    );
  }

  List<Widget>? tagWidgets(Tags? tags) {
    tags ??= Tags([]);
    return tags.list.map((tag) => tagWidget(tag)).toList();
  }

  Widget tagWidget(Tag tag) {
    return InkWell(
      onTap: () {
        if (onTagClick != null) onTagClick!(tag);
      },
      child: Container(
        margin: const EdgeInsets.all(3.0),
        padding: const EdgeInsets.all(3.0),
        decoration: const BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.all(
            Radius.circular(2.0),
          ),
        ),
        child: Text(
          tag.name ?? '',
          style: const TextStyle(fontSize: 12.0),
        ),
      ),
    );
  }

  List<Widget> pollOptionsWidget(Poll poll) {
    return poll.pollOptions?.list
            .map(
              (pollOption) => PollOptionWidget(
                pollOption: pollOption,
                onOptionClick: (option) {
                  if (onOptionClick != null) onOptionClick!(poll, option);
                },
              ),
            )
            .toList() ??
        [];
  }
}
