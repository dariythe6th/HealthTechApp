import 'package:flutter/material.dart';

class GenderSelection extends StatelessWidget {
  final Set<String> selected;
  final ValueChanged<Set<String>> onSelectionChanged;

  const GenderSelection({
    Key? key,
    required this.selected,
    required this.onSelectionChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<String>(
      segments: [
        ButtonSegment(
          value: 'F',
          label: Text('F', style: Theme.of(context).textTheme.displaySmall),
        ),
        ButtonSegment(
          value: 'M',
          label: Text('M', style: Theme.of(context).textTheme.displaySmall),
        ),
      ],
      selected: selected,
      onSelectionChanged: onSelectionChanged,
    );
  }
}
