// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mind_horizon/presentation/bloc/bloc/steps_bloc.dart';
// import 'package:mind_horizon/presentation/bloc/bloc/steps_event.dart';
// import 'package:mind_horizon/presentation/bloc/bloc/steps_state.dart';

// class MainScreens extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Главный экран')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () async {
//                 // Переход на экран с PageView
//                 final result = await Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => PageViewScreen()),
//                 );

//                 // Если результат не null, обновляем состояние
//                 if (result != null) {
//                   // Обновляем состояние кнопок в MainScreens
//                   // context.read<ButtonBloc>().add(IncrementButtonEvent());
//                 }
//               },
//               child: Text('Перейти к элементам'),
//             ),
//             SizedBox(height: 20),
//             BlocBuilder<ButtonBloc, ButtonState>(
//               builder: (context, state) {
//                 return Text(
//                   'Разблокировано ${state.unlockedButtons} из 4 кнопок',
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class PageViewScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Элементы')),
//       body: Column(
//         children: [
//           Expanded(
//             child: BlocBuilder<ButtonBloc, ButtonState>(
//               builder: (context, state) {
//                 return ListView.builder(
//                   itemCount: 4, // Всего 4 кнопки
//                   itemBuilder: (context, index) {
//                     bool isButtonActive = index < state.unlockedButtons;

//                     return Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: ElevatedButton(
//                         onPressed:
//                             isButtonActive
//                                 ? () {
//                                   // Переход на экран с сообщением о разблокировке
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder:
//                                           (context) => UnlockedScreen(
//                                             buttonIndex: index + 1,
//                                           ),
//                                     ),
//                                   );
//                                   // ).then((value) {
//                                   //   // Если кнопка разблокирована, обновляем количество
//                                   //   if (value != null) {
//                                   //   //   // Обновляем количество разблокированных кнопок
//                                   //   //   context.read<ButtonBloc>().add(
//                                   //   //     // IncrementButtonEvent(),
//                                   //   //   );
//                                   //   // }
//                                   // });
//                                 }
//                                 : null, // Кнопка неактивна
//                         child: Text('Кнопка ${index + 1}'),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class UnlockedScreen extends StatelessWidget {
//   final int buttonIndex;

//   UnlockedScreen({required this.buttonIndex});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Вы успешно разблокировали кнопку $buttonIndex'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             // Возвращаемся на главный экран и передаем обновленное количество разблокированных кнопок
//             Navigator.pop(
//               context,
//               buttonIndex + 1,
//             ); // Передаем обновленный индекс кнопки
//           },
//           child: Text('Вернуться на главный экран'),
//         ),
//       ),
//     );
//   }
// }
