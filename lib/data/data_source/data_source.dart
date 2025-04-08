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
        imagePath: 'assets/img/pana.png',
        sounds: [
          SoundsModel(
            id: 0,
            title: 'Sleep cpace',
            musicAsset: 'sound/sleepspace.mp3',
          ),
          SoundsModel(
            id: 1,
            title: 'Time for sweet dreams',
            musicAsset: 'sound/timeforsweet.mp3',
          ),
          SoundsModel(
            id: 2,
            title: 'Melody for the soul',
            musicAsset: 'sound/melodyforsoul.mp3',
          ),
          SoundsModel(
            id: 3,
            title: 'Tranquil sleep',
            musicAsset: 'sound/tranquil.mp3',
          ),
          SoundsModel(
            id: 4,
            title: 'Magical garden',
            musicAsset: 'sound/garden.mp3',
          ),
          SoundsModel(
            id: 5,
            title: 'Gentle flute',
            musicAsset: 'sound/gentle.mp3',
          ),
        ],
      ),
      CategoryFields(
        id: 1,
        title: 'Space',
        description: 'Cosmic melodies for relaxation and streess relief',
        imagePath: 'assets/img/cuate.png',
        sounds: [
          SoundsModel(
            id: 0,
            title: 'Magic of Space',
            musicAsset: 'sound/cosmo.mp3',
          ),
          SoundsModel(
            id: 1,
            title: 'Zen State',
            musicAsset: 'sound/cosmoo.mp3',
          ),
          SoundsModel(
            id: 2,
            title: 'Waves of Calm',
            musicAsset: 'sound/cosmooo.mp3',
          ),
          SoundsModel(
            id: 3,
            title: 'Spiritual Comfort',
            musicAsset: 'sound/cosmoooo.mp3',
          ),
          SoundsModel(
            id: 4,
            title: 'Magical Radiance',
            musicAsset: 'sound/cosmooooo.mp3',
          ),
          SoundsModel(
            id: 5,
            title: 'Alone with Yourself',
            musicAsset: 'sound/cosmoooooo.mp3',
          ),
        ],
      ),
      CategoryFields(
        id: 2,
        title: 'Relaxation',
        description: 'Healing and soothing melodies for relaxation',
        imagePath: 'assets/img/relax.png',
        sounds: [
          SoundsModel(
            id: 0,
            title: 'Indian flute',
            musicAsset: 'sound/relax.mp3',
          ),
          SoundsModel(
            id: 1,
            title: 'Healthy Deep Sleep',
            musicAsset: 'sound/relaxx.mp3',
          ),
          SoundsModel(
            id: 2,
            title: 'Silence of the Mind',
            musicAsset: 'sound/relaxxx.mp3',
          ),
          SoundsModel(
            id: 3,
            title: 'Touch of Silence',
            musicAsset: 'sound/relaxxxx.mp3',
          ),
          SoundsModel(
            id: 4,
            title: 'Presence in the Present',
            musicAsset: 'sound/relaxxxxx.mp3',
          ),
          SoundsModel(
            id: 5,
            title: 'For Stress Relief',
            musicAsset: 'sound/relaxxxxxx.mp3',
          ),
        ],
      ),
      CategoryFields(
        id: 3,
        title: 'Nature',
        description: 'Nature sounds for calming the mind and relaxing the body',
        imagePath: 'assets/img/nature.png',
        sounds: [
          SoundsModel(
            id: 0,
            title: 'Ocean breeze',
            musicAsset: 'sound/seawave.mp3',
          ),
          SoundsModel(
            id: 1,
            title: 'By the fire',
            musicAsset: 'sound/fire.mp3',
          ),
          SoundsModel(id: 2, title: 'Fresh wind', musicAsset: 'sound/wind.mp3'),
          SoundsModel(
            id: 3,
            title: 'Waterfall',
            musicAsset: 'sound/birdsound.mp3',
          ),
          SoundsModel(
            id: 4,
            title: 'The sound of rain',
            musicAsset: 'sound/shinyrain.mp3',
          ),
          SoundsModel(
            id: 5,
            title: 'Rain with thunderstorm',
            musicAsset: 'sound/thundershtorm.mp3',
          ),
        ],
      ),
      CategoryFields(
        id: 4,
        title: 'ASMR',
        description:
            'Discover a variety of ASMR triggers for sleep and relaxation',
        imagePath: 'assets/img/bro.png',
        sounds: [
          SoundsModel(
            id: 0,
            title: 'Gives me goosebumps',
            musicAsset: 'sound/goosebump.mp3',
          ),
          SoundsModel(
            id: 1,
            title: 'Relaxation triggers',
            musicAsset: 'sound/trigger.mp3',
          ),
          SoundsModel(
            id: 2,
            title: 'Gentle touch',
            musicAsset: 'sound/touch.mp3',
          ),
          SoundsModel(
            id: 3,
            title: 'Cracking and knocking sounds',
            musicAsset: 'sound/nockingsound.mp3',
          ),
          SoundsModel(
            id: 4,
            title: 'Crunching sounds',
            musicAsset: 'sound/icecrack.mp3',
          ),
          SoundsModel(
            id: 5,
            title: 'Playing with hands',
            musicAsset: 'sound/handsasmr.mp3',
          ),
        ],
      ),
      CategoryFields(
        id: 5,
        title: 'Positivity',
        description: 'Tune into positivity and fill your body with energy',
        imagePath: 'assets/img/positivity.png',
        sounds: [
          SoundsModel(
            id: 0,
            title: 'Pierian spring',
            musicAsset: 'sound/pos.mp3',
          ),
          SoundsModel(
            id: 1,
            title: 'Positive energy',
            musicAsset: 'sound/poss.mp3',
          ),
          SoundsModel(
            id: 2,
            title: 'Creative upsurge',
            musicAsset: 'sound/posss.mp3',
          ),
          SoundsModel(
            id: 3,
            title: 'Happiness and joy',
            musicAsset: 'sound/possss.mp3',
          ),
          SoundsModel(
            id: 4,
            title: 'Energy of movement',
            musicAsset: 'sound/posssss.mp3',
          ),
          SoundsModel(
            id: 5,
            title: 'In a good mood',
            musicAsset: 'sound/possssss.mp3',
          ),
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
        imagePath: 'assets/img/bat.png',
        largestImagepath: 'assets/img/lbat.png',
        sounds: [
          SoundsModel(
            id: 0,
            title: 'Sleep cpace',
            musicAsset: 'sound/lslep.mp3',
          ),
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
        imagePath: 'assets/img/water.png',
        largestImagepath: 'assets/img/lwawe.png',
        sounds: [
          SoundsModel(id: 0, title: 'Nirvana', musicAsset: 'sound/lwave.mp3'),
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
        imagePath: 'assets/img/amico.png',
        largestImagepath: 'assets/img/lnature.png',
        sounds: [
          SoundsModel(id: 0, title: 'Nature', musicAsset: 'sound/lnature.mp3'),
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
        imagePath: 'assets/img/sleep.png',
        steps: [
          StepsModel(id: 0, title: 'Step 1', stepAsset: 'sound/cosmo.mp3'),
          StepsModel(id: 1, title: 'Step 2', stepAsset: 'sound/cosmo.mp3'),
          StepsModel(id: 2, title: 'Step 3', stepAsset: 'sound/cosmo.mp3'),
          StepsModel(id: 3, title: 'Step 4', stepAsset: 'sound/cosmo.mp3'),
          StepsModel(id: 4, title: 'Step 5', stepAsset: 'sound/cosmo.mp3'),
          StepsModel(id: 5, title: 'Step 6', stepAsset: 'sound/cosmo.mp3'),
          StepsModel(id: 6, title: 'Step 7', stepAsset: 'sound/cosmo.mp3'),
          StepsModel(id: 7, title: 'Step 8', stepAsset: 'sound/cosmo.mp3'),
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
        imagePath: 'assets/img/sleepp.png',
        steps: [
          StepsModel(id: 0, title: 'Step 1', stepAsset: 'sound/cosmo.mp3'),
          StepsModel(id: 1, title: 'Step 2', stepAsset: 'sound/cosmo.mp3'),
          StepsModel(id: 2, title: 'Step 3', stepAsset: 'sound/cosmo.mp3'),
          StepsModel(id: 3, title: 'Step 4', stepAsset: 'sound/cosmo.mp3'),
          StepsModel(id: 4, title: 'Step 5', stepAsset: 'sound/cosmo.mp3'),
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
        id: 2,
        title: 'Sleep',
        description: 'Relax and fall asleep',
        imagePath: 'assets/img/sleep.png',
        steps: [
          // StepsModel(id: 0, title: 'Step 1', stepAsset: 'sound/slep.mp3'),
          StepsModel(id: 0, title: 'Step 1', stepAsset: 'sound/clap.mp3'),
          StepsModel(id: 1, title: 'Step 2', stepAsset: 'sound/sleep.mp3'),
          StepsModel(id: 2, title: 'Step 3', stepAsset: 'sound/sleeep.mp3'),
          StepsModel(id: 3, title: 'Step 4', stepAsset: 'sound/sleeeep.mp3'),
          StepsModel(id: 4, title: 'Step 5', stepAsset: 'sound/sleeeeep.mp3'),
          StepsModel(id: 5, title: 'Step 6', stepAsset: 'sound/sleeeeeep.mp3'),
          StepsModel(id: 6, title: 'Step 7', stepAsset: 'sound/sleeeeeeep.mp3'),
          StepsModel(
            id: 7,
            title: 'Step 8',
            stepAsset: 'sound/sleeeeeeeep.mp3',
          ),
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
        id: 3,
        title: 'Sleep - Part 2',
        description: 'Fall asleep faster and easier',
        imagePath: 'assets/img/sleepp.png',
        steps: [
          StepsModel(id: 0, title: 'Step 1', stepAsset: 'sound/slepp.mp3'),
          StepsModel(id: 1, title: 'Step 2', stepAsset: 'sound/sleppp.mp3'),
          StepsModel(id: 2, title: 'Step 3', stepAsset: 'sound/slepppp.mp3'),
          StepsModel(id: 3, title: 'Step 4', stepAsset: 'sound/sleppppp.mp3'),
          StepsModel(id: 4, title: 'Step 5', stepAsset: 'sound/slepppppp.mp3'),
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
    title: 'Self-esteem',
    categoryFields: [
      CategoryFields(
        id: 4,
        title: 'Self-love',
        description: 'Unleash your individuality',
        imagePath: 'assets/img/love.png',
        steps: [
          StepsModel(id: 0, title: 'Step 1', stepAsset: 'sound/love.mp3'),
          StepsModel(id: 1, title: 'Step 2', stepAsset: 'sound/lovee.mp3'),
          StepsModel(id: 2, title: 'Step 3', stepAsset: 'sound/loveee.mp3'),
          StepsModel(id: 3, title: 'Step 4', stepAsset: 'sound/loveeee.mp3'),
          StepsModel(id: 4, title: 'Step 5', stepAsset: 'sound/loveeeee.mp3'),
          StepsModel(id: 5, title: 'Step 6', stepAsset: 'sound/loveeeeee.mp3'),
          StepsModel(id: 6, title: 'Step 7', stepAsset: 'sound/loveeeeeee.mp3'),
          StepsModel(
            id: 7,
            title: 'Step 8',
            stepAsset: 'sound/loveeeeeeee.mp3',
          ),
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
      CategoryFields(
        id: 5,
        title: 'Weight loass',
        description: 'Get your body in shape',
        imagePath: 'assets/img/shape.png',
        steps: [
          StepsModel(id: 0, title: 'Step 1', stepAsset: 'sound/los.mp3'),
          StepsModel(id: 1, title: 'Step 2', stepAsset: 'sound/loss.mp3'),
          StepsModel(id: 2, title: 'Step 3', stepAsset: 'sound/losss.mp3'),
          StepsModel(id: 3, title: 'Step 4', stepAsset: 'sound/lossss.mp3'),
          StepsModel(id: 4, title: 'Step 5', stepAsset: 'sound/losssss.mp3'),
          StepsModel(id: 5, title: 'Step 6', stepAsset: 'sound/lossssss.mp3'),
          StepsModel(id: 6, title: 'Step 7', stepAsset: 'sound/losssssss.mp3'),
          StepsModel(id: 7, title: 'Step 8', stepAsset: 'sound/lossssssss.mp3'),
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
    title: 'Productivity',
    categoryFields: [
      CategoryFields(
        id: 6,
        title: 'Productivity',
        description: 'Become more successful and productive',
        imagePath: 'assets/img/prod.png',
        steps: [
          StepsModel(id: 0, title: 'Step 1', stepAsset: 'sound/prod.mp3'),
          StepsModel(id: 1, title: 'Step 2', stepAsset: 'sound/prodd.mp3'),
          StepsModel(id: 2, title: 'Step 3', stepAsset: 'sound/proddd.mp3'),
          StepsModel(id: 3, title: 'Step 4', stepAsset: 'sound/prodddd.mp3'),
        ],
        colors: [
          // fCOlor
          Color(0xffff725e),
          //sColor
          Color(0xffff725e),
          //text&btn&backImg Color
          Color(0xffcc5b4b),
          //backImg Color
          Color(0xffcc5b4b),
          //category title Color
          Colors.transparent,
          //list color == 2
          Colors.transparent,
          //list color != 2
          Colors.transparent,
          //backgroundColor
          Color(0xfffce3e3),
          //flowerElem AT secondScreen Color
          Color(0xfff4d6d6),
          //steptTitleColor
          Color(0xffcc5b4b),
          //secondScreenBackgroundColor
          Color(0xfff4d6d6),
          // SHADOW ON SECOND  SLEEP SCREEN
          Color(0xfff4d6d6),
        ],
      ),
      CategoryFields(
        id: 7,
        title: 'Procrastination',
        description: 'Complete tasks quckly and efficientle',
        imagePath: 'assets/img/procr.png',
        steps: [
          StepsModel(id: 0, title: 'Step 1', stepAsset: 'sound/procrast.mp3'),
          StepsModel(id: 1, title: 'Step 2', stepAsset: 'sound/procrastt.mp3'),
          StepsModel(id: 2, title: 'Step 3', stepAsset: 'sound/procrasttt.mp3'),
          StepsModel(
            id: 3,
            title: 'Step 4',
            stepAsset: 'sound/procrastttt.mp3',
          ),
        ],
        colors: [
          // fCOlor
          Color(0xff84a8fa),
          //sColor
          Color(0xff407bff),
          //text&btn&backImg Color
          Color(0xff2d57b3),
          //backImg Color
          Color(0xff2d57b3),
          //category title Color
          Colors.transparent,
          //list color == 2
          Colors.transparent,
          //list color != 2
          Colors.transparent,
          //backgroundColor
          Color(0xffe3e4fc),
          //flowerElem AT secondScreen Color
          Color(0xffd9d6f4),
          //steptTitleColor
          Color(0xff2d57b3),
          //secondScreenBackgroundColor
          Color(0xfff4d6d6),
          // SHADOW ON SECOND  SLEEP SCREEN
          Color(0xfff4d6d6),
        ],
      ),
    ],
  ),
  CategoryModel(
    title: 'Anxiety',
    categoryFields: [
      CategoryFields(
        id: 8,
        title: 'Anxiety',
        description: 'Get rid of fear and worries',
        imagePath: 'assets/img/anxi.png',
        steps: [
          StepsModel(id: 0, title: 'Step 1', stepAsset: 'sound/anxiety.mp3'),
          StepsModel(id: 1, title: 'Step 2', stepAsset: 'sound/anxietyy.mp3'),
          StepsModel(id: 2, title: 'Step 3', stepAsset: 'sound/anxietyyy.mp3'),
          StepsModel(id: 3, title: 'Step 4', stepAsset: 'sound/anxietyyyy.mp3'),
          StepsModel(
            id: 4,
            title: 'Step 5',
            stepAsset: 'sound/anxietyyyyy.mp3',
          ),
          StepsModel(
            id: 5,
            title: 'Step 6',
            stepAsset: 'sound/anxietyyyyyy.mp3',
          ),
        ],
        colors: [
          // fCOlor
          Color(0xfffff0c6),
          //sColor
          Color(0xffffd252),
          //text&btnColor
          Color(0xffffc727),
          //backImg Color
          Color(0xffffc727),
          //category title Color
          Color(0xffffc727),
          //list color == 2
          Colors.transparent,
          //list color != 2
          Colors.transparent,
          //backgroundColor
          Color(0xfffafce3),
          //flowerElem AT secondScreen Color
          Color(0xfff1f4d6),
          //steptTitleColor
          Color(0xffffc727),
          //secondScreenBackgroundColor
          Color(0xfffafce3),
          // SHADOW ON SECOND  SLEEP SCREEN
          Color(0xff314b4b).withValues(alpha: 1.8),
        ],
      ),
      CategoryFields(
        id: 9,
        title: 'Stress relief',
        description: 'Release tension and stress',
        imagePath: 'assets/img/stress.png',
        steps: [
          StepsModel(id: 0, title: 'Step 1', stepAsset: 'sound/stres.mp3'),
          StepsModel(id: 1, title: 'Step 2', stepAsset: 'sound/stress.mp3'),
          StepsModel(id: 2, title: 'Step 3', stepAsset: 'sound/stresss.mp3'),
          StepsModel(id: 3, title: 'Step 4', stepAsset: 'sound/stressss.mp3'),
          StepsModel(id: 4, title: 'Step 5', stepAsset: 'sound/stresssss.mp3'),
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
    ],
  ),
  CategoryModel(
    title: 'RelationShips',
    categoryFields: [
      CategoryFields(
        id: 10,
        title: 'The ability to forgive',
        description: 'Learn to accept and forgive',
        imagePath: 'assets/img/sun.png',
        steps: [
          StepsModel(id: 0, title: 'Step 1', stepAsset: 'sound/abil.mp3'),
          StepsModel(id: 1, title: 'Step 2', stepAsset: 'sound/abill.mp3'),
          StepsModel(id: 2, title: 'Step 3', stepAsset: 'sound/abilll.mp3'),
          StepsModel(id: 3, title: 'Step 4', stepAsset: 'sound/abillll.mp3'),
          StepsModel(id: 4, title: 'Step 5', stepAsset: 'sound/abilllll.mp3'),
          StepsModel(id: 5, title: 'Step 6', stepAsset: 'sound/abillllll.mp3'),
        ],
        colors: [
          // fCOlor
          Color(0xfffff0c6),
          //sColor
          Color(0xffffd252),
          //text&btnColor
          Color(0xffffc727),
          //backImg Color
          Color(0xffffc727),
          //category title Color
          Color(0xffffc727),
          //list color == 2
          Colors.transparent,
          //list color != 2
          Colors.transparent,
          //backgroundColor
          Color(0xfffafce3),
          //flowerElem AT secondScreen Color
          Color(0xfff1f4d6),
          //steptTitleColor
          Color(0xffffc727),
          //secondScreenBackgroundColor
          Color(0xfffafce3),
          // SHADOW ON SECOND  SLEEP SCREEN
          Color(0xff314b4b).withValues(alpha: 1.8),
        ],
      ),
      CategoryFields(
        id: 11,
        title: 'After a breakup',
        description: 'Rise like a phoenix',
        imagePath: 'assets/img/rise.png',
        steps: [
          StepsModel(id: 0, title: 'Step 1', stepAsset: 'sound/after.mp3'),
          StepsModel(id: 1, title: 'Step 2', stepAsset: 'sound/affter.mp3'),
          StepsModel(id: 2, title: 'Step 3', stepAsset: 'sound/afffter.mp3'),
          StepsModel(id: 3, title: 'Step 4', stepAsset: 'sound/affffter.mp3'),
          StepsModel(id: 4, title: 'Step 5', stepAsset: 'sound/afffffter.mp3'),
          StepsModel(id: 5, title: 'Step 6', stepAsset: 'sound/affffffter.mp3'),
        ],
        colors: [
          // fCOlor
          Color(0xff84a8fa),
          //sColor
          Color(0xff407bff),
          //text&btn&backImg Color
          Color(0xff2d57b3),
          //backImg Color
          Color(0xff2d57b3),
          //category title Color
          Colors.transparent,
          //list color == 2
          Colors.transparent,
          //list color != 2
          Colors.transparent,
          //backgroundColor
          Color(0xffe3e4fc),
          //flowerElem AT secondScreen Color
          Color(0xffd9d6f4),
          //steptTitleColor
          Color(0xff2d57b3),
          //secondScreenBackgroundColor
          Color(0xfff4d6d6),
          // SHADOW ON SECOND  SLEEP SCREEN
          Color(0xfff4d6d6),
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
        imagePath: 'assets/img/secanxiety.png',
        sounds: [
          SoundsModel(id: 0, title: 'Sleep cpace', musicAsset: 'sound/anx.mp3'),
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
        imagePath: 'assets/img/happiness.png',
        sounds: [
          SoundsModel(id: 0, title: 'Sleep cpace', musicAsset: 'sound/hap.mp3'),
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
        imagePath: 'assets/img/stres.png',
        sounds: [
          SoundsModel(
            id: 0,
            title: 'Sleep cpace',
            musicAsset: 'sound/relie.mp3',
          ),
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
        imagePath: 'assets/img/dis.png',
        videoPath: 'assets/video/lvideo.mp4',
      ),
      CategoryFields(
        id: 10,
        title: '',
        description: '',
        imagePath: 'assets/img/souns.png',
        videoPath: 'assets/video/mvid.mp4',
      ),
      CategoryFields(
        id: 2,
        title: '',
        description: '',
        imagePath: 'assets/img/cake.png',
        videoPath: 'assets/video/mvid.mp4',
      ),
      CategoryFields(
        id: 3,
        title: '',
        description: '',
        imagePath: 'assets/img/paws.png',
        videoPath: 'assets/video/mvid.mp4',
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
        imagePath: 'assets/img/two.png',
        colors: [Color(0xfffbe7c3)],
      ),
    ],
  ),
];
