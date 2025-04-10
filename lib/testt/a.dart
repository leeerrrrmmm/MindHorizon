import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_horizon/data/data_source/data_source.dart';
import 'package:mind_horizon/presentation/bloc/bloc/steps_bloc.dart';

class Abc extends StatelessWidget {
  const Abc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<MeditationBloc, MeditationState>(
              builder: (context, state) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: meditationCategory.length,
                  itemBuilder: (context, index) {
                    final cat = meditationCategory[index];
                    return Column(
                      children: [
                        Text(cat.title),
                        SizedBox(
                          height: 200,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: cat.categoryFields.length,
                            itemBuilder: (context, secIndex) {
                              final item = cat.categoryFields[secIndex];

                              int currentStep =
                                  state.steps[item.id] ??
                                  (item.curStepListened ?? 0);

                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => BlocProvider.value(
                                            value:
                                                context
                                                    .read<
                                                      MeditationBloc
                                                    >(), // Используем тот же экземпляр BLoC
                                            child: Bcd(
                                              curListenedEl: currentStep,
                                              id: item.id,
                                              stepCounter: item.steps!.length,
                                            ),
                                          ),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.all(8),
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(item.title),
                                      BlocBuilder<
                                        MeditationBloc,
                                        MeditationState
                                      >(
                                        builder: (context, state) {
                                          return Text(
                                            'Step listened: ${state.steps[item.id] ?? 0} / ${item.steps?.length}',
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 100),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Bcd extends StatefulWidget {
  final int stepCounter;
  final int curListenedEl;
  final int id;

  const Bcd({
    super.key,
    required this.curListenedEl,
    required this.id,
    required this.stepCounter,
  });

  @override
  State<Bcd> createState() => _BcdState();
}

class _BcdState extends State<Bcd> {
  late int stepCount;
  late int maxSteps;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    stepCount = widget.curListenedEl;
    maxSteps = widget.stepCounter;
    _pageController = PageController(initialPage: 0);
  }

  void incrementStep() {
    if (stepCount < maxSteps) {
      setState(() {
        stepCount++;
      });

      // Обновляем глобальный BLoC
      context.read<MeditationBloc>().add(
        UpdateStepCount(id: widget.id, stepCount: stepCount),
      );
    } else {
      // Сообщаем пользователю, если достигнут предел шагов
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Maximum steps reached for this item.')),
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meditation Steps')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Step Count: $stepCount / $maxSteps'),

          // PageView для добавления шагов
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: 1, // Один элемент для начала
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Step $stepCount'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        stepCount, // Кнопки для каждого шага
                        (index) => Icon(Icons.check, color: Colors.green),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          // Кнопка увеличения шага
          TextButton(onPressed: incrementStep, child: Text('+1 Step')),

          // Кнопка выхода
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Exit'),
          ),
        ],
      ),
    );
  }
}

class A extends StatelessWidget {
  final String text;
  const A({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(text)));
  }
}
