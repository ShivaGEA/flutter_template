import 'package:flutter/material.dart';

import '../../../domain/datasources/database/entities/poll_options.dart';
import '../../../ui/actions.dart';

class PollOptionWidget extends StatelessWidget {
  final PollOption pollOption;
  final VoidCallBack<PollOption>? onOptionClick;
  PollOptionWidget({required this.pollOption, this.onOptionClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onOptionClick != null) onOptionClick!(pollOption);
      },
      child: Container(
        margin: const EdgeInsets.only(
            top: 4.0, bottom: 4.0, right: 8.0, left: 16.0),
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        decoration: const BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.all(
            Radius.circular(2.0),
          ),
        ),
        width: double.infinity,
        child: Text(pollOption.name ?? ''),
      ),
    );
  }
}
