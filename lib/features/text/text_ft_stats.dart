import 'package:logize/features/text/text_ft_class.dart';
import 'package:logize/widgets/design/section_divider.dart';
import 'package:logize/widgets/design/weekly_chart.dart';
import 'package:flutter/material.dart';

class TextFtStatsWidget extends StatelessWidget {
  final List<Map<String, dynamic>> ftRecs;
  final TextFt ft;
  const TextFtStatsWidget({
    super.key,
    required this.ftRecs,
    required this.ft,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: SectionDivider(string: '"${ft.prompt}" content length'),
        ),
        ftRecs.isEmpty
            ? Center(child: Text('no records'))
            : WeeklyChart(
              integer: true,
              recordFts: ftRecs,
              getRecordValue: (Map<String, dynamic> rec) {
                return rec['content']?.length.toDouble() ?? 0.0;
              },
              unit: 'characters',
            ),
      ],
    );
  }
}
