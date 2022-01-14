import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('adds one to input values', () {});

  testWidgets('New Line Character Elimination Test',
      (WidgetTester tester) async {
    var mockData = <String>[
      //'1) Check for proper installation and proper standpipe height\\n2) Check drain filter for blockage. Clean.\\n3) Check pressure sensor frequency (Hz) and pressure sensor hose.\\n4) Check resistance of the drain pump and voltage to the pump. 120VAC.\\n5) If voltage is present and the pump does not operate, replace pump.\\n6) If voltage is not present, check harness and connectors.\\n7) If harness and connector are good, replace the main control board.\\n\t\t',
      '1) Check to make sure unit is firmly seated on all four legs, doesn\'t'
          ' rock, and is leveled. \\n2) Run Drain and Spin cycle to '
          'ensure basket reaches final spin speed and the Spin LED '
          'does not blink(A blinking LED indicates that an OOB was detected '
          'during final spin)\\n3) Check that basket assembly is hanging'
          ' centered up in lid opening. If not, check for proper #hr# '
          'text=rod & springs color link=TB03-21.pdf#/hr# and are properly '
          'seated. Check that hub nut is tight. \\n4) Check that the rod '
          'and spring are dampening properly. If correct, it will be very '
          'difficult to push down and bottom out the basket assembly. Replace rod and sping assembly if they easily are pushed down, reference #hr# text=Rod & Spring Test link='
          'https://www.youtube.com/embed/emzSusPs_2I?rel=0 #/hr#\\n5) Check the basket for excessive friction or for being excessively out of round. Basket should spin freely and without wobble. If friction is found, remove it. If basket is bad, replace it.\\n6) Check for balance ring damage, tub damage, basket '
          'damage, rods and springs are properly seated.  \\n7) Check balance ring alignment marks. Reference #hr# text=HL03-19 link=HL03-19.pdf#/hr# on how to determine proper alignment of the balance ring halves top/bottom.\\n8) Check water level, supply/restrictions. Supply hose screens, '
          'water valve screens, PSI, house supply valves, cycle settings. Proper water level is required for re-distribute prior to final spin.\\n9) If washer spins correctly, educate consumer on how to properly load/distribute their clothes and select correct cycle/water level to prevent an OOB. Educate consumer on OOB/random re-distribute of loads, some loads will require manual re-distribute. \\n\\n\t\t'
    ];

    var exprs = {
      '\\\\n': '\n',
      '\\n': '\n',
      //'\n':'\n',
      '\t': '',
      '\r': '',
      //'\\\\\\\\':'',
      '\\\\': '',
      //'\\':'',
    };

    mockData.forEach((element) {
      exprs.forEach((expr, replace) {
        element = element.replaceAll(RegExp(expr), replace);
      });
      debugPrint(element);
      //element.escapeNewLineCharacters();
    });
  });
}
