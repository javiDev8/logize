import 'package:logize/features/feature_widget.dart';
import 'package:logize/features/number/number_ft_class.dart';
import 'package:logize/widgets/design/txt.dart';
import 'package:logize/widgets/design/txt_field.dart';
import 'package:flutter/material.dart';

class NumberFtWidget extends StatelessWidget {
  final NumberFt ft;
  final FeatureLock lock;
  final bool detailed;
  const NumberFtWidget({
    super.key,
    required this.lock,
    required this.ft,
    required this.detailed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (detailed) Expanded(child: Text('label:')),

        Expanded(
          child:
              lock.model
                  ? Txt(ft.label, w: 8,)
                  : TxtField(
                    hint: "label",
                    round: true,
                    initialValue: ft.label,
                    onChanged: (txt) => ft.setLabel(txt),
                    validator:
                        (str) => str!.isEmpty ? 'write a label' : null,
                  ),
        ),

        if (!detailed && lock.model && lock.record)
          Text(ft.value?.toString() ?? '', style: TextStyle(fontWeight: FontWeight.w800),),

        if (!lock.record)
          Expanded(
            child: TxtField(
              hint: lock.model ? '' : "value",
              round: true,
              initialValue:
                  ft.value.toString() == 'null' ? '' : ft.value.toString(),
              onChanged: (str) {
                final parsedNum = double.tryParse(str);
                if (parsedNum != null) {
                  ft.setValue(parsedNum);
                }
              },
              validator:
                  ft.isRequired
                      ? (str) {
                        if (str!.isEmpty) {
                          return 'empty';
                        }
                        if (double.tryParse(str) == null) {
                          return 'invalid';
                        }
                        return null;
                      }
                      : null,
            ),
          ),

        if (detailed) Expanded(child: Text('unit:')),

        Expanded(
          child:
              lock.model
                  ? Text(' ${ft.unit}')
                  : TxtField(
                    hint: 'unit',
                    round: true,
                    initialValue: ft.unit,
                    onChanged: (txt) => ft.setUnit(txt),
                  ),
        ),
      ],
    );
  }
}
