import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart'; // Импортируйте пакет audioplayers


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Корманный клоун эрика',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Карманный клоун'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> jokes = [
    "Разговаривают два еврея.\nВчера в театре я видел вашу супругу.\n— Она так кашляла, что все на нее оглядывались.\nУ нее грипп?\n– Нет, у нее новое платье!",
    "Жена спрашивает мужа,\nТот собирается на курорт без нее.\n– А почему ты не одел обручальное кольцо?\nКольцо?!\n— В такую то жару?",
    "Фраза. Папа ты хороший.\nТянет максимум на игрушечный пистолет.\nА фраза.\n— Папа, я хочу быть таким же умным, как ты.\nЭто реальная заявка на айфон.",
    "Доктор,\n— Таблетки от импотенции, которые вы мне прописали, чудодейственны!\nЯ чувствую себя восемнадцатилетним!\n— Прекрасно!\nА что думает по этому поводу ваша супруга?\n— Без понятия, доктор, с тех пор я еще не был дома.",
    "К психиатру пришла женщина.\n— Доктор, с моим мужем происходит что-то странное.\nОн каждое утро пьет кофе.\nЧто же здесь странного?\n— Да, но он потом съедает чашку!\nКак, целиком?!\n— Нет, ручку почему то всегда оставляет.\nДа действительно, странно, задумчиво говорит доктор.\n— Ведь самое вкусное, как раз в ручке.",
    "У вас тут граница?\n— Да!\nИ собаки пограничные есть?\n— Да.\n— А где же вы собак доставали?\nДа нигде не доставали, просто границу прочертили, где собаки живут.",
    "Лучшие анекдоты из России\nЖил был Спирт.\nО своем семейном положении отвечал просто.\n— Разведен.",
    "Звонок на радио.\n— Я хочу поздравить своего папу с Днем рождения,\nПожелать ему счастья, здоровья, удачи от всего сердца, до члена!\nДиктор.\n— Что, что.\nАлло?\n— Дочь Лена.",
    "Папа,\nМама попросила, чтобы ты походил по комнате без тапочек.\n— Зачем?\nОна потеpяла иголку и хочет ее найти.",
    "Блондинка кидает крошки хлеба в унитаз?\n— Хочет накормить туалетного утенка.",
    "Встретились два приятеля.\n— Я слышал, ты недавно женилcя.\nАга, жена классная и на кyxне, и в постели.\n— Когда же она все успевает?\nДа я ей на кyxне постелил.",
    "Еще раз покажешь язык, заболеешь.\n— Чем?\nПереломом челюсти и сотрясением мозга!",
    "Гуляет парень с девушкой и молчит.\nДевушка спрашивает.\n— А почему ты молчишь?\nОн отвечает.\n— Очень стесняюсь попросить!",
    "Лежат в постели режиссер и молодая актриса.\nОна, в слезах говорит.\n– Какая же ты сволочь, что сразу не сказал, что ты мультипликатор!",
    "Учитель пишет на доске разноцветными мелками.\nРаздается голос из класса.\n— А голубым не видно.\nУчитель.\n— Пусть пересядут на первую парту.",
    "Пока Чип и Дейл спешили на помощь,\n— Винтик и Шпунтик раскрутили Гаечку.",
    "Мам, я еду домой,\nЧто нибудь купить?\n— Купи себе квартиру сынок и живи отдельно!",
    "Скажите, у вас булочки сладкие?\n— У нас и между булочек не кисло.",
    "В ресторане молодой парень и пожилая женщина.\nОн все время приглаживает свои волосы.\n— Чего ты их все гладишь?\nСпрашивает женщина.\n— Да как подумаю, что с тобой еще спать придется, волосы дыбом встают.",
    "Требуются рабочие.\nДля работы на работе.\n— Оплата деньгами.",
    "Хочу тебя обрадовать дочка.\n– Говорит отец дочери,\nТвой возлюбленный попросил у меня твоей руки.\n– Да, но мне так не хочется разлучаться с мамой.\nИ не надо, радость моя, возьми ее с собой!",
    "Мамочка, а правда что детей аист приносит?\n– Да, сына, правда.\nИ подарки всем детям дед мороз раздает?\n– Конечно.\nМне тогда интересно, а зачем мы отца дома держим?!",
    "Отец строго отчитывает свою дочь:\n– Сегодня вечером, когда ты вернулась, часы пробили три раза!\n– Да, папа, но я не хотела тебя будить.\nОни пробили бы семь раз, если бы я их вовремя не остановила."
  ];

  String _joke = "";
  late AudioCache _audioCache; // Создаем экземпляр AudioCache
  @override
  void initState() {
    super.initState();
    _joke = '';
    _audioCache = AudioCache(); // Инициализируем AudioCache
  }
  void _incrementCounter() {
    setState(() {
      final Random random = Random();
      int randomIndex = random.nextInt(jokes.length);
      _joke = jokes[randomIndex];
      _audioCache.play('sound.mp3');

    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Очень смешная шутка тут:',
            ),
            Text(
              '$_joke',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Прикольнуться',
        child: Text('Прикольнуться'),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
