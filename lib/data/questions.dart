import 'package:quiz_app/models/quiz_question.dart';

const questions = [
  QuizQuestion('Z čoho sa skladá používateľské rozhranie vo Flutteri?', [
    'Z widgetov',
    'Z komponentov',
    'Z blokov',
    'Z funkcií',
  ]),
  QuizQuestion('Aký programovací jazyk používa Flutter?', [
    'Dart',
    'Kotlin',
    'Swift',
    'JavaScript',
  ]),
  QuizQuestion('Ktorý widget usporiada svoje deti vertikálne pod seba?', [
    'Column',
    'Row',
    'Stack',
    'Wrap',
  ]),
  QuizQuestion('Čo treba zavolať, aby sa po zmene stavu prekreslilo UI?', [
    'setState()',
    'updateUI()',
    'refresh()',
    'redraw()',
  ]),
  QuizQuestion('Čím sa líši StatefulWidget od StatelessWidget?', [
    'Môže meniť svoj stav počas behu aplikácie',
    'Nemôže obsahovať iné widgety',
    'Nemá metódu build()',
    'Nie je medzi nimi žiadny rozdiel',
  ]),
  QuizQuestion('Čo robí spread operátor (...) v zozname?', [
    'Vloží všetky prvky iného zoznamu',
    'Zoradí prvky zoznamu',
    'Odstráni duplicitné prvky',
    'Vytvorí prázdny zoznam',
  ]),
  QuizQuestion(
    'Ktorý widget zaberie celé zostávajúce miesto v Row alebo Column?',
    ['Expanded', 'SizedBox', 'Padding', 'Center'],
  ),
];
