import 'package:flutter/material.dart';
import 'package:mind_horizon/data/models/category_fields_model.dart';
import 'package:mind_horizon/data/models/category_model.dart';
import 'package:mind_horizon/data/models/sounds_model.dart';
import 'package:mind_horizon/data/models/steps_model.dart';

final List<CategoryModel> musiscCategory = [
  CategoryModel(
    title: 'Sounds',
    categoryFields: [
      CategoryFields(
        id: 0,
        title: 'Sleep',
        description: 'Drift into deep sleep and restore your energy',
        imagePath: 'asset/img/pana.png',
        sounds: [
          SoundsModel(id: 0, title: 'Sleep cpace'),
          SoundsModel(id: 1, title: 'Time for sweet dreams'),
          SoundsModel(id: 2, title: 'Melody for the soul'),
          SoundsModel(id: 3, title: 'Tranquil sleep'),
          SoundsModel(id: 4, title: 'Magical garden'),
          SoundsModel(id: 5, title: 'Gentle flute'),
        ],
      ),
      CategoryFields(
        id: 1,
        title: 'Space',
        description: 'Cosmic melodies for relaxation and streess relief',
        imagePath: 'asset/img/cuate.png',
        sounds: [
          SoundsModel(id: 0, title: 'Sleep cpace'),
          SoundsModel(id: 1, title: 'Time for sweet dreams'),
          SoundsModel(id: 2, title: 'Melody for the soul'),
          SoundsModel(id: 3, title: 'Tranquil sleep'),
          SoundsModel(id: 4, title: 'Magical garden'),
          SoundsModel(id: 5, title: 'Gentle flute'),
        ],
      ),
      CategoryFields(
        id: 2,
        title: 'Relaxation',
        description: 'Healing and soothing melodies for relaxation',
        imagePath: 'asset/img/relax.png',
        sounds: [
          SoundsModel(id: 0, title: 'Sleep cpace'),
          SoundsModel(id: 1, title: 'Time for sweet dreams'),
          SoundsModel(id: 2, title: 'Melody for the soul'),
          SoundsModel(id: 3, title: 'Tranquil sleep'),
          SoundsModel(id: 4, title: 'Magical garden'),
          SoundsModel(id: 5, title: 'Gentle flute'),
        ],
      ),
      CategoryFields(
        id: 3,
        title: 'Nature',
        description: 'Nature sounds for calming the mind and relaxing the body',
        imagePath: 'asset/img/nature.png',
        sounds: [
          SoundsModel(id: 0, title: 'Sleep cpace'),
          SoundsModel(id: 1, title: 'Time for sweet dreams'),
          SoundsModel(id: 2, title: 'Melody for the soul'),
          SoundsModel(id: 3, title: 'Tranquil sleep'),
          SoundsModel(id: 4, title: 'Magical garden'),
          SoundsModel(id: 5, title: 'Gentle flute'),
        ],
      ),
      CategoryFields(
        id: 4,
        title: 'ASMR',
        description:
            'Discover a variety of ASMR triggers for sleep and relaxation',
        imagePath: 'asset/img/bro.png',
        sounds: [
          SoundsModel(id: 0, title: 'Sleep cpace'),
          SoundsModel(id: 1, title: 'Time for sweet dreams'),
          SoundsModel(id: 2, title: 'Melody for the soul'),
          SoundsModel(id: 3, title: 'Tranquil sleep'),
          SoundsModel(id: 4, title: 'Magical garden'),
          SoundsModel(id: 5, title: 'Gentle flute'),
        ],
      ),
      CategoryFields(
        id: 5,
        title: 'Positivity',
        description: 'Tune into positivity and fill your body with energy',
        imagePath: 'asset/img/positivity.png',
        sounds: [
          SoundsModel(id: 0, title: 'Sleep cpace'),
          SoundsModel(id: 1, title: 'Time for sweet dreams'),
          SoundsModel(id: 2, title: 'Melody for the soul'),
          SoundsModel(id: 3, title: 'Tranquil sleep'),
          SoundsModel(id: 4, title: 'Magical garden'),
          SoundsModel(id: 5, title: 'Gentle flute'),
        ],
      ),
    ],
  ),
];

final List<CategoryModel> sleepCategory = [
  CategoryModel(
    title: 'Sleep music',
    categoryFields: [
      CategoryFields(
        id: 0,
        title: 'Sleep',
        description: '',
        imagePath: 'asset/img/bat.png',
        largestImagepath: 'asset/img/lbat.png',
        sounds: [
          SoundsModel(id: 0, title: 'Sleep cpace'),
          SoundsModel(id: 1, title: 'Time for sweet dreams'),
          SoundsModel(id: 2, title: 'Melody for the soul'),
          SoundsModel(id: 3, title: 'Tranquil sleep'),
          SoundsModel(id: 4, title: 'Magical garden'),
          SoundsModel(id: 5, title: 'Gentle flute'),
        ],
        colors: [
          // fCOlor
          Color(0xffa3fdbd),
          //sColor
          Color(0xff92e3a9),
          //text&btnColor
          Color(0xff263238),
          //backImg Color
          Color(0xffa3fdbd),
          //category title Color
          Color(0xff92e3a9).withValues(alpha: 0.77),
          //list color == 2
          Color.fromRGBO(146, 227, 169, 0.6),
          //list color != 2
          Color(0xff92e3a9),
          //backgroundColor
          Color(0xffe3fce8),
          //flowerElem AT secondScreen Color
          Color(0xffd6f4de),
          //steptTitleColor
          Color(0xff263238).withValues(alpha: 0.6),
          //secondScreenBackgroundColor
          Color(0xffe3fce8),
          // SHADOW ON SECOND  SLEEP SCREEN
          Color(0xff314b4b).withValues(alpha: 1.8),
        ],
      ),
      CategoryFields(
        id: 1,
        title: 'Wave',
        description: '',
        imagePath: 'asset/img/water.png',
        largestImagepath: 'asset/img/lwawe.png',
        sounds: [
          SoundsModel(id: 0, title: 'Nirvana'),
          SoundsModel(id: 1, title: 'Serenity'),
          SoundsModel(id: 2, title: 'Peace of mind'),
          SoundsModel(id: 3, title: 'Enlightment'),
          SoundsModel(id: 4, title: 'Drowsiness'),
          SoundsModel(id: 5, title: 'The world of dreams and fantasies'),
        ],
        colors: [
          // SoundsModelfCOlor
          Color(0xfffea386),
          //sColor
          Color(0xffff725e),
          //text&btnColor
          Color(0xfffea386),
          //backImg Color
          Color(0xfffea386),
          //category title Color
          Color(0xfffbc9aa),
          //list color == 2
          Color(0xfffbc9aa),
          //list color != 2
          Color(0xfffea386).withValues(alpha: 0.6),
          //backgroundColor
          Color(0xfff8ecd6),
          //flowerElem AT secondScreen Color
          Color(0xfffbe7c3),
          //steptTitleColor
          Color(0xfffea386).withValues(alpha: 0.6),
          //secondScreenBackgroundColor
          Color(0xfff8ecd6),
          // SHADOW ON SECOND  SLEEP SCREEN
          Color.fromARGB(255, 229, 152, 146),
        ],
      ),
      CategoryFields(
        id: 2,
        title: 'Nature',
        description: '',
        imagePath: 'asset/img/amico.png',
        largestImagepath: 'asset/img/lnature.png',
        sounds: [
          SoundsModel(id: 0, title: 'Ocean breeze'),
          SoundsModel(id: 1, title: 'By the fire'),
          SoundsModel(id: 2, title: 'Fresh wind'),
          SoundsModel(id: 3, title: 'Waterfall'),
          SoundsModel(id: 4, title: 'The sound of rain'),
          SoundsModel(id: 5, title: 'Rain with thunderstorm'),
        ],
        colors: [
          // fCOlor
          Color(0xffead2ef),
          //sColor
          Color(0xff9f59ab),
          //text&btn&backImg Color
          Color(0xff9f0fbe),
          //backImg Color
          Color(0xff9f0fbe),
          //category title Color
          Color(0xffcf95d9).withValues(alpha: 0.77),
          //list color == 2
          Color(0xffcf96d9).withValues(alpha: 0.77),
          //list color != 2
          Color(0xffc886d3),
          //backgroundColor
          Color(0xfff7d6f8),
          //flowerElem AT secondScreen Color
          Color(0xfff6c3ff),
          //steptTitleColor
          Color(0xffaa2abf).withValues(alpha: 0.6),
          //secondScreenBackgroundColor
          Color(0xfff7d6f8),
          // SHADOW ON SECOND  SLEEP SCREEN
          Color(0xffca86fe).withValues(alpha: 0.5),
        ],
      ),
    ],
  ),
  CategoryModel(
    title: 'Meditation',
    categoryFields: [
      CategoryFields(
        id: 0,
        title: 'Sleep',
        description: 'Relax and fall asleep',
        imagePath: 'asset/img/sleep.png',
        steps: [
          StepsModel(id: 0, title: 'Step 1'),
          StepsModel(id: 1, title: 'Step 2'),
          StepsModel(id: 2, title: 'Step 3'),
          StepsModel(id: 3, title: 'Step 4'),
          StepsModel(id: 4, title: 'Step 5'),
          StepsModel(id: 5, title: 'Step 6'),
          StepsModel(id: 6, title: 'Step 7'),
          StepsModel(id: 7, title: 'Step 8'),
        ],
        colors: [
          // fCOlor
          Color(0xffa3fdbd),
          //sColor
          Color(0xff92e3a9),
          //text&btnColor
          Color(0xff263238),
          //backImg Color
          Color(0xffa3fdbd),
          //category title Color
          Color(0xff92e3a9).withValues(alpha: 0.77),
          //list color == 2
          Color.fromRGBO(146, 227, 169, 0.6),
          //list color != 2
          Color(0xff92e3a9),
          //backgroundColor
          Color(0xffe3fce8),
          //flowerElem AT secondScreen Color
          Color(0xffd6f4de),
          //steptTitleColor
          Color(0xff263238).withValues(alpha: 0.6),
          //secondScreenBackgroundColor
          Color(0xffe3fce8),
          // SHADOW ON SECOND  SLEEP SCREEN
          Color(0xff314b4b).withValues(alpha: 1.8),
        ],
      ),
      CategoryFields(
        id: 1,
        title: 'Sleep - Part 2',
        description: 'Fall asleep faster and easier',
        imagePath: 'asset/img/sleepp.png',
        steps: [
          StepsModel(id: 0, title: 'Step 1'),
          StepsModel(id: 1, title: 'Step 2'),
          StepsModel(id: 2, title: 'Step 3'),
          StepsModel(id: 3, title: 'Step 4'),
          StepsModel(id: 4, title: 'Step 5'),
        ],
        colors: [
          // fCOlor
          Color(0xffead2ef),
          //sColor
          Color(0xff9f59ab),
          //text&btn&backImg Color
          Color(0xff9f0fbe),
          //backImg Color
          Color(0xff9f0fbe),
          //category title Color
          Color(0xffcf95d9).withValues(alpha: 0.77),
          //list color == 2
          Color(0xffcf96d9).withValues(alpha: 0.77),
          //list color != 2
          Color(0xffc886d3),
          //backgroundColor
          Color(0xfff7d6f8),
          //flowerElem AT secondScreen Color
          Color(0xfff6c3ff),
          //steptTitleColor
          Color(0xffaa2abf).withValues(alpha: 0.6),
          //secondScreenBackgroundColor
          Color(0xfff7d6f8),
          // SHADOW ON SECOND  SLEEP SCREEN
          Color(0xffca86fe).withValues(alpha: 0.5),
        ],
      ),
    ],
  ),
];

final List<CategoryModel> meditationCategory = [
  CategoryModel(
    title: 'Sleep Music',
    categoryFields: [
      CategoryFields(
        id: 0,
        title: 'Sleep',
        description: 'Relax and fall asleep',
        imagePath: 'asset/img/sleep.png',
        steps: [
          StepsModel(id: 0, title: 'Sleep cpace'),
          StepsModel(id: 1, title: 'Time for sweet dreams'),
          StepsModel(id: 2, title: 'Melody for the soul'),
          StepsModel(id: 3, title: 'Tranquil sleep'),
          StepsModel(id: 4, title: 'Magical garden'),
          StepsModel(id: 5, title: 'Gentle flute'),
        ],
      ),
      CategoryFields(
        id: 1,
        title: 'Sleep - Part 2',
        description: 'Fall asleep faster and easier',
        imagePath: 'asset/img/sleepp.png',
        steps: [
          StepsModel(id: 0, title: 'Sleep cpace'),
          StepsModel(id: 1, title: 'Time for sweet dreams'),
          StepsModel(id: 2, title: 'Melody for the soul'),
          StepsModel(id: 3, title: 'Tranquil sleep'),
          StepsModel(id: 4, title: 'Magical garden'),
          StepsModel(id: 5, title: 'Gentle flute'),
        ],
      ),
    ],
  ),
  CategoryModel(
    title: 'Self-esteem',
    categoryFields: [
      CategoryFields(
        id: 0,
        title: 'Self-love',
        description: 'Unleash your individuality',
        imagePath: 'asset/img/love.png',
        steps: [
          StepsModel(id: 0, title: 'Sleep cpace'),
          StepsModel(id: 1, title: 'Time for sweet dreams'),
          StepsModel(id: 2, title: 'Melody for the soul'),
          StepsModel(id: 3, title: 'Tranquil sleep'),
          StepsModel(id: 4, title: 'Magical garden'),
          StepsModel(id: 5, title: 'Gentle flute'),
        ],
      ),
      CategoryFields(
        id: 0,
        title: 'Weight loass',
        description: 'Get your body in shape',
        imagePath: 'asset/img/shape.png',
        steps: [
          StepsModel(id: 0, title: 'Sleep cpace'),
          StepsModel(id: 1, title: 'Time for sweet dreams'),
          StepsModel(id: 2, title: 'Melody for the soul'),
          StepsModel(id: 3, title: 'Tranquil sleep'),
          StepsModel(id: 4, title: 'Magical garden'),
          StepsModel(id: 5, title: 'Gentle flute'),
        ],
      ),
    ],
  ),
  CategoryModel(
    title: 'Productivity',
    categoryFields: [
      CategoryFields(
        id: 0,
        title: 'Productivity',
        description: 'Become more successful and productive',
        imagePath: 'asset/img/prod.png',
        steps: [
          StepsModel(id: 0, title: 'Sleep cpace'),
          StepsModel(id: 1, title: 'Time for sweet dreams'),
          StepsModel(id: 2, title: 'Melody for the soul'),
          StepsModel(id: 3, title: 'Tranquil sleep'),
          StepsModel(id: 4, title: 'Magical garden'),
          StepsModel(id: 5, title: 'Gentle flute'),
        ],
      ),
      CategoryFields(
        id: 0,
        title: 'Procrastination',
        description: 'Complete tasks quckly and efficientle',
        imagePath: 'asset/img/procr.png',
        steps: [
          StepsModel(id: 0, title: 'Sleep cpace'),
          StepsModel(id: 1, title: 'Time for sweet dreams'),
          StepsModel(id: 2, title: 'Melody for the soul'),
          StepsModel(id: 3, title: 'Tranquil sleep'),
          StepsModel(id: 4, title: 'Magical garden'),
          StepsModel(id: 5, title: 'Gentle flute'),
        ],
      ),
    ],
  ),
  CategoryModel(
    title: 'Anxiety',
    categoryFields: [
      CategoryFields(
        id: 0,
        title: 'Anxiety',
        description: 'Get rid of fear and worries',
        imagePath: 'asset/img/anxi.png',
        steps: [
          StepsModel(id: 0, title: 'Sleep cpace'),
          StepsModel(id: 1, title: 'Time for sweet dreams'),
          StepsModel(id: 2, title: 'Melody for the soul'),
          StepsModel(id: 3, title: 'Tranquil sleep'),
          StepsModel(id: 4, title: 'Magical garden'),
          StepsModel(id: 5, title: 'Gentle flute'),
        ],
      ),
      CategoryFields(
        id: 0,
        title: 'Stress relief',
        description: 'Release tension and stress',
        imagePath: 'asset/img/stress.png',
        steps: [],
      ),
    ],
  ),
  CategoryModel(
    title: 'RelationShips',
    categoryFields: [
      CategoryFields(
        id: 0,
        title: 'The ability to forgive',
        description: 'Learn to accept and forgive',
        imagePath: 'asset/img/sun.png',
        steps: [
          StepsModel(id: 0, title: 'Sleep cpace'),
          StepsModel(id: 1, title: 'Time for sweet dreams'),
          StepsModel(id: 2, title: 'Melody for the soul'),
          StepsModel(id: 3, title: 'Tranquil sleep'),
          StepsModel(id: 4, title: 'Magical garden'),
          StepsModel(id: 5, title: 'Gentle flute'),
        ],
      ),
      CategoryFields(
        id: 0,
        title: 'Stress relief',
        description: 'Rise like a phoenix',
        imagePath: 'asset/img/rise.png',
        steps: [
          StepsModel(id: 0, title: 'Sleep cpace'),
          StepsModel(id: 1, title: 'Time for sweet dreams'),
          StepsModel(id: 2, title: 'Melody for the soul'),
          StepsModel(id: 3, title: 'Tranquil sleep'),
          StepsModel(id: 4, title: 'Magical garden'),
          StepsModel(id: 5, title: 'Gentle flute'),
        ],
      ),
    ],
  ),
];

final List<CategoryModel> myCourseCategory = [
  CategoryModel(
    title: 'My course',
    categoryFields: [
      CategoryFields(
        id: 0,
        title: 'Anxiety',
        description: '',
        imagePath: 'asset/img/secanxiety.png',
        sounds: [
          SoundsModel(id: 0, title: 'Sleep cpace'),
          SoundsModel(id: 1, title: 'Time for sweet dreams'),
          SoundsModel(id: 2, title: 'Melody for the soul'),
          SoundsModel(id: 3, title: 'Tranquil sleep'),
          SoundsModel(id: 4, title: 'Magical garden'),
          SoundsModel(id: 5, title: 'Gentle flute'),
        ],
        colors: [
          // fCOlor
          Color(0xffa3fdbd),
          //sColor
          Color(0xff92e3a9),
          //text&btnColor
          Color(0xff263238),
          //backImg Color
          Color(0xffa3fdbd),
          //category title Color
          Color(0xff92e3a9).withValues(alpha: 0.77),
          //list color == 2
          Color.fromRGBO(146, 227, 169, 0.6),
          //list color != 2
          Color(0xff92e3a9),
          //backgroundColor
          Color(0xffe3fce8),
          //flowerElem AT secondScreen Color
          Color(0xffd6f4de),
          //steptTitleColor
          Color(0xff263238).withValues(alpha: 0.6),
          //secondScreenBackgroundColor
          Color(0xffe3fce8),
          // SHADOW ON SECOND  SLEEP SCREEN
          Color(0xff314b4b).withValues(alpha: 1.8),
        ],
      ),
      CategoryFields(
        id: 1,
        title: 'Happines',
        description: '',
        imagePath: 'asset/img/happiness.png',
        sounds: [
          SoundsModel(id: 0, title: 'Sleep cpace'),
          SoundsModel(id: 1, title: 'Time for sweet dreams'),
          SoundsModel(id: 2, title: 'Melody for the soul'),
          SoundsModel(id: 3, title: 'Tranquil sleep'),
          SoundsModel(id: 4, title: 'Magical garden'),
          SoundsModel(id: 5, title: 'Gentle flute'),
        ],
        colors: [
          // fCOlor
          Color(0xfffea386),
          //sColor
          Color(0xffff725e),
          //text&btnColor
          Color(0xfffea386),
          //backImg Color
          Color(0xfffea386),
          //category title Color
          Color(0xfffbc9aa),
          //list color == 2
          Color(0xfffbc9aa),
          //list color != 2
          Color(0xfffea386).withValues(alpha: 0.6),
          //backgroundColor
          Color(0xfff8ecd6),
          //flowerElem AT secondScreen Color
          Color(0xfffbe7c3),
          //steptTitleColor
          Color(0xfffea386).withValues(alpha: 0.6),
          //secondScreenBackgroundColor
          Color(0xfff8ecd6),
          // SHADOW ON SECOND  SLEEP SCREEN
          Color.fromARGB(255, 229, 152, 146),
        ],
      ),
      CategoryFields(
        id: 2,
        title: 'Stress relief',
        description: '',
        imagePath: 'asset/img/stres.png',
        sounds: [
          SoundsModel(id: 0, title: 'Sleep cpace'),
          SoundsModel(id: 1, title: 'Time for sweet dreams'),
          SoundsModel(id: 2, title: 'Melody for the soul'),
          SoundsModel(id: 3, title: 'Tranquil sleep'),
          SoundsModel(id: 4, title: 'Magical garden'),
          SoundsModel(id: 5, title: 'Gentle flute'),
        ],
        colors: [
          // fCOlor
          Color(0xffead2ef),
          //sColor
          Color(0xff9f59ab),
          //text&btn&backImg Color
          Color(0xff9f0fbe),
          //backImg Color
          Color(0xff9f0fbe),
          //category title Color
          Color(0xffcf95d9).withValues(alpha: 0.77),
          //list color == 2
          Color(0xffcf96d9).withValues(alpha: 0.77),
          //list color != 2
          Color(0xffc886d3),
          //backgroundColor
          Color(0xfff7d6f8),
          //flowerElem AT secondScreen Color
          Color(0xfff6c3ff),
          //steptTitleColor
          Color(0xffaa2abf).withValues(alpha: 0.6),
          //secondScreenBackgroundColor
          Color(0xfff7d6f8),
          // SHADOW ON SECOND  SLEEP SCREEN
          Color(0xffca86fe).withValues(alpha: 0.5),
        ],
      ),
    ],
  ),
  CategoryModel(
    title: 'ASMR-video',
    categoryFields: [
      CategoryFields(
        id: 0,
        title: '',
        description: '',
        imagePath: 'asset/img/dis.png',
        steps: [
          StepsModel(id: 0, title: 'Sleep cpace'),
          StepsModel(id: 1, title: 'Time for sweet dreams'),
          StepsModel(id: 2, title: 'Melody for the soul'),
          StepsModel(id: 3, title: 'Tranquil sleep'),
          StepsModel(id: 4, title: 'Magical garden'),
          StepsModel(id: 5, title: 'Gentle flute'),
        ],
      ),
      CategoryFields(
        id: 1,
        title: '',
        description: '',
        imagePath: 'asset/img/souns.png',
        steps: [
          StepsModel(id: 0, title: 'Sleep cpace'),
          StepsModel(id: 1, title: 'Time for sweet dreams'),
          StepsModel(id: 2, title: 'Melody for the soul'),
          StepsModel(id: 3, title: 'Tranquil sleep'),
          StepsModel(id: 4, title: 'Magical garden'),
          StepsModel(id: 5, title: 'Gentle flute'),
        ],
      ),
      CategoryFields(
        id: 2,
        title: '',
        description: '',
        imagePath: 'asset/img/cake.png',
      ),
      CategoryFields(
        id: 3,
        title: '',
        description: '',
        imagePath: 'asset/img/paws.png',
      ),
    ],
  ),
  CategoryModel(
    title: 'Sound of the day',
    categoryFields: [
      CategoryFields(
        id: 0,
        title: 'Touch of silence',
        description: 'Relaxation',
        imagePath: 'asset/img/two.png',
      ),
    ],
  ),
];
