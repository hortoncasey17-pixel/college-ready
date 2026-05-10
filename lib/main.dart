import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';


// ── LANGUAGE SUPPORT ────────────────────────────────────────────
class LangNotifier extends ValueNotifier<String> {
  LangNotifier() : super('en');
}

class LangProvider extends InheritedNotifier<LangNotifier> {
  const LangProvider({super.key, required LangNotifier notifier, required super.child})
      : super(notifier: notifier);

  static LangNotifier of(BuildContext context) {
    final p = context.dependOnInheritedWidgetOfExactType<LangProvider>();
    return p!.notifier!;
  }
}

// Translation map
const Map<String, Map<String, String>> _tr = {
  'en': {
    // Nav labels
    'nav_home': 'Home',
    'nav_timeline': 'Timeline',
    'nav_colleges': 'Colleges',
    'nav_mylist': 'My List',
    'nav_quiz': 'Quiz',
    'nav_preapp': 'Pre-App',
    'nav_essay': 'Essay',
    'nav_apply': 'Apply',
    'nav_aid': 'Aid',
    'nav_scholarships': 'Scholarships',
    'nav_residency': 'Residency',
    'nav_accepted': 'Accepted',
    'nav_campus': 'Campus',
    'nav_firstgen': 'First-Gen',
    'nav_findschool': 'My School',
    'nav_major': 'Majors',
    'scholarship_find_title': 'Find My School',
    'scholarship_find_sub': 'Select your high school to see scholarships matched to your community. No personal info collected.',
    'scholarship_select_hint': 'Select your high school...',
    'scholarship_apply': 'Apply / Learn More',
    'scholarship_deadline': 'Deadline',
    'scholarship_matches': 'scholarships',
    'scholarship_nc_title': 'NC College Scholarships',
    'scholarship_nc_sub': 'Pick a NC college to see institutional scholarships offered directly by that school.',
    'scholarship_college_hint': 'Select a NC college...',
    'scholarship_always_cfnc': 'Always Search CFNC Too',
    'scholarship_cfnc_text': 'CFNC has hundreds of NC-specific scholarships updated every year. Free and takes 5 minutes.',
    'scholarship_search_cfnc': 'Search CFNC.org Scholarships',
    'scholarship_going_merry': 'Going Merry — One App, Many Scholarships',
    'scholarship_free_money': 'Scholarships = Free Money!',
    'scholarship_free_money_sub': 'Unlike loans, scholarships never need to be paid back. Apply early, apply often, and never pay to apply!',
    'scholarship_not_sure': 'Not sure which scholarships fit you?',
    'scholarship_take_quiz': 'Take the Scholarship Match Quiz for personalized matches!',
    'scholarship_take_quiz_btn': 'Take Quiz',
    // Home screen
    'home_hello': 'Hello,',
    'home_future': 'Future Student! 🎓',
    'home_journey': 'Your College Journey',
    'home_appname': 'The Right Click',
    'home_subtitle': 'Complete guide from application to graduation',
    'home_sections': 'Explore Sections',
    'home_learnmore': 'Learn More',
    'home_consulting': 'The Right Click',
    'home_consulting_sub': 'Expert college access advising for NC students',
    'home_badge1': '14 Sections',
    'home_badge2': 'My College List',
    'home_badge3': 'Scholarship Quiz',
    'home_stat1': 'My College\nList',
    'home_stat1_sub': 'Track & Save',
    'home_stat2': 'Scholarship\nQuiz',
    'home_stat2_sub': 'Find Matches',
    'home_stat3': 'First-Gen\nHub',
    'home_stat3_sub': "You've Got This",
    's_timeline': 'Senior Year Timeline',
    's_timeline_sub': 'Month-by-month action plan',
    's_colleges': 'NC College Explorer',
    's_colleges_sub': 'Search & compare NC colleges',
    's_mylist': 'My College List',
    's_mylist_sub': 'Track your applications',
    's_quiz': 'Scholarship Match Quiz',
    's_quiz_sub': 'Find scholarships for you',
    's_preapp': 'Pre-Application',
    's_preapp_sub': '11th & 12th grade checklist',
    's_essay': 'Essay Help',
    's_essay_sub': 'Write a winning college essay',
    's_apply': 'Application Process',
    's_apply_sub': 'How to apply step by step',
    's_aid': 'Financial Aid & FAFSA',
    's_aid_sub': 'Grants, loans & free money',
    's_scholarships': 'Scholarships',
    's_scholarships_sub': 'Find free money for college',
    's_residency': 'Residency',
    's_residency_sub': 'Qualify for in-state tuition',
    's_postaccept': 'Post-Acceptance',
    's_postaccept_sub': "You got in! What's next?",
    's_campus': 'Campus Life',
    's_campus_sub': 'What to expect at college',
    's_firstgen': 'First-Gen Student Hub',
    's_firstgen_sub': 'Resources for trailblazers',
    // Shared header subtitles
    'hdr_timeline': 'Your month-by-month college action plan.',
    'hdr_colleges': 'Search and compare North Carolina colleges.',
    'hdr_mylist': 'Colleges you\u2019re considering.',
    'hdr_quiz': 'Answer a few questions to find scholarships that fit you.',
    'hdr_preapp': 'Your year-by-year college checklist from CFNC.',
    'hdr_essay': 'Write a college essay that gets you noticed.',
    'hdr_apply': 'How to apply to college step by step.',
    'hdr_aid': "Don't let money stop you from going to college.",
    'hdr_scholarships': 'Find free money for college \u2014 no repayment required!',
    'hdr_residency': 'Qualify for lower in-state tuition rates.',
    'hdr_postaccept': "You got in! Here's what to do next.",
    'hdr_campus': 'What to expect when you get to college.',
    'hdr_firstgen': "You're blazing the trail \u2014 we have got your back.",
    // Common buttons
    'btn_visit_cfnc': 'Visit CFNC.org',
    'btn_search': 'Search by name, city, or program...',
    'btn_save': 'Save to My List',
    'btn_remove': 'Remove from My List',
    'btn_visit': 'Visit College Website',
    'btn_learn': 'Apply / Learn More',
    // First-gen
    'fg_title': 'You Are Not Alone 💪',
    'fg_remember': 'Remember This 🌟',
  },
  'es': {
    // Nav labels
    'nav_home': 'Inicio',
    'nav_timeline': 'Calendario',
    'nav_colleges': 'Colegios',
    'nav_mylist': 'Mi Lista',
    'nav_quiz': 'Quiz',
    'nav_preapp': 'Pre-Sol',
    'nav_essay': 'Ensayo',
    'nav_apply': 'Solicitar',
    'nav_aid': 'Ayuda',
    'nav_scholarships': 'Becas',
    'nav_residency': 'Residencia',
    'nav_accepted': 'Aceptado',
    'nav_campus': 'Campus',
    'nav_firstgen': '1ra-Gen',
    'nav_findschool': 'Mi Escuela',
    'nav_major': 'Carreras',
    'scholarship_find_title': 'Encontrar Mi Escuela',
    'scholarship_find_sub': 'Elige tu escuela para ver becas que se ajustan a ti. No se recopila información personal.',
    'scholarship_select_hint': 'Selecciona tu preparatoria...',
    'scholarship_apply': 'Solicitar / Más Información',
    'scholarship_deadline': 'Fecha límite',
    'scholarship_matches': 'becas',
    'scholarship_nc_title': 'Becas de Colegios de NC',
    'scholarship_nc_sub': 'Elige un colegio de NC para ver las becas institucionales que ofrecen directamente.',
    'scholarship_college_hint': 'Selecciona un colegio de NC...',
    'scholarship_always_cfnc': 'Busca También en CFNC',
    'scholarship_cfnc_text': 'CFNC tiene cientos de becas específicas de NC actualizadas cada año. Es gratis y toma 5 minutos.',
    'scholarship_search_cfnc': 'Buscar Becas en CFNC.org',
    'scholarship_going_merry': 'Going Merry — Una Solicitud, Muchas Becas',
    'scholarship_free_money': 'Becas = ¡Dinero Gratis!',
    'scholarship_free_money_sub': 'A diferencia de los préstamos, las becas no se devuelven. ¡Solicita temprano, solicita seguido, y nunca pagues para aplicar!',
    'scholarship_not_sure': '¿No estás seguro qué becas te convienen?',
    'scholarship_take_quiz': '¡Toma el Quiz de Becas para encontrar opciones personalizadas!',
    'scholarship_take_quiz_btn': 'Tomar Quiz',
    // Home screen
    'home_hello': '¡Hola,',
    'home_future': 'Futuro Estudiante! 🎓',
    'home_journey': 'Tu Camino a la Universidad',
    'home_appname': 'The Right Click',
    'home_subtitle': 'Guía completa desde la solicitud hasta la graduación',
    'home_sections': 'Explorar Secciones',
    'home_learnmore': 'Más Información',
    'home_consulting': 'The Right Click',
    'home_consulting_sub': 'Asesoría experta para estudiantes de NC',
    'home_badge1': '14 Secciones',
    'home_badge2': 'Mi Lista de Colegios',
    'home_badge3': 'Quiz de Becas',
    'home_stat1': 'Mi Lista de\nColegios',
    'home_stat1_sub': 'Rastrea y Guarda',
    'home_stat2': 'Quiz de\nBecas',
    'home_stat2_sub': 'Encuentra Becas',
    'home_stat3': 'Centro\n1ra-Gen',
    'home_stat3_sub': '¡Tú Puedes!',
    's_timeline': 'Calendario del Último Año',
    's_timeline_sub': 'Plan de acción mes a mes',
    's_colleges': 'Explorador de Colegios de NC',
    's_colleges_sub': 'Busca y compara colegios de NC',
    's_mylist': 'Mi Lista de Colegios',
    's_mylist_sub': 'Rastrea tus solicitudes',
    's_quiz': 'Quiz de Becas',
    's_quiz_sub': 'Encuentra becas para ti',
    's_preapp': 'Pre-Solicitud',
    's_preapp_sub': 'Lista de 11° y 12° grado',
    's_essay': 'Ayuda con el Ensayo',
    's_essay_sub': 'Escribe un ensayo universitario ganador',
    's_apply': 'Proceso de Solicitud',
    's_apply_sub': 'Cómo solicitar paso a paso',
    's_aid': 'Ayuda Financiera y FAFSA',
    's_aid_sub': 'Becas, préstamos y dinero gratis',
    's_scholarships': 'Becas',
    's_scholarships_sub': 'Encuentra dinero gratis para la universidad',
    's_residency': 'Residencia',
    's_residency_sub': 'Califica para matrícula en tu estado',
    's_postaccept': 'Post-Aceptación',
    's_postaccept_sub': '¡Entraste! ¿Qué sigue?',
    's_campus': 'Vida en el Campus',
    's_campus_sub': 'Qué esperar en la universidad',
    's_firstgen': 'Centro Estudiantes 1ra-Gen',
    's_firstgen_sub': 'Recursos para pioneros',
    // Shared header subtitles
    'hdr_timeline': 'Tu plan de acción universitario mes a mes.',
    'hdr_colleges': 'Busca y compara colegios de Carolina del Norte.',
    'hdr_mylist': 'Colegios que estás considerando.',
    'hdr_quiz': 'Responde unas preguntas para encontrar becas que se ajusten a ti.',
    'hdr_preapp': 'Tu lista de verificación año a año de CFNC.',
    'hdr_essay': 'Escribe un ensayo universitario que llame la atención.',
    'hdr_apply': 'Cómo solicitar a la universidad paso a paso.',
    'hdr_aid': 'No dejes que el dinero te impida ir a la universidad.',
    'hdr_scholarships': '¡Encuentra dinero gratis para la universidad — sin devolución!',
    'hdr_residency': 'Califica para las tarifas de matrícula dentro del estado.',
    'hdr_postaccept': '¡Entraste! Esto es lo que debes hacer a continuación.',
    'hdr_campus': 'Qué esperar cuando llegues a la universidad.',
    'hdr_firstgen': 'Eres el pionero — aquí estamos para apoyarte.',
    // Common buttons
    'btn_visit_cfnc': 'Visitar CFNC.org',
    'btn_search': 'Buscar por nombre, ciudad o programa...',
    'btn_save': 'Guardar en Mi Lista',
    'btn_remove': 'Quitar de Mi Lista',
    'btn_visit': 'Visitar Sitio Web del Colegio',
    'btn_learn': 'Solicitar / Más Información',
    // First-gen
    'fg_title': '¡No Estás Solo/a! 💪',
    'fg_remember': 'Recuerda Esto 🌟',
  },
};

String t(BuildContext context, String key) {
  final lang = LangProvider.of(context).value;
  return _tr[lang]?[key] ?? _tr['en']![key] ?? key;
}

void main() => runApp(const CollegeReadyApp());

const navy = Color(0xFF4B9CD3);
const green = Color(0xFF13294B);
const greenPale = Color(0xFFE8F4FC);
const navyPale = Color(0xFFEAF4FB);
const borderColor = Color(0xFFB8D9EF);
const textGray = Color(0xFF5A7A8A);

class CollegeReadyApp extends StatefulWidget {
  const CollegeReadyApp({super.key});
  @override
  State<CollegeReadyApp> createState() => _CollegeReadyAppState();
}

class _CollegeReadyAppState extends State<CollegeReadyApp> {
  final _lang = LangNotifier();

  @override
  Widget build(BuildContext context) {
    return LangProvider(
      notifier: _lang,
      child: ValueListenableBuilder<String>(
        valueListenable: _lang,
        builder: (ctx, lang, _) => MaterialApp(
          title: 'The Right Click',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4B9CD3), primary: const Color(0xFF4B9CD3), secondary: green),
        useMaterial3: true,
      ),
          home: const MainNav(),
        ),
      ),
    );
  }
}

class MainNav extends StatefulWidget {
  const MainNav({super.key});
  @override
  State<MainNav> createState() => _MainNavState();
}

class _MainNavState extends State<MainNav> {
  int _index = 0;

  final _screens = [
    const HomeScreen(),
    const TimelineScreen(),
    const CollegeExplorerScreen(),
    const MyCollegeListScreen(),
    const ScholarshipQuizScreen(),
    const PreAppScreen(),
    const EssayScreen(),
    const ApplicationScreen(),
    const FinancialAidScreen(),
    const ScholarshipScreen(),
    const ResidencyScreen(),
    const PostAcceptanceScreen(),
    const CampusLifeScreen(),
    const FirstGenScreen(),
    const MajorExplorerScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: 80,
            child: SingleChildScrollView(
              child: IntrinsicHeight(
                child: NavigationRail(
                  selectedIndex: _index,
                  onDestinationSelected: (i) => setState(() => _index = i),
                  backgroundColor: navy,
                  selectedIconTheme: const IconThemeData(color: Color(0xFF13294B)),
                  unselectedIconTheme: const IconThemeData(color: Colors.white54),
                  selectedLabelTextStyle: const TextStyle(color: Color(0xFF13294B), fontWeight: FontWeight.bold, fontSize: 10),
                  unselectedLabelTextStyle: const TextStyle(color: Colors.white54, fontSize: 10),
                  labelType: NavigationRailLabelType.all,
                  leading: Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 8),
                    child: Column(children: [
                      // EN/ES Language Toggle
                      Builder(builder: (ctx) {
                        final ln = LangProvider.of(ctx);
                        return ValueListenableBuilder<String>(
                          valueListenable: ln,
                          builder: (_, lang, __) => Column(children: [
                            Text(lang == 'en' ? 'EN' : 'ES',
                              style: const TextStyle(color: Colors.white70, fontSize: 10, fontWeight: FontWeight.bold)),
                            Transform.scale(scale: 0.7,
                              child: Switch(
                                value: lang == 'es',
                                onChanged: (v) => ln.value = v ? 'es' : 'en',
                                activeColor: const Color(0xFF4B9CD3),
                                activeTrackColor: Colors.white24,
                                inactiveThumbColor: Colors.white,
                                inactiveTrackColor: Colors.white24,
                              )),
                          ]),
                        );
                      }),
                      const SizedBox(height: 4),
                      Container(
                      width: 56, height: 56,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A2E44),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white24, width: 1),
                        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 2))],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: ColorFiltered(
                            colorFilter: const ColorFilter.matrix([
                              -1, 0, 0, 0, 255,
                               0,-1, 0, 0, 255,
                               0, 0,-1, 0, 255,
                               0, 0, 0, 1,   0,
                            ]),
                            child: Image.asset('assets/images/kc_logo.png', fit: BoxFit.contain,
                              errorBuilder: (ctx, err, st) => const Center(child: Text('KC', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)))),
                          ),
                        ),
                      ),
                    ),
                    ]), // end leading Column
                  ),
                  destinations: _buildDestinations(context),
                ),
              ),
            ),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: _screens[_index]),
        ],
      ),
    );
  }

  List<NavigationRailDestination> _buildDestinations(BuildContext context) {
    final keys = ['nav_home','nav_timeline','nav_colleges','nav_mylist','nav_quiz','nav_preapp','nav_essay','nav_apply','nav_aid','nav_scholarships','nav_residency','nav_accepted','nav_campus','nav_firstgen','nav_major'];
    final icons = [Icons.home, Icons.calendar_month, Icons.school, Icons.bookmark, Icons.quiz, Icons.checklist, Icons.draw, Icons.edit_document, Icons.attach_money, Icons.star, Icons.assignment, Icons.check_circle, Icons.apartment, Icons.favorite, Icons.explore];
    return List.generate(keys.length, (i) => NavigationRailDestination(
      icon: Icon(icons[i]),
      label: Text(t(context, keys[i]), style: const TextStyle(fontSize: 9)),
    ));
  }
}

// ── SHARED WIDGETS ───────────────────────────────────────────────

class _Header extends StatelessWidget {
  final String title, subtitle;
  const _Header(this.title, this.subtitle);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).padding.top + 16, 20, 20),
      color: navy,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        Text(subtitle, style: const TextStyle(color: Colors.white70, fontSize: 13)),
        const SizedBox(height: 12),
        Container(width: 48, height: 4, decoration: BoxDecoration(color: green, borderRadius: BorderRadius.circular(2))),
      ]),
    );
  }
}

class _Card extends StatelessWidget {
  final Widget child; final Color? color;
  const _Card({required this.child, this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16), padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(color: color ?? Colors.white, borderRadius: BorderRadius.circular(14),
        border: Border.all(color: borderColor, width: 1.5),
        boxShadow: [BoxShadow(color: navy.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 2))]),
      child: child,
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final IconData icon; final String label;
  const _SectionHeader({required this.icon, required this.label});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, top: 4),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(color: navy, borderRadius: BorderRadius.circular(8)),
      child: Row(children: [
        Icon(icon, color: green, size: 18), const SizedBox(width: 8),
        Expanded(child: Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13))),
      ]),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon; final String text;
  const _InfoItem({required this.icon, required this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Icon(icon, color: green, size: 18), const SizedBox(width: 8),
        Expanded(child: Text(text, style: const TextStyle(color: Color(0xFF3D5A6E), fontSize: 13, height: 1.5))),
      ]),
    );
  }
}

class _CallBtn extends StatelessWidget {
  final String label; final VoidCallback onTap;
  const _CallBtn(this.label, this.onTap);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(color: green.withOpacity(0.1), borderRadius: BorderRadius.circular(8),
          border: Border.all(color: green.withOpacity(0.3))),
        child: Text(label, style: const TextStyle(color: green, fontWeight: FontWeight.w600, fontSize: 13)),
      ),
    );
  }
}

class _StepTile extends StatelessWidget {
  final int step; final String title, body; final String? btnLabel; final VoidCallback? onBtn;
  const _StepTile({required this.step, required this.title, required this.body, this.btnLabel, this.onBtn});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12), padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 1.5),
        boxShadow: [BoxShadow(color: navy.withOpacity(0.04), blurRadius: 6, offset: const Offset(0, 2))]),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(width: 34, height: 34, decoration: const BoxDecoration(color: navy, shape: BoxShape.circle),
          child: Center(child: Text('$step', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)))),
        const SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: const TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 6),
          Text(body, style: const TextStyle(color: Color(0xFF3D5A6E), fontSize: 13, height: 1.6)),
          if (btnLabel != null) ...[const SizedBox(height: 8), _CallBtn(btnLabel!, onBtn!)],
        ])),
      ]),
    );
  }
}

// ── SCHOLARSHIP MATCH QUIZ ───────────────────────────────────────

class ScholarshipQuizScreen extends StatefulWidget {
  const ScholarshipQuizScreen({super.key});
  @override
  State<ScholarshipQuizScreen> createState() => _ScholarshipQuizScreenState();
}

class _ScholarshipQuizScreenState extends State<ScholarshipQuizScreen> {
  int _step = 0;
  final Map<String, String> _answers = {};
  bool _showResults = false;

  final _questions = [
    _QuizQuestion(
      key: 'grade',
      question: 'What grade are you in?',
      icon: Icons.school,
      options: ['9th Grade', '10th Grade', '11th Grade', '12th Grade'],
    ),
    _QuizQuestion(
      key: 'gpa',
      question: 'What is your GPA range?',
      icon: Icons.grade,
      options: ['Below 2.0', '2.0 - 2.5', '2.6 - 3.0', '3.1 - 3.5', '3.6 - 4.0+'],
    ),
    _QuizQuestion(
      key: 'interest',
      question: 'What are your interests or intended major?',
      icon: Icons.lightbulb,
      options: ['STEM / Engineering', 'Business / Finance', 'Education / Teaching', 'Health / Nursing', 'Arts / Humanities', 'Public Service / Law', 'Trades / Technical', 'Undecided'],
    ),
    _QuizQuestion(
      key: 'need',
      question: 'Do you have financial need?',
      icon: Icons.attach_money,
      options: ['Yes — my family has significant financial need', 'Some — moderate financial need', 'No — I am looking for merit-based scholarships'],
    ),
    _QuizQuestion(
      key: 'background',
      question: 'Do any of these apply to you? (Choose the best fit)',
      icon: Icons.people,
      options: ['American Indian / Native American', 'African American / Black', 'Hispanic / Latino', 'Military family (parent serves/served)', 'First-generation college student', 'Student athlete', 'None of the above'],
    ),
  ];

  List<_ScholarshipMatch> get _matches {
    final gpa = _answers['gpa'] ?? '';
    final interest = _answers['interest'] ?? '';
    final need = _answers['need'] ?? '';
    final background = _answers['background'] ?? '';
    final grade = _answers['grade'] ?? '';

    final all = <_ScholarshipMatch>[
      // Always relevant
      _ScholarshipMatch(name: 'CFNC.org Scholarship Search', amount: 'Varies', reason: 'NC\'s #1 free scholarship search tool — personalized to you', url: 'https://www.cfnc.org', tags: ['all']),
      _ScholarshipMatch(name: 'Fastweb.com', amount: 'Varies', reason: 'Free national scholarship database — thousands of opportunities', url: 'https://www.fastweb.com', tags: ['all']),
      _ScholarshipMatch(name: 'Going Merry', amount: 'Varies', reason: 'One application, many scholarships — great for busy seniors', url: 'https://www.goingmerry.com', tags: ['all']),

      // GPA based
      _ScholarshipMatch(name: 'Park Scholarship — NC State', amount: '\$80,000+', reason: 'For high-achieving students with strong leadership', url: 'https://park.ncsu.edu', tags: ['gpa_high', 'stem', 'business']),
      _ScholarshipMatch(name: 'Morehead-Cain — UNC Chapel Hill', amount: 'Full Scholarship', reason: 'Top merit scholarship in NC for exceptional students', url: 'https://www.moreheadcain.org', tags: ['gpa_high']),
      _ScholarshipMatch(name: 'Coca-Cola Scholars Program', amount: '\$10,000-\$20,000', reason: 'Leadership and community service focused — GPA 3.0+', url: 'https://www.coca-colascholarsfoundation.org', tags: ['gpa_mid', 'gpa_high']),

      // Need based
      _ScholarshipMatch(name: 'NC Need-Based Grant', amount: 'Varies', reason: 'For NC residents with demonstrated financial need', url: 'https://www.cfnc.org', tags: ['need_yes', 'need_some']),
      _ScholarshipMatch(name: 'Federal Pell Grant', amount: 'Up to \$7,395/yr', reason: 'Federal grant for students with significant financial need — apply via FAFSA', url: 'https://studentaid.gov', tags: ['need_yes']),
      _ScholarshipMatch(name: 'Jack Kent Cooke Foundation', amount: 'Varies', reason: 'For high-achieving students with significant financial need', url: 'https://www.jkcf.org', tags: ['need_yes', 'gpa_high']),
      _ScholarshipMatch(name: 'Golden LEAF Foundation Scholarship', amount: '\$12,000', reason: 'Priority for NC students from families affected by tobacco industry decline', url: 'https://www.cfnc.org/goldenleaf', tags: ['need_yes', 'need_some']),
      _ScholarshipMatch(name: 'Ronald McDonald House Charities', amount: 'Varies', reason: 'For students with financial need, GPA 2.7+', url: 'https://www.rmhc.org', tags: ['need_yes', 'need_some']),

      // STEM
      _ScholarshipMatch(name: 'NC Space Grant Scholarship', amount: '\$1,000', reason: 'For students pursuing STEM degrees in NC', url: 'https://ncspacegrant.ncsu.edu', tags: ['stem']),
      _ScholarshipMatch(name: 'NC State Centennial Scholarship (Textiles)', amount: '\$55,000', reason: 'For engineering, chemistry, and textile-related fields', url: 'https://textiles.ncsu.edu', tags: ['stem']),
      _ScholarshipMatch(name: 'AES Engineers Scholarship', amount: '\$500', reason: 'For students interested in engineering — essay required', url: 'https://www.aesengineers.com/scholarships.htm', tags: ['stem']),

      // Education
      _ScholarshipMatch(name: 'Prospective Teacher Scholarship Loan', amount: '\$2,500-\$4,000/yr', reason: 'For students committed to teaching in NC public schools', url: 'https://www.cfnc.org', tags: ['education']),
      _ScholarshipMatch(name: 'NC Association of Educational Office Professionals', amount: '\$1,200', reason: 'For students pursuing education-related fields', url: 'https://www.cfnc.org', tags: ['education']),

      // Health / Nursing
      _ScholarshipMatch(name: 'Forgivable Education Loans for Service (FELS)', amount: 'Varies', reason: 'For students entering health and other shortage professions in NC', url: 'https://www.cfnc.org/FELS', tags: ['health']),

      // Business / Finance
      _ScholarshipMatch(name: 'NC Society of Accountants Scholarship', amount: '\$600', reason: 'For students entering the accounting profession', url: 'https://www.cfnc.org', tags: ['business']),

      // Public Service / Law
      _ScholarshipMatch(name: 'U.S. Senate Youth Scholarship', amount: '\$5,000', reason: 'For students interested in history, political science, or public service', url: 'https://www.ussenateyouth.org', tags: ['public_service']),
      _ScholarshipMatch(name: 'NC Bar Association Law Enforcement Officers Scholarship', amount: '\$250-\$4,000', reason: 'For children of NC law enforcement officers', url: 'https://www.cfnc.org', tags: ['public_service']),

      // Native American
      _ScholarshipMatch(name: 'Lumbee Tribe Education Scholarships', amount: 'Varies', reason: 'For enrolled members of the Lumbee Tribe of NC', url: 'https://www.lumbeetribe.com/education', tags: ['native']),
      _ScholarshipMatch(name: 'NC American Indian Fund Scholarship', amount: 'Up to \$1,000/yr', reason: 'For NC residents enrolled in a state or federally recognized tribe', url: 'https://www.trianglecf.org', tags: ['native']),
      _ScholarshipMatch(name: 'United Tribes of NC Scholarship', amount: 'Varies', reason: 'For American Indian students in NC enrolling full-time', url: 'https://www.cfnc.org', tags: ['native']),

      // African American / Black
      _ScholarshipMatch(name: 'United Negro College Fund (UNCF)', amount: 'Varies', reason: 'Largest provider of scholarships for Black students in the US', url: 'https://www.uncf.org', tags: ['black']),
      _ScholarshipMatch(name: 'Ron Brown Scholar Program', amount: 'Varies', reason: 'For academically accomplished African American students', url: 'https://www.ronbrown.org', tags: ['black']),
      _ScholarshipMatch(name: 'HBCU Scholarships via CFNC', amount: 'Varies', reason: 'NC HBCUs offer strong institutional aid — explore via CFNC', url: 'https://www.cfnc.org', tags: ['black']),

      // Hispanic
      _ScholarshipMatch(name: 'Hispanic College Fund', amount: 'Varies', reason: 'Scholarships specifically for Hispanic/Latino students', url: 'https://hispanicfund.org', tags: ['hispanic']),

      // Military
      _ScholarshipMatch(name: 'Navy ROTC Scholarship', amount: 'Up to \$180,000', reason: 'Full tuition + fees for students who commit to naval service', url: 'https://www.nrotc.navy.mil', tags: ['military']),
      _ScholarshipMatch(name: 'Army ROTC Scholarships', amount: 'Varies', reason: 'For students interested in serving in the US Army', url: 'https://www.goarmy.com/rotc/scholarships.html', tags: ['military']),
      _ScholarshipMatch(name: 'Marine Corps Scholarship Foundation', amount: 'Varies', reason: 'For sons and daughters of Marines and former Marines', url: 'https://www.mcsf.org', tags: ['military']),
      _ScholarshipMatch(name: 'Corvias Foundation Scholarship', amount: 'Varies', reason: 'For seniors with a parent on active duty at select military bases', url: 'https://www.corviasfoundation.org', tags: ['military']),

      // First gen
      _ScholarshipMatch(name: 'QuestBridge National College Match', amount: 'Full Scholarship', reason: 'For first-gen, low-income students applying to top colleges', url: 'https://www.questbridge.org', tags: ['firstgen', 'need_yes']),
      _ScholarshipMatch(name: 'Bold.org Scholarships', amount: 'Varies', reason: 'Many scholarships specifically for first-generation students', url: 'https://bold.org/scholarships', tags: ['firstgen', 'all']),

      // Athletes
      _ScholarshipMatch(name: 'Foot Locker Scholar Athletes Program', amount: '\$20,000', reason: 'For student athletes — all sports eligible, GPA 3.0+', url: 'https://www.dosomething.org/footlocker', tags: ['athlete']),
      _ScholarshipMatch(name: 'Big Sun Scholarship', amount: '\$500', reason: 'For all athletes — all sports eligible', url: 'https://www.bigsunathletics.com', tags: ['athlete']),

      // 11th grade specific
      _ScholarshipMatch(name: 'Davidson College Belk Scholarship', amount: 'Full + International Stipend', reason: 'Apply in 11th grade — exceptional leadership and intellect required', url: 'https://www.davidson.edu', tags: ['grade_11', 'gpa_high']),
    ];

    // Score each scholarship
    final scored = <_ScholarshipMatch>[];
    for (final s in all) {
      int score = 0;
      if (s.tags.contains('all')) score += 3;

      // Grade
      if (grade == '11th Grade' && s.tags.contains('grade_11')) score += 2;

      // GPA
      final highGpa = ['3.6 - 4.0+', '3.1 - 3.5'];
      final midGpa = ['2.6 - 3.0', '2.0 - 2.5'];
      if (highGpa.contains(gpa) && s.tags.contains('gpa_high')) score += 3;
      if (midGpa.contains(gpa) && s.tags.contains('gpa_mid')) score += 2;

      // Interest
      if (interest.contains('STEM') && s.tags.contains('stem')) score += 3;
      if (interest.contains('Business') && s.tags.contains('business')) score += 3;
      if (interest.contains('Education') && s.tags.contains('education')) score += 3;
      if (interest.contains('Health') && s.tags.contains('health')) score += 3;
      if (interest.contains('Public Service') && s.tags.contains('public_service')) score += 3;

      // Need
      if (need.contains('significant') && s.tags.contains('need_yes')) score += 3;
      if (need.contains('moderate') && (s.tags.contains('need_yes') || s.tags.contains('need_some'))) score += 2;
      if (need.contains('merit') && s.tags.contains('gpa_high')) score += 2;

      // Background
      if (background.contains('American Indian') && s.tags.contains('native')) score += 4;
      if (background.contains('African American') && s.tags.contains('black')) score += 4;
      if (background.contains('Hispanic') && s.tags.contains('hispanic')) score += 4;
      if (background.contains('Military') && s.tags.contains('military')) score += 4;
      if (background.contains('First-generation') && s.tags.contains('firstgen')) score += 4;
      if (background.contains('athlete') && s.tags.contains('athlete')) score += 4;

      if (score > 0) scored.add(s.copyWith(score: score));
    }

    scored.sort((a, b) => b.score.compareTo(a.score));
    return scored.take(12).toList();
  }

  @override
  Widget build(BuildContext context) {
    if (_showResults) return _buildResults();
    if (_step >= _questions.length) {
      WidgetsBinding.instance.addPostFrameCallback((_) => setState(() => _showResults = true));
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return _buildQuestion();
  }

  Widget _buildQuestion() {
    final q = _questions[_step];
    final progress = (_step + 1) / _questions.length;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Builder(builder: (ctx) => _Header(t(ctx,'nav_timeline')=='Timeline' ? 'Scholarship Match Quiz' : 'Quiz de Becas', t(ctx,'nav_timeline')=='Timeline' ? 'Answer 5 questions to find your best matches.' : 'Responde 5 preguntas para encontrar tus mejores becas.')),
        Expanded(child: ListView(padding: const EdgeInsets.all(20), children: [

          // Progress
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Question ${_step + 1} of ${_questions.length}', style: const TextStyle(color: textGray, fontSize: 13)),
            Text('${(progress * 100).round()}% complete', style: const TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 13)),
          ]),
          const SizedBox(height: 8),
          ClipRRect(borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(value: progress, minHeight: 8,
              backgroundColor: const Color(0xFFE0E0E0),
              valueColor: const AlwaysStoppedAnimation<Color>(navy))),
          const SizedBox(height: 28),

          // Question card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: navy, borderRadius: BorderRadius.circular(16)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Icon(q.icon, color: Colors.white70, size: 28),
              const SizedBox(height: 12),
              Text(q.question, style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold, height: 1.4)),
            ]),
          ),
          const SizedBox(height: 20),

          // Options
          ...q.options.map((opt) {
            final selected = _answers[q.key] == opt;
            return GestureDetector(
              onTap: () {
                setState(() => _answers[q.key] = opt);
                Future.delayed(const Duration(milliseconds: 300), () {
                  setState(() {
                    if (_step < _questions.length - 1) {
                      _step++;
                    } else {
                      _showResults = true;
                    }
                  });
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: selected ? navy : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: selected ? navy : borderColor, width: selected ? 2 : 1.5),
                  boxShadow: [BoxShadow(color: navy.withOpacity(0.05), blurRadius: 6, offset: const Offset(0, 2))],
                ),
                child: Row(children: [
                  Container(width: 24, height: 24,
                    decoration: BoxDecoration(
                      color: selected ? Colors.white : navyPale,
                      shape: BoxShape.circle,
                      border: Border.all(color: selected ? Colors.white : borderColor),
                    ),
                    child: selected ? const Icon(Icons.check, color: navy, size: 14) : null),
                  const SizedBox(width: 12),
                  Expanded(child: Text(opt, style: TextStyle(
                    color: selected ? Colors.white : const Color(0xFF3D5A6E),
                    fontSize: 14, fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                  ))),
                ]),
              ),
            );
          }),

          if (_step > 0) ...[
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () => setState(() { _step--; _showResults = false; }),
              child: const Center(child: Text('← Go Back', style: TextStyle(color: textGray, fontSize: 13))),
            ),
          ],
          const SizedBox(height: 30),
        ])),
      ]),
    );
  }

  Widget _buildResults() {
    final matches = _matches;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Builder(builder: (ctx) => _Header(t(ctx,'nav_timeline')=='Timeline' ? 'Your Scholarship Matches' : 'Tus Becas', t(ctx,'nav_timeline')=='Timeline' ? 'Based on your answers — apply to all that fit!' : 'Según tus respuestas — ¡solicita todas las que apliquen!')),
        Expanded(child: ListView(padding: const EdgeInsets.all(16), children: [

          Container(
            margin: const EdgeInsets.only(bottom: 16), padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(color: navy, borderRadius: BorderRadius.circular(14)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('🎯 Your Top Matches', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text('We found ${matches.length} scholarships that match your profile. Apply to as many as possible — every dollar counts!',
                style: const TextStyle(color: Colors.white70, fontSize: 13, height: 1.5)),
            ]),
          ),

          // Summary of answers
          _Card(color: navyPale, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Your Profile', style: TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(height: 10),
            ..._answers.entries.map((e) {
              final labels = {'grade': 'Grade', 'gpa': 'GPA', 'interest': 'Interest', 'need': 'Financial Need', 'background': 'Background'};
              return Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(children: [
                  Text('${labels[e.key] ?? e.key}: ', style: const TextStyle(color: textGray, fontSize: 12)),
                  Expanded(child: Text(e.value, style: const TextStyle(color: green, fontWeight: FontWeight.w600, fontSize: 12))),
                ]),
              );
            }),
          ])),

          ...matches.map((m) => _MatchCard(match: m)),

          const SizedBox(height: 12),
          GestureDetector(
            onTap: () => setState(() { _step = 0; _answers.clear(); _showResults = false; }),
            child: Container(
              width: double.infinity, padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(color: navyPale, borderRadius: BorderRadius.circular(12), border: Border.all(color: borderColor)),
              child: const Center(child: Text('Retake Quiz', style: TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 14))),
            ),
          ),
          const SizedBox(height: 30),
        ])),
      ]),
    );
  }
}

class _QuizQuestion {
  final String key, question;
  final IconData icon;
  final List<String> options;
  const _QuizQuestion({required this.key, required this.question, required this.icon, required this.options});
}

class _ScholarshipMatch {
  final String name, amount, reason, url;
  final List<String> tags;
  final int score;
  const _ScholarshipMatch({required this.name, required this.amount, required this.reason, required this.url, required this.tags, this.score = 0});
  _ScholarshipMatch copyWith({int? score}) => _ScholarshipMatch(name: name, amount: amount, reason: reason, url: url, tags: tags, score: score ?? this.score);
}

class _MatchCard extends StatelessWidget {
  final _ScholarshipMatch match;
  const _MatchCard({required this.match});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12), padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 1.5),
        boxShadow: [BoxShadow(color: navy.withOpacity(0.04), blurRadius: 6, offset: const Offset(0, 2))]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(match.name, style: const TextStyle(color: green, fontWeight: FontWeight.bold, fontSize: 14)),
        const SizedBox(height: 4),
        Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: BoxDecoration(color: const Color(0xFFE8F5E9), borderRadius: BorderRadius.circular(6)),
          child: Text(match.amount, style: const TextStyle(color: Color(0xFF2E7D32), fontWeight: FontWeight.w600, fontSize: 12))),
        const SizedBox(height: 8),
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Icon(Icons.check_circle, color: navy, size: 16),
          const SizedBox(width: 6),
          Expanded(child: Text(match.reason, style: const TextStyle(color: Color(0xFF3D5A6E), fontSize: 12, height: 1.4))),
        ]),
        if (match.url.isNotEmpty) ...[
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () => _openUrl(match.url),
            child: Container(width: double.infinity, padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(color: navy, borderRadius: BorderRadius.circular(8)),
              child: const Center(child: Text('Apply / Learn More', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13)))),
          ),
        ],
      ]),
    );
  }
}

// ── FIRST-GEN SCREEN ─────────────────────────────────────────────

class FirstGenScreen extends StatelessWidget {
  const FirstGenScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Builder(builder: (ctx) => _Header(t(ctx,'nav_firstgen') == 'First-Gen' ? 'First-Gen Student Hub' : 'Centro Estudiantes 1ra-Gen', t(ctx,'hdr_firstgen'))),
        Expanded(child: ListView(padding: const EdgeInsets.all(16), children: [

          // Hero
          Container(
            margin: const EdgeInsets.only(bottom: 16), padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(color: navy, borderRadius: BorderRadius.circular(14)),
            child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('You Are Not Alone 💪', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('Being the first in your family to go to college is something to be proud of. It\'s not easy, but millions of students have done it — and so can you. This section is made just for you.',
                style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.5)),
            ]),
          ),

          // What is first gen
          _Card(child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('What Does "First-Generation" Mean?', style: TextStyle(color: navy, fontSize: 15, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('You are a first-generation college student if neither of your parents completed a 4-year college degree. This includes students whose parents attended some college but did not graduate.',
              style: TextStyle(color: Color(0xFF3D5A6E), fontSize: 13, height: 1.6)),
            SizedBox(height: 10),
            Text('Did you know?', style: TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 13)),
            SizedBox(height: 4),
            Text('About 1 in 3 college students in the US is a first-generation college student. You are part of a huge and growing community!',
              style: TextStyle(color: Color(0xFF3D5A6E), fontSize: 13, height: 1.5)),
          ])),

          // Unique challenges
          const _SectionHeader(icon: Icons.lightbulb, label: 'Challenges First-Gen Students Face'),
          _Card(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _InfoItem(icon: Icons.info_outline, text: 'Not knowing the "unwritten rules" of college — like how to talk to professors or what office hours are'),
            _InfoItem(icon: Icons.info_outline, text: 'Feeling like you don\'t belong or that others know more than you (this is called "imposter syndrome" — it\'s very common)'),
            _InfoItem(icon: Icons.info_outline, text: 'Having to explain college processes to your family — they want to help but may not know how'),
            _InfoItem(icon: Icons.info_outline, text: 'Balancing work, family responsibilities, and school'),
            _InfoItem(icon: Icons.info_outline, text: 'Financial stress — navigating FAFSA, loans, and aid without guidance'),
            _InfoItem(icon: Icons.info_outline, text: 'Feeling guilty for leaving home or "moving on"'),
          ])),

          // Strengths
          const _SectionHeader(icon: Icons.star, label: 'Your Strengths as a First-Gen Student'),
          _Card(color: navyPale, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _InfoItem(icon: Icons.check_circle_outline, text: 'You are resilient — you\'ve already overcome obstacles that many students haven\'t'),
            _InfoItem(icon: Icons.check_circle_outline, text: 'You are self-motivated — no one handed you a roadmap, but you\'re finding your way'),
            _InfoItem(icon: Icons.check_circle_outline, text: 'You bring a unique perspective that enriches your campus community'),
            _InfoItem(icon: Icons.check_circle_outline, text: 'You are paving the way for younger siblings, cousins, and future generations'),
            _InfoItem(icon: Icons.check_circle_outline, text: 'Many scholarships and programs specifically support first-gen students'),
          ])),

          // College vocabulary glossary
          const _SectionHeader(icon: Icons.menu_book, label: 'College Vocabulary Glossary'),
          _Card(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Terms you\'ll hear — explained in plain language:', style: TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 13)),
            const SizedBox(height: 12),
            _GlossaryItem('FAFSA', 'Free Application for Federal Student Aid — the form you fill out to apply for financial aid. It\'s free and you must complete it every year.'),
            _GlossaryItem('Financial Aid Award Letter', 'A letter from the college telling you how much aid (grants, loans, work-study) they are offering you.'),
            _GlossaryItem('SAI / EFC', 'Student Aid Index — a number that estimates how much your family can contribute. Lower = more aid.'),
            _GlossaryItem('COA', 'Cost of Attendance — the total estimated cost of one year of college including tuition, housing, food, books, and personal expenses.'),
            _GlossaryItem('Grant', 'Free money for college that you do NOT have to pay back. Always take grants over loans.'),
            _GlossaryItem('Subsidized Loan', 'A student loan where the government pays the interest while you\'re in school. Better than unsubsidized.'),
            _GlossaryItem('Unsubsidized Loan', 'A student loan where interest starts building immediately. You\'ll owe more than you borrowed.'),
            _GlossaryItem('Work-Study', 'A program that gives you a part-time on-campus job to help pay for school.'),
            _GlossaryItem('RCN', 'Residency Certification Number — a number you get from NCResidency.org that proves you qualify for NC in-state tuition.'),
            _GlossaryItem('Registrar', 'The office that manages official academic records, transcripts, and enrollment.'),
            _GlossaryItem('Bursar', 'The office that handles tuition payments and billing.'),
            _GlossaryItem('Syllabus', 'A document the professor gives you on day one that outlines everything about the course — read it carefully!'),
            _GlossaryItem('Office Hours', 'Times when your professor is available to meet with you one-on-one. Always go — it helps your grade and your relationship with the professor.'),
            _GlossaryItem('Credit Hour', 'A unit measuring how much work a class involves. Full-time students take 12+ credit hours per semester.'),
            _GlossaryItem('GPA', 'Grade Point Average — a 4.0 scale rating of your academic performance. 4.0 = all A\'s.'),
            _GlossaryItem('Dean\'s List', 'An academic honor for students who earn a high GPA each semester (usually 3.5+).'),
            _GlossaryItem('Major', 'Your primary area of study — like Business, Nursing, or Engineering.'),
            _GlossaryItem('Minor', 'A secondary area of study that requires fewer courses than a major.'),
            _GlossaryItem('Advisor', 'A college staff member who helps you choose classes and stay on track for graduation. Meet with yours every semester!'),
            _GlossaryItem('Orientation', 'A program at the start of college that introduces you to campus, resources, and other students. Attend — it\'s worth it!'),
          ])),

          // What to expect
          const _SectionHeader(icon: Icons.map, label: 'What to Expect Your First Year'),
          _Card(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Nobody tells you this stuff — but we will:', style: TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 13)),
            const SizedBox(height: 10),
            _InfoItem(icon: Icons.arrow_forward, text: 'College is harder than high school — but you can handle it. Get help early, not when you\'re failing.'),
            _InfoItem(icon: Icons.arrow_forward, text: 'You may feel homesick, especially in the first few weeks. This is normal and it gets better.'),
            _InfoItem(icon: Icons.arrow_forward, text: 'Your first test grade might be lower than expected. Don\'t panic — adjust your study strategy.'),
            _InfoItem(icon: Icons.arrow_forward, text: 'Making friends takes time. Join at least one club or organization — that\'s where friendships happen.'),
            _InfoItem(icon: Icons.arrow_forward, text: 'Free food events are real — follow your campus social media to find them.'),
            _InfoItem(icon: Icons.arrow_forward, text: 'The library is your best friend. Learn where it is and how to use academic databases.'),
            _InfoItem(icon: Icons.arrow_forward, text: 'Email your professors professionally. Start with "Dear Professor [Name]" — not "Hey."'),
            _InfoItem(icon: Icons.arrow_forward, text: 'If you\'re struggling, tell someone — your advisor, a counselor, or a professor. Asking for help is smart, not weak.'),
          ])),

          // Guide for parents
          const _SectionHeader(icon: Icons.family_restroom, label: 'A Guide for Your Family'),
          _Card(color: navyPale, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Share this with your parents or guardians:', style: TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 13)),
            const SizedBox(height: 10),
            const Text('Your child is doing something amazing — and your support matters more than you know. Here\'s how you can help even if you didn\'t go to college yourself:',
              style: TextStyle(color: Color(0xFF3D5A6E), fontSize: 13, height: 1.6)),
            const SizedBox(height: 10),
            _InfoItem(icon: Icons.favorite, text: 'Encourage them — tell them you\'re proud of them, even when things are hard'),
            _InfoItem(icon: Icons.favorite, text: 'Help them complete the FAFSA — income information from tax returns is needed'),
            _InfoItem(icon: Icons.favorite, text: 'Understand they may be busier than before — studying takes real time'),
            _InfoItem(icon: Icons.favorite, text: 'Be patient if they seem stressed around exams or deadlines'),
            _InfoItem(icon: Icons.favorite, text: 'Know that asking for help at college is a sign of strength, not weakness'),
            _InfoItem(icon: Icons.favorite, text: 'Attend Family Weekend if the college offers it — your child will love seeing you on campus'),
          ])),

          // Imposter syndrome
          const _SectionHeader(icon: Icons.psychology, label: 'Dealing with Imposter Syndrome'),
          _Card(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('What is imposter syndrome?', style: TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 13)),
            const SizedBox(height: 6),
            const Text('It\'s the feeling that you don\'t really belong in college — that you\'re not as smart as everyone else and that you\'ll be "found out" as a fraud. It\'s incredibly common among first-gen students, and even successful adults feel it.',
              style: TextStyle(color: Color(0xFF3D5A6E), fontSize: 13, height: 1.6)),
            const SizedBox(height: 12),
            const Text('How to fight it:', style: TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 13)),
            const SizedBox(height: 8),
            _InfoItem(icon: Icons.check_circle_outline, text: 'Remember: you earned your spot. Colleges don\'t admit students by mistake.'),
            _InfoItem(icon: Icons.check_circle_outline, text: 'Talk about it — find other first-gen students who feel the same way'),
            _InfoItem(icon: Icons.check_circle_outline, text: 'Celebrate small wins — finishing a paper, acing a quiz, making a new friend'),
            _InfoItem(icon: Icons.check_circle_outline, text: 'Visit campus counseling — they are trained to help with exactly this'),
            _InfoItem(icon: Icons.check_circle_outline, text: 'Write down 3 things you\'re proud of every week'),
          ])),

          // Resources
          const _SectionHeader(icon: Icons.language, label: 'First-Gen Resources'),
          _Card(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _CallBtn('QuestBridge — Full Scholarships for First-Gen Students', () => _openUrl('https://www.questbridge.org')),
            _CallBtn('College Advising Corps — Free College Advising', () => _openUrl('https://www.advisingcorps.org')),
            _CallBtn('First Generation Foundation', () => _openUrl('https://www.firstgenerationfoundation.org')),
            _CallBtn('CFNC.org — NC College Planning', () => _openUrl('https://www.cfnc.org')),
            _CallBtn('Federal Student Aid — studentaid.gov', () => _openUrl('https://studentaid.gov')),
            _CallBtn('I\'m First — First-Gen Student Community', () => _openUrl('https://www.imfirst.org')),
          ])),

          // Mindset
          Container(
            margin: const EdgeInsets.only(bottom: 30), padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(color: greenPale, borderRadius: BorderRadius.circular(14),
              border: const Border(left: BorderSide(color: green, width: 4))),
            child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Remember This 🌟', style: TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 15)),
              SizedBox(height: 10),
              Text('You are not behind. You are not less than. You are not an imposter.\n\nYou are a trailblazer.\n\nEvery step you take toward college is a step that will inspire someone who comes after you — a sibling, a cousin, a neighbor, a child you haven\'t met yet.\n\nYou\'ve got this.',
                style: TextStyle(color: Color(0xFF3D5A6E), fontSize: 13, height: 1.8)),
            ]),
          ),

        ])),
      ]),
    );
  }
}

Widget _GlossaryItem(String term, String definition) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10), padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(color: navyPale, borderRadius: BorderRadius.circular(8)),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(term, style: const TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 13)),
      const SizedBox(height: 4),
      Text(definition, style: const TextStyle(color: Color(0xFF3D5A6E), fontSize: 12, height: 1.5)),
    ]),
  );
}

// ── COLLEGE LIST SERVICE ─────────────────────────────────────────

class CollegeListService extends ChangeNotifier {
  static final CollegeListService _instance = CollegeListService._internal();
  factory CollegeListService() => _instance;
  CollegeListService._internal();

  // Map of college name -> status
  final Map<String, String> _saved = {};

  Map<String, String> get saved => Map.unmodifiable(_saved);

  bool isSaved(String name) => _saved.containsKey(name);
  String? getStatus(String name) => _saved[name];

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getStringList('mylist_keys') ?? [];
    for (final k in keys) {
      final v = prefs.getString('mylist_$k');
      if (v != null) _saved[k] = v;
    }
    notifyListeners();
  }

  Future<void> addCollege(String name) async {
    _saved[name] = 'Interested';
    await _persist();
    notifyListeners();
  }

  Future<void> removeCollege(String name) async {
    _saved.remove(name);
    await _persist();
    notifyListeners();
  }

  Future<void> updateStatus(String name, String status) async {
    _saved[name] = status;
    await _persist();
    notifyListeners();
  }

  Future<void> _persist() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('mylist_keys', _saved.keys.toList());
    for (final entry in _saved.entries) {
      await prefs.setString('mylist_${entry.key}', entry.value);
    }
  }
}

// ── MY COLLEGE LIST SCREEN ───────────────────────────────────────

class MyCollegeListScreen extends StatefulWidget {
  const MyCollegeListScreen({super.key});
  @override
  State<MyCollegeListScreen> createState() => _MyCollegeListScreenState();
}

class _MyCollegeListScreenState extends State<MyCollegeListScreen> {
  final _service = CollegeListService();
  final _statuses = ['Interested', 'Applying', 'Applied', 'Accepted', 'Enrolled'];

  final _statusColors = {
    'Interested': Color(0xFF4B9CD3),
    'Applying': Color(0xFF6B3A8F),
    'Applied': Color(0xFFE07B20),
    'Accepted': Color(0xFF2E7D32),
    'Enrolled': Color(0xFF13294B),
  };

  @override
  void initState() {
    super.initState();
    _service.load().then((_) => setState(() {}));
    _service.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _service.removeListener(() => setState(() {}));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final saved = _service.saved;
    final byStatus = <String, List<String>>{};
    for (final s in _statuses) byStatus[s] = [];
    for (final entry in saved.entries) {
      byStatus[entry.value]?.add(entry.key);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Builder(builder: (ctx) => _Header(t(ctx,'nav_timeline')=='Timeline' ? 'My College List' : 'Mi Lista de Colegios', t(ctx,'nav_timeline')=='Timeline' ? 'Track your applications in one place.' : 'Rastrea tus solicitudes en un solo lugar.')),
        Expanded(child: saved.isEmpty ? _buildEmpty(context) : ListView(padding: const EdgeInsets.all(16), children: [

          // Summary stats row
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: navy, borderRadius: BorderRadius.circular(14)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Your Application Dashboard', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
              const SizedBox(height: 12),
              Row(children: _statuses.map((s) => Expanded(child: Column(children: [
                Text('${byStatus[s]!.length}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                const SizedBox(height: 2),
                Text(s, style: const TextStyle(color: Colors.white60, fontSize: 9), textAlign: TextAlign.center),
              ]))).toList()),
            ]),
          ),

          // Tip card
          _Card(color: navyPale, child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Icon(Icons.tips_and_updates, color: navy, size: 18),
            const SizedBox(width: 8),
            const Expanded(child: Text('Aim for 8-12 colleges: 2-3 reach schools, 4-5 target schools, and 2-3 safety schools. Include at least one community college as a backup.',
              style: TextStyle(color: Color(0xFF3D5A6E), fontSize: 12, height: 1.5))),
          ])),

          // Colleges by status
          ..._statuses.expand((status) {
            final colleges = byStatus[status]!;
            if (colleges.isEmpty) return <Widget>[];
            return [
              Container(
                margin: const EdgeInsets.only(bottom: 10, top: 4),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(color: _statusColors[status]!, borderRadius: BorderRadius.circular(8)),
                child: Row(children: [
                  Text(status, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(10)),
                    child: Text('${colleges.length}', style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
                  ),
                ]),
              ),
              ...colleges.map((name) => _SavedCollegeCard(
                name: name,
                status: status,
                statuses: _statuses,
                statusColors: _statusColors,
                onStatusChange: (newStatus) => _service.updateStatus(name, newStatus),
                onRemove: () => _service.removeCollege(name),
              )),
            ];
          }),

          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              final nav = context.findAncestorStateOfType<_MainNavState>();
              nav?.setState(() => nav._index = 2);
            },
            child: Container(
              width: double.infinity, padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(color: navyPale, borderRadius: BorderRadius.circular(12), border: Border.all(color: borderColor)),
              child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(Icons.search, color: navy, size: 18),
                SizedBox(width: 8),
                Text('Browse NC College Explorer', style: TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 14)),
              ]),
            ),
          ),
          const SizedBox(height: 30),
        ])),
      ]),
    );
  }

  Widget _buildEmpty(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(width: 80, height: 80,
            decoration: BoxDecoration(color: navyPale, borderRadius: BorderRadius.circular(20)),
            child: const Icon(Icons.bookmark_border, color: navy, size: 40)),
          const SizedBox(height: 20),
          const Text('Your college list is empty', style: TextStyle(color: green, fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 8),
          const Text('Browse the NC College Explorer and tap "Save to My List" on colleges that interest you.',
            style: TextStyle(color: textGray, fontSize: 13, height: 1.6), textAlign: TextAlign.center),
          const SizedBox(height: 24),
          GestureDetector(
            onTap: () {
              final nav = context.findAncestorStateOfType<_MainNavState>();
              nav?.setState(() => nav._index = 2);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(color: navy, borderRadius: BorderRadius.circular(20)),
              child: const Text('Go to College Explorer', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14)),
            ),
          ),
        ]),
      ),
    );
  }
}

class _SavedCollegeCard extends StatelessWidget {
  final String name, status;
  final List<String> statuses;
  final Map<String, Color> statusColors;
  final Function(String) onStatusChange;
  final VoidCallback onRemove;

  const _SavedCollegeCard({
    required this.name, required this.status, required this.statuses,
    required this.statusColors, required this.onStatusChange, required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10), padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 1.5),
        boxShadow: [BoxShadow(color: navy.withOpacity(0.04), blurRadius: 6, offset: const Offset(0, 2))]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Expanded(child: Text(name, style: const TextStyle(color: green, fontWeight: FontWeight.bold, fontSize: 14))),
          GestureDetector(
            onTap: onRemove,
            child: Container(padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(color: Colors.red.shade50, borderRadius: BorderRadius.circular(6)),
              child: Icon(Icons.close, color: Colors.red.shade400, size: 16)),
          ),
        ]),
        const SizedBox(height: 10),
        const Text('Update Status:', style: TextStyle(color: textGray, fontSize: 11)),
        const SizedBox(height: 6),
        Wrap(spacing: 6, runSpacing: 6, children: statuses.map((s) {
          final isSelected = s == status;
          return GestureDetector(
            onTap: () => onStatusChange(s),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: isSelected ? statusColors[s]! : Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: isSelected ? statusColors[s]! : borderColor, width: 1.5),
              ),
              child: Text(s, style: TextStyle(
                color: isSelected ? Colors.white : textGray,
                fontSize: 11, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              )),
            ),
          );
        }).toList()),
      ]),
    );
  }
}

// ── HOME SCREEN ──────────────────────────────────────────────────

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Builder(builder: (ctx) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(t(ctx,'home_hello'), style: const TextStyle(color: textGray, fontSize: 14)),
                Text(t(ctx,'home_future'), style: const TextStyle(color: green, fontSize: 22, fontWeight: FontWeight.bold)),
              ])),
              Container(width: 42, height: 42,
                decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle,
                  border: Border.all(color: borderColor, width: 1.5),
                  boxShadow: [BoxShadow(color: navy.withOpacity(0.1), blurRadius: 6)]),
                child: ClipOval(child: Image.asset('assets/images/kc_logo.png', fit: BoxFit.contain,
                  errorBuilder: (ctx, err, st) => const Center(child: Text('KC', style: TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 13)))))),
            ]),
            const SizedBox(height: 24),
            Container(width: double.infinity, padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(color: navy, borderRadius: BorderRadius.circular(20)),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Builder(builder: (ctx) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(t(ctx,'home_journey'), style: const TextStyle(color: Colors.white60, fontSize: 13)),
                  const SizedBox(height: 6),
                  Text(t(ctx,'home_appname'), style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(t(ctx,'home_subtitle'), style: const TextStyle(color: Colors.white60, fontSize: 13, height: 1.4)),
                  const SizedBox(height: 20),
                  Row(children: [
                    _HeroBadge(t(ctx,'home_badge1')),
                    const SizedBox(width: 10),
                    _HeroBadge(t(ctx,'home_badge2')),
                    const SizedBox(width: 10),
                    _HeroBadge(t(ctx,'home_badge3')),
                  ]),
                ])),
              ]),
            ),
            const SizedBox(height: 24),
            Row(children: [
              _StatCard('My College\nList', 'Track & Save', Icons.bookmark, const Color(0xFF2E7D32)),
              const SizedBox(width: 12),
              _StatCard('Scholarship\nQuiz', 'Find Matches', Icons.quiz, const Color(0xFF6B3A8F)),
              const SizedBox(width: 12),
              _StatCard('First-Gen\nHub', 'You\'ve Got This', Icons.favorite, const Color(0xFFCC5500)),
            ]),
            const SizedBox(height: 24),
            Builder(builder: (ctx) => Text(t(ctx,'home_sections'), style: const TextStyle(color: green, fontSize: 16, fontWeight: FontWeight.bold))),
            const SizedBox(height: 14),
            Builder(builder: (ctx) => _SectionTile(context, t(ctx,'s_timeline'), t(ctx,'s_timeline_sub'), Icons.calendar_month, const Color(0xFF4B9CD3), 1)),
            Builder(builder: (ctx) => _SectionTile(context, t(ctx,'s_colleges'), t(ctx,'s_colleges_sub'), Icons.school, const Color(0xFF5B9E30), 2)),
            Builder(builder: (ctx) => _SectionTile(context, t(ctx,'s_mylist'), t(ctx,'s_mylist_sub'), Icons.bookmark, const Color(0xFF2E7D32), 3)),
            Builder(builder: (ctx) => _SectionTile(context, t(ctx,'s_quiz'), t(ctx,'s_quiz_sub'), Icons.quiz, const Color(0xFF6B3A8F), 4)),
            Builder(builder: (ctx) => _SectionTile(context, t(ctx,'s_preapp'), t(ctx,'s_preapp_sub'), Icons.checklist, const Color(0xFF1A5C8A), 5)),
            Builder(builder: (ctx) => _SectionTile(context, t(ctx,'s_essay'), t(ctx,'s_essay_sub'), Icons.draw, const Color(0xFF8B0000), 6)),
            Builder(builder: (ctx) => _SectionTile(context, t(ctx,'s_apply'), t(ctx,'s_apply_sub'), Icons.edit_document, const Color(0xFF13294B), 7)),
            Builder(builder: (ctx) => _SectionTile(context, t(ctx,'s_aid'), t(ctx,'s_aid_sub'), Icons.attach_money, const Color(0xFF2E7D32), 8)),
            Builder(builder: (ctx) => _SectionTile(context, t(ctx,'s_scholarships'), t(ctx,'s_scholarships_sub'), Icons.star, const Color(0xFFE07B20), 9)),
            Builder(builder: (ctx) => _SectionTile(context, t(ctx,'s_residency'), t(ctx,'s_residency_sub'), Icons.assignment, const Color(0xFF0092B2), 10)),
            Builder(builder: (ctx) => _SectionTile(context, t(ctx,'s_postaccept'), t(ctx,'s_postaccept_sub'), Icons.check_circle, const Color(0xFF1A5C8A), 11)),
            Builder(builder: (ctx) => _SectionTile(context, t(ctx,'s_campus'), t(ctx,'s_campus_sub'), Icons.apartment, const Color(0xFFCC5500), 12)),
            Builder(builder: (ctx) => _SectionTile(context, t(ctx,'s_firstgen'), t(ctx,'s_firstgen_sub'), Icons.favorite, const Color(0xFF8B0000), 13)),
            const SizedBox(height: 24),
            Container(width: double.infinity, padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16),
                border: Border.all(color: borderColor, width: 1.5),
                boxShadow: [BoxShadow(color: navy.withOpacity(0.06), blurRadius: 10, offset: const Offset(0, 3))]),
              child: Column(children: [
                Container(width: 80, height: 80,
                  decoration: BoxDecoration(color: const Color(0xFFF5F5F0), borderRadius: BorderRadius.circular(14), border: Border.all(color: borderColor)),
                  child: ClipRRect(borderRadius: BorderRadius.circular(14),
                    child: Image.asset('assets/images/kc_logo.png', fit: BoxFit.contain,
                      errorBuilder: (ctx, err, st) => const Center(child: Text('KC', style: TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 22)))))),
                const SizedBox(height: 14),
                const Text('The Right Click', style: TextStyle(color: green, fontWeight: FontWeight.bold, fontSize: 15)),
                const SizedBox(height: 4),
                const Text('Expert college access advising for NC students', style: TextStyle(color: textGray, fontSize: 12)),
                const SizedBox(height: 14),
                GestureDetector(
                  onTap: () => _openUrl('https://www.hortonconsulting.com'),
                  child: Container(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(color: navy, borderRadius: BorderRadius.circular(20)),
                    child: const Text('Learn More', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13))),
                ),
              ]),
            ),
            const SizedBox(height: 30),
          ]),
        ),
      ),
    );
  }

  Widget _HeroBadge(String text) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(color: Colors.white12, borderRadius: BorderRadius.circular(20)),
    child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600)),
  );

  Widget _StatCard(String title, String subtitle, IconData icon, Color color) => Expanded(
    child: Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: borderColor)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(width: 36, height: 36,
          decoration: BoxDecoration(color: color.withOpacity(0.12), borderRadius: BorderRadius.circular(10)),
          child: Icon(icon, color: color, size: 18)),
        const SizedBox(height: 10),
        Text(title, style: const TextStyle(color: green, fontWeight: FontWeight.bold, fontSize: 11)),
        const SizedBox(height: 2),
        Text(subtitle, style: const TextStyle(color: textGray, fontSize: 10)),
      ]),
    ),
  );

  Widget _SectionTile(BuildContext context, String title, String subtitle, IconData icon, Color color, int index) {
    return GestureDetector(
      onTap: () {
        final nav = context.findAncestorStateOfType<_MainNavState>();
        nav?.setState(() => nav._index = index);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10), padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: borderColor)),
        child: Row(children: [
          Container(width: 48, height: 48,
            decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(14)),
            child: Icon(icon, color: color, size: 24)),
          const SizedBox(width: 14),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: const TextStyle(color: green, fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(height: 3),
            Text(subtitle, style: const TextStyle(color: textGray, fontSize: 12)),
          ])),
          Container(width: 32, height: 32,
            decoration: BoxDecoration(color: const Color(0xFFF5F6FA), borderRadius: BorderRadius.circular(10)),
            child: const Icon(Icons.chevron_right_rounded, color: textGray, size: 20)),
        ]),
      ),
    );
  }
}

// ── TIMELINE SCREEN ──────────────────────────────────────────────

class TimelineScreen extends StatelessWidget {
  const TimelineScreen({super.key});

  static const _months = [
    _MonthData('August', 'Junior/Senior Year Starts', Color(0xFF4B9CD3), ['Meet with your school counselor to review your 4-year plan', 'Research colleges that match your interests and goals', 'Start building your college list (aim for 8-12 schools)', 'Sign up for the PSAT — it\'s offered in October', 'Begin exploring scholarship opportunities on CFNC.org', 'Join clubs, sports, or community service to strengthen your application', 'If you took AP/IB courses, review summer work']),
    _MonthData('September', 'Test Prep & College Research', Color(0xFF5B9E30), ['Register for the October PSAT (if not done in August)', 'Attend any college fairs at your school or in your area', 'Research Common App schools vs. CFNC schools', 'Talk to current college students about their experience', 'Start a resume of activities, awards, and work experience', 'Research financial aid deadlines for schools on your list']),
    _MonthData('October', 'PSAT & Applications Open', Color(0xFF6B3A8F), ['Take the PSAT — score well and you may qualify for National Merit', 'FAFSA opens October 1 — complete it as early as possible!', 'Begin drafting your Common App or CFNC application', 'Start writing your personal statement / college essay', 'Request letters of recommendation from teachers/counselors', 'Check Early Decision / Early Action deadlines (usually Nov 1-15)', 'Visit colleges if possible — virtual tours count too']),
    _MonthData('November', 'Early Applications Due', Color(0xFF1A5C8A), ['Early Decision / Early Action deadlines: November 1-15', 'Submit early applications — double-check every requirement', 'Make sure your FAFSA is submitted — don\'t wait!', 'Follow up with teachers writing recommendation letters', 'Request official transcripts from your high school counselor', 'Continue working on Regular Decision applications', 'Apply for local scholarships — many have Nov/Dec deadlines']),
    _MonthData('December', 'Regular Apps & Scholarships', Color(0xFF8B0000), ['Complete and submit Regular Decision applications', 'Some schools have December 1 or December 15 deadlines', 'Apply for scholarships with December deadlines', 'Student athletes: submit transcripts to NCAA Clearinghouse', 'Check your email for any missing application materials', 'Take the SAT or ACT if you want to improve your score', 'Celebrate early decision results if you applied ED']),
    _MonthData('January', 'Final Deadlines & Aid', Color(0xFF0092B2), ['Most Regular Decision deadlines: January 1 - February 1', 'Submit any remaining applications immediately', 'Apply for scholarships with January/February deadlines', 'Check FAFSA status — make sure it was processed correctly', 'Research NC Need-Based Grant eligibility at CFNC.org', 'Send mid-year grade reports if required by colleges', 'Navy ROTC and other scholarship deadlines this month']),
    _MonthData('February', 'Wait & Keep Applying', Color(0xFF2E7D32), ['Continue applying for scholarships — never stop!', 'Some rolling admissions schools still accepting applications', 'Follow up on any missing financial aid documents', 'Research housing options at colleges you applied to', 'Keep your grades up — colleges can rescind acceptances', 'Prepare for possible college interviews', 'Ronald McDonald House Charities Scholarship due this month']),
    _MonthData('March', 'Decisions Arriving', Color(0xFFCC5500), ['Regular Decision acceptances arrive — check your portals!', 'Compare financial aid award letters from each school', 'Apply for Golden LEAF and other March deadline scholarships', 'Visit accepted schools if you haven\'t already', 'Make a spreadsheet comparing cost, aid, and fit', 'Talk with your family about financial decisions', 'Lumber River EMC scholarship due this month']),
    _MonthData('April', 'Decision Time', Color(0xFFB8860B), ['National Decision Deadline is May 1 — you must decide by then', 'Accept your offer of admission at your chosen school', 'Notify schools you will NOT attend (free up spots for others)', 'Pay your enrollment deposit to hold your spot', 'Apply for housing if you plan to live on campus', 'April scholarship deadlines: FELS, NC Society of Accountants', 'Complete any remaining scholarship applications']),
    _MonthData('May', 'Commit & Prepare', Color(0xFF4B9CD3), ['May 1 — National Decision Day! Final commitment deadline', 'Take AP exams — high scores can earn college credit', 'Register for orientation at your college', 'Apply for remaining May deadline scholarships', 'Request your final transcript be sent after graduation', 'Set up your college email account when available', 'Begin looking at what to bring to college']),
    _MonthData('June', 'Graduate & Get Ready!', Color(0xFF13294B), ['Congratulations — you\'re graduating!', 'Make sure your final transcript is sent to your college', 'Complete any required health forms or immunization records', 'Set up direct deposit for financial aid refunds', 'Attend orientation — it\'s worth it!', 'Meet with your academic advisor to register for classes', 'June scholarship deadlines: Balanced Man, NC Space Grant', 'Enjoy your summer — college starts soon!']),
  ];

  @override
  Widget build(BuildContext context) {
    final currentMonth = DateTime.now().month;
    const monthNumbers = {'August': 8, 'September': 9, 'October': 10, 'November': 11, 'December': 12, 'January': 1, 'February': 2, 'March': 3, 'April': 4, 'May': 5, 'June': 6};
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Builder(builder: (ctx) => _Header(t(ctx,'nav_timeline') == 'Timeline' ? 'Senior Year Timeline' : 'Calendario del Último Año', t(ctx,'hdr_timeline'))),
        Expanded(child: ListView(padding: const EdgeInsets.all(16), children: [
          Builder(builder: (ctx) {
            final isEn = t(ctx,'nav_timeline') == 'Timeline';
            return _Card(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(isEn ? 'Your College Roadmap' : 'Tu Hoja de Ruta para la Universidad',
                style: const TextStyle(color: navy, fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(isEn
                ? 'Every month matters in your senior year. This timeline shows exactly what to do and when. The current month is highlighted — tap any month to see the full action list.'
                : 'Cada mes importa en tu último año. Este calendario muestra exactamente qué hacer y cuándo. El mes actual está resaltado — toca cualquier mes para ver la lista completa.',
                style: const TextStyle(color: Color(0xFF3D5A6E), fontSize: 13, height: 1.6)),
              const SizedBox(height: 12),
              Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: navyPale, borderRadius: BorderRadius.circular(10)),
                child: Row(children: [
                  const Icon(Icons.info_outline, color: navy, size: 18), const SizedBox(width: 8),
                  Expanded(child: Text(
                    isEn ? 'Pro tip: Start in August of your JUNIOR year — the earlier you begin, the more options you\'ll have!'
                         : 'Consejo: ¡Empieza en agosto de tu año JUNIOR — cuanto antes empieces, más opciones tendrás!',
                    style: const TextStyle(color: Color(0xFF1A5C8A), fontSize: 12, height: 1.5))),
                ])),
            ]));
          }),
          ..._months.map((month) {
            final mNum = monthNumbers[month.name] ?? 0;
            return _MonthCard(month: month, isCurrent: mNum == currentMonth);
          }),
          const SizedBox(height: 30),
        ])),
      ]),
    );
  }
}

class _MonthData {
  final String name, subtitle; final Color color; final List<String> tasks;
  const _MonthData(this.name, this.subtitle, this.color, this.tasks);
}

class _MonthCard extends StatefulWidget {
  final _MonthData month; final bool isCurrent;
  const _MonthCard({required this.month, required this.isCurrent});
  @override
  State<_MonthCard> createState() => _MonthCardState();
}

class _MonthCardState extends State<_MonthCard> {
  bool _expanded = false;
  @override
  void initState() { super.initState(); _expanded = widget.isCurrent; }

  static const _monthNamesEs = {
    'August': 'Agosto', 'September': 'Septiembre', 'October': 'Octubre',
    'November': 'Noviembre', 'December': 'Diciembre', 'January': 'Enero',
    'February': 'Febrero', 'March': 'Marzo', 'April': 'Abril',
    'May': 'Mayo', 'June': 'Junio',
  };

  static const _monthSubtitlesEs = {
    'August': 'Comienza el Año Junior/Senior',
    'September': 'Preparación para Exámenes e Investigación',
    'October': 'PSAT y Solicitudes Abiertas',
    'November': 'Solicitudes Tempranas Vencen',
    'December': 'Solicitudes Regulares y Becas',
    'January': 'Plazos Finales y Ayuda Económica',
    'February': 'Espera y Sigue Aplicando',
    'March': 'Llegan las Decisiones',
    'April': 'Hora de Decidir',
    'May': 'Comprométete y Prepárate',
    'June': '¡Gradúate y Prepárate!',
  };

  static const _monthTasksEs = {
    'August': ['Reúnete con tu consejero escolar para revisar tu plan de 4 años', 'Investiga colegios que coincidan con tus intereses y metas', 'Empieza a construir tu lista de colegios (apunta a 8-12 escuelas)', 'Inscríbete para el PSAT — se ofrece en octubre', 'Empieza a explorar oportunidades de becas en CFNC.org', 'Únete a clubes, deportes o servicio comunitario para fortalecer tu solicitud', 'Si tomaste cursos AP/IB, revisa el trabajo de verano'],
    'September': ['Regístrate para el PSAT de octubre (si no lo hiciste en agosto)', 'Asiste a ferias de colegios en tu escuela o área', 'Investiga colegios de Common App vs. colegios de CFNC', 'Habla con estudiantes universitarios actuales sobre su experiencia', 'Comienza un currículum de actividades, premios y experiencia laboral', 'Investiga los plazos de ayuda económica para las escuelas en tu lista'],
    'October': ['Toma el PSAT — una buena puntuación puede calificarte para National Merit', '¡El FAFSA abre el 1 de octubre — complétalo lo antes posible!', 'Comienza a redactar tu solicitud de Common App o CFNC', 'Empieza a escribir tu declaración personal / ensayo universitario', 'Pide cartas de recomendación a maestros/consejeros', 'Verifica los plazos de Decisión Anticipada/Acción Anticipada (normalmente Nov 1-15)', 'Visita colegios si es posible — las visitas virtuales también cuentan'],
    'November': ['Plazos de Decisión Anticipada/Acción Anticipada: 1-15 de noviembre', 'Envía las solicitudes tempranas — verifica todos los requisitos', '¡Asegúrate de que tu FAFSA esté enviado — no esperes!', 'Haz seguimiento con los maestros que escriben cartas de recomendación', 'Solicita transcripciones oficiales a tu consejero escolar', 'Continúa trabajando en las solicitudes de Decisión Regular', 'Solicita becas locales — muchas tienen plazos en nov/dic'],
    'December': ['Completa y envía las solicitudes de Decisión Regular', 'Algunas escuelas tienen plazos el 1 o 15 de diciembre', 'Solicita becas con plazos en diciembre', 'Atletas estudiantiles: envía transcripciones al NCAA Clearinghouse', 'Revisa tu correo electrónico por materiales faltantes de la solicitud', 'Toma el SAT o ACT si quieres mejorar tu puntuación', 'Celebra los resultados de decisión anticipada si aplicaste ED'],
    'January': ['La mayoría de los plazos de Decisión Regular: 1 de enero - 1 de febrero', 'Envía las solicitudes restantes de inmediato', 'Solicita becas con plazos en enero/febrero', 'Verifica el estado del FAFSA — asegúrate de que fue procesado correctamente', 'Investiga la elegibilidad para la Beca NC Based en CFNC.org', 'Envía informes de calificaciones de mediados de año si los colegios lo requieren', 'Los plazos de Navy ROTC y otras becas son este mes'],
    'February': ['¡Continúa solicitando becas — nunca pares!', 'Algunas escuelas con admisiones continuas todavía aceptan solicitudes', 'Haz seguimiento de documentos faltantes de ayuda económica', 'Investiga opciones de vivienda en los colegios a los que aplicaste', 'Mantén tus calificaciones — los colegios pueden revocar aceptaciones', 'Prepárate para posibles entrevistas universitarias', 'La beca Ronald McDonald House Charities vence este mes'],
    'March': ['¡Las aceptaciones de Decisión Regular llegan — revisa tus portales!', 'Compara las cartas de ayuda económica de cada escuela', 'Solicita Golden LEAF y otras becas con plazos en marzo', 'Visita las escuelas aceptadas si aún no lo has hecho', 'Haz una hoja de cálculo comparando costo, ayuda y ajuste', 'Habla con tu familia sobre las decisiones financieras', 'La beca Lumber River EMC vence este mes'],
    'April': ['La Fecha Límite Nacional de Decisión es el 1 de mayo — debes decidir antes', 'Acepta tu oferta de admisión en la escuela elegida', 'Notifica a las escuelas a las que NO asistirás (libera cupos para otros)', 'Paga tu depósito de inscripción para reservar tu lugar', 'Solicita vivienda si planeas vivir en el campus', 'Plazos de becas en abril: FELS, NC Society of Accountants', 'Completa las solicitudes de becas restantes'],
    'May': ['1 de mayo — ¡Día Nacional de Decisión! Plazo final de compromiso', 'Toma los exámenes AP — las altas puntuaciones pueden darte crédito universitario', 'Regístrate para la orientación en tu colegio', 'Solicita becas con plazos en mayo', 'Pide que tu transcripción final se envíe después de la graduación', 'Configura tu cuenta de correo universitario cuando esté disponible', 'Empieza a ver qué llevar a la universidad'],
    'June': ['¡Felicitaciones — te gradúas!', 'Asegúrate de que tu transcripción final se envíe a tu colegio', 'Completa los formularios de salud o registros de vacunación requeridos', 'Configura el depósito directo para reembolsos de ayuda económica', '¡Asiste a la orientación — vale la pena!', 'Reúnete con tu consejero académico para registrar clases', 'Plazos de becas en junio: Balanced Man, NC Space Grant', '¡Disfruta el verano — la universidad empieza pronto!'],
  };

  @override
  Widget build(BuildContext context) {
    final isEn = t(context,'nav_timeline') == 'Timeline';
    final m = widget.month;
    final displayName = isEn ? m.name : (_monthNamesEs[m.name] ?? m.name);
    final displaySubtitle = isEn ? m.subtitle : (_monthSubtitlesEs[m.name] ?? m.subtitle);
    final displayTasks = isEn ? m.tasks : (_monthTasksEs[m.name] ?? m.tasks);
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14),
        border: Border.all(color: widget.isCurrent ? m.color : borderColor, width: widget.isCurrent ? 2.5 : 1.5),
        boxShadow: [BoxShadow(color: widget.isCurrent ? m.color.withOpacity(0.15) : navy.withOpacity(0.04), blurRadius: widget.isCurrent ? 12 : 6, offset: const Offset(0, 2))]),
      child: Column(children: [
        GestureDetector(
          onTap: () => setState(() => _expanded = !_expanded),
          child: Container(padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: _expanded ? m.color : Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Row(children: [
              Container(width: 44, height: 44,
                decoration: BoxDecoration(color: _expanded ? Colors.white.withOpacity(0.2) : m.color.withOpacity(0.12), borderRadius: BorderRadius.circular(10)),
                child: Icon(Icons.calendar_today, color: _expanded ? Colors.white : m.color, size: 20)),
              const SizedBox(width: 12),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  Text(displayName, style: TextStyle(color: _expanded ? Colors.white : green, fontWeight: FontWeight.bold, fontSize: 16)),
                  if (widget.isCurrent) ...[
                    const SizedBox(width: 8),
                    Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(color: _expanded ? Colors.white : m.color, borderRadius: BorderRadius.circular(10)),
                      child: Text('NOW', style: TextStyle(color: _expanded ? m.color : Colors.white, fontSize: 10, fontWeight: FontWeight.bold))),
                  ],
                ]),
                const SizedBox(height: 2),
                Text(displaySubtitle, style: TextStyle(color: _expanded ? Colors.white70 : textGray, fontSize: 12)),
              ])),
              Row(children: [
                Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: _expanded ? Colors.white.withOpacity(0.2) : m.color.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                  child: Text(isEn ? '${m.tasks.length} tasks' : '${m.tasks.length} tareas', style: TextStyle(color: _expanded ? Colors.white : m.color, fontSize: 11, fontWeight: FontWeight.w600))),
                const SizedBox(width: 8),
                Icon(_expanded ? Icons.expand_less : Icons.expand_more, color: _expanded ? Colors.white : textGray),
              ]),
            ]),
          ),
        ),
        if (_expanded)
          Padding(padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: displayTasks.map((task) => Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(width: 8, height: 8, margin: const EdgeInsets.only(top: 5), decoration: BoxDecoration(color: m.color, shape: BoxShape.circle)),
                  const SizedBox(width: 10),
                  Expanded(child: Text(task, style: const TextStyle(color: Color(0xFF3D5A6E), fontSize: 13, height: 1.5))),
                ]),
              )).toList())),
      ]),
    );
  }
}

// ── NC COLLEGE EXPLORER ──────────────────────────────────────────

class CollegeExplorerScreen extends StatefulWidget {
  const CollegeExplorerScreen({super.key});
  @override
  State<CollegeExplorerScreen> createState() => _CollegeExplorerScreenState();
}

class _CollegeExplorerScreenState extends State<CollegeExplorerScreen> {
  String _search = '';
  String _filter = 'All';
  final _filters = ['All', 'UNC System', 'Private', 'Community College', 'HBCU'];

  static const _colleges = [
    _CollegeData(name: 'UNC Chapel Hill', city: 'Chapel Hill', type: 'UNC System', inStateTuition: '\$7,020', outStateTuition: '\$36,082', acceptanceRate: '19%', enrollment: '32,000+', programs: 'Liberal Arts, Business, Medicine, Law, Journalism', url: 'https://www.unc.edu', isHBCU: false),
    _CollegeData(name: 'NC State University', city: 'Raleigh', type: 'UNC System', inStateTuition: '\$9,101', outStateTuition: '\$29,220', acceptanceRate: '45%', enrollment: '36,000+', programs: 'Engineering, Agriculture, Business, Design, Sciences', url: 'https://www.ncsu.edu', isHBCU: false),
    _CollegeData(name: 'UNC Charlotte', city: 'Charlotte', type: 'UNC System', inStateTuition: '\$7,084', outStateTuition: '\$19,513', acceptanceRate: '79%', enrollment: '30,000+', programs: 'Business, Engineering, Education, Architecture', url: 'https://www.uncc.edu', isHBCU: false),
    _CollegeData(name: 'Appalachian State University', city: 'Boone', type: 'UNC System', inStateTuition: '\$7,418', outStateTuition: '\$21,179', acceptanceRate: '76%', enrollment: '20,000+', programs: 'Business, Education, Fine Arts, Sciences', url: 'https://www.appstate.edu', isHBCU: false),
    _CollegeData(name: 'East Carolina University', city: 'Greenville', type: 'UNC System', inStateTuition: '\$7,309', outStateTuition: '\$22,009', acceptanceRate: '86%', enrollment: '28,000+', programs: 'Health Sciences, Business, Education, Engineering', url: 'https://www.ecu.edu', isHBCU: false),
    _CollegeData(name: 'UNC Greensboro', city: 'Greensboro', type: 'UNC System', inStateTuition: '\$7,215', outStateTuition: '\$20,666', acceptanceRate: '84%', enrollment: '20,000+', programs: 'Nursing, Business, Education, Fine Arts', url: 'https://www.uncg.edu', isHBCU: false),
    _CollegeData(name: 'UNC Wilmington', city: 'Wilmington', type: 'UNC System', inStateTuition: '\$7,285', outStateTuition: '\$20,427', acceptanceRate: '74%', enrollment: '17,000+', programs: 'Marine Biology, Business, Education, Film', url: 'https://www.uncw.edu', isHBCU: false),
    _CollegeData(name: 'Western Carolina University', city: 'Cullowhee', type: 'UNC System', inStateTuition: '\$7,324', outStateTuition: '\$19,830', acceptanceRate: '80%', enrollment: '12,000+', programs: 'Business, Education, Health Sciences, Fine Arts', url: 'https://www.wcu.edu', isHBCU: false),
    _CollegeData(name: 'UNC Pembroke', city: 'Pembroke', type: 'UNC System', inStateTuition: '\$6,206', outStateTuition: '\$16,382', acceptanceRate: '90%', enrollment: '8,000+', programs: 'Education, Business, Health Sciences, Liberal Arts', url: 'https://www.uncp.edu', isHBCU: false),
    _CollegeData(name: 'Fayetteville State University', city: 'Fayetteville', type: 'UNC System', inStateTuition: '\$6,521', outStateTuition: '\$17,711', acceptanceRate: '55%', enrollment: '7,000+', programs: 'Business, Education, Criminal Justice, Nursing', url: 'https://www.uncfsu.edu', isHBCU: true),
    _CollegeData(name: 'NC Central University', city: 'Durham', type: 'UNC System', inStateTuition: '\$6,623', outStateTuition: '\$18,299', acceptanceRate: '58%', enrollment: '8,000+', programs: 'Law, Business, Education, Sciences', url: 'https://www.nccu.edu', isHBCU: true),
    _CollegeData(name: 'NC A&T State University', city: 'Greensboro', type: 'UNC System', inStateTuition: '\$7,065', outStateTuition: '\$19,140', acceptanceRate: '63%', enrollment: '14,000+', programs: 'Engineering, Agriculture, Business, Nursing', url: 'https://www.ncat.edu', isHBCU: true),
    _CollegeData(name: 'Winston-Salem State University', city: 'Winston-Salem', type: 'UNC System', inStateTuition: '\$6,459', outStateTuition: '\$17,153', acceptanceRate: '56%', enrollment: '5,000+', programs: 'Nursing, Business, Education, Sciences', url: 'https://www.wssu.edu', isHBCU: true),
    _CollegeData(name: 'Duke University', city: 'Durham', type: 'Private', inStateTuition: '\$63,054', outStateTuition: '\$63,054', acceptanceRate: '6%', enrollment: '17,000+', programs: 'Medicine, Law, Engineering, Business, Policy', url: 'https://www.duke.edu', isHBCU: false),
    _CollegeData(name: 'Wake Forest University', city: 'Winston-Salem', type: 'Private', inStateTuition: '\$62,670', outStateTuition: '\$62,670', acceptanceRate: '25%', enrollment: '8,000+', programs: 'Business, Law, Medicine, Liberal Arts', url: 'https://www.wfu.edu', isHBCU: false),
    _CollegeData(name: 'Davidson College', city: 'Davidson', type: 'Private', inStateTuition: '\$62,210', outStateTuition: '\$62,210', acceptanceRate: '17%', enrollment: '2,000+', programs: 'Liberal Arts, Sciences, Pre-Med, Pre-Law', url: 'https://www.davidson.edu', isHBCU: false),
    _CollegeData(name: 'Elon University', city: 'Elon', type: 'Private', inStateTuition: '\$40,869', outStateTuition: '\$40,869', acceptanceRate: '73%', enrollment: '7,000+', programs: 'Business, Communications, Law, Education', url: 'https://www.elon.edu', isHBCU: false),
    _CollegeData(name: 'High Point University', city: 'High Point', type: 'Private', inStateTuition: '\$38,500', outStateTuition: '\$38,500', acceptanceRate: '69%', enrollment: '6,000+', programs: 'Business, Pharmacy, Education, Health Sciences', url: 'https://www.highpoint.edu', isHBCU: false),
    _CollegeData(name: 'Campbell University', city: 'Buies Creek', type: 'Private', inStateTuition: '\$34,500', outStateTuition: '\$34,500', acceptanceRate: '70%', enrollment: '7,000+', programs: 'Pharmacy, Law, Business, Education, Nursing', url: 'https://www.campbell.edu', isHBCU: false),
    _CollegeData(name: 'Shaw University', city: 'Raleigh', type: 'Private', inStateTuition: '\$17,000', outStateTuition: '\$17,000', acceptanceRate: '80%', enrollment: '1,500+', programs: 'Business, Education, Criminal Justice, Liberal Arts', url: 'https://www.shawu.edu', isHBCU: true),
    _CollegeData(name: 'Johnson C. Smith University', city: 'Charlotte', type: 'Private', inStateTuition: '\$20,614', outStateTuition: '\$20,614', acceptanceRate: '41%', enrollment: '1,500+', programs: 'Business, STEM, Social Work, Communications', url: 'https://www.jcsu.edu', isHBCU: true),
    _CollegeData(name: 'Livingstone College', city: 'Salisbury', type: 'Private', inStateTuition: '\$17,956', outStateTuition: '\$17,956', acceptanceRate: '42%', enrollment: '1,100+', programs: 'Business, Education, Criminal Justice, Sciences', url: 'https://www.livingstone.edu', isHBCU: true),
    _CollegeData(name: 'Robeson Community College', city: 'Lumberton', type: 'Community College', inStateTuition: '\$2,432', outStateTuition: '\$8,576', acceptanceRate: 'Open Admissions', enrollment: '3,500+', programs: 'Associate Degrees, Nursing, Business, Trades, Transfer', url: 'https://www.robeson.edu', isHBCU: false),
    _CollegeData(name: 'Wake Tech Community College', city: 'Raleigh', type: 'Community College', inStateTuition: '\$2,432', outStateTuition: '\$8,576', acceptanceRate: 'Open Admissions', enrollment: '70,000+', programs: 'Business, IT, Health Sciences, Trades, Transfer', url: 'https://www.waketech.edu', isHBCU: false),
    _CollegeData(name: 'Central Piedmont Community College', city: 'Charlotte', type: 'Community College', inStateTuition: '\$2,432', outStateTuition: '\$8,576', acceptanceRate: 'Open Admissions', enrollment: '40,000+', programs: 'Business, Health, Engineering Tech, Arts, Transfer', url: 'https://www.cpcc.edu', isHBCU: false),
    _CollegeData(name: 'Cape Fear Community College', city: 'Wilmington', type: 'Community College', inStateTuition: '\$2,432', outStateTuition: '\$8,576', acceptanceRate: 'Open Admissions', enrollment: '16,000+', programs: 'Nursing, Business, Marine Technology, Trades', url: 'https://www.cfcc.edu', isHBCU: false),
    _CollegeData(name: 'Richmond Community College', city: 'Hamlet', type: 'Community College', inStateTuition: '\$2,432', outStateTuition: '\$8,576', acceptanceRate: 'Open Admissions', enrollment: '2,500+', programs: 'Business, Health Sciences, Trades, Liberal Arts Transfer', url: 'https://www.richmondcc.edu', isHBCU: false),
  ];

  List<_CollegeData> get _filtered => _colleges.where((c) {
    final matchSearch = _search.isEmpty || c.name.toLowerCase().contains(_search.toLowerCase()) || c.city.toLowerCase().contains(_search.toLowerCase()) || c.programs.toLowerCase().contains(_search.toLowerCase());
    final matchFilter = _filter == 'All' || (_filter == 'HBCU' && c.isHBCU) || (_filter != 'HBCU' && c.type == _filter);
    return matchSearch && matchFilter;
  }).toList();

  @override
  Widget build(BuildContext context) {
    final results = _filtered;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Builder(builder: (ctx) => _Header(t(ctx,'nav_timeline') == 'Timeline' ? 'NC College Explorer' : 'Explorador de Colegios de NC', t(ctx,'hdr_colleges'))),
        Expanded(child: ListView(padding: const EdgeInsets.all(16), children: [
          Container(margin: const EdgeInsets.only(bottom: 12), padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: borderColor, width: 1.5),
              boxShadow: [BoxShadow(color: navy.withOpacity(0.05), blurRadius: 6)]),
            child: TextField(onChanged: (v) => setState(() => _search = v),
              decoration: InputDecoration(hintText: t(context, 'btn_search'), hintStyle: TextStyle(color: textGray, fontSize: 13), border: InputBorder.none, icon: Icon(Icons.search, color: navy)))),
          SizedBox(height: 38,
            child: ListView(scrollDirection: Axis.horizontal, children: _filters.map((f) =>
              GestureDetector(onTap: () => setState(() => _filter = f),
                child: Container(margin: const EdgeInsets.only(right: 8), padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(color: _filter == f ? navy : Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: _filter == f ? navy : borderColor, width: 1.5)),
                  child: Text(f, style: TextStyle(color: _filter == f ? Colors.white : textGray, fontSize: 12, fontWeight: FontWeight.w600))))).toList())),
          const SizedBox(height: 12),
          Padding(padding: const EdgeInsets.only(bottom: 12), child: Text('${results.length} colleges found', style: const TextStyle(color: textGray, fontSize: 12))),
          ...results.map((c) => _CollegeCard(college: c)),
          const SizedBox(height: 16),
          _Card(color: navyPale, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Need More Help?', style: TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(height: 8),
            const Text('CFNC.org has a comprehensive NC college search tool with even more filters and details.', style: TextStyle(color: Color(0xFF3D5A6E), fontSize: 13, height: 1.5)),
            const SizedBox(height: 10),
            _CallBtn('Search All NC Colleges — CFNC.org', () => _openUrl('https://www.cfnc.org/college-planning/find-a-college/')),
            _CallBtn('NC Community College System', () => _openUrl('https://www.nccommunitycolleges.edu')),
          ])),
          const SizedBox(height: 30),
        ])),
      ]),
    );
  }
}

class _CollegeData {
  final String name, city, type, inStateTuition, outStateTuition, acceptanceRate, enrollment, programs, url;
  final bool isHBCU;
  const _CollegeData({required this.name, required this.city, required this.type, required this.inStateTuition, required this.outStateTuition, required this.acceptanceRate, required this.enrollment, required this.programs, required this.url, required this.isHBCU});
}

class _CollegeCard extends StatefulWidget {
  final _CollegeData college;
  const _CollegeCard({required this.college});
  @override
  State<_CollegeCard> createState() => _CollegeCardState();
}

class _CollegeCardState extends State<_CollegeCard> {
  bool _expanded = false;
  final _listService = CollegeListService();

  Color get _typeColor { switch (widget.college.type) { case 'UNC System': return const Color(0xFF4B9CD3); case 'Private': return const Color(0xFF6B3A8F); case 'Community College': return const Color(0xFF2E7D32); default: return navy; } }

  @override
  void initState() {
    super.initState();
    _listService.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _listService.removeListener(() => setState(() {}));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = widget.college;
    final isSaved = _listService.isSaved(c.name);
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14), border: Border.all(color: isSaved ? const Color(0xFF2E7D32) : borderColor, width: isSaved ? 2 : 1.5),
        boxShadow: [BoxShadow(color: navy.withOpacity(0.04), blurRadius: 6, offset: const Offset(0, 2))]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        GestureDetector(onTap: () => setState(() => _expanded = !_expanded),
          child: Padding(padding: const EdgeInsets.all(14), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Expanded(child: Text(c.name, style: const TextStyle(color: green, fontWeight: FontWeight.bold, fontSize: 15))),
              if (isSaved) const Icon(Icons.bookmark, color: Color(0xFF2E7D32), size: 18),
              const SizedBox(width: 4),
              Icon(_expanded ? Icons.expand_less : Icons.expand_more, color: textGray),
            ]),
            const SizedBox(height: 6),
            Row(children: [
              const Icon(Icons.location_on, color: textGray, size: 14), const SizedBox(width: 4),
              Text(c.city, style: const TextStyle(color: textGray, fontSize: 12)), const SizedBox(width: 12),
              Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2), decoration: BoxDecoration(color: _typeColor.withOpacity(0.1), borderRadius: BorderRadius.circular(6)),
                child: Text(c.type, style: TextStyle(color: _typeColor, fontSize: 11, fontWeight: FontWeight.w600))),
              if (c.isHBCU) ...[const SizedBox(width: 6),
                Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2), decoration: BoxDecoration(color: const Color(0xFFFFF3E0), borderRadius: BorderRadius.circular(6)),
                  child: const Text('HBCU', style: TextStyle(color: Color(0xFFE65100), fontSize: 11, fontWeight: FontWeight.w600)))],
            ]),
            const SizedBox(height: 10),
            Row(children: [
              _StatChip(Icons.school, 'In-State', c.inStateTuition),
              const SizedBox(width: 8),
              _StatChip(Icons.trending_up, 'Acceptance', c.acceptanceRate),
              const SizedBox(width: 8),
              _StatChip(Icons.people, 'Students', c.enrollment),
            ]),
          ]))),
        if (_expanded) ...[
          const Divider(height: 1),
          Padding(padding: const EdgeInsets.all(14), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Popular Programs', style: TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 13)),
            const SizedBox(height: 4),
            Text(c.programs, style: const TextStyle(color: Color(0xFF3D5A6E), fontSize: 13, height: 1.5)),
            const SizedBox(height: 10),
            Row(children: [
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text('Out-of-State', style: TextStyle(color: textGray, fontSize: 11)), Text(c.outStateTuition, style: const TextStyle(color: green, fontWeight: FontWeight.bold, fontSize: 13))])),
              const SizedBox(width: 16),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text('Enrollment', style: TextStyle(color: textGray, fontSize: 11)), Text(c.enrollment, style: const TextStyle(color: green, fontWeight: FontWeight.bold, fontSize: 13))])),
            ]),
            const SizedBox(height: 12),
            // Save to My List button
            GestureDetector(
              onTap: () async {
                if (isSaved) {
                  await _listService.removeCollege(c.name);
                } else {
                  await _listService.addCollege(c.name);
                }
              },
              child: Container(
                width: double.infinity, padding: const EdgeInsets.symmetric(vertical: 10),
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: isSaved ? Colors.red.shade50 : const Color(0xFFE8F5E9),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: isSaved ? Colors.red.shade200 : const Color(0xFF2E7D32)),
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(isSaved ? Icons.bookmark_remove : Icons.bookmark_add,
                    color: isSaved ? Colors.red.shade400 : const Color(0xFF2E7D32), size: 18),
                  const SizedBox(width: 6),
                  Text(isSaved ? t(context, 'btn_remove') : t(context, 'btn_save'),
                    style: TextStyle(color: isSaved ? Colors.red.shade400 : const Color(0xFF2E7D32), fontWeight: FontWeight.w600, fontSize: 13)),
                ]),
              ),
            ),
            GestureDetector(onTap: () => _openUrl(c.url),
              child: Container(width: double.infinity, padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(color: navy, borderRadius: BorderRadius.circular(10)),
                child: const Center(child: Text('Visit College Website', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13))))),
          ])),
        ],
      ]),
    );
  }
}

Widget _StatChip(IconData icon, String label, String value) => Expanded(
  child: Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
    decoration: BoxDecoration(color: navyPale, borderRadius: BorderRadius.circular(8)),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label, style: const TextStyle(color: textGray, fontSize: 10)),
      const SizedBox(height: 2),
      Text(value, style: const TextStyle(color: green, fontWeight: FontWeight.bold, fontSize: 12), overflow: TextOverflow.ellipsis),
    ])),
);

// ── PRE-APP SCREEN ───────────────────────────────────────────────

const _preAppItems = {
  'grade11': ['Review your academic plan with your counselor', 'Use CFNC.org to find free practice tests for the SAT and ACT', 'Take the PSAT in October — you might qualify for National Merit Scholarships', 'Check admissions requirements of colleges that interest you', 'Keep your CFNC plan of study updated', 'Attend college fairs and financial aid workshops', 'Visit colleges', 'Use CFNC.org to start researching scholarships, grants, and loans', 'Talk with coaches about college sports and scholarship eligibility', 'Register and take SAT, ACT, and/or AP tests', 'Narrow down your list of colleges', 'Find a summer job or internship in your field of interest', 'Get your FSA ID at fafsa.ed.gov — you and a parent/guardian each need one. Save it in a secure place!'],
  'grade12fall': ['Review courses, graduation requirements, and scholarship opportunities with your counselor', 'Update your CFNC plan of study', 'Take the first SAT or ACT offered this fall', 'Select at least five colleges — a reach school, a safety school, and others in between', 'Complete and submit the FAFSA as soon as possible after October 1 at fafsa.ed.gov', 'Participate in College Application Month if offered at your school', 'Keep track of application and financial aid deadlines for each college', 'Check with college financial aid offices for school-specific scholarship deadlines', 'Write, edit, proofread, and rewrite your admissions essays early', 'Ask teachers, counselors, or community leaders to write recommendation letters', 'Use NCResidency.org to determine eligibility for in-state tuition and state grants', 'Use CFNC.org to complete NC college applications and send official transcripts', 'Submit applications to out-of-state schools through their websites', 'Student athletes: send transcripts to NCAA Clearinghouse for eligibility certification'],
  'grade12spring': ['Compare admission acceptance letters and financial aid packages', 'Apply for education loans if needed — limit the amount you borrow, you will have to pay it back', 'Send in your enrollment deposit to hold your spot at the college you choose', 'If not accepted by your college of choice, use the College Redirection module at CFNC.org for new options', 'Make sure your final high school transcript is sent to your college', 'Send in college credit course transcripts (community college, middle college) if any', 'Take exams for any AP or college-level courses completed', 'If planning to attend a community college, check with your local campus about placement testing requirements'],
};

class PreAppScreen extends StatefulWidget {
  const PreAppScreen({super.key});
  @override
  State<PreAppScreen> createState() => _PreAppScreenState();
}

class _PreAppScreenState extends State<PreAppScreen> {
  final Map<String, List<bool>> _checked = {'grade11': List.filled(13, false), 'grade12fall': List.filled(14, false), 'grade12spring': List.filled(8, false)};
  bool _loading = true;

  @override
  void initState() { super.initState(); _loadChecks(); }

  Future<void> _loadChecks() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      for (final s in _checked.keys) { final saved = prefs.getStringList('preapp_$s'); if (saved != null && saved.length == _checked[s]!.length) _checked[s] = saved.map((v) => v == '1').toList(); }
      _loading = false;
    });
  }

  Future<void> _toggle(String s, int i) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() => _checked[s]![i] = !_checked[s]![i]);
    await prefs.setStringList('preapp_$s', _checked[s]!.map((v) => v ? '1' : '0').toList());
  }

  Future<void> _resetAll() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() { for (final s in _checked.keys) _checked[s] = List.filled(_checked[s]!.length, false); });
    for (final s in _checked.keys) await prefs.remove('preapp_$s');
  }

  int _done(String s) => _checked[s]!.where((v) => v).length;
  int _total(String s) => _checked[s]!.length;
  int get _grandTotal => _checked.values.fold(0, (sum, l) => sum + l.length);
  int get _grandDone => _checked.values.fold(0, (sum, l) => sum + l.where((v) => v).length);

  @override
  Widget build(BuildContext context) {
    if (_loading) return const Scaffold(body: Center(child: CircularProgressIndicator()));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Builder(builder: (ctx) => _Header(t(ctx,'nav_timeline') == 'Timeline' ? 'Pre-Application' : 'Pre-Solicitud', t(ctx,'hdr_preapp'))),
        Expanded(child: ListView(padding: const EdgeInsets.all(16), children: [
          _Card(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Your College Checklist', style: TextStyle(color: navy, fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('Starting early is the biggest advantage you can give yourself. Tap each item to mark it complete — your progress saves automatically!', style: TextStyle(color: Color(0xFF3D5A6E), fontSize: 13, height: 1.6)),
            const SizedBox(height: 14),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Overall Progress', style: TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 13)), Text('$_grandDone / $_grandTotal', style: const TextStyle(color: Color(0xFF2E7D32), fontWeight: FontWeight.bold, fontSize: 13))]),
            const SizedBox(height: 8),
            ClipRRect(borderRadius: BorderRadius.circular(8), child: LinearProgressIndicator(value: _grandDone / _grandTotal, minHeight: 10, backgroundColor: const Color(0xFFE0E0E0), valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF2E7D32)))),
            const SizedBox(height: 12),
            Row(children: [
              Expanded(child: _CallBtn('Visit CFNC.org', () => _openUrl('https://www.cfnc.org'))),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () async { final confirm = await showDialog<bool>(context: context, builder: (ctx) => AlertDialog(title: const Text('Reset Checklist?'), content: const Text('This will uncheck all items. Are you sure?'), actions: [TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')), TextButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Reset', style: TextStyle(color: Colors.red)))])); if (confirm == true) _resetAll(); },
                child: Container(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10), decoration: BoxDecoration(color: Colors.red.shade50, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.red.shade200)), child: Text('Reset', style: TextStyle(color: Colors.red.shade700, fontWeight: FontWeight.w600, fontSize: 13))),
              ),
            ]),
          ])),
          _GradeHeader(icon: Icons.looks_3, label: '11th Grade — The Critical Year for Success', color: const Color(0xFF4B9CD3), completed: _done('grade11'), total: _total('grade11')),
          _Card(color: navyPale, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: List.generate(_preAppItems['grade11']!.length, (i) => _CheckItem(text: _preAppItems['grade11']![i], checked: _checked['grade11']![i], onTap: () => _toggle('grade11', i))))),
          _GradeHeader(icon: Icons.looks_4, label: '12th Grade Fall — Don\'t Let Up', color: const Color(0xFF1A5C8A), completed: _done('grade12fall'), total: _total('grade12fall')),
          _Card(color: navyPale, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [...List.generate(_preAppItems['grade12fall']!.length, (i) => _CheckItem(text: _preAppItems['grade12fall']![i], checked: _checked['grade12fall']![i], onTap: () => _toggle('grade12fall', i))), const SizedBox(height: 8), _CallBtn('Complete FAFSA — studentaid.gov', () => _openUrl('https://studentaid.gov/h/apply-for-aid/fafsa')), _CallBtn('NC Residency — ncresidency.org', () => _openUrl('https://www.ncresidency.org')), _CallBtn('NC College Applications — CFNC.org', () => _openUrl('https://www.cfnc.org'))])),
          _GradeHeader(icon: Icons.looks_5, label: '12th Grade Spring — Finish Strong!', color: green, completed: _done('grade12spring'), total: _total('grade12spring')),
          _Card(color: greenPale, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [...List.generate(_preAppItems['grade12spring']!.length, (i) => _CheckItem(text: _preAppItems['grade12spring']![i], checked: _checked['grade12spring']![i], onTap: () => _toggle('grade12spring', i))), const SizedBox(height: 8), _CallBtn('CFNC.org — 866.866.CFNC', () => _openUrl('https://www.cfnc.org'))])),
          const SizedBox(height: 30),
        ])),
      ]),
    );
  }
}

class _GradeHeader extends StatelessWidget {
  final IconData icon; final String label; final Color color; final int completed, total;
  const _GradeHeader({required this.icon, required this.label, required this.color, required this.completed, required this.total});
  @override
  Widget build(BuildContext context) {
    return Container(margin: const EdgeInsets.only(bottom: 10), padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: Row(children: [Icon(icon, color: Colors.white, size: 22), const SizedBox(width: 10), Expanded(child: Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14))),
        Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), decoration: BoxDecoration(color: completed == total ? const Color(0xFF2E7D32) : Colors.white24, borderRadius: BorderRadius.circular(20)),
          child: Text('$completed/$total', style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)))]));
  }
}

class _CheckItem extends StatelessWidget {
  final String text; final bool checked; final VoidCallback onTap;
  const _CheckItem({required this.text, required this.checked, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap,
      child: AnimatedContainer(duration: const Duration(milliseconds: 200), margin: const EdgeInsets.only(bottom: 8), padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(color: checked ? const Color(0xFFE8F5E9) : Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: checked ? const Color(0xFF2E7D32) : borderColor, width: checked ? 1.5 : 1)),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Icon(checked ? Icons.check_circle : Icons.radio_button_unchecked, color: checked ? const Color(0xFF2E7D32) : const Color(0xFFB0BEC5), size: 20), const SizedBox(width: 10),
          Expanded(child: Text(text, style: TextStyle(color: checked ? const Color(0xFF2E7D32) : const Color(0xFF3D5A6E), fontSize: 13, height: 1.5, decoration: checked ? TextDecoration.lineThrough : null, decorationColor: const Color(0xFF2E7D32)))),
        ])));
  }
}

// ── REMAINING SCREENS (Essay, Apply, Aid, Scholarships, Residency, PostAcceptance, Campus) ──

class EssayScreen extends StatelessWidget {
  const EssayScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: Column(children: [
      Builder(builder: (ctx) => _Header(t(ctx,'nav_timeline') == 'Timeline' ? 'Essay Help' : 'Ayuda con el Ensayo', t(ctx,'hdr_essay'))),
      Expanded(child: ListView(padding: const EdgeInsets.all(16), children: [
        _Card(child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Your Essay is Your Voice', style: TextStyle(color: navy, fontSize: 16, fontWeight: FontWeight.bold)), SizedBox(height: 8), Text('The college essay is your chance to show admissions officers who you are beyond your grades and test scores. Make it count!', style: TextStyle(color: Color(0xFF3D5A6E), fontSize: 13, height: 1.6))])),
        const _SectionHeader(icon: Icons.lightbulb, label: 'Choosing Your Topic'),
        _Card(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text('Great essay topics:', style: TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 14)), const SizedBox(height: 10), _InfoItem(icon: Icons.check_circle_outline, text: 'A challenge you overcame and what you learned'), _InfoItem(icon: Icons.check_circle_outline, text: 'A person who significantly influenced you'), _InfoItem(icon: Icons.check_circle_outline, text: 'A moment that changed how you see the world'), _InfoItem(icon: Icons.check_circle_outline, text: 'A passion or hobby that defines you'), _InfoItem(icon: Icons.check_circle_outline, text: 'Your background, identity, or community'), _InfoItem(icon: Icons.check_circle_outline, text: 'A failure and how you grew from it'), const SizedBox(height: 8), const Text('Topics to avoid:', style: TextStyle(color: Color(0xFF1A5C8A), fontWeight: FontWeight.bold, fontSize: 14)), const SizedBox(height: 6), _InfoItem(icon: Icons.cancel_outlined, text: 'Sports injuries or "we lost but I learned teamwork"'), _InfoItem(icon: Icons.cancel_outlined, text: 'Mission trips that focus on you helping "less fortunate" people'), _InfoItem(icon: Icons.cancel_outlined, text: 'Summarizing your resume or activities list')])),
        const _SectionHeader(icon: Icons.edit, label: 'Writing Your Essay'),
        _StepTile(step: 1, title: 'Brainstorm First', body: 'Before writing, spend 20-30 minutes writing down every story, experience, or moment that feels important to you. Don\'t judge your ideas — just write.'),
        _StepTile(step: 2, title: 'Start with a Hook', body: 'Your first sentence should grab the reader\'s attention. Start in the middle of action, with a surprising fact, or with a vivid description.'),
        _StepTile(step: 3, title: 'Show, Don\'t Tell', body: 'Instead of saying "I am hardworking," show it through a specific story. Use details, dialogue, and sensory language to bring your story to life.'),
        _StepTile(step: 4, title: 'Be Authentic', body: 'Write in your own voice. Don\'t try to sound like someone else. Admissions officers read thousands of essays — an authentic voice stands out.'),
        _StepTile(step: 5, title: 'Edit and Revise', body: 'Write your first draft without worrying about perfection. Then revise multiple times. Read it out loud — if it sounds awkward, it probably reads that way too.'),
        const _SectionHeader(icon: Icons.computer, label: 'Essay Resources'),
        _Card(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [_CallBtn('Common App Essay Tips', () => _openUrl('https://www.commonapp.org/apply/essay-prompts')), _CallBtn('Khan Academy — College Essay Guide', () => _openUrl('https://www.khanacademy.org/college-careers-more/college-admissions/essays')), _CallBtn('College Essay Guy — Free Resources', () => _openUrl('https://www.collegeessayguy.com'))])),
        const SizedBox(height: 30),
      ])),
    ]));
  }
}

class ApplicationScreen extends StatelessWidget {
  const ApplicationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: Column(children: [
      Builder(builder: (ctx) => _Header(t(ctx,'nav_timeline') == 'Timeline' ? 'Application Process' : 'Proceso de Solicitud', t(ctx,'hdr_apply'))),
      Expanded(child: ListView(padding: const EdgeInsets.all(16), children: [
        _Card(child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Applying to College', style: TextStyle(color: navy, fontSize: 16, fontWeight: FontWeight.bold)), SizedBox(height: 8), Text('The college application process can feel overwhelming but breaking it into steps makes it manageable. Start early and stay organized!', style: TextStyle(color: Color(0xFF3D5A6E), fontSize: 13, height: 1.6))])),
        const _SectionHeader(icon: Icons.calendar_today, label: 'Key Deadlines to Know'),
        _Card(color: navyPale, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [_InfoItem(icon: Icons.flag, text: 'Early Decision / Early Action: Usually November 1–15'), _InfoItem(icon: Icons.flag, text: 'Regular Decision: Usually January 1–February 1'), _InfoItem(icon: Icons.flag, text: 'Rolling Admissions (community colleges): Apply anytime — sooner is better'), _InfoItem(icon: Icons.flag, text: 'FAFSA Opens: October 1 each year — file as early as possible'), const Text('Tip: Set calendar reminders for every deadline!', style: TextStyle(color: green, fontWeight: FontWeight.w600, fontSize: 12, fontStyle: FontStyle.italic))])),
        const _SectionHeader(icon: Icons.edit_document, label: 'How to Apply'),
        _StepTile(step: 1, title: 'Choose Your Application Platform', body: 'Most 4-year colleges use the Common App or Coalition App. Community colleges usually have their own application. Check each college\'s admissions page.', btnLabel: 'Common App — commonapp.org', onBtn: () => _openUrl('https://www.commonapp.org')),
        _StepTile(step: 2, title: 'Create Your Account', body: 'Use a professional email address — avoid usernames like "cooldude2008." Write down your login information somewhere safe.'),
        _StepTile(step: 3, title: 'Fill Out the Application', body: 'You\'ll need: personal information, high school GPA, activities list, college essay, letters of recommendation, and application fee (or fee waiver).'),
        _StepTile(step: 4, title: 'Request Transcripts', body: 'Contact your high school counselor to send your official transcript directly to each college. Do this early — schools can be slow.'),
        _StepTile(step: 5, title: 'Submit and Follow Up', body: 'After submitting, create an account on each college\'s admissions portal to track your application status and check for missing documents.'),
        const _SectionHeader(icon: Icons.school, label: 'NC College Application Resources'),
        _Card(color: navyPale, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text('Helpful NC Resources', style: TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 14)), const SizedBox(height: 8), _InfoItem(icon: Icons.check_circle_outline, text: 'CFNC.org — apply to NC public colleges and universities'), _InfoItem(icon: Icons.check_circle_outline, text: 'NC community colleges have rolling admissions — apply anytime'), _InfoItem(icon: Icons.check_circle_outline, text: 'Complete your NC Residency Determination (RDS) for in-state tuition'), const SizedBox(height: 8), _CallBtn('Apply via CFNC.org', () => _openUrl('https://www.cfnc.org')), _CallBtn('NC Community College System', () => _openUrl('https://www.nccommunitycolleges.edu'))])),
        const SizedBox(height: 30),
      ])),
    ]));
  }
}

class FinancialAidScreen extends StatelessWidget {
  const FinancialAidScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: Column(children: [
      Builder(builder: (ctx) => _Header(t(ctx,'nav_timeline') == 'Timeline' ? 'Financial Aid & FAFSA' : 'Ayuda Financiera y FAFSA', t(ctx,'hdr_aid'))),
      Expanded(child: ListView(padding: const EdgeInsets.all(16), children: [
        Container(margin: const EdgeInsets.only(bottom: 16), padding: const EdgeInsets.all(18), decoration: BoxDecoration(color: navy, borderRadius: BorderRadius.circular(14)),
          child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Row(children: [Icon(Icons.star, color: green, size: 22), SizedBox(width: 8), Text('Most Students Get Financial Aid!', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold))]), SizedBox(height: 8), Text('Over 85% of college students receive some form of financial aid. The key is applying — you can\'t get money you don\'t apply for!', style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.5))])),
        const _SectionHeader(icon: Icons.assignment, label: 'Step 1: Complete the FAFSA'),
        _StepTile(step: 1, title: 'What is the FAFSA?', body: 'The Free Application for Federal Student Aid (FAFSA) is FREE to fill out. Never pay someone to complete your FAFSA!'),
        _StepTile(step: 2, title: 'When to File', body: 'The FAFSA opens October 1 each year. File as early as possible — some aid is first-come, first-served.', btnLabel: 'Complete FAFSA — studentaid.gov', onBtn: () => _openUrl('https://studentaid.gov/h/apply-for-aid/fafsa')),
        _StepTile(step: 3, title: 'What You Need', body: 'Your SSN, parents\' SSN (if dependent), federal tax returns, W-2 forms, bank account info, and your FSA ID.'),
        _StepTile(step: 4, title: 'Create Your FSA ID', body: 'You and one parent each need your own FSA ID. Create it at studentaid.gov before starting the FAFSA.', btnLabel: 'Create FSA ID — studentaid.gov', onBtn: () => _openUrl('https://studentaid.gov/fsa-id/create-account/launch')),
        const _SectionHeader(icon: Icons.attach_money, label: 'Types of Financial Aid'),
        _Card(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text('Grants (Free — No Repayment!)', style: TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 14)), const SizedBox(height: 8), _InfoItem(icon: Icons.monetization_on, text: 'Pell Grant — up to \$7,395/year for students with financial need'), _InfoItem(icon: Icons.monetization_on, text: 'NC Need-Based Grant — for NC residents attending NC colleges'), _InfoItem(icon: Icons.monetization_on, text: 'Institutional Grants — free money from the college itself')])),
        _Card(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text('Loans (Must Be Repaid)', style: TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 14)), const SizedBox(height: 8), _InfoItem(icon: Icons.info_outline, text: 'Subsidized — government pays interest while you\'re in school'), _InfoItem(icon: Icons.info_outline, text: 'Unsubsidized — interest builds while you\'re in school'), const Text('Tip: Only borrow what you absolutely need!', style: TextStyle(color: Color(0xFF1A5C8A), fontSize: 12, fontStyle: FontStyle.italic))])),
        const SizedBox(height: 30),
      ])),
    ]));
  }
}

class ScholarshipScreen extends StatefulWidget {
  const ScholarshipScreen({super.key});
  @override
  State<ScholarshipScreen> createState() => _ScholarshipScreenState();
}

class _ScholarshipScreenState extends State<ScholarshipScreen> {
  String? _selectedSchool;

  List<_SchoolScholarship> get _schoolResults =>
      _selectedSchool == null ? [] : _getScholarships(_selectedSchool!);

  @override
  Widget build(BuildContext context) {
    final schoolResults = _schoolResults;
    return Scaffold(backgroundColor: Colors.white, body: Column(children: [
      Builder(builder: (ctx) => _Header(t(ctx,'nav_timeline') == 'Timeline' ? 'Scholarships' : 'Becas', t(ctx,'hdr_scholarships'))),
      Expanded(child: ListView(padding: const EdgeInsets.all(16), children: [

        // ── FIND MY SCHOOL SECTION ──
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(color: navy, borderRadius: BorderRadius.circular(14)),
          child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [Icon(Icons.school, color: Colors.white, size: 22), SizedBox(width: 8),
              Text('Find My School / Encontrar Mi Escuela', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold))]),
            SizedBox(height: 8),
            Text('Select your school to see local scholarships. No personal info collected. / Elige tu escuela para ver becas locales. No se recopila información personal.',
              style: TextStyle(color: Colors.white70, fontSize: 12, height: 1.5)),
          ]),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12),
            border: Border.all(color: borderColor, width: 1.5),
            boxShadow: [BoxShadow(color: navy.withOpacity(0.05), blurRadius: 6)]),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _selectedSchool,
              isExpanded: true,
              hint: const Text('Select your high school... / Selecciona tu preparatoria...', style: TextStyle(color: textGray, fontSize: 13)),
              icon: const Icon(Icons.expand_more, color: navy),
              onChanged: (v) => setState(() => _selectedSchool = v),
              items: _ctecSchools.map((s) => DropdownMenuItem(
                value: s,
                child: Text(s, style: const TextStyle(color: green, fontSize: 13, fontWeight: FontWeight.w500)),
              )).toList(),
            ),
          ),
        ),
        if (_selectedSchool != null) ...[
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(color: const Color(0xFF2E7D32), borderRadius: BorderRadius.circular(10)),
            child: Row(children: [
              const Icon(Icons.location_on, color: Colors.white, size: 18),
              const SizedBox(width: 8),
              Expanded(child: Text(_selectedSchool!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13))),
              Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(20)),
                child: Text('\${schoolResults.length} scholarships / becas', style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold))),
            ]),
          ),
          ...schoolResults.map((s) => _SchoolScholarshipTile(scholarship: s)),
          const SizedBox(height: 8),
        ],

        // ── NC COLLEGE SCHOLARSHIPS SECTION ──
        const SizedBox(height: 8),
        const Divider(thickness: 1.5, color: borderColor),
        const SizedBox(height: 8),
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(color: const Color(0xFF2E7D32), borderRadius: BorderRadius.circular(14)),
          child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [Icon(Icons.account_balance, color: Colors.white, size: 22), SizedBox(width: 8),
              Text('NC College Scholarships / Becas de Colegios de NC', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold))]),
            SizedBox(height: 8),
            Text('Pick a NC college to see institutional scholarships. / Elige un colegio de NC para ver sus becas institucionales.',
              style: TextStyle(color: Colors.white70, fontSize: 12, height: 1.5)),
          ]),
        ),
        const _CollegeScholarshipPicker(),
        const SizedBox(height: 8),
        const Divider(thickness: 1.5, color: borderColor),
        const SizedBox(height: 8),

        // ── EXISTING SCHOLARSHIPS CONTENT ──
        Container(margin: const EdgeInsets.only(bottom: 16), padding: const EdgeInsets.all(18), decoration: BoxDecoration(color: navy, borderRadius: BorderRadius.circular(14)),
          child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Row(children: [Icon(Icons.star, color: Color(0xFFFFD700), size: 24), SizedBox(width: 8), Text('Scholarships = Free Money! / ¡Becas = Dinero Gratis!', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold))]), SizedBox(height: 8), Text('Unlike loans, scholarships never need to be paid back. Apply early, apply often! / Las becas nunca se devuelven. ¡Solicita temprano y seguido!', style: TextStyle(color: Colors.white70, fontSize: 12, height: 1.5))])),
        Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF6B3A8F).withOpacity(0.08),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFF6B3A8F).withOpacity(0.3))),
          child: Row(
            children: [
              const Icon(Icons.quiz, color: Color(0xFF6B3A8F), size: 24),
              const SizedBox(width: 12),
              const Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Not sure which scholarships fit you? / ¿No sabes qué becas te convienen?',
                    style: TextStyle(color: Color(0xFF6B3A8F), fontWeight: FontWeight.bold, fontSize: 12)),
                  SizedBox(height: 2),
                  Text('Take the Scholarship Match Quiz! / ¡Toma el Quiz de Becas!',
                    style: TextStyle(color: Color(0xFF3D5A6E), fontSize: 11)),
                ],
              )),
              GestureDetector(
                onTap: () { final nav = context.findAncestorStateOfType<_MainNavState>(); nav?.setState(() => nav._index = 4); },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(color: const Color(0xFF6B3A8F), borderRadius: BorderRadius.circular(8)),
                  child: const Text('Quiz', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                ),
              ),
            ],
          ),
        ),
        const _SectionHeader(icon: Icons.search, label: 'Free Scholarship Search Websites'),
        _Card(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [_CallBtn('CFNC.org — NC College Resources', () => _openUrl('https://www.cfnc.org')), _CallBtn('Fastweb.com', () => _openUrl('https://www.fastweb.com')), _CallBtn('Scholarships.com', () => _openUrl('https://www.scholarships.com')), _CallBtn('QuestBridge.org', () => _openUrl('https://www.questbridge.org')), _CallBtn('Bold.org Scholarships', () => _openUrl('https://bold.org/scholarships')), Builder(builder: (ctx) => _CallBtn(t(ctx,'scholarship_going_merry'), () => _openUrl('https://www.goingmerry.com')))])),
        _DeadlineHeader(label: 'September / October Deadlines', color: const Color(0xFF6B3A8F)),
        _ScholarshipTile(name: 'Park Scholarship — NC State', amount: '\$80,000+ (4-year)', details: 'Academics, leadership, volunteer service, and character. Includes computer stipend and study abroad.', url: 'https://park.ncsu.edu'),
        _ScholarshipTile(name: 'Morehead-Cain — UNC Chapel Hill', amount: 'Full Scholarship', details: 'Top 5% of senior class. Moral character, physical vigor, leadership, and scholarship required.', url: 'https://www.moreheadcain.org'),
        _ScholarshipTile(name: 'Coca-Cola Scholars Program', amount: '\$10,000–\$20,000', details: 'Leadership, extracurriculars, and community service. GPA 3.0 required.', url: 'https://www.coca-colascholarsfoundation.org'),
        _DeadlineHeader(label: 'January / February Deadlines', color: const Color(0xFF0092B2)),
        _ScholarshipTile(name: 'Jagannathan Scholarship', amount: 'Varies', details: 'For NC residents attending a UNC institution. Financial need + academic achievement. Counselor nomination required.', url: 'https://www.cfnc.org'),
        _ScholarshipTile(name: 'Navy ROTC Scholarship', amount: 'Up to \$180,000', details: 'Tuition, books, and fees. Commitment to Navy service required.', url: 'https://www.nrotc.navy.mil'),
        _ScholarshipTile(name: 'United Tribes of NC Scholarship', amount: 'Varies', details: 'For American Indian students in NC enrolled in a recognized tribe.', url: ''),
        _DeadlineHeader(label: 'March Deadlines', color: const Color(0xFF2E7D32)),
        _ScholarshipTile(name: 'Golden LEAF Foundation Scholarship', amount: '\$12,000', details: 'Priority for families affected by tobacco industry decline. FAFSA required.', url: 'https://www.cfnc.org/goldenleaf'),
        _ScholarshipTile(name: 'Lumber River EMC Scholarship', amount: 'Up to \$8,000', details: 'For seniors whose parents are LREMC members.', url: 'https://www.lremc.com'),
        _DeadlineHeader(label: 'April Deadlines', color: const Color(0xFFCC5500)),
        _ScholarshipTile(name: 'Forgivable Education Loans for Service (FELS)', amount: 'Varies', details: 'For students committed to working in NC shortage professions after graduation.', url: 'https://www.cfnc.org/FELS'),
        _ScholarshipTile(name: 'NC American Indian Fund Scholarship', amount: 'Up to \$1,000/yr', details: 'NC resident enrolled in a recognized tribe. 2.0 GPA. Full-time student.', url: 'https://www.trianglecf.org'),
        _DeadlineHeader(label: 'June Deadlines', color: const Color(0xFF8B0000)),
        _ScholarshipTile(name: 'NC Space Grant Scholarship', amount: '\$1,000', details: 'For STEM degree students in NC.', url: 'https://ncspacegrant.ncsu.edu'),
        _ScholarshipTile(name: 'Prospective Teacher Scholarship Loan', amount: '\$2,500–\$4,000/yr', details: 'For education majors committing to teach in NC public schools.', url: 'https://www.cfnc.org'),
        const _SectionHeader(icon: Icons.people, label: 'Minority & Community Scholarships'),
        _Card(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [_CallBtn('United Negro College Fund (UNCF)', () => _openUrl('https://www.uncf.org')), _CallBtn('Hispanic College Fund', () => _openUrl('https://hispanicfund.org')), _CallBtn('Jackie Robinson Foundation', () => _openUrl('https://www.jackierobinson.org')), _CallBtn('QuestBridge — First-Gen Full Scholarships', () => _openUrl('https://www.questbridge.org')), _CallBtn('Lumbee Tribe Education Scholarships', () => _openUrl('https://www.lumbeetribe.com/education'))])),
        const _SectionHeader(icon: Icons.favorite, label: 'Scholarships for Undocumented & DACA Students'),
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(color: const Color(0xFF1A5C8A).withOpacity(0.08), borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFF1A5C8A).withOpacity(0.3))),
          child: const Row(children: [
            Icon(Icons.info_outline, color: Color(0xFF1A5C8A), size: 20),
            SizedBox(width: 10),
            Expanded(child: Text('These scholarships are open to students regardless of immigration status. You belong here and you deserve support.',
              style: TextStyle(color: Color(0xFF1A5C8A), fontSize: 12, height: 1.5))),
          ]),
        ),
        _ScholarshipTile(
          name: 'QuestBridge Match Scholarship',
          amount: 'Full Ride (worth over USD 200,000)',
          details: 'Top 5-10% of graduating class. SAT 1260+ or ACT 27+ (not required). Household income under USD 65,000/yr. OPEN TO UNDOCUMENTED/DACA STUDENTS. Deadline: Sept. 26.',
          url: 'https://www.questbridge.org',
        ),
        _ScholarshipTile(
          name: 'Golden Door Scholarship',
          amount: 'Full Ride (4-year)',
          details: 'Must have DACA, TPS, or be undocumented. High financial need required. Covers tuition, room and board, internship support, and annual career summit. Deadline: Oct. 1.',
          url: 'https://www.goldendoorscholars.org',
        ),
        _ScholarshipTile(
          name: 'TheDream.US National Scholarship',
          amount: 'Up to USD 30,000',
          details: 'For DACA and TPS recipients. Min 2.5 GPA. Must attend a partner college full-time. Strong financial need preferred.',
          url: 'https://www.thedream.us/scholarships/national-scholarship/',
        ),
        _ScholarshipTile(
          name: 'Hispanic Scholarship Fund (HSF)',
          amount: 'USD 500 - USD 5,000',
          details: 'Hispanic heritage. Min 3.0 GPA. US Citizen, permanent resident, or DACA recipient. FAFSA or state aid application required.',
          url: 'https://www.hsf.net/scholarship',
        ),
        _ScholarshipTile(
          name: 'College Advising Corps Scholarship',
          amount: 'Varies',
          details: 'For first-generation, low-income, and underrepresented students including DACA recipients. Check CFNC and Going Merry for current availability.',
          url: 'https://www.goingmerry.com',
        ),
        const SizedBox(height: 30),
      ])),
    ]));
  }
}

class _DeadlineHeader extends StatelessWidget {
  final String label; final Color color;
  const _DeadlineHeader({required this.label, required this.color});
  @override
  Widget build(BuildContext context) => Container(margin: const EdgeInsets.only(bottom: 10, top: 6), padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10), decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
    child: Row(children: [const Icon(Icons.calendar_today, color: Colors.white, size: 18), const SizedBox(width: 10), Expanded(child: Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)))]));
}

class _ScholarshipTile extends StatelessWidget {
  final String name, amount, details, url;
  const _ScholarshipTile({required this.name, required this.amount, required this.details, required this.url});
  @override
  Widget build(BuildContext context) => Container(margin: const EdgeInsets.only(bottom: 10), padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: borderColor, width: 1.5), boxShadow: [BoxShadow(color: navy.withOpacity(0.04), blurRadius: 6, offset: const Offset(0, 2))]),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(name, style: const TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 14)),
      const SizedBox(height: 4),
      Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3), decoration: BoxDecoration(color: const Color(0xFFE8F5E9), borderRadius: BorderRadius.circular(6)), child: Text(amount, style: const TextStyle(color: Color(0xFF2E7D32), fontWeight: FontWeight.w600, fontSize: 12))),
      const SizedBox(height: 8),
      Text(details, style: const TextStyle(color: Color(0xFF3D5A6E), fontSize: 13, height: 1.5)),
      if (url.isNotEmpty) ...[const SizedBox(height: 8), _CallBtn('Apply / Learn More', () => _openUrl(url))],
    ]));
}

class ResidencyScreen extends StatelessWidget {
  const ResidencyScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: Column(children: [
      Builder(builder: (ctx) => _Header(t(ctx,'nav_timeline') == 'Timeline' ? 'Residency' : 'Residencia', t(ctx,'hdr_residency'))),
      Expanded(child: ListView(padding: const EdgeInsets.all(16), children: [
        _Card(child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('What is Residency?', style: TextStyle(color: navy, fontSize: 16, fontWeight: FontWeight.bold)), SizedBox(height: 8), Text('Your state residency status determines whether you pay in-state or out-of-state tuition. In-state tuition is significantly cheaper — understanding residency requirements can save you over \$70,000!', style: TextStyle(color: Color(0xFF3D5A6E), fontSize: 13, height: 1.6))])),
        const _SectionHeader(icon: Icons.home, label: 'NC Residency Requirements'),
        _Card(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text('To qualify for in-state tuition in NC you generally must:', style: TextStyle(color: Color(0xFF3D5A6E), fontSize: 13, height: 1.6)), const SizedBox(height: 10), _InfoItem(icon: Icons.check_circle_outline, text: 'Have lived in NC for at least 12 consecutive months before the semester begins'), _InfoItem(icon: Icons.check_circle_outline, text: 'Have established NC as your legal domicile (permanent home)'), _InfoItem(icon: Icons.check_circle_outline, text: 'Not be living in NC solely for the purpose of attending college'), _InfoItem(icon: Icons.check_circle_outline, text: 'If you are a dependent student, your parent or guardian must meet the requirements')])),
        const _SectionHeader(icon: Icons.assignment, label: 'NC Residency Determination Service (RDS)'),
        _Card(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text('NC uses the RDS to determine in-state eligibility for all NC colleges.', style: TextStyle(color: Color(0xFF3D5A6E), fontSize: 13, height: 1.6)), const SizedBox(height: 12), _StepTile(step: 1, title: 'Create an RDS Account', body: 'Go to ncresidency.org and create a free account. You will need your SSN or ITIN.'), _StepTile(step: 2, title: 'Complete Your Application', body: 'Fill out the online residency application honestly. You will receive a Residency Certification Number (RCN).'), _StepTile(step: 3, title: 'Submit Your RCN', body: 'Include your RCN when you apply to NC colleges. Each school will use it to verify your residency status.'), _StepTile(step: 4, title: 'Appeal if Denied', body: 'If denied, gather documentation showing your NC ties and submit an appeal through RDS.', btnLabel: 'Apply at NCResidency.org', onBtn: () => _openUrl('https://www.ncresidency.org'))])),
        const _SectionHeader(icon: Icons.language, label: 'Residency Resources'),
        _Card(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [_CallBtn('NC Residency Determination — ncresidency.org', () => _openUrl('https://www.ncresidency.org')), _CallBtn('Call RDS Toll-Free — 844.319.3640', () => _callPhone('8443193640')), _CallBtn('Email RDS — rdsinfo@ncresidency.org', () => _openUrl('mailto:rdsinfo@ncresidency.org')), _CallBtn('CFNC — NC College Financial Aid Info', () => _openUrl('https://www.cfnc.org/pay-for-college'))])),
        const SizedBox(height: 30),
      ])),
    ]));
  }
}

class PostAcceptanceScreen extends StatelessWidget {
  const PostAcceptanceScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: Column(children: [
      Builder(builder: (ctx) => _Header(t(ctx,'nav_timeline') == 'Timeline' ? 'Post-Acceptance' : 'Post-Aceptación', t(ctx,'hdr_postaccept'))),
      Expanded(child: ListView(padding: const EdgeInsets.all(16), children: [
        Container(margin: const EdgeInsets.only(bottom: 16), padding: const EdgeInsets.all(18), decoration: BoxDecoration(color: navy, borderRadius: BorderRadius.circular(14)), child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('🎉 Congratulations!', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)), SizedBox(height: 8), Text('Getting your acceptance letter is a huge achievement. But there\'s still important work to do before your first day of class!', style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.5))])),
        const _SectionHeader(icon: Icons.checklist, label: 'Immediate Next Steps'),
        _StepTile(step: 1, title: 'Review Your Financial Aid Award Letter', body: 'Compare offers from different schools. Look at grants vs. loans carefully — grants are free, loans must be repaid.'),
        _StepTile(step: 2, title: 'Accept Your Offer of Admission', body: 'Log into the college\'s admissions portal and officially accept. Deadline is often May 1 for fall enrollment.'),
        _StepTile(step: 3, title: 'Pay Your Enrollment Deposit', body: 'Many colleges require a deposit (usually \$100–\$500) to hold your spot.'),
        _StepTile(step: 4, title: 'Submit Final Transcripts', body: 'After graduation, have your high school counselor send your final official transcript to your college.'),
        const _SectionHeader(icon: Icons.school, label: 'Academic Preparation'),
        _StepTile(step: 5, title: 'Register for Orientation', body: 'Most colleges require orientation before classes start. You\'ll learn about resources and meet other students.'),
        _StepTile(step: 6, title: 'Meet with Your Academic Advisor', body: 'They will help you choose the right classes and stay on track toward your degree.'),
        _StepTile(step: 7, title: 'Register for Classes', body: 'Register early — popular classes fill up quickly. Balance your schedule so you don\'t take on too much at once.'),
        const SizedBox(height: 30),
      ])),
    ]));
  }
}

class CampusLifeScreen extends StatelessWidget {
  const CampusLifeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: Column(children: [
      Builder(builder: (ctx) => _Header(t(ctx,'nav_timeline') == 'Timeline' ? 'Campus Life' : 'Vida en el Campus', t(ctx,'hdr_campus'))),
      Expanded(child: ListView(padding: const EdgeInsets.all(16), children: [
        _Card(child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('College is a Big Transition', style: TextStyle(color: navy, fontSize: 16, fontWeight: FontWeight.bold)), SizedBox(height: 8), Text('College life is exciting but also a big adjustment. Knowing what to expect helps you make the most of the experience.', style: TextStyle(color: Color(0xFF3D5A6E), fontSize: 13, height: 1.6))])),
        const _SectionHeader(icon: Icons.class_, label: 'Academics in College'),
        _Card(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text('College classes are different from high school:', style: TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 14)), const SizedBox(height: 10), _InfoItem(icon: Icons.arrow_forward, text: 'Professors don\'t remind you about assignments — you\'re responsible'), _InfoItem(icon: Icons.arrow_forward, text: 'Read the syllabus! It contains everything you need to know'), _InfoItem(icon: Icons.arrow_forward, text: 'Go to class — attendance matters even when it\'s not required'), _InfoItem(icon: Icons.arrow_forward, text: 'Visit office hours — professors want to help you succeed'), _InfoItem(icon: Icons.arrow_forward, text: 'Use the tutoring center — it\'s free and effective')])),
        const _SectionHeader(icon: Icons.schedule, label: 'Time Management'),
        _Card(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text('The #1 skill for college success:', style: TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 14)), const SizedBox(height: 10), _InfoItem(icon: Icons.check_circle_outline, text: 'Use a planner or calendar app to track all deadlines'), _InfoItem(icon: Icons.check_circle_outline, text: 'Study for 2-3 hours for every 1 hour in class'), _InfoItem(icon: Icons.check_circle_outline, text: 'Avoid all-nighters — sleep is essential for learning'), _InfoItem(icon: Icons.check_circle_outline, text: 'Balance school, work, and social life')])),
        const _SectionHeader(icon: Icons.health_and_safety, label: 'Health & Wellness'),
        _Card(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text('Take care of yourself:', style: TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 14)), const SizedBox(height: 10), _InfoItem(icon: Icons.favorite_border, text: 'Use campus counseling services — they\'re confidential and free'), _InfoItem(icon: Icons.favorite_border, text: 'Sleep 7-9 hours per night'), _InfoItem(icon: Icons.favorite_border, text: 'Eat regular meals — don\'t skip breakfast'), _InfoItem(icon: Icons.favorite_border, text: 'Don\'t be afraid to ask for help')])),
        const _SectionHeader(icon: Icons.work, label: 'Career Preparation'),
        _Card(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text('Start thinking about your career from Day 1:', style: TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 14)), const SizedBox(height: 10), _InfoItem(icon: Icons.arrow_forward, text: 'Visit the Career Center early in your college career'), _InfoItem(icon: Icons.arrow_forward, text: 'Build your resume as you gain experience'), _InfoItem(icon: Icons.arrow_forward, text: 'Look for internships, even in your first or second year'), _InfoItem(icon: Icons.arrow_forward, text: 'Create a LinkedIn profile')])),
        const SizedBox(height: 30),
      ])),
    ]));
  }
}


// ── NC INSTITUTIONAL SCHOLARSHIPS DATA ─────────────────────────
const List<String> _ncColleges = [
  'Appalachian State University',
  'Barton College',
  'Belmont Abbey College',
  'Bennett College',
  'Brevard College',
  'Cabarrus College of Health Sciences',
  'Campbell University',
  'Catawba College',
  'Chowan University',
  'Davidson College',
  'Duke University',
  'East Carolina University',
  'Elizabeth City State University',
  'Elon University',
  'Fayetteville State University',
  'Gardner-Webb University',
  'Greensboro College',
  'Guilford College',
  'High Point University',
  'Johnson C. Smith University',
  'Lees-McRae College',
  'Lenoir-Rhyne University',
  'Livingstone College',
  'Louisburg College',
  'Mars Hill University',
  'Meredith College',
  'Methodist University',
  'Montreat College',
  'NC Wesleyan College',
  'North Carolina A&T',
  'North Carolina Central University',
  'North Carolina State University',
  'Pfeiffer University',
  'Queens University of Charlotte',
  'Saint Augustines University',
  'Salem College',
  'Shaw University',
  'St. Andrews University',
  'UNC Asheville',
  'UNC Chapel Hill',
  'UNC Charlotte',
  'UNC Greensboro',
  'UNC Pembroke',
  'UNC School of the Arts',
  'UNC Wilmington',
  'University of Mount Olive',
  'Wake Forest University',
  'Warren Wilson College',
  'Western Carolina University',
  'William Peace University',
  'Wingate University',
  'Winston Salem State University',
];

List<_CollegeScholarship> _getCollegeScholarships(String college) {
  switch (college) {
    case 'Appalachian State University':
      return [
        _CollegeScholarship(name: 'ACCESS Scholarship Program', amount: 'Full institutional costs, room and board, book rental, and tuition & fees up to  8 semesters', deadline: 'Automatically considered for the application if: Apply for admission by Nov. 1st, submit supplemental materials by Nov. 15th, and complete FAFSA by December 1st.', reqs: 'Available to low-income students in NC', url: 'https://scholarships.appstate.edu/first-year-students/access-scholarship-program'),
        _CollegeScholarship(name: 'Appalachian Excellence Scholarship (AES)', amount: 'Scholarship amount may vary', deadline: 'Automatically considered for the application if: Apply for admission by Nov. 1st, submit supplemental materials by Nov. 15th', reqs: 'Available to top first year students with strong academic record', url: 'https://scholarships.appstate.edu/first-year-students/appalachian-excellence-scholarship'),
        _CollegeScholarship(name: 'Signature Scholarships: Chancellors Scholarship', amount: 'full institutional costs for up to 4 years (8 consecutive semesters), including tuition and fees, room and board, and book rental, plus study abroad opportunities, numerous classroom and experienti...', deadline: 'Apply for admission by Nov. 1st, submit supplemental materials by Nov. 15th, Submit application for Signature Scholarships and Selective Academic Programs in MyMountaineer Portal', reqs: 'Must be accepted into Honors College. The academically competitive merit-based scholarship at Appalachian, designed for students with ambitious academic goals', url: 'https://scholarships.appstate.edu/first-year-students/signature-scholarships/chancellors-scholarship'),
        _CollegeScholarship(name: 'Signature Scholarships: Dr. Willie C. Flemming Scholarship', amount: 'Full in-state tuition and fees for up to 8 semesters, the scholarship provides mentorship by alumni, the opportunity to participate in inclusivity-focused events, and networking and team building w...', deadline: 'Apply for admission by Nov. 1st, submit supplemental materials by Nov. 15th, Submit application for Signature Scholarships and Selective Academic Programs in MyMountaineer Portal', reqs: 'Designed for students from underrepresented backgrounds, leadership, scholarship, community involvement and academic excellence', url: 'https://scholarships.appstate.edu/first-year-students/signature-scholarships/dr-willie-c-fleming-scholarship'),
        _CollegeScholarship(name: 'Signature Scholarships: Diversity Scholars Program', amount: 'In-state tuition and fees, leadership development workshops, mentorship opportunities, service-learning and international experiences. Full in-state tuition and fees covered for up to 8 semesters', deadline: 'Apply for admission by Nov. 1st, submit supplemental materials by Nov. 15th, Submit application for Signature Scholarships and Selective Academic Programs in MyMountaineer Portal', reqs: 'Students who show leadership potential, academic excellence, a willingness to create positive change and a commitment to the principles of diversity. Looking for students from different cultures an...', url: 'https://scholarships.appstate.edu/first-year-students/signature-scholarships/diversity-scholars-program'),
        _CollegeScholarship(name: 'Signature Scholarships: Alumni Memorial Scholarship', amount: 'USD 2,000 each year for up to 4 consecutive years (8 semesters)', deadline: 'Apply for admission by Nov. 1st, submit supplemental materials by Nov. 15th, Submit application for Signature Scholarships and Selective Academic Programs in MyMountaineer Portal', reqs: 'Available to children of alumni for Appalachian State University', url: 'https://scholarships.appstate.edu/first-year-students/signature-scholarships/alumni-memorial-scholarship'),
        _CollegeScholarship(name: 'Signature Scholarships: New River Light and Power Scholarship', amount: 'USD 2,000-4,000 each year for up to 4 consecutive years/8 semesters', deadline: 'Apply for admission by Nov. 1st, submit supplemental materials by Nov. 15th, Submit application for Signature Scholarships and Selective Academic Programs in MyMountaineer Portal', reqs: 'Awarded to incoming first-year high school students from Watauga County', url: 'https://scholarships.appstate.edu/first-year-students/signature-scholarships/new-river-light-and-power-scholarship-0'),
        _CollegeScholarship(name: 'Signature Scholarships: Beaver College of Health Sciences', amount: 'USD 10,000 for up to 4 years (8 consecutive semesters)', deadline: 'Apply for admission by Nov. 1st, submit supplemental materials by Nov. 15th, Submit application for Signature Scholarships and Selective Academic Programs in MyMountaineer Portal', reqs: 'Beaver College of Health Sciences:                           High-achieving student committed to a career in the health sciences and in direct patient care environments', url: 'https://scholarships.appstate.edu/first-year-students/signature-scholarships/beaver-college-health-sciences'),
        _CollegeScholarship(name: 'Signature Scholarships: Reich College of Education', amount: 'USD 500-USD 5,000', deadline: 'Apply for admission by Nov. 1st, submit supplemental materials by Nov. 15th, Submit application for Signature Scholarships and Selective Academic Programs in MyMountaineer Portal', reqs: 'Reich College of Education:                                 Incoming first-year education majors', url: 'https://scholarships.appstate.edu/first-year-students/signature-scholarships/reich-college-education'),
        _CollegeScholarship(name: 'Signature Scholarships: Walker College of Business', amount: 'USD 500-USD 5,000', deadline: 'Apply for admission by Nov. 1st, submit supplemental materials by Nov. 15th, Submit application for Signature Scholarships and Selective Academic Programs in MyMountaineer Portal', reqs: 'Walker College of Business:                                    Variety of scholarships to incoming first-year students pursuing a major within the Walker College of Business', url: 'https://scholarships.appstate.edu/first-year-students/signature-scholarships/walker-college-business'),
        _CollegeScholarship(name: 'College and Departmental Scholarships: Hayes School of Music', amount: 'USD 500-USD 10,000', deadline: 'Incoming students must audition for the Hayes School of Music and submit supplemental materials. See Hayes website for audition and audition process. Auditions are typically from January-March', reqs: 'Incoming students in the Hayes School of Music', url: 'https://scholarships.appstate.edu/first-year-students/college-and-departmental-scholarships/hayes-school-music'),
        _CollegeScholarship(name: 'College and Departmental Scholarships: Plemmons Leadership Scholarship', amount: 'USD 2,000 a year. Up to USD 8,000 total.', deadline: 'Review requirements, apply via website, attend info sessions and receive an invitation to participate in the program', reqs: 'Cohort based, 4-year program. Focused on academics and leadership. Must maintain 3.0 gpa.', url: 'https://scholarships.appstate.edu/first-year-students/college-and-departmental-scholarships/plemmons-leadership-scholarship'),
      ];
    case 'East Carolina University':
      return [
        _CollegeScholarship(name: 'ECU Scholarships', amount: 'Scholarship amounts vary', deadline: 'Dates Vary. Must apply through the ECUAward Scholarship Portal. Includes departmental, college and general scholarships. Use keyword search to find specific scholarships. Review info on website in ...', reqs: 'Requirements vary', url: 'https://ecu.academicworks.com/'),
        _CollegeScholarship(name: 'Honors College: EC Scholars', amount: '~USD 63,000: Includes In-state tuition, USD 5,000 a semester for up to 8 semester, and USD 5,000 to study abroad', deadline: 'Apply to ECU by October 18th, apply for Honors College and EC Scholars by November 15th.', reqs: 'Must be invited to apply for EC Scholars, Honors College and accepted into Honors College. 3.5 unweighted/4.0 weighted GPA', url: 'https://ecscholars.ecu.edu/'),
        _CollegeScholarship(name: 'Honors College: Chancellors Fellows', amount: 'In-state tuition for 8 semesters and benefits received as an Honors College student', deadline: 'Apply to ECU by October 18th and apply for Honors College and other special programs by November 15th.', reqs: 'Must be invited to apply Honors College and accepted into Honors College. 3.5 unweighted/4.0 weighted GPA', url: 'https://honors.ecu.edu/about/scholarship/'),
        _CollegeScholarship(name: 'Honors College: Centennial Fellows', amount: 'USD 2,500 a year for four years and benefits received as an Honors College student', deadline: 'Apply to ECU by October 18th and apply for Honors College and other special programs by November 15th.', reqs: 'Must be invited to apply for Honors College and accepted into Honors College. 3.5 unweighted/4.0 weighted GPA', url: 'https://honors.ecu.edu/about/scholarship/'),
        _CollegeScholarship(name: 'Honors College:  Discipline Scholars', amount: 'Additional scholarships in addition to Honors College and/or EC Scholars', deadline: 'Apply to ECU by October 18th and apply for Honors College and other special programs by November 15th.', reqs: 'Must be invited to apply for Honors College and accepted into Honors College. 3.5 unweighted/4.0 weighted GPA. This is for students who are majoring in business, humanities, music or social sciences', url: 'https://honors.ecu.edu/admissions/discipline-scholars/'),
      ];
    case 'Elizabeth City State University':
      return [
        _CollegeScholarship(name: 'Institutional Scholarships: Endowed, Alumni and Athletic', amount: 'Scholarship amounts vary', deadline: 'Scholarship Application must be submitted by April (Date has not been updated)', reqs: 'Complete the FAFSA, accepted and enrolled full time, demonstrate potential to contribute to FSU community, 3.0 GPA. Endowed, Alumni and Athletic Scholarships are available.', url: 'https://www.uncfsu.edu/paying-for-college/scholarships-(paying-for-college)/institutional-scholarships-list'),
      ];
    case 'Fayetteville State University':
      return [
        _CollegeScholarship(name: 'Chancellors Academic Scholarship', amount: 'Fully funded for four years.', deadline: 'January 15th', reqs: 'Students who represent ECSUs core values of and commitment to excellence, accountability diversity and ECSUs motto. Competitive applicant, 3.5 gpa unweighted, leadership, academics, extracurricular...', url: 'https://www.ecsu.edu/academics/enrollment-management-retention/financial-aid/chancellors-scholarship.html'),
        _CollegeScholarship(name: 'UNC Campus Based Scholarship', amount: 'Up to USD 2,500 a year for up to 8 semesters. Will be applied after need-based aid has been awarded.', deadline: 'Website does not state, but may be automatically eligible if you meet the criteria', reqs: 'Cumulative weighted 2.5 gpa, agree to participate in First Year Experience, complete the FAFSA, demonstrate financial need, show high moral and ethical standards', url: 'https://www.ecsu.edu/academics/enrollment-management-retention/financial-aid/unc-campus-base-scholarship.html'),
      ];
    case 'North Carolina A&T':
      return [
        _CollegeScholarship(name: 'National Alumni Scholarship', amount: 'Full tuition, related fees, and room and board for up to 4 years', deadline: 'Apply to NCAT by October 15th to be automatically considered (website includes Oct 15 and Nov 15. Suggest to apply by Oct. 15)', reqs: 'Apply by the priority deadline (October 15), 3.5 GPA, along with application materials, US citizen', url: 'https://www.ncat.edu/admissions/financial-aid/types-of-aid/scholarships/freshmen-scholarships.php'),
        _CollegeScholarship(name: 'Lewis and Dowdy Scholarship', amount: 'Full 4-year renewable scholarship which includes tuition and related fees, room and board (standard double occupancy). Scholars may also use award funds to travel abroad during the fall and spring ...', deadline: 'Apply to NCAT by October 15th to be automatically considered (website includes Oct 15 and Nov 15. Suggest to apply by Oct. 15)', reqs: '3.75 gpa weighted, leadership & service, US citizen or eligible non-citizen', url: 'https://www.ncat.edu/academics/honors/cheatham-white-scholars.php'),
        _CollegeScholarship(name: 'Cheatham-White Scholars', amount: 'Fully funded for four years:  tuition, fees, housing, meals, textbooks, laptop, travel, personal expenses, and the potential of international study and travel', deadline: 'Apply to NCAT and submit scholarship application by October 15th. School nomination or self-nomination by November 1st. Submit scholarship application with supplemental materials by December 1st.', reqs: '4.0 weighted gpa, character, leadership, extracurricular activities and service', url: 'https://www.ncat.edu/academics/honors/cheatham-white-scholars.php'),
        _CollegeScholarship(name: 'Merit Scholarships', amount: 'Amount varies based on criteria and funding', deadline: 'Apply for early admission (website includes Oct 15 and Nov 15. Suggest to apply by Oct. 15) No additional application is required.', reqs: 'Based on academic achievement demonstrated in application', url: 'https://www.ncat.edu/admissions/financial-aid/types-of-aid/scholarships/freshmen-scholarships.php'),
        _CollegeScholarship(name: 'Endowment Scholarships', amount: 'Varies based on funding each year', deadline: 'Website does not state, but may be automatically eligible if you meet the criteria', reqs: 'Awarded based on range of criteria: major, high school, academic achievement, community service, leadership, and/or financial need', url: 'https://www.ncat.edu/admissions/financial-aid/types-of-aid/scholarships/endowed-scholarships.php'),
        _CollegeScholarship(name: 'College and Departmental', amount: 'Scholarship amounts vary depending on funding, department and criteria', deadline: 'Must be admitted to NCAT and complete Aggie Scholarship Application Portal by March 15th. Portal opens in February.', reqs: 'Commonly offered to continuing students, but first year students may be considered depending on department and criteria.', url: 'https://www.ncat.edu/academics/colleges-departments/index.php'),
        _CollegeScholarship(name: 'NC A&T Alumni Scholarships', amount: 'Scholarship amounts vary depending on the alumni chapter', deadline: 'Scholarship deadlines vary depending on the alumni chapter. Reach out to local chapter for details.', reqs: 'Requirements vary depending in the scholarship. Based on leadership, academics, involvement, and geographical location', url: 'https://www.ncat.edu/academics/colleges-departments/index.php'),
      ];
    case 'North Carolina Central University':
      return [
        _CollegeScholarship(name: 'Cheatham-White Scholars', amount: 'Full tuition and fees, housing, meals, books, laptop, travel expenses, 4 summers of fully funded enrichment and networking opportunities', deadline: 'Must be nominated from their school or self-nominated. Nomination process must be completed before application can be submitted. Nomination by November 15 and scholarship application by December 15.', reqs: 'Must be accepted into NCCU as full-time student, 4.0 gpa, character, leadership, service, extracurricular activities, and US citizen or permanent resident', url: 'https://www.nccu.edu/usp/cheatham-white-scholarship-program'),
        _CollegeScholarship(name: 'Chancellor Cycle of Success Scholarships: Eagle in Flight, Rising Eagle, Soaring Eagle', amount: 'USD 2,500-USD 7,500', deadline: 'Confirmed enrolled at NCCU. Chancellor’s Scholarships are not applied for but offered to selected students based upon minimum eligibility requirements.  It is then up to the student to accept or de...', reqs: '3.3 gpa, Academic excellence, Full time enrollment, complete FAFSA', url: 'https://www.nccu.edu/chancellors-cycle-success-scholarship'),
        _CollegeScholarship(name: 'University Scholarships', amount: 'Scholarship amounts may vary', deadline: 'Deadlines may vary depending on scholarship. May require to apply through general application and additional requirements. View website for additional details', reqs: 'Academic excellence', url: 'https://nccu.academicworks.com/'),
      ];
    case 'North Carolina State University':
      return [
        _CollegeScholarship(name: 'Park Scholarship', amount: 'Four year scholarship valued at USD 116,000 for NC students. Includes tuition, room and board, books, travel and personal expenses, an grant to fund enrichment experiences, and invitation to Honors...', deadline: 'School endorsement by October 15, self-endorsement by November 1, and apply for early action admission by November 1 and indicate early action on application', reqs: 'Based on scholarship, leadership, and service and character. US citizen or permanent resident.', url: 'https://park.ncsu.edu/'),
        _CollegeScholarship(name: 'General Hugh Shelton Leadership Initiative Scholarship', amount: 'USD 5,000/year and USD 2,000/year for enrichment experiences', deadline: 'Apply for early admission by November 1 and indicate early action. Committee will select students in November to offer and invite to apply for scholarship based on their admission application', reqs: 'Accepted as full time student. Leadership, character, service, personal growth, physical fitness and wellness, understanding and commitment to the scholarship program.', url: 'https://sheltonleadership.ncsu.edu/college-programs/scholarships/'),
        _CollegeScholarship(name: 'Chancellors Leadership Scholarship', amount: 'USD 5,000/year', deadline: 'Apply through general application on PACK ASSIST', reqs: '3.0 GPA. Demonstrated leadership potential, academic achievement, personal talent, unique work/service experience and an understanding of and an appreciation for diversity,  financial need', url: 'https://ncsu.academicworks.com/opportunities/132549'),
        _CollegeScholarship(name: 'Goodnight Scholars Program', amount: 'Tuition and fees, housing and meals up to USD 21,000/year', deadline: 'Submit admission application by November 1 and will receive a nomination if criteria is met. Self-nomination forms are open on November 1. Scholarship application due January 10. Submit the FAFSA. ...', reqs: 'Family income under USD 110,000, STEM or STEM education major,', url: 'https://goodnight.ncsu.edu/'),
        _CollegeScholarship(name: 'College, Departmental and Employer Affiliated Scholarships', amount: 'Varies depending on funding, department and criteria', deadline: 'Visit PACK ASSIST website. Scholarship applications open December 1. Complete the FAFSA.', reqs: 'Varies depending on funding, department and criteria', url: 'https://studentservices.ncsu.edu/your-money/financial-aid/types/scholarships/#freshmen'),
        _CollegeScholarship(name: 'John Gaitling Grant', amount: 'Varies depending on funding', deadline: 'Applications open December 1st.', reqs: 'Students with last name Gaitling or Gaitlin. Must provide birth certificate proving spelling of last name. Enrolled full time and remain in undergraduate program pursuing first undergraduate degree', url: 'https://ncsu.academicworks.com/opportunities?utf8=%E2%9C%93&term=gatling&commit=Search'),
        _CollegeScholarship(name: 'ROTC Funding: Army, Navy, Air Force', amount: '', deadline: 'Review the website for more information about ROTC at NC State', reqs: '', url: 'https://dasa.ncsu.edu/career-and-leadership/rotc/'),
        _CollegeScholarship(name: 'Children of Fallen Heroes Scholarships', amount: 'Varies depending on funding', deadline: 'Submit scholarship application provided on NC State scholarships website', reqs: 'Offered to Pell Grant eligible students whose parent or guardian was a public safety officer or fire police officer and died in the line of duty. Students must be under 24 years old or enrolled in ...', url: 'https://studentservices.ncsu.edu/forms/financialaid/Noyear/Children%20of%20Fallen%20Heroes.pdf'),
        _CollegeScholarship(name: 'PACK ASSIST Scholarship application Portal', amount: '', deadline: 'Applications open December 1st.', reqs: '', url: 'https://ncsu.academicworks.com/opportunities?utf8=%E2%9C%93&term=chancellor%27s+leadership&commit=Search'),
      ];
    case 'UNC Asheville':
      return [
        _CollegeScholarship(name: 'University Merit Award', amount: 'Varies depending on funding', deadline: 'The University Merit Award is a comprehensive scholarship program offered to first-time applicants. Students may be considered for the University Merit Award if they meet some or all of the criteria', reqs: 'Academic excellence based on gpa and/or test scores, service, extracurriculars, leadership and interest in programs offered and UNCA', url: 'https://www.unca.edu/admission/financial-aid/types-of-aid/scholarships/'),
        _CollegeScholarship(name: 'Alumni Referral Scholarship', amount: '1000', deadline: 'January', reqs: 'Alumnus/a are able to refer any incoming student to receive the scholarship.', url: 'https://www.unca.edu/admission/financial-aid/types-of-aid/alumni-referral-scholarship/'),
        _CollegeScholarship(name: 'Department Scholarships', amount: 'Varies depending on funding, department and criteria', deadline: 'Review the general scholarship page and each departments website for details', reqs: 'Varies depending on funding, department and criteria', url: 'https://www.unca.edu/admission/financial-aid/types-of-aid/scholarships/'),
        _CollegeScholarship(name: 'Weatherhead Scholarship', amount: 'Funding for tuition, room and board, and transportation assistance as needed', deadline: 'The University Merit Award is a comprehensive scholarship program offered to first-time applicants. Students may be considered for the University Merit Award if they meet some or all of the criteria', reqs: 'Award offered to Asian students', url: 'https://www.unca.edu/admission/financial-aid/types-of-aid/scholarships/'),
        _CollegeScholarship(name: 'UNC Asheville University Scholars Program', amount: 'Up to USD 10,000 per year along with additional funding of USD 10,000 to support high-impact learning opportunities such as study abroad, undergraduate research, and internships.', deadline: 'Students must be nominated by a counselor/leader and applied for admission to the  university by January 1st.', reqs: 'Academic accomplishments', url: ''),
      ];
    case 'UNC Chapel Hill':
      return [
        _CollegeScholarship(name: 'Academic Scholarships', amount: 'Amount may vary', deadline: 'No additional application is required. Advised to submit FAFSA by January 10. List of scholarships are at the bottom of Academic scholarship page.', reqs: 'All admitted students are automatically considered. Some academic scholarships may take need into consideration.', url: 'https://studentaid.unc.edu/incoming/what-aid-is-available/scholarships/'),
        _CollegeScholarship(name: 'Carolina Covenant', amount: 'Fully financial need through grants, scholarships and work study.', deadline: 'Must complete FAFSA on time each year. Automatically considered for scholarship. No additional application required.', reqs: 'Total family income that is at or below 200% of the poverty guideline based on family size.', url: 'https://studentaid.unc.edu/incoming/what-aid-is-available/carolina-covenant/'),
        _CollegeScholarship(name: 'Kenan Music Scholars Program', amount: 'Four-year full-tuition scholarship (including student fees, room, and board) and additional financial support for musical enrichment activities', deadline: 'Apply to the university (encouraged to apply by the early action deadline) and submit online audition request form. Submit FAFSA and CSS profile by March 1st. Auditions begin in November', reqs: 'Music Majors', url: 'https://kenanmusicscholars.unc.edu/'),
        _CollegeScholarship(name: 'Thomas Wolfe Scholarship for Creative Writing', amount: 'Full four-year financial support', deadline: 'Apply to the university by October 15th and indicate early action and apply to the scholarship by November 15.', reqs: 'Artistic Merit', url: 'https://englishcomplit.unc.edu/creative-writing/scholarships-and-awards/the-thomas-wolfe-scholarship/'),
        _CollegeScholarship(name: 'Chancellors Science Scholarship', amount: '10000 for 4 years or up to 8 semesters', deadline: 'Apply by October 15th Early Action application deadline. Complete the Excel@Carolina survey found in the Common Application’s UNC supplement, and select Chancellor’s Science Scholars as one of your...', reqs: 'Academic Excellence, research, inclusion, and community, grit and resilience', url: 'https://chancellorssciencescholars.unc.edu/'),
        _CollegeScholarship(name: 'Morehead Cain', amount: 'Four-year, fully funded educational experience and summer enrichment experiences', deadline: 'Nomination from high school by September 14. Can also self nominate by the application deadline. Apply by to the university by October 15th and complete online Morehead Cain application.', reqs: 'Scholarship, leadership, character, and physical vigor', url: 'http://www.moreheadcain.org/'),
        _CollegeScholarship(name: 'Robertson Scholarship', amount: 'Cannot apply if applying for the Morehead Cain. If 8 semesters of full tuition, room and board, and most mandatory fees for Scholars at Duke and UNC-Chapel Hill. Additional funding for up to three ...', deadline: 'Apply through separate application due November 15. Can apply regular or early decision admission.', reqs: 'Leadership, intellectual curiosity, character and collaborative spirit.  There is one application for all High School students regardless of nationality or citizenship. It is the responsibility of ...', url: 'https://robertsonscholars.org/'),
      ];
    case 'UNC Charlotte':
      return [
        _CollegeScholarship(name: 'Levine Scholarship', amount: 'Four year scholarship valued at around USD 105,000. Award includes  full tuition, room, board, a grant to implement a service project of the Scholar’s own design, and four summers of experiences th...', deadline: 'School or self-nomination due October 8. Apply for admission by November 1. Recommendations and Levine Scholarship supplemental application due by November 16.', reqs: 'Students must excel academically and show evidence of experience, motivation and commitment toward the ideals of the program. Committee is looking for intellectual curiosity, academic excellence, e...', url: 'https://levinescholars.uncc.edu/'),
        _CollegeScholarship(name: 'UNC Charlotte Scholarships', amount: 'Scholarship amounts vary depending on funding, department and criteria', deadline: 'Students should create a profile on the NinersScholars Portal.', reqs: 'Scholarships available are based on merit and need', url: 'https://ninerscholars.uncc.edu/scholarshipsearch/'),
      ];
    case 'UNC Greensboro':
      return [
        _CollegeScholarship(name: 'Blue and Gold Scholarships', amount: 'Scholarship amounts range in value and duration. Many are one-year scholarships while others are renewable based on academic achievement and other criteria', deadline: 'Submit application for admission by January 15. Will automatically be considered for scholarships. Will be notified by the end of January and only eligible to receive one of the B&G scholarships', reqs: 'Merit-based scholarships. Academically talented incoming freshmen', url: 'https://admissions.uncg.edu/costs-aid/scholarships/'),
        _CollegeScholarship(name: 'Chancellor and Spartans Scholarships', amount: 'Funds toward your financial aid package, which will be applied directly to your university bill during each semester’s financial aid disbursement', deadline: 'Submit application for admission by January 15 and the FAFSA. No additional application is required and students will be notified by the end of January', reqs: 'A select number of students who show academic merit and have financial need', url: 'https://admissions.uncg.edu/costs-aid/scholarships/'),
        _CollegeScholarship(name: 'Say Yes to UNCG', amount: 'Last-dollar tuition assistance after all federal, state, and institutional grants and scholarship are applied', deadline: 'Submit application for admission within 15 months of high school graduation, complete the FAFSA, complete and submit a Say Yes Guilford County Tuition Scholarship Application, along with all other ...', reqs: 'Graduates of the Guilford County School System who meet federal aid standards. Amount depends on the number of consecutive years attended a Guilford County public school through grade 12', url: 'https://admissions.uncg.edu/costs-aid/scholarships/'),
        _CollegeScholarship(name: 'UNCG Guarantee', amount: 'Up to the standard costs of COA, which include tuition and fees, room and board, and other educational experiences. Goal is to provide a financial aid package for students to leave UNCG with minima...', deadline: 'Must apply to the university by January 1st. If eligible, students will receive an email with a link to apply.', reqs: 'High-achieving, low-income (EFC = 0) N.C. residents who plan to enroll in UNCG as full-time students. 3.8 GPA', url: 'https://guarantee.uncg.edu/apply/'),
        _CollegeScholarship(name: 'Science, Technology, And Math Preparation Scholarships (STAMPS 3.0)', amount: 'USD 4,616 per year, based on financial need', deadline: 'Deadline to apply to the program is March 15. Eligible students will receive an invitation to apply for the STAMPS 3.0 scholarship program.', reqs: 'Pell-eligible students with a 3.0 or higher GPA who is planning to major in Biology, Chemistry & Biochemistry, Computer Science, Geography, Mathematics, or Physics', url: 'https://admissions.uncg.edu/costs-aid/scholarships/'),
      ];
    case 'UNC Pembroke':
      return [
        _CollegeScholarship(name: 'Brave ASSIST: A Student Scholarship Interactive Search Tool', amount: 'Varies depending on funding, department and criteria', deadline: 'Log in to portal to view available scholarships. Auto-match Scholarships: All current and newly-admitted students are considered for auto-match scholarships based on information imported from their...', reqs: 'Varies depending on funding, department and criteria', url: 'https://www.uncp.edu/admissions/costs-and-financial-aid/brave-assist-student-scholarship-interactive-search-tool'),
        _CollegeScholarship(name: 'UNC Pembroke Scholarship website: List of education scholarships and access to Cumberland County Foundation', amount: '', deadline: 'Check website for updates', reqs: '', url: 'https://www.uncp.edu/academics/colleges-schools/school-education/scholarships-and-grants'),
      ];
    case 'UNC School of the Arts':
      return [
        _CollegeScholarship(name: 'Kenan Excellence Scholarship', amount: 'Full tuition, fees, and room and board and is renewable for all four years of undergraduate education', deadline: 'The dean of each of the five arts schools nominates two excellent candidates for the KES each Spring term from among their best new admittees to the university', reqs: 'Merit-based scholarship', url: 'https://www.uncsa.edu/mysa/current-students/academics/fellowship-grants-awards/kenan-scholarship/index.aspx'),
        _CollegeScholarship(name: 'Stanley M. Zedalis Military Affiliated Student Scholarship', amount: '500', deadline: 'May 15th. Complete separate application on Stanley M. Zedalis Military Affiliated Student Scholarship website', reqs: '1st and 2nd choice preference is given to veterans, but military dependents are also eligible to apply. The scholarship is open to all U.S. military connected UNCSA graduate, undergraduate and high...', url: 'https://www.uncsa.edu/mysa/current-students/academics/fellowship-grants-awards/zedalis-application.aspx'),
      ];
    case 'UNC Wilmington':
      return [
        _CollegeScholarship(name: 'UNC Wilmington merit and need-based scholarships', amount: 'Scholarship amounts may vary', deadline: 'Each year, the application is open December 1 through the priority date of March 1. To improve chances for consideration of need-based scholarships, students should complete the FAFSA by January 1st.', reqs: 'Available scholarships include both merit and need based scholarships', url: 'https://uncw.edu/finaid/scholarships.html'),
        _CollegeScholarship(name: 'SOAR Ambassador Program', amount: 'In-state tuition and fees plus additional USD 1,000 during sophomore - senior years.', deadline: 'To apply for the SOAR Ambassador Scholarship, complete the SOAR specific questions on the UNCW Scholarships website', reqs: 'High school academic achievement, standardized test score performance, and participation in extracurricular activities during high school. Family income is within 200% of the Federal guidelines', url: 'https://uncw.edu/finaid/soar.html'),
      ];
    case 'Winston Salem State University':
      return [
        _CollegeScholarship(name: 'WSSU Merit Scholarships', amount: 'Scholarship amounts may vary', deadline: 'Complete Merit Scholarship application by December 1st.', reqs: 'Admitted to WSSU, 3.75 gpa, top 25% of class', url: 'https://www.wssu.edu/admissions/scholarships-and-financial-aid/scholarships/index.html'),
      ];
    case 'Western Carolina University':
      return [
        _CollegeScholarship(name: 'Merit-based and need-based scholarships', amount: 'Scholarship amounts may vary', deadline: 'The general scholarship application is required for consideration for these scholarships. Students also must submit the FAFSA by January 1 each year in order to be considered for need-based scholar...', reqs: 'Some of these scholarships are based on financial need and others are based on merit. Many scholarships also have criteria related to program of study, county of residence, or leadership and involv...', url: 'https://www.wcu.edu/apply/scholarships/wcu-scholarships.aspx'),
        _CollegeScholarship(name: 'Academic Scholarships', amount: 'Scholarship amounts may vary', deadline: 'Once students have been admitted to the university, they are automatically considered for Brinson Honors College scholarships and Chancellors Series scholarships. Offers to new freshmen begin in th...', reqs: 'Consideration is based on academic records submitted during the admission process.', url: 'https://www.wcu.edu/apply/scholarships/wcu-scholarships.aspx'),
      ];
    case 'Barton College':
      return [
        _CollegeScholarship(name: 'Opportunity Award, John J. Harper Scholarship, Barton W. Stone Scholarship, Presidential Scholarship, Trustee Scholarship', amount: 'USD 5,000/year - 14,000/year', deadline: 'To qualify for awards and scholarships, you must apply for admission to Barton. Scholarship awards are based only on official transcripts and test scores. No additional scholarship applications are...', reqs: 'GPA Varies', url: 'https://www.barton.edu/financial-aid/scholarships-and-grants/'),
        _CollegeScholarship(name: 'Alumni Scholarship', amount: 'USD 1,000/year', deadline: 'Reach out to financial aid/admission counselor for more information. Indicate on admission application', reqs: 'Dependent of a Barton graduate,', url: 'https://www.barton.edu/financial-aid/scholarships-and-grants/'),
        _CollegeScholarship(name: 'Multiple Family Member Scholarship', amount: '1000', deadline: 'Reach out to financial aid/admission counselor for more information. Indicate on admission application', reqs: 'Awarded to the second and subsequent family member enrolled at Barton. The additional family member must be a dependent of the same household, and both students must be enrolled on a full-time basis', url: 'https://www.barton.edu/financial-aid/scholarships-and-grants/'),
        _CollegeScholarship(name: 'Whitehurst Family Honors Program Scholarship', amount: 'Scholarship amounts may vary', deadline: 'Initiation only scholarship competition.', reqs: '3.5 unweighted gpa. 1200 SAT/24 ACT', url: 'https://www.barton.edu/financial-aid/scholarships-and-grants/freshman-scholarships/'),
      ];
    case 'Belmont Abbey College':
      return [
        _CollegeScholarship(name: 'Merit Scholarships', amount: 'USD 2,000-USD 5,000', deadline: 'Merit Awards are automatically awarded based off of transcripts and are not stackable with Honors and Premier Scholarships.', reqs: '2.75-3.5 gpa', url: 'https://belmontabbeycollege.edu/financial-aid/#awards'),
        _CollegeScholarship(name: 'Honors College', amount: 'USD 8,500/year', deadline: 'Apply online for one premier scholarship online (honors, St. Thomas, Felix Hintemeyer, Curlin). Merit, honors and premier scholarships are not stackable.', reqs: '3.5 unweighted gpa', url: 'https://belmontabbeycollege.edu/financial-aid/#scholarships'),
        _CollegeScholarship(name: 'Curlin Scholars Program', amount: 'USD 7,500/year', deadline: 'Apply online for one premier scholarship online (honors, St. Thomas, Felix Hintemeyer, Curlin). Merit, honors and premier scholarships are not stackable.', reqs: '3.5 unweighted gpa', url: 'https://belmontabbeycollege.edu/financial-aid/#scholarships'),
        _CollegeScholarship(name: 'St. Thomas More Scholarship', amount: 'USD 5,500/year', deadline: 'Apply online for one premier scholarship online (honors, St. Thomas, Felix Hintemeyer, Curlin). Merit, honors and premier scholarships are not stackable.', reqs: '3.3 unweighted gpa', url: 'https://belmontabbeycollege.edu/financial-aid/#scholarships'),
        _CollegeScholarship(name: 'Father John Ortegen Scholarship', amount: 'USD 5,500/year', deadline: 'Apply online for one premier scholarship online (honors, St. Thomas, Felix Hintemeyer, Curlin). Merit, honors and premier scholarships are not stackable.', reqs: '3.75 unweighted gpa', url: 'https://belmontabbeycollege.edu/financial-aid/#scholarships'),
        _CollegeScholarship(name: 'Hintemeyer Catholic Leadership Award', amount: 'USD 6,500/year', deadline: 'Apply online for one premier scholarship online (honors, St. Thomas, Felix Hintemeyer, Curlin). Merit, honors and premier scholarships are not stackable.', reqs: '3.2 unweighted gpa', url: 'https://belmontabbeycollege.edu/financial-aid/#scholarships'),
      ];
    case 'Bennett College':
      return [
        _CollegeScholarship(name: 'Spirit, Promise, Leader, Excellence, Presidential, Illustrious Belle Scholarships', amount: 'Reach out to Office of Admissions for more info', deadline: 'Scholarships are often based upon criteria set by the donor, unmet need, merit, and funding availability. Scholarship inquiries for new students should be directed to the Office of Admission', reqs: '2.5-2.9, 3.0-3.25, 3.26-3.49, 3.5-3.79, 3.8 & up, 4.0 & up', url: 'https://www.bennett.edu/admissions/financial-aid/types-of-financial-aid/'),
      ];
    case 'Brevard College':
      return [
        _CollegeScholarship(name: 'Half-Tuition Scholarship', amount: 'Half-tuition', deadline: 'Automatically admitted when accepted as a student', reqs: 'Available to all high school students applying from NC', url: 'https://brevard.edu/scholarships-grants/'),
        _CollegeScholarship(name: 'Merit Scholarships', amount: 'USD 11,000-USD 13,000', deadline: 'Application for admission serves as scholarship application. Admissions counselor will notify of Merit Scholarship eligibility', reqs: 'Admissions counselor will notify of Merit Scholarship eligibility', url: 'https://brevard.edu/scholarships-grants/'),
        _CollegeScholarship(name: 'Honors Scholarships', amount: 'USD 1,000/year', deadline: 'Complete application for admission and Honors Program application', reqs: 'Rigor and leadership involvement', url: 'https://brevard.edu/honors-program/'),
        _CollegeScholarship(name: 'Institute for Women in Leadership', amount: 'USD 1,000/year', deadline: 'Apply online for leadership program and application for admission', reqs: 'Leadership, community', url: 'https://brevard.edu/institute-for-women-in-leadership-application/'),
      ];
    case 'Cabarrus College of Health Sciences':
      return [
        _CollegeScholarship(name: 'Endowed, Community, and Foundation Scholarships', amount: 'Amount varies from year to year based on funding and organizations', deadline: 'Reach out to admissions or financial aid office for more information. The Endowed Scholarship application is emailed to all currently enrolled students on their Cabarrus College email before April ...', reqs: 'Combination of criteria including financial need, instructor recommendation, merit, essay response and club and activity participation as well as program of study', url: 'https://atriumhealth.org/education/cabarrus-college-of-health-sciences/financial-information/scholarships'),
      ];
    case 'Campbell University':
      return [
        _CollegeScholarship(name: 'Institutional Merit Scholarships', amount: 'Scholarship amounts vary with gpa', deadline: 'Automatically applied when applying for admission', reqs: 'Based on merit', url: 'https://www.campbell.edu/financial-aid/scholarships/'),
        _CollegeScholarship(name: 'Departmental Endowed Scholarship', amount: 'Amounts vary based on departments, donors, and funding', deadline: 'You must review and select up to two endowment scholarships to apply for before completing the online application. Application closes May 1.', reqs: 'Main campus, full-time, donor eligibility requirements (need, academics, church membership, residence), conduct, community service', url: 'https://www.campbell.edu/financial-aid/scholarships/endowed-scholarships/'),
        _CollegeScholarship(name: 'Letti Pate Whitehead Foundation Scholarship', amount: 'Amounts vary based on funding', deadline: 'Apply online through scholarship application', reqs: 'Christian woman, live on main campus, full-time student, 2.0 gpa, financial need demonstrated through the FAFSA', url: 'https://www.campbell.edu/financial-aid/scholarships/sponsored-scholarships/'),
        _CollegeScholarship(name: 'Roy L. Marshall Scholarship', amount: 'Amounts vary based on funding', deadline: 'Apply online through scholarship application', reqs: 'Financial need demonstrated through FAFSA, personally responsible for 20% of tuition, 2.0 gpa, live on main campus, full-time student, cannot be award to law or legal studies', url: 'https://www.campbell.edu/financial-aid/scholarships/sponsored-scholarships/'),
      ];
    case 'Catawba College':
      return [
        _CollegeScholarship(name: 'Socratic Scholarship', amount: 'Full-tuition Scholarship', deadline: 'Must be admitted by October 25. Students will be invited to compete for a full-tuition scholarship on the basis of their high school gpa. Once a student is accepted and invited to participate in th...', reqs: '4.0 weighted or 3.5 unweighted', url: 'https://catawba.edu/about/offices/finaid/types-financial-aid/scholarships/merit-scholarships/socratic-scholarships/'),
        _CollegeScholarship(name: 'Spirit of Catawba Scholarship', amount: 'Full-tuition scholarship', deadline: 'Must be admitted by February 18. Students may be nominated by school officials, community members or admissions counselors. Once a student is accepted and invited to participate in the competition,...', reqs: 'Students who excel in two or more of the primary values of Catawba: Scholarship, Character, Culture, and Service. ed a new club at their school, excelled as a leader in their school or community, s...', url: 'https://catawba.edu/about/offices/finaid/types-financial-aid/scholarships/merit-scholarships/spirit-catawba-scholarship/'),
        _CollegeScholarship(name: 'Merit Scholarships: Presidential, Trustees, Deans, Pillars, and Founders Scholarships', amount: 'USD 8,000-USD 20,000/year', deadline: 'All undergraduate, day students are automatically considered for merit scholarships once they are admitted to Catawba College. Students are also encouraged to file the FAFSA', reqs: 'Awarded based on a combination of SAT or ACT Composite Score & weighted academic grade point average for first-year students', url: 'https://catawba.edu/about/offices/finaid/types-financial-aid/scholarships/merit-scholarships/'),
        _CollegeScholarship(name: 'Major-based Departmental Scholarships', amount: 'Amount varies up to USD 5,000/year', deadline: 'Apply through each departmental website', reqs: 'Based on major, gpa and sat/act criteria within each department', url: 'https://catawba.edu/about/offices/finaid/types-financial-aid/scholarships/departmental-scholarships/'),
        _CollegeScholarship(name: 'Need-based Scholarships', amount: 'Amount varies', deadline: 'As a college recognized for serving a high percentage of low-income and first-generation students, the Financial Aid Office may award a Catawba Need-Based Scholarship in order to help students cove...', reqs: 'Eligibility for the Catawba Need-Based Scholarship is determined by using information from the FAFSA and would be included in a student’s original Financial Aid Award Package, if eligible. Students...', url: 'https://catawba.edu/about/offices/finaid/types-financial-aid/scholarships/catawba-need-based-scholarships/'),
        _CollegeScholarship(name: 'Freshman Scholarships: Athletic, Band, Cheering, Girls State and Boys State, Valedictorian and Salutatorian, Summer Discover Program', amount: 'Amount varies up to USD 12,000', deadline: 'Review website for requirements', reqs: 'Review website for requirements', url: 'https://catawba.edu/about/offices/finaid/types-financial-aid/scholarships/other-scholarships/'),
      ];
    case 'Chowan University':
      return [
        _CollegeScholarship(name: 'Chowan Merit Scholarship: Opportunity, University, Alumni, President', amount: 'USD 4,000, USD 6,000, USD 7,000, USD 9,000/year', deadline: 'At Chowan University, we recognize and reward the hard work and talent of our students. Accepted students are automatically considered. To apply, complete the application for admission, submit your...', reqs: 'Based on gpa and test scores', url: 'https://chowan.edu/admissions/financial-aid/scholarships-grants'),
        _CollegeScholarship(name: 'Chowan Scholarships: Trustees, Dean, Leadership', amount: 'USD 1,000, USD 3,000, USD 6,000/year', deadline: 'A short application, essay, and on-campus interview are required. Interviews are held on select dates in November, January, February, and March. Your completed application is your registration for ...', reqs: 'You are eligible for the Deans and Trustee Scholarships if you are an incoming student whose application for admission is accepted into Chowan University. You are eligible for a Leadership Scholars...', url: 'https://chowan.edu/admissions/financial-aid/scholarships-grants'),
        _CollegeScholarship(name: 'Athletic, Christian Service and Music Scholarships', amount: 'Amounts may vary', deadline: 'Apply Online for Christian Service Scholarship and Music Scholarships require audition', reqs: 'Review website for requirements', url: 'https://chowan.edu/admissions/financial-aid/scholarships-grants'),
        _CollegeScholarship(name: 'CU Matching Scholarship', amount: 'Chowan will match up to USD 1,000 a semester per student', deadline: 'When a faith-based organization/church invests in a student through scholarship funds, the CU Matching Scholarship will be awarded. Up to two organizations', reqs: 'Student is accepted and enrolled as an undergraduate student beginning Fall 2020. Student is the recipient of a scholarship from a faith-based organization/church.', url: 'https://chowan.edu/admissions/financial-aid/scholarships-grants'),
      ];
    case 'Davidson College':
      return [
        _CollegeScholarship(name: 'John M. Belk Scholarship', amount: 'Comprehensive funding (tuition, fees, room and board) plus special study stipends that allow you great flexibility in the on- and off-campus opportunities you choose to explore', deadline: 'School officials are able to nominate 2 students from each school. College admission staff are able to nominate as well based on application. Nomination deadline is December 1 and admission deadlin...', reqs: 'Academic excellence and purposeful engagement in the classroom, in student and civic organizations, on the athletic field, or in the arts. While academic achievement is paramount, Belk Scholars als...', url: 'https://www.davidson.edu/admission-and-financial-aid/financial-aid/merit-scholarships/nomination-scholarships/john-m-belk-scholarship'),
        _CollegeScholarship(name: 'Lowell L. Bryan', amount: 'Full tuition and fees', deadline: 'Guidance counselors, heads of schools or principals, or coaches (high school or league) may nominate up to three students for the Bryan scholarship. One of our Davidson coaches may also nominate. S...', reqs: 'Students who will contribute in a superlative manner to their sports as well as to academic and co-curricular life at Davidson', url: 'https://www.davidson.edu/admission-and-financial-aid/financial-aid/merit-scholarships/nomination-scholarships/lowell-l-bryan-scholarship'),
        _CollegeScholarship(name: 'Missy and John Kuykendall Scholarship', amount: 'USD 25,000 plus one USD 3,000 special study stipend', deadline: 'Candidates are identified by our admission/ financial aid staff and the Merit office. Selection is based on factors Davidson values in its holistic review: strength of the application for admission...', reqs: 'You have demonstrated through habits of mind, leadership, and character the kind of outstanding servant leadership that distinguish the lives of Missy Kuykendall and President Emeritus John W. Kuyk...', url: 'https://www.davidson.edu/admission-and-financial-aid/financial-aid/merit-scholarships/competition-scholarships/missy-and-john-kuykendall-scholarship'),
        _CollegeScholarship(name: 'William Holt Terry Scholarship', amount: 'Full tuition and fees, and a USD 3,000 special opportunity stipend', deadline: 'No separate application is required. Finalists participate in selection interviews during Celebration and Recognition/Decision Davidson Weekend in April', reqs: 'Finalists for the Terry Scholarship are chosen from  applicants for admission identified as outstanding candidates by the Dean of Admission and the Director of the Terry Scholarship program.', url: 'https://www.davidson.edu/admission-and-financial-aid/financial-aid/merit-scholarships/competition-scholarships/william-holt-terry-scholarship'),
        _CollegeScholarship(name: 'Application Scholarships', amount: 'Amounts vary', deadline: 'Students may apply for as many of these scholarships as you wish. The deadline for submission is the deadline of your chosen admission plan (Early Decision 1 - Nov. 15; Early Decision II - Jan. 4; ...', reqs: 'Requirements vary based on program', url: 'https://www.davidson.edu/admission-and-financial-aid/financial-aid/merit-scholarships/application-scholarships'),
        _CollegeScholarship(name: 'Davidson College Grants', amount: 'USD 100-USD 30,000', deadline: 'Need determined based on application', reqs: 'Need-based grants are the foundation of our financial aid program and are funded through the generosity of foundations, corporations, alumni and friends, and from the annual operating budget.', url: 'https://www.davidson.edu/admission-and-financial-aid/financial-aid/grants'),
      ];
    case 'Duke University':
      return [
        _CollegeScholarship(name: 'Merit Scholarships', amount: 'Amounts Vary', deadline: 'Applicants are automatically considered for merit scholarships through admissions application. Students are encouraged to complete FAFSA and CSS Profile applications to ensure consideration for nee...', reqs: 'Based on merit and admissions application', url: 'https://financialaid.duke.edu/undergraduate-applicants/other-sources-aid#merit'),
        _CollegeScholarship(name: 'A. James Clark Scholars Program', amount: 'USD 10,000/year', deadline: 'Application opens April 1 and closes April 30', reqs: 'A Duke University Pratt School of Engineering incoming first-year student. Applicants are incoming first-year students who qualify for need-based financial aid and are interested in new ventures at...', url: 'http://clarkscholars.duke.edu/'),
        _CollegeScholarship(name: 'David M. Rubenstein Scholars', amount: 'Loan-free financial package for four years, including: Tuition, room, board, Fully-loaded laptop computer on first day of class, Preorientation program provided at no cost, Enrichment funding to pu...', deadline: 'No application to become David M. Rubenstein Scholars. Students who are admitted to Duke who indicate that they will be the first in their families to graduate from a four-year university, and who ...', reqs: 'Students who indicate they will be the first in their families to graduate from a four-year university, and who also meet financial criteria, are automatically considered for the scholarship. Appli...', url: 'https://rubensteinscholars.duke.edu/'),
        _CollegeScholarship(name: 'Robertson Scholarship', amount: 'Cannot apply if applying for the Morehead Cain. If 8 semesters of full tuition, room and board, and most mandatory fees for Scholars at Duke and UNC-Chapel Hill. Additional funding for up to three ...', deadline: 'Apply through separate application due November 15. Can apply regular or early decision admission.', reqs: 'Leadership, intellectual curiosity, character and collaborative spirit.  There is one application for all High School students regardless of nationality or citizenship. It is the responsibility of ...', url: 'https://robertsonscholars.org/'),
      ];
    case 'Elon University':
      return [
        _CollegeScholarship(name: 'Presidential Scholarship', amount: 'USD 6,000/year', deadline: 'No separate application is needed. Scholarships are automatically awarded to students who meet the criteria when the completed admissions application is reviewed.', reqs: 'Based on high school record', url: 'https://www.elon.edu/u/admissions/undergraduate/financial-aid/scholarships/merit-based-scholarships/'),
        _CollegeScholarship(name: 'Elon Engagement Scholarships', amount: 'USD 4,500/year plus one-time USD 2,000 grant Elon Experience or project', deadline: 'Every first-year applicant is considered', reqs: 'Selection is based on your high school academic record and very important—your application essay', url: 'https://www.elon.edu/u/admissions/undergraduate/financial-aid/scholarships/merit-based-scholarships/'),
        _CollegeScholarship(name: 'Honors Fellows', amount: 'USD 13,500 scholarship renewable annually based on academic performance and participation. This is in addition to a Presidential Scholarship of USD 6,000. All Honors Fellows receive a USD 1,000 Glo...', deadline: 'Each year, 45 students are selected as Honors Fellows based on their high school records, essays, teacher recommendations and a faculty interview. Must apply for admissions by January 10.', reqs: 'Based on their high school records, essays, teacher recommendations and a faculty interview. Honors Fellows may pursue any four-year undergraduate degree at Elon', url: 'https://www.elon.edu/u/admissions/undergraduate/financial-aid/fellows-and-scholars-programs/honors-fellows/'),
        _CollegeScholarship(name: 'Elon College Fellows', amount: 'USD 5,500 annually. This is in addition to any USD 6,000 Presidential Award. Elon College Fellows who plan to attend medical school may apply for Jane M. Baird Pre-medical Scholarships of USD 4,000...', deadline: 'Application deadline is January 17.  Must apply for admissions by January 10.', reqs: 'Students who plan to major in the arts and sciences and have a GPA of 3.8 or higher should apply', url: 'https://www.elon.edu/u/admissions/undergraduate/financial-aid/fellows-and-scholars-programs/elon-college-fellows/'),
        _CollegeScholarship(name: 'Business Fellows', amount: 'Scholarships valued at USD 5,500, which are renewable annually as long as the student remains a Fellow in good standing. This is in addition to any Presidential Scholarship received.', deadline: 'Application deadline is January 17.  Must apply for admissions by January 10.', reqs: 'Students should have a GPA of at least 3.8. Thirty Business Fellows are selected annually based on academic criteria, business interest and experience, essays and faculty interview', url: 'https://www.elon.edu/u/admissions/undergraduate/financial-aid/fellows-and-scholars-programs/business-fellows/'),
        _CollegeScholarship(name: 'Communication Fellows', amount: 'Scholarships valued at USD 5,500 and are renewable annually as long as the student remains a Fellow in good standing. This is in addition to any Presidential Scholarship received.', deadline: 'Application deadline is January 17.  Must apply for admissions by January 10.', reqs: 'Any student who plans to major in journalism, strategic communications, cinema & television arts, media analytics, communication design or sport management should apply. Students should have a GPA ...', url: 'https://www.elon.edu/u/admissions/undergraduate/financial-aid/fellows-and-scholars-programs/communications-fellows/'),
        _CollegeScholarship(name: 'Teaching Fellows', amount: 'Scholarships valued at USD 5,500, which are renewable annually as long as the student remains a Fellow in good standing. This is in addition to any Presidential or Elon Engagement scholarship recei...', deadline: 'Application deadline is January 17.  Must apply for admissions by January 10.', reqs: 'Students who are committed to educating future generations and have distinguished themselves as leaders are encouraged to apply. Students should have a 3.8 GPA or higher.', url: 'https://www.elon.edu/u/admissions/undergraduate/financial-aid/fellows-and-scholars-programs/teaching-fellows/'),
        _CollegeScholarship(name: 'Isabella Cannon Leadership Fellows', amount: 'Scholarships valued at USD 5,500 annually. In addition, all 25 Fellows receive a one-time USD 1,000 Global Study grant to be used for study abroad. This amount is in addition to any Presidential or...', deadline: 'Application deadline is January 15.  Must apply for admissions by January 10.', reqs: 'Students with substantial and broad leadership experiences in their high school and/or communities are encouraged to apply. Students should have a GPA of 3.6 or higher', url: 'https://www.elon.edu/u/admissions/undergraduate/financial-aid/fellows-and-scholars-programs/isabella-cannon-leadership-fellows/'),
        _CollegeScholarship(name: 'Odyssey Program', amount: 'Scholarship amount available varies depending on the program. USD 7,500-USD 25,000. The program also includes a stipend for books and supplies, and a one-time USD 4,000 Global Study grant to be use...', deadline: 'Apply for admissions, submit CSS profile and FAFSA, submit Odyssey application. Odyssey deadline is January 17.', reqs: 'FGC student, Pell eligible, achieved success despite hardship, have not had the opportunity for enriching educational experiences due to personal circumstances or the socioeconomic climate of their...', url: 'https://www.elon.edu/u/admissions/undergraduate/financial-aid/odyssey-program/'),
        _CollegeScholarship(name: 'Scholars Programs: Engineering, Nursing, Change Makers, Elon Sports Visions, Health Professionals, Public Health, Legal Professions', amount: 'USD 5,000-USD 5,500', deadline: 'Application Deadline is January 15.  Must apply for admissions by January 10.', reqs: 'Students who meet requirements and plan to major in required areas', url: 'https://www.elon.edu/u/admissions/undergraduate/financial-aid/fellows-and-scholars-programs/'),
      ];
    case 'Gardner-Webb University':
      return [
        _CollegeScholarship(name: 'Institutional Grants and Scholarships: Trustee, Presidential, Provost, Deans, Achievement, and Opportunity', amount: 'USD 5,000 to USD 18,000 depending on the student’s academic profile and whether the student is an on campus resident or off campus commuter. Full-time student', deadline: 'In order to determine the amount of institutional scholarship or grant you are eligible to receive, you must first apply and be accepted to Gardner-Webb.', reqs: 'Depends on students profile', url: 'https://gardner-webb.edu/admissions-aid/scholarships-and-grants/'),
        _CollegeScholarship(name: 'Tucker Scholarship', amount: 'An eight-semester full-tuition and room and board scholarship', deadline: 'Must be admitted as a student. Application deadline is November 1. Ministers, teachers, guidance counselors, and community leaders can nominate a worthy student for a chance at this top scholarship...', reqs: 'The scholarship will be referred to as the Tucker Heart, Soul, Mind, and Strength Scholarship because it will seek out students who demonstrate potential to apply these four attributes in carrying ...', url: 'https://gardner-webb.edu/admissions-aid/scholarships-and-grants/tucker-scholarship/'),
        _CollegeScholarship(name: 'Ignite Excellence Scholarships: Full-tuition Scholarship and Participation Award', amount: 'Full-tuition  = USD 31,200 Participation = USD 2,000', deadline: 'After being accepted to the university, selected accepted students will be invited to participate in Ignite Excellence by Nov 13th and the deadline to register will be December 4th.', reqs: 'Accepted student, reside on campus, be enrolled full time and maintain a cumulative GPA of 3.5. Scholarships are awarded for a maximum of eight semesters. Scholarships do not cover costs for additi...', url: 'https://gardner-webb.edu/admissions-aid/scholarships-and-grants/'),
        _CollegeScholarship(name: 'Performance: Athletic, Honors Music & Band Scholarships', amount: 'Band: USD 1,000', deadline: 'Communicate with coaches, music faculty and band director', reqs: 'Athletic scholarship are awarded by coaches, Honors music is based on audition, and band is awarded by band director', url: 'https://gardner-webb.edu/admissions-aid/scholarships-and-grants/'),
        _CollegeScholarship(name: 'Foothills Commitment', amount: 'USD 15,600 or more in total aid', deadline: 'Contact an admissions counselor for more details. This special offer is for first-year, undergraduate residential students from Gaston, Cleveland, Lincoln and Rutherford counties. Students must com...', reqs: 'This special offer is for first-year, undergraduate residential students from Gaston, Cleveland, Lincoln and Rutherford counties.', url: 'https://gardner-webb.edu/admissions-aid/scholarships-and-grants/'),
        _CollegeScholarship(name: 'Church Matching Scholarship', amount: 'Matching amount up to the cost of tuition', deadline: 'Mut be enrolled full time. Submit application by May 1', reqs: 'Matching scholarships will now be offered to traditional undergraduate students, who receive a scholarship from any Christian church.', url: 'https://gardner-webb.edu/admissions-aid/scholarships-and-grants/'),
        _CollegeScholarship(name: 'Ministers Dependent Scholarship', amount: '5500', deadline: 'Must be accepted for admission. Application deadline is May 1.', reqs: 'Dependent student of a full time minister of a church or an ordained, full time employee of a church-related agency', url: 'https://gardner-webb.edu/admissions-aid/scholarships-and-grants/'),
        _CollegeScholarship(name: 'R.W. Andrews Scholarship', amount: 'N.C. full tuition, room, and board, and USD 800 per year for books for one of the traditional on-campus undergraduate programs at Gardner-Webb University', deadline: 'A scholarship application is required to be reviewed by The Andrews Scholarship selection committed. Deadline is March 1', reqs: 'African American male from Cleveland County', url: 'https://gardnerwebb.az1.qualtrics.com/jfe/form/SV_5aNWyS09D6NOwTz'),
        _CollegeScholarship(name: 'Various Scholarships: Luther Butler, Minister Advisory, Christian Service Organization, GWU Legacy', amount: 'USD 250-30% of tuition', deadline: 'Separate applications are required and FAFSA is required for some. Check website for deadlines', reqs: 'Requirements vary', url: 'https://gardner-webb.edu/admissions-aid/scholarships-and-grants/'),
      ];
    case 'Greensboro College':
      return [
        _CollegeScholarship(name: 'Merit-based: Achievement, Founders, Deans, Trustees Scholarships', amount: 'USD 2,500, USD 4,000, USD 5,500, USD 7,000', deadline: 'First-time freshmen and transfer students who have earned fewer than 24 college credit hours are eligible for a merit-based scholarship', reqs: 'First-time freshmen and transfer students are eligible for consideration. Your academic record and accomplishments, such as your high school/college GPA, SAT score, and ACT Score, are used to deter...', url: 'https://www.greensboro.edu/financial-aid/merit-scholarships/'),
        _CollegeScholarship(name: 'Presidential Scholars', amount: 'Full-tuition', deadline: 'First-time freshmen and transfer students who have earned fewer than 24 college credit hours are eligible for a merit-based scholarship', reqs: 'Minimum cumulative weighted GPA of 3.80, be accepted to the College and into the George Center for Honors Studies. Scholarship requires Residential component', url: 'https://www.greensboro.edu/financial-aid/merit-scholarships/'),
        _CollegeScholarship(name: 'Fine Arts Scholarships: Theatre, Music, Art', amount: 'USD 2,500-USD 7,500', deadline: 'Incoming students with outstanding talent in theatre, music, or art may be considered for a Fine Arts Scholarship', reqs: 'These scholarships are based on a combination of a student’s academic record and talent. There are three types of Fine Arts Scholarships: Theatre Scholarships, Music Scholarships, and Art Scholarsh...', url: 'https://www.greensboro.edu/financial-aid/merit-scholarships/'),
      ];
    case 'Guilford College':
      return [
        _CollegeScholarship(name: 'Merit Scholarships', amount: 'USD 20,000-USD 100,000 for all for years', deadline: 'Theres no application process, and students are notified of their award at the time of admission', reqs: 'Based on review of application: grades, coursework, SAT and/or ACT scores or your writing portfolio (Guilford is test-optional), class rank when available, leadership and community service, and ext...', url: 'https://www.guilford.edu/admissions/financial-aid/scholarships-and-grants'),
      ];
    case 'High Point University':
      return [
        _CollegeScholarship(name: 'Presidential Scholarships: Founders', amount: 'USD 30,000-full tuition', deadline: 'Your High Point University Undergraduate Admissions Application serves as your Presidential Scholars Application – there is no separate application that you need to submit. Submit admission applica...', reqs: '4.0 gpa unweighted, SAT: 1550, ACT: 34, Top 5% of class. Students have the option on whether to submit test scores', url: 'https://www.highpoint.edu/admissions/tuition-fees/presidential-scholarship-program/'),
        _CollegeScholarship(name: 'Presidential Scholarships: Fellows', amount: 'USD 9,000-USD 20,000', deadline: 'Your High Point University Undergraduate Admissions Application serves as your Presidential Scholars Application – there is no separate application that you need to submit. Submit admission applica...', reqs: '3.8 gpa unweighted, SAT: 1363, ACT: 29, top 10% of class. Students have the option on whether to submit test scores', url: 'https://www.highpoint.edu/admissions/tuition-fees/presidential-scholarship-program/'),
        _CollegeScholarship(name: 'Presidential Scholarships', amount: 'USD 5,000-USD 11,000', deadline: 'Your High Point University Undergraduate Admissions Application serves as your Presidential Scholars Application – there is no separate application that you need to submit. Submit admission applica...', reqs: '3.58 gpa unweighted, SAT: 1235, ACT: 25. Students have the option on whether to submit test scores', url: 'https://www.highpoint.edu/admissions/tuition-fees/presidential-scholarship-program/'),
        _CollegeScholarship(name: 'High Point Scholarships', amount: 'USD 2,000-USD 5,000. All High Point Scholars will be invited to campus for a special weekend in March where they will have the opportunity to increase their scholarship by USD 2,000 per year', deadline: 'Your High Point University Undergraduate Admissions Application serves as your Presidential Scholars Application – there is no separate application that you need to submit. Submit admission applica...', reqs: '3.26 gpa unweighted, SAT: 1157, ACT: 23. Students have the option on whether to submit test scores', url: 'https://www.highpoint.edu/admissions/high-point-scholarship-program/'),
        _CollegeScholarship(name: 'Honors Scholar Program', amount: 'USD 3,000/year added to any additional scholarships', deadline: 'To be considered for membership into the Honors Scholar Program as a new student, you must first submit your High Point University. Then complete Honors Scholar application. Priority given to appli...', reqs: '3.5 gpa unweighted, SAT: 1300, ACT: 27', url: 'https://www.highpoint.edu/honorsprogram/prospective-students/'),
        _CollegeScholarship(name: 'Fellows Programs: Business, Communication, Creative Art, Education, Exercise Science, Natural Science, Siegfried Leadership, Strickland L.I.F.T', amount: 'USD 3,000/year added to any additional scholarships', deadline: 'To be considered for membership into the Honors Scholar Program as a new student, you must first submit your High Point University. Then complete Honors Scholar application. Priority given to appli...', reqs: 'Requirements vary based on department and fellowship', url: 'https://www.highpoint.edu/admissions/academic-fellowship-programs/'),
        _CollegeScholarship(name: 'ROTC: Army and Air Force', amount: 'Cost of tuition and books, plus USD 100 per month for personal expenses', deadline: 'Contact admissions counselor for more information', reqs: 'Participation in ROTC', url: 'https://www.highpoint.edu/admissions/scholarships-and-grants/'),
        _CollegeScholarship(name: 'Scout awards', amount: '1000', deadline: 'Contact admissions counselor for more information', reqs: 'Awarded to entering students who have achieved the rank of Eagle Scout in the Boy Scouts of America or earned their Gold Award in the Girl Scouts of the US', url: 'https://www.highpoint.edu/admissions/scholarships-and-grants/'),
        _CollegeScholarship(name: 'International Scholarships', amount: 'USD 5,000/year', deadline: 'A student’s application for admission  is also the application for scholarships. We do not feel that any additional essay can outweigh the commitment to excellence shown by students over their high...', reqs: '3.0 unweighted, submit SAT/ACT for higher award', url: 'https://www.highpoint.edu/admissions/scholarships-and-grants/'),
        _CollegeScholarship(name: 'Diversity Scholarship', amount: 'Amounts vary', deadline: 'Review Diversity Scholarships available on website. To be fully considered for all awards, students should apply by November 15', reqs: 'Exceptional and talented students who have been traditionally underrepresented on college campuses, and who are culturally, ethnically, or racially diverse', url: 'https://www.highpoint.edu/admissions/scholarships-and-grants/'),
        _CollegeScholarship(name: 'Music Scholarships', amount: 'USD 500-USD 2,000', deadline: 'These awards require an audition, and students should contact the music department for additional information.', reqs: 'Audition-based awards offered by the Music Department to entering music majors.', url: 'https://www.highpoint.edu/admissions/scholarships-and-grants/'),
        _CollegeScholarship(name: 'Marching Panthers', amount: 'USD 3,000/year', deadline: 'These awards require an interview, and students should contact the Marching Band for additional information. High Point Marching Panther Scholars are required to attend Band Camp over the summer.', reqs: 'Awarded to wind, drum line, color guard, and majorette students to participate in the university marching band. Preference will be given to students who have band experience, and show a strong inte...', url: 'https://highpointpanthers.com/sports/2009/8/24/PB_0824091449.aspx?id=31'),
      ];
    case 'Johnson C. Smith University':
      return [
        _CollegeScholarship(name: 'Family Discount Scholarship', amount: 'A 10% discount is applied to all students enrolled and validated who have a sibling, parent, or spouse currently enrolled and validated. The family scholarship is 10% of the student’s semester char...', deadline: 'Complete Application provided online. Contact financial aid office for more scholarship opportunities', reqs: 'All students enrolled and validated who have a sibling, parent, or spouse currently enrolled', url: 'https://www.jcsu.edu/admissions/financial_aid/forms-resources'),
      ];
    case 'Lees-McRae College':
      return [
        _CollegeScholarship(name: 'Academic Merit', amount: 'USD 3,000-USD 12,000/year', deadline: 'All students are automatically considered for academic scholarships once they are granted admission to the college. No additional application is required', reqs: 'Scholarship awards are based only on official transcripts and test scores.', url: 'https://www.lmc.edu/admissions/financial-aid/types-of-aid.htm'),
        _CollegeScholarship(name: 'Elizabeth McRae Scholarship', amount: 'Full tuition for a full-time student', deadline: 'Recipients are chosen from all students invited to attend Scholars Day—an event in the spring that includes an interview and essay competition, with the top two performers selected as recipients.', reqs: 'Recipients are chosen from all students invited to attend Scholars Day—an event in the spring that includes an interview and essay competition, with the top two performers selected as recipients.', url: 'https://www.lmc.edu/admissions/financial-aid/types-of-aid.htm'),
        _CollegeScholarship(name: 'HOSA Scholarship', amount: 'USD 2,000/year', deadline: 'Apply for admission and submit scholarship application due April 30', reqs: 'From Banner Elk, NC. Active member of HOSA.', url: 'https://www.lmc.edu/admissions/financial-aid/types-of-aid.htm'),
        _CollegeScholarship(name: 'Humanities Scholarship', amount: 'USD 2,000/year', deadline: 'Apply for admission and submit scholarship application due April 30', reqs: 'Major is English, history or religious studies.', url: 'https://www.lmc.edu/admissions/financial-aid/types-of-aid.htm'),
        _CollegeScholarship(name: 'Presbyterian Scholarship', amount: 'USD 2,000/year', deadline: 'Apply for admission and submit scholarship application due April 30', reqs: 'Awarded to students who have been an active member of the Presbyterian Church congregation for a minimum of four years. Selected students must demonstrate participation in church and community service', url: 'https://www.lmc.edu/admissions/financial-aid/types-of-aid.htm'),
        _CollegeScholarship(name: 'Sam & Mary Hart Scholarship and Shelton Scholarship', amount: '', deadline: 'Full tuition and full ride scholarships. Not available again until 2022-2023 and 2024-2025 school years', reqs: '', url: 'https://www.lmc.edu/admissions/financial-aid/types-of-aid.htm'),
        _CollegeScholarship(name: 'Sullivan Scholarship', amount: 'Amounts vary', deadline: 'Apply for admission and submit scholarship application due May 15', reqs: 'Demonstrates exemplary personal character and a commitment to service above self. The selected student must exhibit noble character as the aggregate of features and traits related to ethical and mo...', url: 'https://www.lmc.edu/admissions/financial-aid/types-of-aid.htm'),
        _CollegeScholarship(name: 'Theatre Scholarships', amount: 'USD 1,000-USD 5,000', deadline: 'Apply for admission and participate in audition', reqs: 'Theatre Arts, Theatre Arts Education, or Theatre Arts Administration major. Scholarships are talent-based and offered to students interested in all areas of the Theatre Arts at Lees-McRae. Performa...', url: 'https://www.lmc.edu/academics/programs/theatre-arts/auditions.htm'),
      ];
    case 'Lenoir-Rhyne University':
      return [
        _CollegeScholarship(name: 'LR Scholarships', amount: 'Amounts may vary', deadline: 'To be considered for these scholarships, students must be accepted and invited to the Scholarship Day event held early spring', reqs: 'Based on academic profile', url: 'https://www.lr.edu/admission/undergraduate/financial-aid-clone'),
        _CollegeScholarship(name: 'LR Scholars', amount: 'USD 4,000-USD 16,000', deadline: 'Based on admission to the university and academics', reqs: 'Recognition of academic achievement during their high school career', url: 'https://www.lr.edu/admission/undergraduate/financial-aid-clone'),
        _CollegeScholarship(name: 'Music Scholarships', amount: 'Annual amount varies', deadline: 'Accepted for admission and should reach out to music department for details', reqs: 'Awarded at the discretion of the LR Music Department', url: 'https://www.lr.edu/admission/undergraduate/financial-aid-clone'),
        _CollegeScholarship(name: 'Opportunities for Lutherans', amount: 'USD 1,000/year plus an additional match program up to USD 250 a semester', deadline: 'Accepted for admission and indicate dependent of Lutheran', reqs: 'Awarded to dependent children of ordained, Lutheran ministers', url: 'https://www.lr.edu/admission/undergraduate/financial-aid-clone'),
        _CollegeScholarship(name: 'Legacy Scholarships', amount: 'USD 1,000/year', deadline: 'Accepted for admission and indicate legacy', reqs: 'Given to students whose parents or grandparents are LR graduates', url: 'https://www.lr.edu/admission/undergraduate/financial-aid-clone'),
      ];
    case 'Livingstone College':
      return [
        _CollegeScholarship(name: 'Institutional Scholarships', amount: '', deadline: 'No institutional scholarships are listed on the site http://livingstone.edu/financial-aid/', reqs: '', url: ''),
      ];
    case 'Louisburg College':
      return [
        _CollegeScholarship(name: 'Robbins Methodist Grant - Methodist grant for students who attend Louisburg College', amount: 'USD 1,000 for 2 years', deadline: 'Pastors may nominate high school seniors from their church each year to receive the grant', reqs: 'Member of United Methodist Church, 2.0 gpa, SAT: 850, nominated by pastor, and accepted for admission', url: 'https://www.louisburg.edu/admissions/financial-aid/grants-scholarships.php'),
      ];
    case 'Mars Hill University':
      return [
        _CollegeScholarship(name: 'Presidential, Bailey, and Blue and Gold', amount: 'Amount may vary depending on gpa and other criteria', deadline: 'Award is offered based on admission application and applied to award', reqs: 'Mars Hill University offers merit-based financial aid to students meeting specific academic standards, based on high school performance and/or standardized test scores.', url: 'https://www.mhu.edu/future-students/traditional-undergraduate/financial-aid/scholarships-grants/'),
        _CollegeScholarship(name: 'Blackwell Scholarship', amount: 'Not listed', deadline: 'March 1 priority deadline', reqs: '3.2 with test scores 1990/19; 3.5 w/no test score and approved waiver. Students who are involved in leadership and citizenship activities in their high schools, and want to continue in these types ...', url: 'https://www.mhu.edu/future-students/traditional-undergraduate/financial-aid/scholarships-grants/blackwell-scholarship/'),
        _CollegeScholarship(name: 'Bonners Scholars', amount: 'Not listed', deadline: 'A rolling selection process is used until available scholarships are awarded.. Must complete FAFSA', reqs: 'Must demonstrate need. Interested in community service with the financial support needed to attend college and continue to be involved in the community. The Bonner Scholarship is available to stude...', url: 'https://www.mhu.edu/academics/engagement/bonner-scholars-program/'),
        _CollegeScholarship(name: 'NC Baptist Scholarship', amount: 'USD 500-USD 2,500', deadline: 'Apply online', reqs: 'Member of church affiliated with Baptist State Convention of NC. US citizen/permanent resident and live in NC at least a year.', url: 'https://www.mhu.edu/future-students/traditional-undergraduate/financial-aid/scholarships-grants/'),
      ];
    case 'Meredith College':
      return [
        _CollegeScholarship(name: 'Meredith Impact Scholarship', amount: 'USD 20,000/year. Students with exceptional qualifications will be considered for Impact Scholarship award amounts up to USD 24,000.', deadline: 'No separate application is needed. Admitted first-year students are guaranteed to receive a minimum USD 20,000 annual scholarship award if the scholarship qualifications are met.', reqs: '3.4 gpa unweighted, SAT: 1100, ACT: 22', url: 'https://www.meredith.edu/scholarship/impact-scholarship/'),
        _CollegeScholarship(name: 'Meredith Legacy Scholarship', amount: 'Full tuition, room and board, books, supplies, international study, networking opportunities, and other academic enrichment programs with a total estimated value of USD 210,000.', deadline: 'Apply for the Honors Program to be considered for this scholarship. Apply for early admissions and the deadline to apply for the Honors Program is January 15.', reqs: 'Selection criteria include superior standardized test scores (SAT/ACT); a minimum unweighted high school GPA of 3.8, based on a 4.0 grading scale; demonstrated leadership in high school, the local ...', url: 'https://www.meredith.edu/scholarship/meredith-legacy-scholarship/'),
        _CollegeScholarship(name: 'Presidential Scholarships', amount: 'Full tuition annually and international study. Estimated value of USD 165,000 over four years', deadline: 'Apply for the Honors Program to be considered for this scholarship. Apply for early admissions and the deadline to apply for the Honors Program is January 15.', reqs: 'Selection criteria include superior standardized test scores (SAT/ACT); a minimum unweighted high school GPA of 3.8, based on a 4.0 grading scale; demonstrated leadership in high school, the local ...', url: 'https://www.meredith.edu/scholarship/presidential-scholarships/'),
        _CollegeScholarship(name: 'Academic Merit Grants and Scholarships', amount: 'USD 18,000-24,000 annually. Renewable for up to four years subject to the recipient being a full-time student and maintaining good standing with the College.', deadline: 'Application for admission is your application for academic merit scholarships. students are notified regarding Academic Merit Scholarships or Tuition Grants approximately two weeks following an off...', reqs: 'Award amounts may be determined by such factors as: grades reflected on your high school transcript at time of admission, SAT/ACT score at time of admission, and rigor of coursework', url: 'https://www.meredith.edu/scholarship/academic-merit-scholarships/'),
        _CollegeScholarship(name: 'Honors Program', amount: 'USD 1000 annual scholarship; travel with honors students; specialized advising; supportive, dynamic community; recognition on transcript and at Commencement; opportunities for study abroad scholars...', deadline: 'Students applying to the Honors Program are encouraged to apply to the College using the Early Action Application Plan and must be admitted to the College by the Scholars’ Program Application Deadl...', reqs: 'Applicants must have a minimum 3.75 unweighted GPA and be included in the top 10% of their high school graduating class (when rank exists). The Honors Program is test-optional.', url: 'https://www.meredith.edu/scholarship/honors-program-scholarship/'),
        _CollegeScholarship(name: 'STEM Scholars Program: AWE-STEM', amount: 'AWE-STEM Scholars (need and merit based): USD 4,000 per year; Paschal Scholars: USD 1000 per year. Specialized learning community, mentoring program, and expert speakers on topics of interest for w...', deadline: 'Apply online. The scholarship deadline is January 15. Complete the FAFSA', reqs: 'GPA of 3.0 unweighted, Plan to major in a STEM major, test optional. Biology, Chemistry, Computer Science, Engineering, and Mathematics majors.  The award is need and merit-based. Recipients must s...', url: 'https://www.meredith.edu/scholarship/stem-scholars-program/'),
        _CollegeScholarship(name: 'STEM Scholars Program: Paschal Scholars', amount: 'USD 1,000/year', deadline: 'Apply online. The scholarship deadline is January 15. FAFSA is encouraged but not required', reqs: 'GPA of 3.0 unweighted, Plan to major in a STEM major, test optional. Biology, Chemistry, Computer Science, Engineering, and Mathematics majors.  The award is need and merit-based. Recipients must s...', url: 'https://www.meredith.edu/scholarship/stem-scholars-program/'),
        _CollegeScholarship(name: 'Meredith Teaching Scholars', amount: 'Two-year mentorship with Wake County teacher, broad teacher licensure choices, domestic and international travel opportunities', deadline: 'Students who have applied for admission are eligible. Also must complete Teaching Scholars application online. Application deadline is January 15. Must be admitted to the college by January 15', reqs: 'Best and brightest high school seniors interested in the teaching profession', url: 'https://www.meredith.edu/scholarship/meredith-teaching-fellows-scholarships/'),
        _CollegeScholarship(name: 'Service Scholars', amount: 'USD 500 a year and enrichment opportunities', deadline: 'Apply online by January 15.', reqs: 'Demonstrated commitment to their community, unweighted 3.4 gpa, SAT: 1140', url: 'https://www.meredith.edu/scholarship/service-scholarship/'),
        _CollegeScholarship(name: 'Art Scholarships', amount: 'Amount may vary. Renewable for 4 years', deadline: 'Admitted to the college by January 15 and apply  for scholarship by January 15', reqs: 'Applicants for art scholarships must send a digital portfolio of 10-12 pieces of art along with the completed Application', url: 'https://www.meredith.edu/scholarship/art-scholarships/'),
        _CollegeScholarship(name: 'Creative Writing Scholarships', amount: 'Amount may vary. Renewable for 4 years', deadline: 'Admitted to the college by January 15 and apply  for scholarship by January 15', reqs: '3.0 gpa unweighted,  Applicants for Creative Writing scholarships must send a digital portfolio of 3 – 5 pieces of creative writing (maximum of 30 pages), including poetry, fiction, and/or creative...', url: 'https://www.meredith.edu/scholarship/creative-writing-scholarships/'),
        _CollegeScholarship(name: 'Interior Design Scholarships', amount: 'Amount may vary. Renewable for 4 years', deadline: 'Admitted to the college by January 15 and apply  for scholarship by January 15', reqs: 'The scholarship recipient is determined on the basis of scholarship and potential for success in the field of interior design. Finalists for the scholarship will be invited to campus for Scholars’ ...', url: 'https://www.meredith.edu/scholarship/interior-design-scholarships/'),
        _CollegeScholarship(name: 'Theatre Scholarships: Siska Scholarship', amount: 'Amount may vary. Renewable for 4 years', deadline: 'Admitted to the college by January 15 and apply  for scholarship by January 15', reqs: 'Four year endowment for incoming first-year students who plan on making theatre their major and career', url: 'https://www.meredith.edu/scholarship/theatre-scholarships/'),
        _CollegeScholarship(name: 'Theatre Scholarships: John Creagh Memorial', amount: 'Amount may vary. Renewable for 4 years', deadline: 'Audition and interview are required for application, and interested high school seniors should contact Steven Roten for more info. Admitted to the college by January 15 and apply  for scholarship b...', reqs: 'Audition and/or portfolio are required; theatre', url: 'https://www.meredith.edu/scholarship/theatre-scholarships/'),
        _CollegeScholarship(name: 'Thomas Meredith Baptist Heritage', amount: 'Amount may vary. Renewable for 4 years', deadline: 'Admitted to the college by January 15 and apply  for scholarship by January 15', reqs: 'A recipient must be a member of the North Carolina Baptist church and be recommended by a church official (director of the W.M.U. or other similar women’s organization, pastor or youth minister).', url: 'https://www.meredith.edu/scholarship/thomas-meredith-baptist-heritage-scholarships/'),
        _CollegeScholarship(name: 'Meredith Promise Scholarship', amount: 'Amount may vary. The Meredith Promise Scholarship will be renewed annually for two additional years, pending the recipient’s satisfactory academic progress.', deadline: 'All students in good academic standing will receive an email from the Office of Retention and Student Success in January notifying them of the requirements for the scholarship, how to access the ap...', reqs: 'Only first-time, degree-seeking students who are in their first year at Meredith, have at least a 2.0 first-semester GPA, have demonstrated financial need, and who started in August of the current ...', url: 'https://www.meredith.edu/scholarship/meredith-promise-scholarship/'),
        _CollegeScholarship(name: 'Children of Fallen Heroes', amount: 'Amount may vary', deadline: 'Complete the FAFSA', reqs: 'Student must be Pell-eligible , and be less than 24 years of age or enrolled at an institution of higher education at the time of her parent’s or guardian’s death. All Title IV aid must be based on...', url: 'https://www.meredith.edu/scholarship/children-of-fallen-heroes/'),
      ];
    case 'Methodist University':
      return [
        _CollegeScholarship(name: 'Wright Scholars Program', amount: 'Full tuition scholarships which cover full-time day tuition will be offered each year to members of the incoming freshman class.', deadline: 'Scholarship applications will be mailed in February to accepted students who meet the minimum qualifications, and there is a March 1st deadline', reqs: '3.7 gpa, SAT: 1160, ACT: 24, financial need may be considered,', url: 'https://www.methodist.edu/financial-aid/academic-scholarships/'),
        _CollegeScholarship(name: 'Presidential Scholarships', amount: 'USD 19,000-USD 27,000 depending on gpa, test scores, and commuter or residential student', deadline: 'Apply and admitted as a student', reqs: 'Minimum of 3.0 gpa to be considered', url: 'https://www.methodist.edu/financial-aid/academic-scholarships/'),
        _CollegeScholarship(name: 'Valedictorian/Salutatorian Scholarship', amount: 'Valedictorian: USD 2,500/year Salutatorian: USD 1,000/year', deadline: 'Apply and admitted as a student', reqs: 'Ranked as Valedictorian or Salutatorian in their class. The student must also meet Presidential Scholarship criteria (minimum GPA = 3.10, minimum New SAT/Old SAT/ACT = 1100/1020/22).', url: 'https://www.methodist.edu/financial-aid/academic-scholarships/'),
        _CollegeScholarship(name: 'Methodist University Personnel (MUP) Scholarship', amount: 'Children of employees who have not received a Baccalaureate degree will receive a scholarship to cover 100% tuition. Children of employees who have received the degree will receive a scholarship th...', deadline: 'MUP Application must be submitted at least 30 days before the start of the semester. Must complete the FAFSA and provide a birth certificate', reqs: 'Spouses and dependent sons/daughters (must be defined as a dependent by  FAFSA and birth certificate) of full-time non-faculty/faculty employees (without a Baccalaureate degree): 100% of tuition, a...', url: 'https://www.methodist.edu/financial-aid/mup/'),
        _CollegeScholarship(name: 'Performance Scholarships', amount: 'All performance scholarships can exceed the institutional cap (up to USD 2,000) for the current academic year.', deadline: 'Methodist University offers several performance scholarships. However the student must successfully complete the minimum requirements as set forth by the department offering the scholarship.', reqs: 'Student must successfully complete the minimum requirements as set forth by the department offering the scholarship', url: 'https://www.methodist.edu/financial-aid/scholarships/'),
        _CollegeScholarship(name: 'Endowed Scholarships', amount: 'Endowed scholarships are not necessarily renewed every year to the same student. Some of the endowed scholarships may not be available every year due to funding.', deadline: 'Must submit the FAFSA. No additional applicated is required', reqs: 'Methodist  offers a variety of Endowed Scholarships. All endowed scholarships are offered annually by the Office of Financial Aid to full time (12 day hours) degree-seeking Day students, who have c...', url: 'https://www.methodist.edu/financial-aid/endowed-scholarships/'),
        _CollegeScholarship(name: 'Sibling Scholarship', amount: 'USD 1,000/year for residential and commuting', deadline: 'Enrollment of each sibling must be verified at the beginning of each semester.', reqs: 'This Scholarship is offered to each dependent sibling who is concurrently enrolled full time (12 Day hours) in the day program at MU', url: 'https://www.methodist.edu/financial-aid/scholarships/'),
        _CollegeScholarship(name: 'Ministers Dependent Scholarship', amount: '50% of tuition', deadline: 'Must complete the FAFSA', reqs: 'Full time day program student. The student must be the legal dependents of full-time licensed ministers (active, retired or deceased) who are/were members of the United Methodist Church. This Schol...', url: 'https://www.methodist.edu/financial-aid/ministers-dependent/'),
        _CollegeScholarship(name: 'National and NC Independent Tuition Exchange', amount: 'Amount may vary', deadline: 'Must apply and meet requirements. Each participating institution has individual requirements. Read scholarship site for more details', reqs: 'Available to Children and family member of faculty and employees of participating institutions', url: 'National: https://www.methodist.edu/financial-aid/national-tuition-exchange/ NC Independent: https://www.methodist.edu/financial-aid/nc-independent-tuition-exchange/'),
      ];
    case 'Montreat College':
      return [
        _CollegeScholarship(name: 'Keystone Scholarship', amount: 'Amount varies each year for each student', deadline: 'No additional application is provided based on the website', reqs: 'Need-based. Cannot be combined with athletic scholarships, but not merit scholarships', url: 'https://www.montreat.edu/admissions/tuition-aid/undergraduate/scholarships/'),
        _CollegeScholarship(name: 'Athletic Scholarships', amount: 'Amount varies based on qualifications', deadline: 'No additional application is provided based on the website. Contact admissions and high school/college coaches for more details for each student', reqs: 'Based on talent, character, roster needs, and academic merit. Maybe be combined with other grants or scholarships', url: 'https://www.montreat.edu/admissions/tuition-aid/undergraduate/scholarships/'),
        _CollegeScholarship(name: 'Trustee Scholarship', amount: 'Residential students: USD 8,000/year (USD 32,000 total)  Commuter students: USD 4,000/year (USD 16,000 total)', deadline: 'No additional application is provided based on the website. Based on information provided in application for admission', reqs: 'The Trustee Scholarship is awarded to students with an Academic Index* of 84 and greater. Academic Index is calculated by the following formula: (Unweighted GPA x 10) + (SAT x .0375). For first-tim...', url: 'https://www.montreat.edu/admissions/tuition-aid/undergraduate/scholarships/'),
        _CollegeScholarship(name: 'Presidential Scholarship', amount: 'Residential students: USD 7,000/year (USD 28,000 total)  Commuter students: USD 3,500/year (USD 14,000 total)', deadline: 'No additional application is provided based on the website. Based on information provided in application for admission', reqs: 'The Trustee Scholarship is awarded to students with an Academic Index* of 77.0 - 83.99. Academic Index is calculated by the following formula: (Unweighted GPA x 10) + (SAT x .0375). For first-time ...', url: 'https://www.montreat.edu/admissions/tuition-aid/undergraduate/scholarships/'),
        _CollegeScholarship(name: 'Provost Scholarship', amount: 'Residential students: USD 6,000/year (USD 24,000 total)  Commuter students: USD 3,000/year (USD 12,000 total)', deadline: 'No additional application is provided based on the website. Based on information provided in application for admission', reqs: 'The Provost Scholarship is awarded to students with an Academic Index* of 69.0 - 76.99. Academic Index is calculated by the following formula: (Unweighted GPA x 10) + (SAT x .0375). For first-time ...', url: 'https://www.montreat.edu/admissions/tuition-aid/undergraduate/scholarships/'),
        _CollegeScholarship(name: 'Anderson Scholarship', amount: 'Residential students: USD 5,000/year (USD 20,000 total)  Commuter students: USD 2,500/year (USD 10,000 total)', deadline: 'No additional application is provided based on the website. Based on information provided in application for admission', reqs: 'The Anderson Scholarship is awarded to students with an Academic Index* below 69. Academic Index is calculated by the following formula: (Unweighted GPA x 10) + (SAT x .0375). For first-time freshmen.', url: 'https://www.montreat.edu/admissions/tuition-aid/undergraduate/scholarships/'),
        _CollegeScholarship(name: 'Church-matching Grant', amount: 'Montreat will match up to USD 1,000 in church contributions each year', deadline: 'Download and complete the church matching application provided online, complete the FAFSA and submit the USD 150 enrollment deposit', reqs: 'Funds given by the church should not be the result of a designated gift from the student’s immediate or extended family. Qualified students will be awarded based on first come first serve, deposit,...', url: 'https://www.montreat.edu/admissions/tuition-aid/undergraduate/scholarships/'),
        _CollegeScholarship(name: 'COMPASS Scholarship', amount: 'Students who successfully complete COMPASS will receive a USD 2,000 Montreat College Scholarship', deadline: 'Attend the June COMPASS Summer Experience (June 19-24, 2022)', reqs: 'Attend COMPASS for a week-long summer immersion program for high school students and rising college freshmen who would like to explore an academic field of interest with college-level instructors a...', url: 'https://www.montreat.edu/admissions/tuition-aid/undergraduate/scholarships/'),
        _CollegeScholarship(name: 'Cybersecurity Scholarship', amount: 'The award is USD 2,000 per student renewable annual, if student maintains eligibility requirements', deadline: 'Download and complete Scholarship Application by March 15 and email to Professor Kelli Burgin', reqs: 'New or transfer student, 3.25+ gpa, demonstrated interest in cybersecurity major and career in cybersecurity', url: 'https://www.montreat.edu/admissions/tuition-aid/undergraduate/scholarships/'),
        _CollegeScholarship(name: 'Evangelical Presbyterian Church (EPC) Scholarship', amount: 'USD 2,500/year - USD 10,000 total', deadline: 'Submit application for admission, answer Yes to EPC question, and submit letter from church verifying their membership', reqs: 'To be eligible, students must answer “Yes” to the EPC question in the Financial Aid Opportunities section of our free application for admission, and submit a letter from their church verifying thei...', url: 'https://www.montreat.edu/admissions/tuition-aid/undergraduate/scholarships/'),
        _CollegeScholarship(name: 'Homeschool Scholarship', amount: 'USD 2,500/year - USD 10,000 total', deadline: 'Submit application for admission and answer Yes to  homeschool question (note OR in the question)', reqs: 'First-Time students who were homeschooled during 9th, 10th, 11th OR 12th grade. To be eligible, students must answer “Yes” to the homeschool question in the Financial Aid Opportunities section of a...', url: 'https://www.montreat.edu/admissions/tuition-aid/undergraduate/scholarships/'),
        _CollegeScholarship(name: 'Honors Scholarship', amount: 'All Scholars Day participants will receive USD 500 2 - Full - tuition  4 - USD 6,250/yr (USD 25,000 total)  6 - USD 5,000/yr (USD 20,000 total)  8 - USD 3,750/yr (USD 15,000 total) 15 - USD 2,500/y...', deadline: 'Apply for admissions by January 14 (test-optional applications are not eligible), apply to Honors Program by January 14, Register for Scholars Day by January 14, Attend Scholars Day on February 4 ,...', reqs: '3.5 gpa, SAT: 1200, ACT: 25, CLT: 78', url: 'https://www.montreat.edu/admissions/tuition-aid/undergraduate/honors-scholarships/'),
        _CollegeScholarship(name: 'The Korean Christian Heritage Scholarship (KCHS)', amount: 'USD 13,200/yr (USD 52,800 total) Recipients will receive a KCHS award equal to one-third of the total cost of tuition and fees as published on the college’s website. Additionally, the college commi...', deadline: 'Application for admission and Honors Program application must be completed by January 1. Should also complete other Honors Program requirements listed above to be safe: registering for Scholars Day...', reqs: '3.5 gpa unweighted or qualifying test score (SAT: 1200, ACT: 25, CLT: 78), possess a burning heart for Christ (see site for details), accepted in honors program', url: 'https://www.montreat.edu/admissions/tuition-aid/undergraduate/korean-christian-heritage-scholarship/'),
        _CollegeScholarship(name: 'Music (Choir) Scholarship', amount: 'USD 500 for the first year of participation', deadline: 'Complete the interest form, submit audio recording and audition for Music Choir. Email recording to professor Talsma by April 1, 2022', reqs: 'Based on experience, performance and personnel needs', url: 'https://www.montreat.edu/admissions/tuition-aid/undergraduate/scholarships/'),
        _CollegeScholarship(name: 'Outdoor Recreation Studies', amount: 'USD 2,000 for the first year (USD 1,000/semester)', deadline: 'For details about the application process contact Dottie Shuman, Professor of Outdoor Recreation Studies (dottie.shuman@montreat.edu). An application form and essay are required for each applicant....', reqs: 'Incoming first-year Outdoor Recreation Studies', url: 'https://www.montreat.edu/admissions/tuition-aid/undergraduate/scholarships/'),
      ];
    case 'NC Wesleyan College':
      return [
        _CollegeScholarship(name: 'John & Charles Wesley Heritage Scholarship', amount: 'Up to Full tuition, room (double occupancy), Board and Books Award is inclusive of all federal, state and institutional scholarships and grants. (Student is responsible for any other additional fees)', deadline: 'Awarded during the application process. All scholarships require completion of FAFSA. Award amounts may change without notice. Selection process includes interview', reqs: '4.0 gpa, SAT : 1240, ACT: 26', url: 'https://ncwc.edu/scholarships/'),
        _CollegeScholarship(name: 'Trustee Scholarship', amount: 'Up to Full tuition and books.  Award is inclusive of all federal, state and institutional scholarships and grants. (Student is responsible for any other additional fees)', deadline: 'Awarded during the application process. All scholarships require completion of FAFSA. Award amounts may change without notice. Selection process includes interview', reqs: '3.75 gpa, SAT: 1200, ACT: 25', url: 'https://ncwc.edu/scholarships/'),
        _CollegeScholarship(name: 'Founders Scholarship', amount: 'Amount may vary.', deadline: 'Awarded during the application process. All scholarships require completion of FAFSA. Award amounts may change without notice.', reqs: '3.75 gpa, SAT 1200, ACT: 25', url: 'https://ncwc.edu/scholarships/'),
        _CollegeScholarship(name: 'Presidents Scholarship', amount: 'USD 20,000 total', deadline: 'Awarded during the application process. All scholarships require completion of FAFSA. Award amounts may change without notice.', reqs: '3.3 gpa, SAT: 1080, ACT: 21', url: 'https://ncwc.edu/scholarships/'),
        _CollegeScholarship(name: 'Deans Scholarship', amount: 'USD 18,000 total', deadline: 'Awarded during the application process. All scholarships require completion of FAFSA. Award amounts may change without notice.', reqs: '3.0 gpa, SAT: 980, ACT: 19', url: 'https://ncwc.edu/scholarships/'),
        _CollegeScholarship(name: 'Wesleyan Scholarship', amount: 'USD 15,000 total', deadline: 'Awarded during the application process. All scholarships require completion of FAFSA. Award amounts may change without notice.', reqs: '2.5 gpa, SAT: 900, ACT: 17', url: 'https://ncwc.edu/scholarships/'),
        _CollegeScholarship(name: 'Bishop Opportunity Award', amount: 'USD 10,000 total', deadline: 'Awarded during the application process. All scholarships require completion of FAFSA. Award amounts may change without notice.', reqs: '2.3 gpa, SAT: 700, ACT: 13', url: 'https://ncwc.edu/scholarships/'),
        _CollegeScholarship(name: 'Legacy Award', amount: 'USD 22,000 total (residential) and USD 18,000 (commuter)  Award is inclusive of all institutional scholarships and grants', deadline: 'Awarded during the application process. If student has not received the award, contact aid office for revision', reqs: '3.0 gpa, parents or grandparents graduated from NCWC', url: 'https://ncwc.edu/scholarships/'),
        _CollegeScholarship(name: 'Honors Award (Gaile D. Taylor Honors Program)', amount: 'USD 500/semester. Scholarship amount increases over time', deadline: 'Complete application and email to Director of the program', reqs: 'GPA requirement has been waived due the pandemic 3.5 gpa, SAT: 1170 or ACT equivalent', url: 'https://ncwc.edu/scholarships/'),
        _CollegeScholarship(name: 'International Scholarship', amount: 'USD 5,500 total', deadline: 'Awarded during the application process.', reqs: 'New students (on-campus only)', url: 'https://ncwc.edu/scholarships/'),
        _CollegeScholarship(name: 'Fine Arts Award', amount: 'Amount may vary', deadline: 'Apply for admission and participate in Fine Arts programs', reqs: 'Band/Wesleyan Singers/Wesleyan Players', url: 'https://ncwc.edu/scholarships/'),
        _CollegeScholarship(name: 'Eagle Scouts/Girl Scouts', amount: '1000', deadline: 'Apply for admission. Inquire about scholarship info', reqs: 'Eagle Scout or Girl Scout Gold Award recipient', url: 'https://ncwc.edu/scholarships/'),
        _CollegeScholarship(name: 'Shelton Challenge Scholarship', amount: 'USD 1,000/year', deadline: 'Apply for admission and participate in the Shelton Challenge', reqs: 'Participate in the Shelton Challenge is a six-day residential leadership experience that seeks youth who are rising 9th – 12th graders (graduating seniors included) with a 3.0+ unweighted (GPA).', url: 'https://ncwc.edu/scholarships/'),
        _CollegeScholarship(name: 'Cheer & Dance Award', amount: 'Amount may vary', deadline: 'Apply for admission and participate in cheer or dance', reqs: 'Participate in Cheer or Dance team', url: 'https://ncwc.edu/scholarships/'),
        _CollegeScholarship(name: 'ROTC Award', amount: 'Amount may vary', deadline: 'Apply for admission and participate in ROTC', reqs: '2.5 gpa, ACT: 19', url: 'https://ncwc.edu/scholarships/'),
        _CollegeScholarship(name: 'Olive A. Stokes Scholarship Trust', amount: 'Amount may vary', deadline: 'Submit scholarship application to Althea Nelson and Dave Benedetto by June. Contact aid office about this year. Application has not been updated since 2020', reqs: 'NC and US citizen, resident of Nash or Edgecombe county Must demonstrate need, qualities of leadership, good citizenship, force of character and community spirit, and scholarship', url: 'https://ncwc.edu/scholarships/'),
        _CollegeScholarship(name: 'Helen Lancaster Minton Educational Fund Scholarship', amount: 'Amount may vary', deadline: 'Submit scholarship application to Althea Nelson and Dave Benedetto by June. Contact aid office about this year. Application has not been updated since 2020', reqs: 'NC and US citizen, resident of Nash or Edgecombe county Must demonstrate need, qualities of leadership, good citizenship, force of character and community spirit, and scholarship', url: 'https://ncwc.edu/scholarships/'),
      ];
    case 'Pfeiffer University':
      return [
        _CollegeScholarship(name: 'Academic Scholarships', amount: 'Up to USD 20,000', deadline: 'When prospective students complete an application, they are reviewed for a possible academic scholarship (of up to USD 20,000) at the time of the admissions decision', reqs: 'Academic scholarships are based on high school course selection and GPA and SAT/ACT scores. Students who win an Honor Scholarship are ineligible for these awards. Scholarships are renewable annuall...', url: 'https://www.pfeiffer.edu/admissions/scholarships'),
        _CollegeScholarship(name: 'Milton Rose Science Fellows Scholarships', amount: '5000', deadline: 'When prospective students complete an application, they are reviewed for a possible scholarship at the time of the admissions decision', reqs: 'Majoring in sciences or mathematics', url: 'https://www.pfeiffer.edu/admissions/scholarships'),
        _CollegeScholarship(name: 'The Grigg Education Scholars program', amount: 'Amount is based on funds available from the Grigg Education Scholars program endowment. Awards shall not exceed cost of tuition and room & board', deadline: 'Complete Grigg Education Scholars application form and complete the FAFSA. Scholarship committee will interview applicant who submit required documents. Contact admissions/financial for more info -...', reqs: '3.0 gpa, SAT: 1000, open to NC high school seniors who are interested in teaching profession. Preference is given to Stanly County students who meet program criteria.', url: 'https://www.pfeiffer.edu/admissions/scholarships'),
        _CollegeScholarship(name: 'Honors Program', amount: 'Amount may vary', deadline: 'In early September 2021, the Undergraduate Honors Program at Pfeiffer University will begin considering applications from eligible rising freshmen who are seeking admission to Pfeiffer for fall 202...', reqs: '3.5 weighted gpa', url: 'https://www.pfeiffer.edu/news/research-pays-honors-program-grads'),
        _CollegeScholarship(name: 'PICMA Emerging Writers Competition', amount: '', deadline: 'Information has not been updated since 2019-2020 school year', reqs: '', url: ''),
      ];
    case 'Queens University of Charlotte':
      return [
        _CollegeScholarship(name: 'Merit Scholarships: University Scholarships', amount: 'Amount may vary', deadline: 'All applicants are considered for merit scholarships automatically, regardless of your financial circumstances', reqs: 'Academic success, community service or program-specific excellence.  Strong academic record including top grades and test scores. Excellence and achievement in some extracurricular activities will ...', url: 'https://www.queens.edu/admissions-aid/tuition-scholarship-aid/freshman-transfer-scholarships/'),
        _CollegeScholarship(name: 'Merit Scholarships: IB and AP Capstone Scholarships', amount: 'Amount may vary', deadline: 'All applicants are considered for merit scholarships automatically, regardless of your financial circumstances', reqs: 'Students who have completed the International Baccalaureate Diploma Program (IBDP) or the AP Capstone Innovative Diploma Program. Academic success, community service or program-specific excellence.', url: 'https://www.queens.edu/admissions-aid/tuition-scholarship-aid/freshman-transfer-scholarships/'),
        _CollegeScholarship(name: 'The Queens Commitment', amount: 'USD 10,000 min./year', deadline: 'Automatically considered with application for admission', reqs: 'Admitted students who are current high school graduates of Mecklenburg County and CPCC students', url: 'https://www.queens.edu/news/2020/the-queens-commitment.html'),
        _CollegeScholarship(name: 'Presidential Scholarship Program', amount: 'Full tuition for four years', deadline: 'Must apply for admission by December 1', reqs: 'Outstanding academic achievements and extracurricular engagement', url: 'https://www.queens.edu/admissions-aid/tuition-scholarship-aid/freshman-transfer-scholarships/'),
        _CollegeScholarship(name: 'Trustee Scholarship', amount: 'Amount may vary', deadline: 'Must apply for admission by December 1', reqs: 'Outstanding academic achievements and extracurricular engagement', url: 'https://www.queens.edu/admissions-aid/tuition-scholarship-aid/freshman-transfer-scholarships/'),
        _CollegeScholarship(name: 'Reece A. Overcash Scholarships for Humanities, Math, Science, and Technology', amount: 'Amount may vary', deadline: 'Must apply for admission by December 1', reqs: 'Humanities, Math, Science and Technology majors. Outstanding academic achievements and extracurricular engagement', url: 'https://www.queens.edu/admissions-aid/tuition-scholarship-aid/freshman-transfer-scholarships/'),
        _CollegeScholarship(name: 'James L. Knight School of Communication Scholarships', amount: 'USD 4,000/year', deadline: 'Must apply for admission by December 1', reqs: 'Students entering the Knight School of Communication', url: 'https://www.queens.edu/admissions-aid/tuition-scholarship-aid/freshman-transfer-scholarships/knight-scholarship.html'),
        _CollegeScholarship(name: 'Cato School of Education Fellows', amount: 'Amount may vary', deadline: 'Must apply for admission by December 1', reqs: 'Incoming students to the School of Education and are planning to teach', url: 'https://www.queens.edu/admissions-aid/tuition-scholarship-aid/freshman-transfer-scholarships/knight-scholarship.html'),
        _CollegeScholarship(name: 'McColl School of Business Case Scholarships', amount: 'Amount may vary. DECA and FBLA high school students with more than two semesters of membership and 3.0 and higher GPAs are automatically eligible for up to USD 2,000 annual scholarship.  It is enti...', deadline: 'Must apply for admission by December 1. Participation in the scholarship challenge is optional, but strongly encouraged. Apply for the McColl Scholarship challenge through the Royal Scholarship Pro...', reqs: 'Top-level admitted Queens students will be notified of eligibility to participate. Scholarship challenge to prospective business students. DECA and FBLA high school students with two or more semest...', url: 'https://www.queens.edu/admissions-aid/tuition-scholarship-aid/freshman-transfer-scholarships/'),
        _CollegeScholarship(name: 'Gossett Jewish Leadership Scholarship', amount: 'USD 5,000/yr', deadline: 'Contact admissions/aid. Information not available on website', reqs: 'Candidates must demonstrate a commitment to Judaism and successful leadership experience in their Jewish and/or secular communities.  Recipients are expected to be actively involved in Queens’ Jewi...', url: 'https://www.queens.edu/admissions-aid/tuition-scholarship-aid/freshman-transfer-scholarships/gossett-jewish-leadership.html'),
        _CollegeScholarship(name: 'Performing Arts and Visual Arts Scholarships: Music and Music Therapy', amount: 'up to USD 10,000/yr', deadline: 'Apply for admission and complete audition requirements. Audition dates are December -February', reqs: 'Music or Music Therapy majors. Based on preparation, musical talent, academic achievement and potential', url: 'https://www.queens.edu/admissions-aid/tuition-scholarship-aid/freshman-transfer-scholarships/music-scholarships.html'),
        _CollegeScholarship(name: 'Preyer History Fellows Program', amount: 'USD 2,000 in awards and independent research funds, eligible to compete for up to additional USD 2,000 in funds for international study and internships', deadline: 'Apply for admission, complete the Preyer History Program application. Must declare history major and enroll in two history courses during first year.', reqs: 'History majors. Academic ability and interest in program.', url: 'https://www.queens.edu/admissions-aid/tuition-scholarship-aid/freshman-transfer-scholarships/preyer-history-fellows-program.html'),
        _CollegeScholarship(name: 'Athletic Scholarships', amount: 'Amount may vary', deadline: 'No additional application is provided based on the website. Contact admissions and high school/college coaches for more details for each student', reqs: 'Student-athletes may be considered for NCAA Division II talent-based athletic scholarships.', url: 'https://www.queens.edu/admissions-aid/tuition-scholarship-aid/freshman-transfer-scholarships/'),
        _CollegeScholarship(name: 'Legacy Scholarships', amount: 'Amount may vary', deadline: 'No additional application is provided based on the website.', reqs: 'Children, grandchildren or siblings of enrolled students or previous Queens graduates may be eligible for additional funds', url: 'https://www.queens.edu/admissions-aid/tuition-scholarship-aid/freshman-transfer-scholarships/'),
      ];
    case 'St. Andrews University':
      return [
        _CollegeScholarship(name: 'Honors Program', amount: 'Amount may vary', deadline: 'No additional application is needed. Students who are determined eligible will receive an invitation to join the Honors Program', reqs: '3.4 gpa', url: 'https://www.sa.edu/financial-aid/scholarship-opportunities/'),
        _CollegeScholarship(name: 'Dogwood Scholarship', amount: 'Amount may vary', deadline: 'Admission committee will review application and qualifying students will be contacted by their Admissions Counselor', reqs: 'Based on students gpa and SAT/ACT score', url: 'https://www.sa.edu/financial-aid/scholarship-opportunities/'),
        _CollegeScholarship(name: 'Intercollegiate Scholarships', amount: 'Amount may vary', deadline: 'Contact Head Coach', reqs: 'Womens: Basketball, Beach Volleyball, Cheer, Cross Country, Dance, eSports, Golf, Lacrosse, Softball, Soccer, Swimming, Track & Field, Volleyball, Indoor Track & Field, and Wrestling Mens: Baseball...', url: 'https://www.sa.edu/financial-aid/scholarship-opportunities/'),
        _CollegeScholarship(name: 'Equestrian Performance', amount: 'Amount may vary', deadline: 'Apply for Performance Scholarship by March 1', reqs: 'Must have Equine competition experience in hunter-jumper, western, or dressage. Students must compete on one of our equestrian teams and maintain good academic standing in order to keep the award a...', url: 'https://www.sa.edu/financial-aid/scholarship-opportunities/'),
        _CollegeScholarship(name: 'Studio Art', amount: 'Amount may vary', deadline: 'Submit scholarship application and portfolio', reqs: 'Available to all students of the college by portfolio review and scholarship application', url: 'https://www.sa.edu/financial-aid/scholarship-opportunities/'),
        _CollegeScholarship(name: 'Choir', amount: 'Amount may vary', deadline: 'Submit scholarship application and audition for Choir', reqs: 'Based on audition results and needs of the choir', url: 'https://www.sa.edu/financial-aid/scholarship-opportunities/'),
        _CollegeScholarship(name: 'Creative Writing', amount: 'Amount may vary', deadline: 'Submit scholarship application and portfolio', reqs: 'Based on writing portfolio', url: 'https://www.sa.edu/financial-aid/scholarship-opportunities/'),
        _CollegeScholarship(name: 'St. Andrews Pipe Band', amount: 'Amount may vary', deadline: 'Audition required. Deadline for submission is by March 1.', reqs: 'Pipers, drummers and Celtic dancers', url: 'https://www.sa.edu/financial-aid/scholarship-opportunities/'),
        _CollegeScholarship(name: 'Therapeutic Horsemanship', amount: 'Amount may vary', deadline: 'Submit Therapeutic Horsemanship Scholarship application by March !.', reqs: '3.0 gpa, Students interested in therapeutic horsemanship program. Applicants are required to have volunteer hours at Therapeutic Horsemanship center or submit a written paper about the benefits of ...', url: 'https://www.sa.edu/financial-aid/scholarship-opportunities/'),
      ];
    case 'Saint Augustines University':
      return [
        _CollegeScholarship(name: 'Institutional Scholarships', amount: '', deadline: 'No information is listed regarding institutional scholarships. Website does list a few external scholarships', reqs: '', url: ''),
      ];
    case 'Salem College':
      return [
        _CollegeScholarship(name: 'Salem College Promise', amount: 'Tuition and fees', deadline: 'All admitted students are considered with no additional scholarship application', reqs: 'NC resident, incoming first year, Pell-eligible', url: 'https://www.salem.edu/admissions/scholarships'),
        _CollegeScholarship(name: 'Academic Scholarship', amount: 'Half of tuition cost', deadline: 'All admitted students are considered with no additional scholarship application', reqs: '3.25 gpa', url: 'https://www.salem.edu/admissions/scholarships'),
        _CollegeScholarship(name: 'Davis Art Scholarship', amount: 'Full tuition cost', deadline: 'Scholarship application deadline is January 15. Contact admissions for more information on application', reqs: 'Students interested in majoring in Studio Art, Interior Design or Art History', url: 'https://www.salem.edu/admissions/scholarships'),
        _CollegeScholarship(name: 'Music Scholarships', amount: 'Amount may vary', deadline: 'Contact admissions about specific scholarships. 336-917-2621/ admissions@salem.edu', reqs: 'Music Major', url: 'https://www.salem.edu/admissions/scholarships'),
      ];
    case 'Shaw University':
      return [
        _CollegeScholarship(name: 'Institutional Scholarships', amount: '', deadline: 'No information is listed regarding institutional scholarships. Website is in the process of updates. Financial Aid process is Aug 15- Sept 15. Decisions regarding scholarships begin about two weeks...', reqs: '', url: ''),
      ];
    case 'University of Mount Olive':
      return [
        _CollegeScholarship(name: 'Leaders Scholarship', amount: 'USD 5,000/year', deadline: 'All admitted students are considered with no additional scholarship application', reqs: '2.8 gpa, SAT: 1000, ACT: 19', url: 'https://umo.edu/academic-scholarships/'),
        _CollegeScholarship(name: 'Merit Scholarship', amount: 'USD 6,000/year', deadline: 'All admitted students are considered with no additional scholarship application', reqs: '3.2 gpa, SAT: 1100, ACT: 22', url: 'https://umo.edu/academic-scholarships/'),
        _CollegeScholarship(name: 'Presidential Scholarship', amount: 'USD 8,000/year *The Presidential scholarship is awarded only upon initial entrance to UMO', deadline: 'All admitted students are considered with no additional scholarship application', reqs: '3.7 gpa, SAT: 1100, ACT: 22', url: 'https://umo.edu/academic-scholarships/'),
        _CollegeScholarship(name: 'Trojan Scholarship', amount: 'USD 1,000/year', deadline: 'All admitted students are considered with no additional scholarship application', reqs: 'Awarded to students who live on campus and receive an academic scholarship', url: 'https://umo.edu/academic-scholarships/'),
        _CollegeScholarship(name: 'Athletic Scholarships', amount: 'Annual amount may vary depending on talent and funds', deadline: 'Contact Head Coach and HS school coach for more info', reqs: 'Based on talent and fund availability Baseball, basketball, cheerleading, cross country, field hockey (women), golf, lacrosse, soccer, softball, tennis, track and field, volleyball, and wrestling (...', url: 'https://umo.edu/athletic-scholarships/'),
        _CollegeScholarship(name: 'Ministerial Benefit Grant', amount: 'At least 90% of all tuition cost for those persons preparing to serve in leadership in the church would be borne by the University.', deadline: 'Apply for admission, admitted to religion degree program and submit grant application', reqs: '2.5 gpa, licensed ordained minister, Admitted to religion degree program, eligible for institutional aid, obtain endorsement from students home church and ordaining counsel', url: 'https://umo.edu/ministerial-and-community-grants/'),
        _CollegeScholarship(name: 'Mount Olive Rotary Endowed Scholarship Fund', amount: 'USD 4,000/year', deadline: 'Apply for admission and submit Scholarship fund application', reqs: '2.8 gpa, SAT: 920, ACT: 19, Leadership experiences in high school, community or church organizations', url: 'https://umo.edu/ministerial-and-community-grants/'),
        _CollegeScholarship(name: 'Art', amount: 'USD 500-USD 1,500 based on portfolio review', deadline: 'No additional application listed on website', reqs: 'Art or graphic design major, full-time student, 2.5 gpa, participate in departmental events', url: 'https://umo.edu/departmental-scholarships/'),
        _CollegeScholarship(name: 'Education: Homegrown Teacher Academy Scholarship', amount: 'USD 3,000 during freshman & sophomore years  USD 6,000 during junior and seniors years', deadline: 'Must apply via scholarship website by April 1', reqs: 'Resident of Duplin County, 3.5 gpa, must teach in Duplin County for 4 years after graduation.', url: 'https://umo.edu/wp-content/uploads/Homegrown-Techer-Academy-Application.pdf'),
        _CollegeScholarship(name: 'Music: Charles and Margenette A. Hinnant Music Scholarship', amount: 'USD 3,000/year', deadline: 'Audition required', reqs: 'Demonstrate outstanding talent, academic ability and good character', url: 'https://umo.edu/departmental-scholarships/'),
        _CollegeScholarship(name: 'Music: Ensemble Scholarships', amount: 'Chamber Choir - USD 2,750/year Concert Choir - USD 1,000/year Chamber Ensemble - USD 1,000/year', deadline: 'Must audition and register for appropriate ensemble and applied course during the semester', reqs: 'Demonstrate outstanding talent, academic ability and good character', url: 'https://umo.edu/departmental-scholarships/'),
        _CollegeScholarship(name: 'Music: Warren Vocal Scholarship', amount: 'USD 500/year', deadline: 'Audition may be required', reqs: 'Demonstrate outstanding talent, academic ability and good character', url: 'https://umo.edu/departmental-scholarships/'),
        _CollegeScholarship(name: 'Music: Trumpet Scholarship', amount: 'USD 500/year', deadline: 'Audition may be required', reqs: 'Demonstrate outstanding talent, academic ability and good character', url: 'https://umo.edu/departmental-scholarships/'),
        _CollegeScholarship(name: 'Music: Instrumental Scholarship', amount: 'USD 200/year', deadline: 'Audition may be required', reqs: 'Demonstrate outstanding talent, academic ability and good character', url: 'https://umo.edu/departmental-scholarships/'),
        _CollegeScholarship(name: 'Agriculture: AgCarolina Farm Credit Scholarship', amount: 'Amount may vary', deadline: 'Submit application for admission and scholarship application', reqs: '3.0 gpa. Must be a child or grandchild of an AgCarolina Farm Credit Customer. Enroll in a four-year Agricultureal program. Recipients will be selected based on academic achievement, leadership char...', url: 'https://umo.edu/departmental-scholarships/'),
        _CollegeScholarship(name: 'Agriculture: Carolina Farm Credit Scholarship', amount: 'USD 2,000/year', deadline: 'Submit application for admission and scholarship application', reqs: '2.5 gpa. Enroll in a four-year Agricultureal program. Recipients will be selected based on academic achievement, leadership characteristics and future plans for enhancing the quality of life for Ea...', url: 'https://umo.edu/departmental-scholarships/'),
        _CollegeScholarship(name: 'Agriculture: NC Peanut Growers Scholarship', amount: '1000/year', deadline: 'Submit application for admission and scholarship application', reqs: 'Recipients must demonstrate strong evidence of personal integrity, moral character, good citizenship, academic promise and a sincere commitment to attaining an education. Priority for students who ...', url: 'https://umo.edu/departmental-scholarships/'),
        _CollegeScholarship(name: 'Agriculture: Collegiate FFA Scholarship', amount: 'USD 500/year', deadline: 'Submit application for admission and scholarship application. Scholarship deadline is April 1', reqs: '2.5 gpa Active involvement in FFA, pursue a degree in agriculture as a full-time student, active membership in UMO CFFA', url: 'https://umo.edu/departmental-scholarships/'),
        _CollegeScholarship(name: 'Barbara Ross Kornegay Scholarship', amount: 'USD 1,100/year', deadline: 'Submit application for admission and scholarship application. Selected candidates will be interviewed by the Kornegay scholarship committee. Scholarship deadline is April 1', reqs: '3.0 gpa Actively involved in FFA or CFFA and pursing degree in agriculture', url: 'https://umo.edu/departmental-scholarships/'),
      ];
    case 'Wake Forest University':
      return [
        _CollegeScholarship(name: 'Guy T. Carswell Scholarships', amount: 'Tuition, room and board, USD 3,400 for personal expenses. Recipients are also encouraged to apply for up to USD 5,000 funding for research, study or travel project during each of their three summer...', deadline: 'No additional application is required for scholarship consideration. Submit application for admission by November 15. Finalists are invited to campus for interviews and are notified by the end of t...', reqs: 'Awarded to students with outstanding qualities of academic promise, leadership, and talent. Successful applicants have pursued the most challenging curriculum available to them and have achieved gr...', url: 'https://financialaid.wfu.edu/merit/'),
        _CollegeScholarship(name: 'Joseph G. Gordon Scholarships', amount: 'Tuition, room and board, USD 3,400 for personal expenses. Recipients are also encouraged to apply for up to USD 5,000 funding for research, study or travel project during each of their three summer...', deadline: 'No additional application is required for scholarship consideration. Submit application for admission by November 15. Finalists are invited to campus for interviews and are notified by the end of t...', reqs: 'Awarded to students who show exceptional promise and achievement and who are members of constituencies traditionally underrepresented at Wake Forest', url: 'https://financialaid.wfu.edu/merit/'),
        _CollegeScholarship(name: 'Graylyn Scholarships', amount: 'Tuition, room and board, USD 3,400 for personal expenses. Recipients are also encouraged to apply for up to USD 5,000 funding for research, study or travel project during each of their three summer...', deadline: 'No additional application is required for scholarship consideration. Submit application for admission by November 15. Finalists are invited to campus for interviews and are notified by the end of t...', reqs: 'Successful applicants have pursued the most challenging curriculum available to them and have achieved grade point averages and standardized test scores (if submitted) that place them in the top pe...', url: 'https://financialaid.wfu.edu/merit/'),
        _CollegeScholarship(name: 'Nancy Susan Reynolds Scholarships', amount: 'Tuition, room and board, USD 3,400 for personal expenses. Recipients are also encouraged to apply for up to USD 5,000 funding for research, study or travel project during each of their three summer...', deadline: 'No additional application is required for scholarship consideration. Submit application for admission by November 15. Finalists are invited to campus for interviews and are notified by the end of t...', reqs: 'Excellent students and creative leaders. Successful applicants have pursued the most challenging curriculum available to them and have achieved grade point averages and standardized test scores (if...', url: 'https://financialaid.wfu.edu/merit/'),
        _CollegeScholarship(name: 'Stamps Scholarships', amount: 'Tuition, fees, room and board, and USD 3,400 for books and personal expense. Scholars may receive up to USD 15,000 total over their four undergraduate years for approved travel or study projects.', deadline: 'No additional application is required for scholarship consideration. Submit application for admission by November 15. Finalists are invited to campus for interviews and are notified by the end of t...', reqs: 'Students who demonstrate outstanding academic achievement, a high degree of intellectual curiosity and scholarship, exceptional promise in leadership, service and social responsibility, perseveranc...', url: 'https://financialaid.wfu.edu/merit/'),
        _CollegeScholarship(name: 'Leadership and Character Scholars', amount: 'Full scholarship', deadline: 'Apply and qualify for, need-based financial aid (FAFSA an CSS profile) in their first year. Submit application for admission by December 1.  Submit application for admission by November 15.', reqs: 'Students who have demonstrated merit, moral leadership, commitment and purpose, overcome great odds, worked hard to accomplish goal and work on behalf of others. Show virtues such as honesty, dilig...', url: 'https://financialaid.wfu.edu/merit/'),
        _CollegeScholarship(name: 'Leila and David Farr Scholarship (in Entrepreneurship)', amount: 'USD 5,000/year', deadline: 'Submit the application for admission, include a brief letter asking to be considered for the Farr Scholarship, describing how you became interested in entrepreneurship. Letter is due January 15.  S...', reqs: 'Interest in entrepreneurship and shows outstanding potential.', url: 'https://financialaid.wfu.edu/merit/'),
        _CollegeScholarship(name: 'Inmar Technology Scholarships (in Computer Science)', amount: 'USD 10,000/year Ability to earn a competitive salary during the summer months as an intern', deadline: 'Submit application for admission, submit scholarship application by February 15.  Submit application for admission by November 15.', reqs: 'Strong interest in majoring in Computer Science or Information Technology.', url: 'https://financialaid.wfu.edu/merit/'),
        _CollegeScholarship(name: 'Randall D. Ledford Scholarships I (in Physics)', amount: 'Half-tuition scholarship', deadline: 'Submit application for admission and scholarship application (Fall 2023)', reqs: 'Physics Majors', url: 'https://financialaid.wfu.edu/merit/'),
        _CollegeScholarship(name: 'Randall D. Ledford Scholarships II (in Physics)', amount: 'Half-tuition scholarship', deadline: 'Submit application for admission by November 15 and scholarship application letter by February 15, 2022', reqs: 'Physics Majors', url: 'https://financialaid.wfu.edu/merit/'),
        _CollegeScholarship(name: 'William Louis Poteat Scholarships', amount: 'Scholarship amount may vary', deadline: 'Complete application for admission by November 15 and FAFSA,  CSS profile, & recommendation form/application by January 1.', reqs: 'Active member of a NC Baptist church. The award is based upon excellent academic achievement, promise of leadership, and involvement in one’s church, and recipients must show promise of making a si...', url: 'https://financialaid.wfu.edu/merit/'),
        _CollegeScholarship(name: 'Presidential Scholarships for Distinguished Achievement', amount: 'USD 16,000/year', deadline: 'Provide documentation of talent (art portfolios, debate records, taped performances, etc.) Applications for admission and scholarship applications received after November 15 will be considered as t...', reqs: 'Students who possess exceptional talents in art, dance, debate, music, and theatre.', url: 'https://financialaid.wfu.edu/merit/'),
        _CollegeScholarship(name: 'Army ROTC Scholarships', amount: 'Scholarship amount may vary', deadline: 'The four-year scholarships are awarded after national high school competition. Submit application for admission by November 15.', reqs: 'Based on academic and extracurricular achievement as well as leadership potential.', url: 'https://financialaid.wfu.edu/merit/'),
        _CollegeScholarship(name: 'Egbert L. Davis, Jr. Scholarship', amount: 'Scholarship amount may vary', deadline: 'Based on review of application for admission. Submit application for admission by November 15.', reqs: 'Winners demonstrate outstanding academic performance, diligence, integrity, character, leadership, and reasonable athletic competence.', url: 'https://financialaid.wfu.edu/merit/'),
        _CollegeScholarship(name: 'George E. and Lila C. Bradford Scholarships', amount: 'Scholarship amount may vary', deadline: 'Based on review of application for admission. Submit application for admission by November 15.', reqs: 'Awarded to a student with an intent and capacity to prepare for a career in medicine.', url: 'https://financialaid.wfu.edu/merit/'),
        _CollegeScholarship(name: 'Heritage Scholarships', amount: 'Scholarship amount may vary', deadline: 'Applicants should complete both the CSS Profile and the FAFSA by January 1, so that need may be determined before the selection process is complete. Submit application for admission by November 15.', reqs: 'Awarded to students special gifts in the liberal arts and sciences who have demonstrated their academic potential, critical curiosity, and passion for learning. These scholarships are awarded to st...', url: 'https://financialaid.wfu.edu/merit/'),
        _CollegeScholarship(name: 'Holding Scholarship', amount: 'Scholarship amount may vary', deadline: 'Applicants should complete both the CSS Profile and the FAFSA by January 1, so that need may be determined before the selection process is complete. Submit application for admission by November 15.', reqs: 'Student from North Carolina (with strong preference given to applicants from eastern North Carolina) who has shown strong academic talent and an exceptional promise in civic leadership. Holding Sch...', url: 'https://financialaid.wfu.edu/merit/'),
        _CollegeScholarship(name: 'Junius C. and Eliza P. Brown Scholarships', amount: 'Scholarship amount may vary', deadline: 'Applicants should complete both the CSS Profile and the FAFSA by January 1, so that need may be determined before the selection process is complete. Submit application for admission by November 15.', reqs: 'Need-based scholarship. Preference given to residents of the town of Madison and Rockingham County', url: 'https://financialaid.wfu.edu/merit/'),
        _CollegeScholarship(name: 'Leroy and Teresa Robinson Scholarships', amount: 'USD 2,000 - full tuition', deadline: 'Applicants should complete the CSS Profile by January 1. Submit application for admission by November 15.', reqs: 'Available for students in Montgomery County. reference is given to graduates of East Montgomery High School, but applications are encouraged from graduates of all schools in the county. The awards ...', url: 'https://financialaid.wfu.edu/merit/'),
        _CollegeScholarship(name: 'Marcus C. Miller Scholarship', amount: 'Scholarship amount may vary', deadline: 'Submit application for admission by November 15.', reqs: 'Demonstrated ability in the innovative use of information technology prior to entering Wake Forest.', url: 'https://financialaid.wfu.edu/merit/'),
        _CollegeScholarship(name: 'O.W. Wilson Scholarship', amount: 'Scholarship amount may vary', deadline: 'Submit application for admission by November 15.', reqs: 'Awarded to students who have clearly superior records and excellent potential.', url: 'https://financialaid.wfu.edu/merit/'),
        _CollegeScholarship(name: 'Robert P. and Dorothy Caldwell Scholarship', amount: 'Scholarship amount may vary', deadline: 'Submit application for admission by November 15.', reqs: 'Need-based and merit-based scholarships. Scholarship Committee gives preference to students from Gaston and Catawba (N.C.) Counties who need assistance in order to attend Wake Forest.', url: 'https://financialaid.wfu.edu/merit/'),
        _CollegeScholarship(name: 'Additional Scholarship Programs', amount: 'Scholarship amount may vary', deadline: 'Many scholarships are available for students that are funded by donors. Criteria and details may be vary', reqs: '', url: 'https://financialaid.wfu.edu/merit/'),
      ];
    case 'Warren Wilson College':
      return [
        _CollegeScholarship(name: 'Milepost One', amount: 'Full tuition. Milepost One winners who qualify for a federal or state need-based grant will receive the remainder of their tuition free through the Warren Wilson College Milepost One scholarship.', deadline: 'Submit application for admission, complete the FAFSA, submit scholarship application by February 1, 2022', reqs: '3.0 gpa, Family income is USD 125,000 or less, live on campus', url: 'https://warren-wilson.edu/admission/tuition-and-aid/scholarships/'),
        _CollegeScholarship(name: 'Academic Scholarships', amount: 'USD 7,000-USD 17,000/year', deadline: 'Warren Wilson does not require a separate application for scholarship consideration. All applicants are reviewed for scholarships at the time of acceptance. Students will be notified in your accept...', reqs: 'Trustee, Presidential, Dean’s, and Opportunity scholarships are available.  Based exclusively on academic performance, including research projects and rigor of curriculum, our academic scholarships...', url: 'https://warren-wilson.edu/admission/tuition-and-aid/scholarships/'),
        _CollegeScholarship(name: 'Woodbury Scholarship', amount: 'USD 5,000/year', deadline: 'Recipients are nominated by their admissions counselor. Warren Wilson does not require a separate application for scholarship consideration. All applicants are reviewed for scholarships at the time...', reqs: 'The scholarship is based on merit or need, and recipients are nominated by their admissions counselor and chosen annually by a special committee.', url: 'https://warren-wilson.edu/admission/tuition-and-aid/scholarships/'),
        _CollegeScholarship(name: 'Honors Scholarship', amount: 'USD 4,000/year', deadline: 'Warren Wilson does not require a separate application for scholarship consideration. All applicants are reviewed for scholarships at the time of acceptance. Students will be notified in your accept...', reqs: 'Awarded to those students who best represent the mission of the college through their overall high school performance and notable achievements. The most prestigious of our scholarships, students mu...', url: 'https://warren-wilson.edu/admission/tuition-and-aid/scholarships/'),
        _CollegeScholarship(name: 'Community Engagement and Leadership Scholarship', amount: 'USD 4,000/year', deadline: 'Warren Wilson does not require a separate application for scholarship consideration. All applicants are reviewed for scholarships at the time of acceptance. Students will be notified in your accept...', reqs: 'Awarded to students who have demonstrated exceptional leadership capacity or commitment to their community, including involvement in some form of volunteer activity. Students may also be considered...', url: 'https://warren-wilson.edu/admission/tuition-and-aid/scholarships/'),
        _CollegeScholarship(name: 'Sustainability Scholarship', amount: 'USD 4,000/year', deadline: 'Warren Wilson does not require a separate application for scholarship consideration. All applicants are reviewed for scholarships at the time of acceptance. Students will be notified in your accept...', reqs: 'Awarded to students who have demonstrated exceptional leadership in both awareness and action towards a healthier planet.', url: 'https://warren-wilson.edu/admission/tuition-and-aid/scholarships/'),
      ];
    case 'William Peace University':
      return [
        _CollegeScholarship(name: 'Presidential Scholarship', amount: 'USD 16,000/year', deadline: 'All first-year and transfer students who are accepted for admission at William Peace University will be considered for merit-based scholarships and grants.', reqs: 'Students who have earned exceptional academic records, characteristics of leadership and/or special talents that would enable them to make significant contributions to campus life.', url: 'https://www.peace.edu/admissions-aid/costs-scholarships-financial-aid/scholarships-and-awards/'),
        _CollegeScholarship(name: 'Deans Scholarship', amount: 'USD 14,000/year', deadline: 'All first-year and transfer students who are accepted for admission at William Peace University will be considered for merit-based scholarships and grants.', reqs: 'Students who have strong academic records who will make significant contributions to the campus', url: 'https://www.peace.edu/admissions-aid/costs-scholarships-financial-aid/scholarships-and-awards/'),
        _CollegeScholarship(name: 'William Peace Scholarship', amount: 'USD 12,000/year', deadline: 'All first-year and transfer students who are accepted for admission at William Peace University will be considered for merit-based scholarships and grants.', reqs: 'Students who have earned outstanding academic records and display significant contributions to the WPU community', url: 'https://www.peace.edu/admissions-aid/costs-scholarships-financial-aid/scholarships-and-awards/'),
        _CollegeScholarship(name: 'Pacer Scholarship', amount: 'USD 9,000/year', deadline: 'All first-year and transfer students who are accepted for admission at William Peace University will be considered for merit-based scholarships and grants.', reqs: 'Awarded annually based on merit/academics', url: 'https://www.peace.edu/admissions-aid/costs-scholarships-financial-aid/scholarships-and-awards/'),
        _CollegeScholarship(name: 'WPU Award', amount: 'USD 4,000/year', deadline: 'All first-year and transfer students who are accepted for admission at William Peace University will be considered for merit-based scholarships and grants.', reqs: 'Students who have been involved in high school activities including academic or extracurricular programming', url: 'https://www.peace.edu/admissions-aid/costs-scholarships-financial-aid/scholarships-and-awards/'),
        _CollegeScholarship(name: 'Honors Scholarship', amount: 'USD 1,000/year', deadline: 'Must be accepted into the university by April 1. Eligible students will receive an invitation to apply for the honors programs. Interview with search committee may be required.', reqs: '3.7 gpa. SAT/ACT scores will be reviewed', url: 'https://www.peace.edu/admissions-aid/costs-scholarships-financial-aid/scholarships-and-awards/'),
        _CollegeScholarship(name: 'Theater Scholarship', amount: 'Scholarship amount may vary', deadline: 'Interview and audition are required with the respective department', reqs: 'Students who are interested in pursuing degree in Fine Arts.', url: 'https://www.peace.edu/admissions-aid/costs-scholarships-financial-aid/scholarships-and-awards/'),
        _CollegeScholarship(name: 'Sibling Grant', amount: 'USD 500/semester', deadline: 'Students must contact the financial aid office for eligibility', reqs: 'Siblings who are simultaneously enrolled in the day program at WPU', url: 'https://www.peace.edu/admissions-aid/costs-scholarships-financial-aid/scholarships-and-awards/'),
      ];
    case 'Wingate University':
      return [
        _CollegeScholarship(name: 'Academic Merit Scholarships, Irwin Belk Scholarships, Gateway Scholarships, Presidential Scholarships, Trustee Scholarships', amount: 'Academic scholarships range in value based on applicant eligibility and scholarship type', deadline: 'Admissions staff review all eligible applicants for consideration for scholarships', reqs: 'Each scholarship requirements vary based on a holistic review of applications', url: 'https://www.wingate.edu/admissions/financial-aid/student-financial-aid'),
        _CollegeScholarship(name: 'Jerry E. McGee Scholarship', amount: 'Scholarship amount may vary', deadline: 'Admissions staff review all eligible applicants for consideration for scholarships. Those eligible for the scholarship will be contacted directly to apply.', reqs: 'Each scholarship requirements vary based on a holistic review of applications', url: 'https://www.wingate.edu/admissions/financial-aid/student-financial-aid'),
        _CollegeScholarship(name: 'True Homes, LLC', amount: 'USD 1,000/year', deadline: 'Admissions staff review all eligible applicants for consideration for scholarships. Those eligible for the scholarship will be contacted directly to apply.', reqs: 'Available to student in 25 Carolinas counties.', url: 'https://www.wingate.edu/admissions/financial-aid/student-financial-aid'),
        _CollegeScholarship(name: 'Wilma L. McCurdy Memorial Fund', amount: 'Scholarship amount may vary', deadline: 'Apply for admission and submit scholarship application', reqs: '2.0 gpa, demonstrated financial need and residents of Stanly county.', url: 'https://www.wingate.edu/admissions/financial-aid/student-financial-aid'),
        _CollegeScholarship(name: 'Luther H. Butler Scholarship', amount: 'USD 500-USD 2,500', deadline: 'Apply for admission and submit scholarship application by February 15', reqs: 'Students who are members of a church affiliated with the Baptist State Convention of NC.', url: 'https://www.wingate.edu/admissions/financial-aid/student-financial-aid'),
      ];
    default:
      return [];
  }
}

class _CollegeScholarship {
  final String name, amount, deadline, reqs, url;
  const _CollegeScholarship({required this.name, required this.amount, required this.deadline, required this.reqs, required this.url});
}

// ── FIND MY SCHOOL DATA ────────────────────────────────────────

const List<String> _ctecSchools = [
  'A.L. Brown High School',
  'Asheboro High School',
  'Beddingfield High School',
  'Ben L. Smith High School',
  'Bertie High School',
  'Caldwell Early College High School',
  'Cape Hatteras Secondary School',
  'Chatham Central High School',
  'iMeck Academy',
  'East Surry High School',
  'Eastern Guilford High School',
  'Eastern Randolph High School',
  'E. E. Smith High School',
  'Elkin High School',
  'Fairmont High School',
  'Farmville Central High School',
  'Fike High School',
  'First Flight High School',
  'Garinger High School',
  'Gates County High School',
  'Graham High School',
  'Harnett Central High School',
  'Hawthorne Academy of Health Sciences',
  'Hertford County High School',
  'Hibriten High School',
  'High Point Central High School',
  'Hillside High School',
  'Hoke County High School',
  'Hugh M. Cummings High School',
  'Hunt High School',
  'J. M. Morehead High School',
  'James B. Dudley High School',
  'Jordan-Matthews High School',
  'Julius L. Chambers High School',
  'Kinston High School',
  'Lexington Senior High School',
  'Lumberton High School',
  'Manteo High School',
  'McMichael High School',
  'Montgomery Central High School',
  'Mt. Airy High School',
  'Nash Central High School',
  'North Edgecombe High School',
  'North Lenoir High School',
  'North Rowan High School',
  'North Surry High School',
  'Northwest Collegiate and Technical Academy',
  'Pamlico County High School',
  'Parkland High School',
  'Phillip O. Berry High School',
  'Polk County Early College',
  'Polk County High School',
  'Purnell Swett High School',
  'Reidsville High School',
  'Roanoke Valley Early College',
  'Rockingham County High School',
  'Rockingham Early College High School',
  'Rocky Mount High School',
  'Rocky River High School',
  'Salisbury High School',
  'Scotland High School',
  'South Caldwell High School',
  'South Central High School',
  'South Lenoir High School',
  'South Stokes High School',
  'Southeast Collegiate Prep Academy',
  'Southern School of Energy and Sustainability',
  'Southwest Edgecombe High School',
  'Surry Central High School',
  'Surry Early College High School of Design',
  'T. W. Andrews High School',
  'Tarboro High School',
  'Thomasville High School',
  'Vance County High School',
  'Walter Williams High School',
  'Warren County High School',
  'Weldon STEM High School',
  'West Caldwell High School',
  'West Charlotte High School',
  'West Mecklenburg High School',
  'West Stokes High School',
  'Other / Not Listed',
];

const Map<String, String> _schoolCounty = {
  'A.L. Brown High School': 'Cabarrus',
  'Asheboro High School': 'Randolph',
  'Beddingfield High School': 'Wilson',
  'Ben L. Smith High School': 'Guilford',
  'Bertie High School': 'Bertie',
  'Caldwell Early College High School': 'Caldwell',
  'Cape Hatteras Secondary School': 'Dare',
  'Chatham Central High School': 'Chatham',
  'iMeck Academy': 'Mecklenburg',
  'East Surry High School': 'Surry',
  'Eastern Guilford High School': 'Guilford',
  'Eastern Randolph High School': 'Randolph',
  'E. E. Smith High School': 'Cumberland',
  'Elkin High School': 'Surry',
  'Fairmont High School': 'Robeson',
  'Farmville Central High School': 'Pitt',
  'Fike High School': 'Wilson',
  'First Flight High School': 'Dare',
  'Garinger High School': 'Mecklenburg',
  'Gates County High School': 'Gates',
  'Graham High School': 'Alamance',
  'Harnett Central High School': 'Harnett',
  'Hawthorne Academy of Health Sciences': 'Mecklenburg',
  'Hertford County High School': 'Hertford',
  'Hibriten High School': 'Caldwell',
  'High Point Central High School': 'Guilford',
  'Hillside High School': 'Durham',
  'Hoke County High School': 'Hoke',
  'Hugh M. Cummings High School': 'Alamance',
  'Hunt High School': 'Wilson',
  'J. M. Morehead High School': 'Rockingham',
  'James B. Dudley High School': 'Guilford',
  'Jordan-Matthews High School': 'Chatham',
  'Julius L. Chambers High School': 'Mecklenburg',
  'Kinston High School': 'Lenoir',
  'Lexington Senior High School': 'Davidson',
  'Lumberton High School': 'Robeson',
  'Manteo High School': 'Dare',
  'McMichael High School': 'Rockingham',
  'Montgomery Central High School': 'Montgomery',
  'Mt. Airy High School': 'Surry',
  'Nash Central High School': 'Nash',
  'North Edgecombe High School': 'Edgecombe',
  'North Lenoir High School': 'Lenoir',
  'North Rowan High School': 'Rowan',
  'North Surry High School': 'Surry',
  'Northwest Collegiate and Technical Academy': 'Halifax',
  'Pamlico County High School': 'Pamlico',
  'Parkland High School': 'Forsyth',
  'Phillip O. Berry High School': 'Mecklenburg',
  'Polk County Early College': 'Polk',
  'Polk County High School': 'Polk',
  'Purnell Swett High School': 'Robeson',
  'Reidsville High School': 'Rockingham',
  'Roanoke Valley Early College': 'Halifax',
  'Rockingham County High School': 'Rockingham',
  'Rockingham Early College High School': 'Rockingham',
  'Rocky Mount High School': 'Nash',
  'Rocky River High School': 'Mecklenburg',
  'Salisbury High School': 'Rowan',
  'Scotland High School': 'Scotland',
  'South Caldwell High School': 'Caldwell',
  'South Central High School': 'Pitt',
  'South Lenoir High School': 'Lenoir',
  'South Stokes High School': 'Stokes',
  'Southeast Collegiate Prep Academy': 'Halifax',
  'Southern School of Energy and Sustainability': 'Durham',
  'Southwest Edgecombe High School': 'Edgecombe',
  'Surry Central High School': 'Surry',
  'Surry Early College High School of Design': 'Surry',
  'T. W. Andrews High School': 'Guilford',
  'Tarboro High School': 'Edgecombe',
  'Thomasville High School': 'Davidson',
  'Vance County High School': 'Vance',
  'Walter Williams High School': 'Alamance',
  'Warren County High School': 'Warren',
  'Weldon STEM High School': 'Halifax',
  'West Caldwell High School': 'Caldwell',
  'West Charlotte High School': 'Mecklenburg',
  'West Mecklenburg High School': 'Mecklenburg',
  'West Stokes High School': 'Stokes',
  'Other / Not Listed': 'NC',
};

List<_SchoolScholarship> _getScholarships(String school) {
  if (school == 'A.L. Brown High School') return _albScholarships;
  if (school == 'Asheboro High School') return _asheboroScholarships;
  if (school == 'Ben L. Smith High School') return _benSmithScholarships;
  if (school == 'Bertie High School') return _bertieScholarships;
  if (school == 'Caldwell Early College High School') return _caldwellEarlyCollegeScholarships;
  if (school == 'Cape Hatteras Secondary School') return _capeHatterasScholarships;
  if (school == 'Chatham Central High School') return _chathamCentralScholarships;
  if (school == 'E. E. Smith High School') return _eeSmithScholarships;
  if (school == 'East Surry High School') return _eastSurryScholarships;
  if (school == 'Eastern Guilford High School') return _easternGuilfordScholarships;
  if (school == 'Eastern Randolph High School') return _easternRandolphScholarships;
  if (school == 'Elkin High School') return _elkinScholarships;
  if (school == 'Fairmont High School') return _fairmontScholarships;
  if (school == 'Farmville Central High School') return _farmvilleCentralScholarships;
  if (school == 'Fike High School') return _fikeScholarships;
  if (school == 'First Flight High School') return _firstFlightScholarships;
  if (school == 'Garinger High School') return _garingerScholarships;
  if (school == 'Gates County High School') return _gatesCountyScholarships;
  if (school == 'Graham High School') return _grahamScholarships;
  if (school == 'Harnett Central High School') return _harnettCentralScholarships;
  if (school == 'Hawthorne Academy of Health Sciences') return _hawthorneAcademyScholarships;
  if (school == 'Hertford County High School') return _hertfordCountyScholarships;
  if (school == 'Hibriten High School') return _hibritenScholarships;
  if (school == 'High Point Central High School') return _highPointCentralScholarships;
  if (school == 'Hillside High School') return _hillsideScholarships;
  if (school == 'Hoke County High School') return _hokeCountyScholarships;
  if (school == 'Hugh M. Cummings High School') return _cummingsScholarships;
  if (school == 'Hunt High School') return _huntScholarships;
  if (school == 'iMeck Academy') return _imeckScholarships;
  if (school == 'J. M. Morehead High School') return _moreheadScholarships;
  if (school == 'James B. Dudley High School') return _dudleyScholarships;
  if (school == 'Jordan-Matthews High School') return _jordanMatthewsScholarships;
  if (school == 'Julius L. Chambers High School') return _chambersScholarships;
  if (school == 'Kinston High School') return _kinstonScholarships;
  if (school == 'Lexington Senior High School') return _lexingtonScholarships;
  final county = _schoolCounty[school] ?? 'NC';
  return [
    _SchoolScholarship(
      name: 'CFNC.org Scholarship Search',
      amount: 'Varies',
      details: 'Search hundreds of NC scholarships matched to $county County students. Free to use.',
      url: 'https://www.cfnc.org/money-for-college/find-scholarships/',
    ),
    _SchoolScholarship(
      name: 'NC Need-Based Grant',
      amount: 'Up to \$9,300/yr',
      details: 'For NC residents with financial need attending NC colleges. Apply via FAFSA.',
      url: 'https://www.cfnc.org/pay-for-college/financial-aid/nc-need-based-grant/',
    ),
    _SchoolScholarship(
      name: 'Golden LEAF Scholarship',
      amount: '\$12,000',
      details: 'For NC students from rural and economically distressed communities. Search on CFNC.',
      url: 'https://www.cfnc.org/money-for-college/find-scholarships/',
    ),
    _SchoolScholarship(
      name: 'QuestBridge Scholarship',
      amount: 'Full Ride',
      details: 'For high-achieving, low-income first-gen students nationwide. Apply at questbridge.org.',
      url: 'https://www.questbridge.org',
    ),
    _SchoolScholarship(
      name: 'Going Merry',
      amount: 'Varies',
      details: 'One application, many scholarships. Great for busy seniors in $county County.',
      url: 'https://www.goingmerry.com',
    ),
  ];
}

// ── A.L. BROWN SPECIFIC SCHOLARSHIPS ────────────────────────────
const List<_SchoolScholarship> _albScholarships = [
  _SchoolScholarship(name: 'Gates Scholarship', amount: 'Full Ride', details: 'African-American, American Indian, Asian/Pacific Islander, or Hispanic seniors. Min 3.3 GPA. Pell-eligible. Deadline: Sept. 15, 2025.', url: 'https://www.thegatesscholarship.org/scholarship'),
  _SchoolScholarship(name: 'QuestBridge Scholars', amount: 'Full Ride', details: 'Financial hardship required. Strong academics in AP/honors. 2 essays + 2 teacher recs. Deadline: Sept. 30, 2025.', url: 'https://apply.questbridge.org/portal/apply'),
  _SchoolScholarship(name: 'Coca-Cola Scholars Program', amount: '\$20,000', details: 'Min 3.0 GPA. US Citizen or permanent resident. Deadline: Sept. 30, 2025.', url: 'https://www.coca-colascholarsfoundation.org/apply/'),
  _SchoolScholarship(name: 'Elks National Foundation MVS', amount: 'Up to \$30,000', details: 'US Citizen. Leadership, academics, community involvement. Deadline: Nov. 12, 2025.', url: 'https://www.elks.org/scholars/scholarships/MVS.cfm'),
  _SchoolScholarship(name: 'Jack Kent Cooke Foundation', amount: 'Up to \$55,000/yr', details: 'Min 3.5 unweighted GPA. Family income under \$95,000. Leadership and persistence. Deadline: Nov. 12, 2025.', url: 'https://www.jkcf.org/our-scholarships/college-scholarship-program/'),
  _SchoolScholarship(name: 'Greenhouse Scholars', amount: '\$20,000', details: 'Min 3.5 unweighted GPA. Family income under \$80,000. 4-year institution. Deadline: Nov. 13, 2025.', url: 'https://greenhousescholars.org/our-scholars/become-a-scholar/'),
  _SchoolScholarship(name: 'SMART STEM Scholarship', amount: 'Full tuition + \$30k stipend', details: 'US Citizen, 18+, STEM degree, 3.0 GPA. Must work for Dept of Defense after graduation. Deadline: Dec. 5, 2025.', url: 'https://www.smartscholarship.org'),
  _SchoolScholarship(name: 'Ron Brown Scholarship', amount: '\$40,000', details: 'Black students. Academic excellence, financial need, leadership. Deadline: Dec. 1, 2025.', url: 'https://ronbrown.org/apply/ron-brown-scholarship/'),
  _SchoolScholarship(name: 'Jackie Robinson Foundation', amount: '\$35,000', details: 'Minority students. 4-year college. Financial need, leadership, community service. Deadline: TBD.', url: 'https://jackierobinson.org/apply/'),
  _SchoolScholarship(name: 'Hispanic Scholarship Fund', amount: '\$500-\$5,000', details: 'Hispanic heritage. Min 3.0 GPA. US Citizen, permanent resident, or DACA. Submit FAFSA. Deadline: TBA.', url: 'https://www.hsf.net/scholarship'),
  _SchoolScholarship(name: 'The Dream.US National Scholarship', amount: '\$30,000', details: 'Undocumented/DACA students. Min 2.5 GPA. Full-time at partner college. Deadline: TBA.', url: 'https://www.thedream.us/scholarships/national-scholarship/'),
  _SchoolScholarship(name: 'UNCF STEM Scholarship', amount: 'Up to \$25,000', details: 'African American, Hispanic, Asian, or Native American seniors. Min 3.0 GPA. STEM major. Deadline: TBA.', url: 'https://opportunities.uncf.org'),
  _SchoolScholarship(name: 'NextNC Scholarship', amount: '\$3,000-\$5,000/yr', details: 'NC public high school senior. Family income under \$80,000. Just submit FAFSA by June 1, 2026.', url: 'https://nextncscholarship.org/'),
  _SchoolScholarship(name: 'Carolina Pines HBCU Scholarships', amount: '\$5,000', details: 'Two scholarships (Spruce: 3.0 GPA; Fraser: 2.5 GPA). 75 community service hours. Acceptance to HBCU. Deadline: Feb. 22.', url: 'https://form.jotform.com/250063761529053'),
  _SchoolScholarship(name: 'Bethel Enrichment Center Community Impact', amount: '\$500-\$1,000', details: 'Member of Bethel Baptist Church. Min 2.5 weighted GPA. Active in Youth Ministry. Deadline: Feb. 22, 2026.', url: 'https://www.becscholarship.org/apply'),
  _SchoolScholarship(name: 'Rolonda Morgan Memorial Scholarship', amount: '\$500', details: 'EC students with extracurricular involvement. Short response + 3 references. Deadline: Feb. 27.', url: 'https://alb.kcs.k12.nc.us/for-students/seniors/scholarships'),
  _SchoolScholarship(name: 'Millie W. Hall Scholarship', amount: '\$500', details: 'Pursuing education or medical field. Min 3.25 unweighted GPA. Apply through ALB Guidance. Deadline: Feb. 27.', url: 'https://alb.kcs.k12.nc.us/for-students/seniors/scholarships'),
  _SchoolScholarship(name: 'Mary Rose Mills-Linda Rankin Memorial', amount: '\$2,000', details: 'Top 10% of class. Min 1290 SAT or 27 ACT. Good character, extracurriculars. Deadline: Mar. 3.', url: 'https://alb.kcs.k12.nc.us/for-students/seniors/scholarships'),
  _SchoolScholarship(name: 'Eunice Riggins Memorial Scholarship', amount: '\$2,000', details: 'Female-identifying students. Top 10% of class. 4-year NC college. Min 1220 SAT or 25 ACT. Deadline: Mar. 3.', url: 'https://alb.kcs.k12.nc.us/for-students/seniors/scholarships'),
  _SchoolScholarship(name: 'Clare Johnson Marley Fine Arts Scholarship', amount: '\$2,000', details: 'Fine arts major. Top 20% of class. Min 1220 SAT or 25 ACT. Proof of talent required. Deadline: Mar. 3.', url: 'https://alb.kcs.k12.nc.us/for-students/seniors/scholarships'),
  _SchoolScholarship(name: 'American Legion Scholarship', amount: '\$1,000 (5 winners)', details: 'A.L. Brown graduating class. Minimum C average. Interviews in mid-March. Deadline: Mar. 6.', url: 'https://alb.kcs.k12.nc.us/for-students/seniors/scholarships'),
  _SchoolScholarship(name: 'Douglas F. Goodson Memorial Scholarship', amount: '\$1,000', details: 'Min 3.0 GPA. Accepted to 2 or 4-year college. Deadline: Mar. 6.', url: 'https://alb.kcs.k12.nc.us/for-students/seniors/scholarships'),
  _SchoolScholarship(name: 'Dr. Mable Parker McLean Scholarship', amount: '\$1,000', details: 'Min 3.0 GPA. Leadership through community service. 4-year college. 500-word essay. Deadline: Mar. 15.', url: 'https://www.pearlsandivycc.org/2025-scholarship'),
  _SchoolScholarship(name: 'SECU People Helping People Scholarship', amount: '\$10,000 (2 winners)', details: 'NC public school senior. SECU member. UNC system university. Min 2.5 GPA. Deadline: Mar. 20.', url: 'https://alb.kcs.k12.nc.us/for-students/seniors/scholarships'),
  _SchoolScholarship(name: 'Walter and April Stofford Scholarship', amount: '\$1,000', details: 'African-American senior from ALB or Concord High. Min 3.0 GPA. Active in church and community. 500-700 word essay. Deadline: Mar. 20.', url: 'https://alb.kcs.k12.nc.us/for-students/seniors/scholarships'),
  _SchoolScholarship(name: 'Central Carolina REALTORS Scholarship', amount: '\$2,000', details: 'Academic excellence and community involvement. Transcript, 2 recs, goal letter required. Deadline: Apr. 8.', url: 'https://alb.kcs.k12.nc.us/for-students/seniors/scholarships'),
  _SchoolScholarship(name: 'Salvation Army Scholarship', amount: '\$1,000', details: 'Cabarrus or Stanly County resident. NC college full-time. Volunteer experience and financial need. Deadline: Apr. 8.', url: 'https://alb.kcs.k12.nc.us/for-students/seniors/scholarships'),
  _SchoolScholarship(name: 'Rev. Dr. Jerry L. Cannon Scholarship', amount: '\$1,000', details: 'Graduating senior. Min 2.5 GPA. Full-time at accredited college, trade school, or community college. Deadline: Apr. 8.', url: 'https://cnjenkins.org/rev-dr-jerry-l-cannon-scholarship/'),
  _SchoolScholarship(name: 'J. Carlyle Rutledge Scholarship', amount: '\$2,500', details: 'Freshman year at NC 4-year college. Academic excellence, leadership, community involvement, financial need. Deadline: Apr. 24.', url: 'https://alb.kcs.k12.nc.us/for-students/seniors/scholarships'),
  _SchoolScholarship(name: 'Sara Frances Bounds Memorial Scholarship', amount: '\$1,000 (5 winners)', details: '4-year NC college. Min 3.0 weighted GPA. Deadline: Apr. 24.', url: 'https://alb.kcs.k12.nc.us/for-students/seniors/scholarships'),
  _SchoolScholarship(name: 'Carla Kincaid Sloop Memorial Scholarship', amount: '\$500', details: 'A.L. Brown senior. 4-year college. Academic merit, financial need, personal statement. Deadline: Apr. 24.', url: 'https://alb.kcs.k12.nc.us/for-students/seniors/scholarships'),
  _SchoolScholarship(name: 'Dearmon Family Scholarship', amount: '\$2,500', details: 'A.L. Brown senior. Min 3.0 GPA. STEAM major. Financial need. Deadline: Apr. 24.', url: 'https://alb.kcs.k12.nc.us/for-students/seniors/scholarships'),
  _SchoolScholarship(name: 'Frances Black Holland Scholarship', amount: '\$2,000', details: 'Excellence, community service, character. Min 2.75 GPA. Deadline: Apr. 24.', url: 'https://alb.kcs.k12.nc.us/for-students/seniors/scholarships'),
  _SchoolScholarship(name: 'Kannapolis ADK Educator Scholarship', amount: '\$750-\$1,500', details: 'Female student entering 4-year teacher training program. Min 3.0 GPA. Deadline: Apr. 30.', url: 'https://alb.kcs.k12.nc.us/for-students/seniors/scholarships'),
  _SchoolScholarship(name: 'PFLAG Concord/Kannapolis Scholarship', amount: '\$1,500', details: 'LGBTQIA+ senior or ally. Cabarrus County resident. Min 2.5 weighted GPA. 2 recs + 500-word essay. Deadline: TBD.', url: 'https://alb.kcs.k12.nc.us/for-students/seniors/scholarships'),
  _SchoolScholarship(name: 'Gamma Pi DGK Future Educator Scholarship', amount: '\$1,000', details: 'Cabarrus or Kannapolis City school senior. Pursuing education degree. Deadline: TBD.', url: 'https://alb.kcs.k12.nc.us/for-students/seniors/scholarships'),
  _SchoolScholarship(name: 'Brown Family Scholarship', amount: '\$500', details: 'Pursuing nursing or sports-related major. 1-page essay on career goals. Deadline: TBD.', url: 'https://alb.kcs.k12.nc.us/for-students/seniors/scholarships'),
  _SchoolScholarship(name: 'ALB Student Services Scholarship Page', amount: 'Varies', details: 'Check here regularly for new and updated scholarships from ALB counselors.', url: 'https://sites.google.com/kcs.k12.nc.us/albstudentservices/home'),
];


// ── ASHEBORO HIGH SCHOOL SPECIFIC SCHOLARSHIPS ──────────────────
const List<_SchoolScholarship> _asheboroScholarships = [
  _SchoolScholarship(name: 'Asheboro City Schools Education Foundation', amount: 'Multiple Awards', details: 'Apply online by April 1, 2026 at 4pm. In-person interviews required. Letters of recommendation strongly encouraged. Covers all scholarships listed below.', url: 'https://www.asheboro.k12.nc.us/Scholarships.aspx'),
  _SchoolScholarship(name: 'Cone Health Scholarship', amount: 'Varies', details: 'Pursuing healthcare degree. Good character, extracurriculars, community service. 2 or 4-year college. Deadline: Apr. 1, 2026.', url: 'https://www.asheboro.k12.nc.us/Scholarships.aspx'),
  _SchoolScholarship(name: 'Katie Bunch Servant Leadership Scholarship', amount: 'Varies (2 awards)', details: 'One male, one female. Demonstrated leadership at AHS. Student Council participant preferred. Deadline: Apr. 1, 2026.', url: 'https://www.asheboro.k12.nc.us/Scholarships.aspx'),
  _SchoolScholarship(name: 'Ruby B. Smith Memorial Scholarship', amount: 'Varies', details: 'Top 25% of class. Taken AP or College Calculus. Math or science degree preferred. Statement of goals + math/science teacher rec required. Deadline: Apr. 1, 2026.', url: 'https://www.asheboro.k12.nc.us/Scholarships.aspx'),
  _SchoolScholarship(name: 'Lee J. Stone Scholarship', amount: 'Varies', details: 'Multi-sport NCHSAA athlete. Sportsmanship and community service. Football player preferred. Top 25% of class. Financial need. Deadline: Apr. 1, 2026.', url: 'https://www.asheboro.k12.nc.us/Scholarships.aspx'),
  _SchoolScholarship(name: 'Diane L. Frost Centennial Scholarship', amount: 'Varies', details: 'Excels in classroom, community, athletics, extracurriculars. Math, music, education, or leadership career preferred. Deadline: Apr. 1, 2026.', url: 'https://www.asheboro.k12.nc.us/Scholarships.aspx'),
  _SchoolScholarship(name: 'Derek Kesler Scholarship', amount: 'Varies', details: 'Top 25% of class. Financial need and good character preferred. 3 recommendations required including one from a current teacher. Deadline: Apr. 1, 2026.', url: 'https://www.asheboro.k12.nc.us/Scholarships.aspx'),
  _SchoolScholarship(name: 'Laura Lisk Memorial Scholarship', amount: 'Varies', details: 'Female athlete. Soccer player preferred. Sportsmanship and community service throughout athletic career. Deadline: Apr. 1, 2026.', url: 'https://www.asheboro.k12.nc.us/Scholarships.aspx'),
  _SchoolScholarship(name: 'Shann Redding Scholarship for Excellence', amount: 'Varies', details: 'Oldest ACS Foundation scholarship. Accepted to college. Involved in extracurricular activities at AHS. Deadline: Apr. 1, 2026.', url: 'https://www.asheboro.k12.nc.us/Scholarships.aspx'),
  _SchoolScholarship(name: 'Lisa Robertson Memorial Scholarship', amount: 'Varies', details: 'NCHSAA athlete. Female softball player preferred. Sportsmanship, community service. Financial need preferred. Deadline: Apr. 1, 2026.', url: 'https://www.asheboro.k12.nc.us/Scholarships.aspx'),
  _SchoolScholarship(name: 'Brooke Upchurch Phillips Scholarship', amount: 'Varies', details: 'Top 25% of class. NC Scholar. Honors/AP courses. Effort in school, community, and employment. Deadline: Apr. 1, 2026.', url: 'https://www.asheboro.k12.nc.us/Scholarships.aspx'),
  _SchoolScholarship(name: 'Dr. Bob W. Gordon Scholarship', amount: 'Varies', details: 'B average or better. Pursuing education, social work, or school counseling at 4-year university. Financial need and good character preferred. Deadline: Apr. 1, 2026.', url: 'https://www.asheboro.k12.nc.us/Scholarships.aspx'),
  _SchoolScholarship(name: 'Richard Harrington Scholarship', amount: 'Varies', details: 'Pursuing education or related field. Top 20% of class. Financial need and good character preferred. Deadline: Apr. 1, 2026.', url: 'https://www.asheboro.k12.nc.us/Scholarships.aspx'),
  _SchoolScholarship(name: 'Lee Phoenix Scholarship', amount: 'Varies', details: 'Interest in education career. Financial need. Top 25% of class. Good moral character, extracurriculars. Deadline: Apr. 1, 2026.', url: 'https://www.asheboro.k12.nc.us/Scholarships.aspx'),
  _SchoolScholarship(name: 'Curt Lorimer Memorial Scholarship', amount: 'Varies', details: 'Top 20% of class. Extracurricular involvement. Planning to attend Randolph Community College. Deadline: Apr. 1, 2026.', url: 'https://www.asheboro.k12.nc.us/Scholarships.aspx'),
  _SchoolScholarship(name: 'Diana Burge Scholarship Award in English', amount: 'Varies', details: 'Top literary student. Top 25% of class. Heart for serving others. Nominated by AHS English Department. Female with financial need preferred. Deadline: Apr. 1, 2026.', url: 'https://www.asheboro.k12.nc.us/Scholarships.aspx'),
  _SchoolScholarship(name: 'Ida Ruth Alman Memorial Scholarship', amount: 'Varies', details: 'Considering education career, preferably elementary. Top 25% of class. Financial need. Deadline: Apr. 1, 2026.', url: 'https://www.asheboro.k12.nc.us/Scholarships.aspx'),
  _SchoolScholarship(name: 'Sam Ramsey Chick-fil-A Legacy Scholarship', amount: 'Varies', details: 'Academic excellence. Extracurriculars. Part-time job in community. Business/finance preferred. Chick-fil-A employee preferred. Financial need. Deadline: Apr. 1, 2026.', url: 'https://www.asheboro.k12.nc.us/Scholarships.aspx'),
  _SchoolScholarship(name: 'J.B. and Claire Davis Scholarship of Excellence', amount: 'Varies', details: 'Top 25% of class. 2 letters of recommendation. Preference: ECU or RCC, baseball, golf, or business field. Deadline: Apr. 1, 2026.', url: 'https://www.asheboro.k12.nc.us/Scholarships.aspx'),
  _SchoolScholarship(name: 'Christine Fennell Scholarship', amount: 'Varies', details: 'Going into education. Female, financial need, student-athlete, or musician preferred. Top 25% of class. Good character. Deadline: Apr. 1, 2026.', url: 'https://www.asheboro.k12.nc.us/Scholarships.aspx'),
  _SchoolScholarship(name: 'B. Frank Barham Math Scholarship', amount: 'Varies', details: 'Completed AP or College Calculus. Top 20% of class. Math or science field. Skill and enthusiasm for mathematics required. Deadline: Apr. 1, 2026.', url: 'https://www.asheboro.k12.nc.us/Scholarships.aspx'),
  _SchoolScholarship(name: 'Richard Morgan Scholarship', amount: 'Varies', details: 'Nominated by current AHS chorus teacher. Standout choral student. Deadline: Apr. 1, 2026.', url: 'https://www.asheboro.k12.nc.us/Scholarships.aspx'),
  _SchoolScholarship(name: 'C. Reitzel Smith Memorial Scholarship', amount: 'Varies', details: 'Top 20% of class. Business, finance, or marketing field preferred. Good character, extracurriculars, community service. Financial need preferred. Deadline: Apr. 1, 2026.', url: 'https://www.asheboro.k12.nc.us/Scholarships.aspx'),
  _SchoolScholarship(name: 'Pam Hill Scholarship', amount: 'Varies', details: 'Planning a civic-minded career. Financial need and good character preferred. Deadline: Apr. 1, 2026.', url: 'https://www.asheboro.k12.nc.us/Scholarships.aspx'),
  _SchoolScholarship(name: 'Dr. Gurdial and Mrs. Surinder Walha Scholarship', amount: 'Varies', details: 'Female student. Top 10% of class. Advanced math or science courses. Pursuing medical field. Deadline: Apr. 1, 2026.', url: 'https://www.asheboro.k12.nc.us/Scholarships.aspx'),
  _SchoolScholarship(name: 'Class of 1972 Memorial Scholarship', amount: 'Varies', details: 'NC college or university. Top 25% of class. Good character. Extracurriculars or part-time job. Financial need preferred. 2 recommendations required. Deadline: Apr. 1, 2026.', url: 'https://www.asheboro.k12.nc.us/Scholarships.aspx'),
  _SchoolScholarship(name: 'Eddie Luck Memorial Scholarship', amount: 'Varies', details: 'Avid student-athlete. Demonstrates sportsmanship. Academic excellence. Deadline: Apr. 1, 2026.', url: 'https://www.asheboro.k12.nc.us/Scholarships.aspx'),
  _SchoolScholarship(name: 'Mildred Chriscoe Scholarship', amount: 'Varies', details: 'Female going into business or financial field. Financial need and good character preferred. Deadline: Apr. 1, 2026.', url: 'https://www.asheboro.k12.nc.us/Scholarships.aspx'),
  _SchoolScholarship(name: 'Kathryn Cherry Needham Memorial Scholarship', amount: 'Varies', details: 'Female. Top 25% of class. Pursuing medical field. Financial need and good character preferred. Deadline: Apr. 1, 2026.', url: 'https://www.asheboro.k12.nc.us/Scholarships.aspx'),
  _SchoolScholarship(name: 'Joyce Harrington Scholarship of Excellence', amount: 'Varies', details: 'Excelled in classroom. Community service, athletics, extracurriculars. Financial need, English excellence preferred. Deadline: Apr. 1, 2026.', url: 'https://www.asheboro.k12.nc.us/Scholarships.aspx'),
  _SchoolScholarship(name: 'Charles Spivey Memorial Scholarship', amount: 'Varies', details: 'Top 25% of class. Financial need and good character preferred. Deadline: Apr. 1, 2026.', url: 'https://www.asheboro.k12.nc.us/Scholarships.aspx'),
  _SchoolScholarship(name: 'Betty Wilson Memorial Scholarship', amount: 'Varies', details: 'Top 25% of class. Financial need, good character. Female going into nursing or medical field preferred. Deadline: Apr. 1, 2026.', url: 'https://www.asheboro.k12.nc.us/Scholarships.aspx'),
  _SchoolScholarship(name: 'Zack Thornburg Memorial Scholarship', amount: 'Varies', details: 'Wrestling or football team member. Community college preferred. Financial need and good character. Deadline: Apr. 1, 2026.', url: 'https://www.asheboro.k12.nc.us/Scholarships.aspx'),
  _SchoolScholarship(name: 'T. Henry Redding Scholarship for Achievement', amount: 'Varies (Renewable)', details: 'Top 20% of class. Planning to attend UNC-Chapel Hill. Renewable with 2.75 GPA. Deadline: Apr. 1, 2026.', url: 'https://www.asheboro.k12.nc.us/Scholarships.aspx'),
  _SchoolScholarship(name: 'William H. Redding Scholarship for Excellence', amount: 'Varies', details: 'Top 10% of class. Planning to attend UNC-Chapel Hill. Active in extracurriculars. Deadline: Apr. 1, 2026.', url: 'https://www.asheboro.k12.nc.us/Scholarships.aspx'),
  _SchoolScholarship(name: 'Allen Tate Scholarship', amount: 'Varies', details: 'Accepted to college. Deadline: Apr. 1, 2026.', url: 'https://www.asheboro.k12.nc.us/Scholarships.aspx'),
  _SchoolScholarship(name: 'Braxton Montgomery Scholarships', amount: 'Varies (2 awards)', details: 'Planning to attend NC community college. Male with financial need preferred. Deadline: Apr. 1, 2026.', url: 'https://www.asheboro.k12.nc.us/Scholarships.aspx'),
  _SchoolScholarship(name: 'CFNC.org Scholarship Search', amount: 'Varies', details: 'Search hundreds of additional NC scholarships matched to Randolph County students.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
  _SchoolScholarship(name: 'Ferree Foundation', amount: 'Varies', details: 'Low interest loans and limited scholarships for Randolph County students pursuing higher education.', url: 'https://ferreefoundation.org/'),
];

// ── BERTIE HIGH SCHOOL SCHOLARSHIPS ─────────────────────────────
const List<_SchoolScholarship> _bertieScholarships = [
  _SchoolScholarship(name: 'Dr. Otis L. Smallwood Scholarship', amount: 'Varies', details: 'Offered directly by Bertie County Public Schools. Check the school news page or counselor for current deadline and application.', url: 'https://www.bertie.k12.nc.us/view-all-news'),
  _SchoolScholarship(name: 'Roanoke Electric Cooperative Senior Scholarship', amount: 'Varies', details: 'For students whose parents or guardians are customers of Roanoke Electric Cooperative. Apply using the link on the school counselor page. Deadline: TBD.', url: 'https://bechs.bertie.k12.nc.us/counselors/home/financial-information-for-college'),
  _SchoolScholarship(name: 'Vidant Roanoke Chowan Medical Staff Scholarship', amount: 'Varies', details: 'For Bertie County area students pursuing a career in healthcare. See counselor for application. Deadline: TBD.', url: 'https://bechs.bertie.k12.nc.us/counselors/home/financial-information-for-college'),
  _SchoolScholarship(name: 'William A. Marsh Jr. Scholarship', amount: 'Varies', details: 'Local scholarship for Bertie County students. Application available through school counselor. Deadline: TBD.', url: 'https://bechs.bertie.k12.nc.us/counselors/home/financial-information-for-college'),
  _SchoolScholarship(name: 'Self Help Credit Union Community Scholarship', amount: 'Varies', details: 'Available to Bertie County students. See Ms. Tann in the counselor office for a copy of the application. Deadline: TBD.', url: 'https://www.self-help.org'),
  _SchoolScholarship(name: 'Kyle Byrd Memorial Scholarship', amount: 'Varies', details: 'Paper application only. Print from school counselor page, complete, and mail in. Copies also available in the counselor office. Deadline: TBD.', url: 'https://bechs.bertie.k12.nc.us/counselors/home/financial-information-for-college'),
  _SchoolScholarship(name: 'Prince Hall Grand Lodge NC Masons Scholarship', amount: 'Varies', details: 'Most Worshipful Prince Hall Grand Lodge of NC. Available through the school counselor office. Deadline: TBD.', url: 'https://bechs.bertie.k12.nc.us/counselors/home/financial-information-for-college'),
  _SchoolScholarship(name: 'Excelsior Temple Elks of the World Scholarship', amount: 'Varies', details: 'Excelsior Temple No. 692, Improved Benevolent Protective Order Elks. Application in the counselor office. Deadline: TBD.', url: 'https://bechs.bertie.k12.nc.us/counselors/home/financial-information-for-college'),
  _SchoolScholarship(name: 'Charles R. Ullman and Associates Scholarship', amount: 'Varies', details: 'Attorney-sponsored local scholarship for Bertie County students. Available through school counselor. Deadline: TBD.', url: 'https://bechs.bertie.k12.nc.us/counselors/home/financial-information-for-college'),
  _SchoolScholarship(name: 'NC Head Start Association Scholarship', amount: 'Varies', details: 'For students from Head Start families in NC. See counselor for application. Deadline: TBD — check with Ms. Tann.', url: 'https://bechs.bertie.k12.nc.us/counselors/home/financial-information-for-college'),
  _SchoolScholarship(name: 'NC Cooperative Extension Scholarship', amount: 'USD 750', details: 'Offered by NC Cooperative Extension Administrative Professionals Association. Currently accepting applications — see Bertie County Extension office at 102 Lancaster Ave, Windsor.', url: 'https://bertie.ces.ncsu.edu/'),
  _SchoolScholarship(name: 'Aubrey Lee Brooks Foundation', amount: 'Varies', details: 'NC students with strong academics. Opens January, deadline February/March. Apply electronically — check CFNC for the current link.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
  _SchoolScholarship(name: 'NC Farm Bureau R. Flake Shaw Scholarship', amount: 'Varies', details: 'For NC students planning to enroll full-time at any NC college. Rural county students like Bertie County given priority. Apply through NC Farm Bureau.', url: 'https://www.ncfb.org/about-us/scholarships/'),
  _SchoolScholarship(name: 'Golden LEAF Scholarship', amount: 'USD 12,000', details: 'Priority for NC students from rural and economically distressed communities. Bertie County students are strong candidates. FAFSA required. Apply at CFNC. Deadline: March 1.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
  _SchoolScholarship(name: 'NC Need-Based Grant', amount: 'Up to USD 9,300/yr', details: 'For NC residents with financial need attending NC colleges. Apply via FAFSA. Deadline: Submit FAFSA as early as possible.', url: 'https://www.cfnc.org/pay-for-college/financial-aid/nc-need-based-grant/'),
  _SchoolScholarship(name: 'NextNC Scholarship', amount: 'USD 3,000-USD 5,000/yr', details: 'NC public high school senior. Family income under USD 80,000. Just submit FAFSA by June 1. No separate application needed.', url: 'https://nextncscholarship.org/'),
  _SchoolScholarship(name: 'QuestBridge Match Scholarship', amount: 'Full Ride', details: 'High-achieving, low-income first-gen students. Top 5-10% of class. Household income under USD 65,000. Open to undocumented/DACA. Deadline: Sept. 26.', url: 'https://www.questbridge.org'),
  _SchoolScholarship(name: 'Going Merry', amount: 'Varies', details: 'One application, many scholarships. Great for busy Bertie County seniors. Free to use.', url: 'https://www.goingmerry.com'),
  _SchoolScholarship(name: 'CFNC.org Scholarship Search', amount: 'Varies', details: 'Search hundreds of NC scholarships including ones matched to Bertie County and rural Eastern NC students.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
  _SchoolScholarship(name: 'Bertie Early College Counselor Scholarship Page', amount: 'Varies', details: 'Full list of local scholarships maintained by the Bertie school counselor. Check here regularly for new applications and updated deadlines.', url: 'https://bechs.bertie.k12.nc.us/counselors/home/financial-information-for-college'),
];

// ── BEN L. SMITH HIGH SCHOOL SCHOLARSHIPS (GUILFORD COUNTY) ─────
const List<_SchoolScholarship> _benSmithScholarships = [
  _SchoolScholarship(name: 'Access Amazing Scholarship (GTCC)', amount: 'Full tuition and fees', details: 'Last-dollar scholarship for Guilford County HS graduates attending GTCC. Covers remaining balance after grants. Submit FAFSA. Apply early.', url: 'https://www.gtcc.edu/admissions-and-aid/how-to-pay-for-college/financial-aid/access-amazing-scholarship'),
  _SchoolScholarship(name: 'Kay Hagan Memorial Scholarship', amount: 'USD 1,000/yr (renewable)', details: 'Female senior with passion for community and civic leadership. Renewable 4 years with 3.0 GPA. Apply through CFGG portal. Deadline: Feb. 15.', url: 'https://cfgg.org/students/'),
  _SchoolScholarship(name: 'John R. Kernodle Jr. Memorial Scholarship', amount: 'USD 10,000 (renewable)', details: 'Guilford County seniors committing to teach in NC public schools 3+ years. Preference for NC colleges and Guilford County teachers. Deadline: Feb. 1.', url: 'https://cfgg.org/students/'),
  _SchoolScholarship(name: 'Herman and Earline Herbin Scholarship', amount: 'USD 1,750 (renewable)', details: 'Two awards for Guilford County seniors. Primarily need-based. Renewable 4 years. Apply through CFGG portal. Deadline: Mar. 2.', url: 'https://cfgg.org/students/'),
  _SchoolScholarship(name: 'Thomas and Bettie OBriant Memorial Scholarship', amount: 'USD 2,500 (renewable)', details: 'Guilford County senior. Financial need preferred. Renewable 4 years. Apply through CFGG portal. Deadline: Mar. 2.', url: 'https://cfgg.org/students/'),
  _SchoolScholarship(name: 'Jason Christopher James Memorial Scholarship', amount: 'USD 7,500', details: 'Guilford County senior interested in foreign affairs, international relations, or service abroad. Apply through CFGG portal.', url: 'https://cfgg.org/students/'),
  _SchoolScholarship(name: 'John Carlton Myatt Writing Scholarship', amount: 'Varies', details: 'Guilford County senior with creative, courageous spirit in writing. English or language arts degree preferred. Apply through CFGG portal.', url: 'https://cfgg.org/students/'),
  _SchoolScholarship(name: 'Eberhart Scholarship Enrichment Fund', amount: 'Varies', details: 'Guilford County senior. Two recs required. Mail to PO Box 10208, Greensboro NC 27404. Deadline: Apr. 15.', url: 'https://cfgg.org/students/'),
  _SchoolScholarship(name: 'Greensboro Mens Club Foundation', amount: 'USD 2,500 (5 awards)', details: 'Male Guilford County senior. Transcript, 2 recs, FAFSA SAR required. Deadline: Apr. 30.', url: 'https://www.greensboromensclub.org/scholars-program'),
  _SchoolScholarship(name: 'Reginald and Mildred Womble Scholarship', amount: 'USD 2,500', details: 'Guilford County senior planning to attend an HBCU. Apply through GWCCEC.', url: 'https://cfgg.org/students/'),
  _SchoolScholarship(name: 'Pearl Berlin Scholarship', amount: 'Varies', details: 'LGBTQ+ students and allies in Guilford County. Courage and leadership required. Apply through CFGG.', url: 'https://cfgg.org/students/'),
  _SchoolScholarship(name: 'Tannenbaum-Sternberger Foundation', amount: 'Varies', details: 'Guilford County residents attending partner NC colleges including NC A&T, UNCG, and others.', url: 'https://www.tsfoundation.com/scholarships'),
  _SchoolScholarship(name: 'SECU People Helping People Scholarship', amount: 'USD 10,000', details: 'NC public school senior. Must be SECU member. UNC system university. Min 2.5 GPA. Deadline: Mar. 20.', url: 'https://www.ncsecu.org/resources/scholarships.html'),
  _SchoolScholarship(name: 'Aubrey Lee Brooks Scholarship', amount: 'Varies', details: 'Guilford County senior. Submit full application electronically by March 1. Check CFGG portal for current details.', url: 'https://cfgg.org/students/'),
  _SchoolScholarship(name: 'QuestBridge Match Scholarship', amount: 'Full Ride', details: 'High-achieving, low-income first-gen students. Top 5-10% of class. Household income under USD 65,000. Open to undocumented/DACA. Deadline: Sept. 26.', url: 'https://www.questbridge.org'),
  _SchoolScholarship(name: 'NC Need-Based Grant', amount: 'Up to USD 9,300/yr', details: 'NC residents with financial need attending NC colleges. Apply via FAFSA.', url: 'https://www.cfnc.org/pay-for-college/financial-aid/nc-need-based-grant/'),
  _SchoolScholarship(name: 'CFNC.org Scholarship Search', amount: 'Varies', details: 'Search hundreds of NC scholarships matched to Guilford County students.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
  _SchoolScholarship(name: 'Community Foundation of Greater Greensboro', amount: 'Multiple awards', details: 'Search all CFGG scholarships for Guilford County seniors in one portal.', url: 'https://cfgg.org/students/'),
];

// ── CALDWELL EARLY COLLEGE HIGH SCHOOL SCHOLARSHIPS ────────────
const List<_SchoolScholarship> _caldwellEarlyCollegeScholarships = [
  _SchoolScholarship(name: 'Kenneth A. Roberts Award', amount: 'TBD', details: 'Deadline: Aug 15, 2025. • 1-2 students are nominated by their high school                                                     • Must demonstrate high levels of leadership, scholarship, and citizenship', url: ''),
  _SchoolScholarship(name: 'Caldwell Womans Club-Sallie Southall Cotten Scholarship', amount: '3 awards                      USD 1,000 (one time); USD 1,200 (one time); USD 4,000 (per year)', details: 'Deadline: 02/10/2026 due to Mrs. Mack. • Male or Female can apply • Academics (top 25% of class), leadership, community service, interview skills, financial need, and extra curricular activities • Interviews will be February 4th and 5th...', url: ''),
  _SchoolScholarship(name: 'National Association of Federal Education Program Adminisrators', amount: 'up to USD 5,000', details: 'Deadline: Postmark by 1/1/26. High school senior on track to graduate by the conclusion of the 2025-26 school year;  Enrolled in a public school district or charter school (public school academy) with at least one current NAFEP...', url: 'https://drive.google.com/file/d/1nXAxuk6ukWoCFu8UBwgDy3v9Yx6p4XgU/view'),
  _SchoolScholarship(name: 'Air Force ROTC', amount: 'Tuition, books and spending stipend', details: 'Deadline: See school counselor. • Enrolled in Air Force ROTC                                                                                                                                                                         ...', url: ''),
  _SchoolScholarship(name: 'NC Society Daughters of the American Revolution Endowment Fund Gift Scholarships', amount: '1500', details: 'Deadline: Due to Mrs. Mack by 1/22/26. • Choose Cordon Street scholarship • Letter of references • Written letter expressing academic and career goals • Official transcript • List of extracurricular activities and academic achievements', url: ''),
  _SchoolScholarship(name: 'Catherine S. Tucker Scholarship', amount: 'Varies', details: 'Deadline: Jan 31, 2026. • Must be African American female in the counties or Alexander, Burke, Caldwell, Catawba, Iredell, and Wilkes • Weighted GPA of 3.0 • Must be accepted into 2 community or 4 year university in the s...', url: ''),
  _SchoolScholarship(name: 'Patriot Jerky - Patriotism Scholarship', amount: '1000', details: 'Deadline: Apr 01, 2026. • American Citizenship • Must prove 50 hours of community service • 2 letters of recommendation • 3.0 GPA or higher • One-page essay explaining What Patriotism Means to You', url: 'https://patriotjerky.net/pages/scholarship-applications'),
  _SchoolScholarship(name: 'Donna Easter Student Ethics Scholarship', amount: '2500', details: 'Deadline: Apr 10, 2026. • Be in good academic standing  • Show proof of community service and leadership while in high school • Submit a 500 word essay describing how you handled an ethical dilemma you faced • With the ap...', url: ''),
  _SchoolScholarship(name: 'La Noticia Scholarship', amount: '2500', details: 'Deadline: May 01, 2026. • Must be of Latino origin  • Minimum GPA of 3.5 • 2 letters of recommendation • With the application, you must also submit a cover letter, resume, 500 word essay, transcript, and 2 short answer re...', url: 'https://lanoticia.com/apply-for-scholarship/'),
  _SchoolScholarship(name: 'Telco Community Credit Union', amount: '(6) USD 1,000', details: 'Deadline: Feb 01, 2026. • A high school senior planning to be enrolled in an accredited 2-year or 4-year college in Fall 2026 • Possess a 3.0 GPA or above on a 4-point (non-weighted) scale • Be a Telco Community Credit Un...', url: ''),
  _SchoolScholarship(name: 'C. L. Robbins Scholarship', amount: 'Varies', details: 'Deadline: Submit online application by 2/5/2026. • Academic achievement and leadership • Financial need • Demonstrates traits of high personal character • Minimum cumulative GPA of 2.0', url: ''),
  _SchoolScholarship(name: 'Michael A. DeMayo Scholarship', amount: '2500', details: 'Deadline: Mar 23, 2026. • Minumum GPA of 3.0 • An essay, brochure or TikTok video that discourages teens from underage drinking and driving', url: ''),
  _SchoolScholarship(name: 'Rob Foundation Scholarship', amount: '2500', details: 'Deadline: Application open from 3/1/26 until 4/30/26. • Must be a North Carolina resident                                                                                                                                                                  ...', url: 'https://robfoundation.org/application-process'),
  _SchoolScholarship(name: 'Florence Kidder Memorial Scholarship', amount: 'Varies from USD 400 to USD 3,000', details: 'Deadline: Feb 08, 2026. • Must be a high school senior  • Complete an application form and write an original essay of 500 to 700 words on the provided essay prompt', url: ''),
  _SchoolScholarship(name: 'NC Scholarship for Children of War Time Veterans', amount: 'Full tuition to NC public universities; up to USD 4,500 at NC private institutions.', details: 'Deadline: See school counselor. Child of deceased, disabled, combat, POW/MIA veteran. NC resident.                                                                                                                                   ...', url: ''),
  _SchoolScholarship(name: 'GySgt. Christopher Eckard Scholarship', amount: '750', details: 'Deadline: Apr 15, 2026. • Must be a direct descendant (child, grandchild, or a legally adopted child) of a veteran. The parent or grandparent must have served at least one day of active duty in the Armed Forces of the Uni...', url: 'https://www.chriseckardscholarship.org/application'),
  _SchoolScholarship(name: 'NCSEAA Golden Leaf Scholarship', amount: 'USD 3,000 for 2-year college students, USD 10,000 for 4-year college students', details: 'Deadline: Mar 01, 2026. • Must enroll as a full time, degree seeking student in Fall 2026 at a participating institution                                                                                                     ...', url: ''),
  _SchoolScholarship(name: 'NC Forgivable Education Loan for Services (FELS)', amount: 'up to USD 20,000', details: 'Deadline: Mar 01, 2025. 3.0 for graduating high school students (weighted GPA)                                                                                                                  Maintain Satisfactory Academi...', url: ''),
  _SchoolScholarship(name: 'African American Network-Carolinas Scholarship - member of a race/ethnic category typically considered people of color', amount: 'Varies', details: 'Deadline: Feb 27, 2026. • Must attend a 4 year university in NC or SC • Must plan to major in engineering, math, science, computer science, accounting, finance or business administration • All minority students may apply ...', url: ''),
  _SchoolScholarship(name: 'Matthew Grazeidei', amount: '1500', details: 'Deadline: Feb 20, 2026. • ALL NC students with a disability are eligible                                                                                                                                                 • De...', url: ''),
  _SchoolScholarship(name: 'The Michael Howell Scholarship - Education Foundation of Caldwell County, Inc.', amount: 'Varies', details: 'Deadline: Return to Mrs. Mack by 2/26 and she will deliver to Education Center or due to Education Center by 3/1/26. • Applicant must fall under the McKinney-Vento Act • A minimum high school GPA of 3.2 or higher • Recommendation from a teacher, typed essay (topic on last page of application), and transcript requ...', url: ''),
  _SchoolScholarship(name: 'Janet H. Wilson Memorial Scholarship - Education Foundation of Caldwell County, Inc.', amount: 'Varies', details: 'Deadline: Return to Mrs. Mack by 2/26 and she will deliver to Education Center or due to Education Center by 3/1/26. • Applicant must be a student seeking a degree in a Career and Technical Education (CTE) related field of study, must be a CTE Concentrator  • Have a high school unweighted GPA of 3.0 or higher  • ...', url: ''),
  _SchoolScholarship(name: 'Thomas Marshall “Jack” Robbins Scholarship - Education Foundation of Caldwell County, Inc.', amount: 'Varies', details: 'Deadline: Return to Mrs. Mack by 2/26 and she will deliver to Education Center or due to Education Center by 3/1/26. • Must be US citizen • Have a high school GPA of 3.2 or higher  • Consideration is given to those students who have shown academic promise and leadership qualities. • Final decisions are based on t...', url: ''),
  _SchoolScholarship(name: 'Connie Patterson Jenkins Scholarship - Education Foundation of Caldwell County, Inc.', amount: 'Varies', details: 'Deadline: Return to Mrs. Mack by 2/26 and she will deliver to Education Center or due to Education Center by 3/1/26. • Must be US citizen • Have a high school GPA of 3.2 or higher • Consideration is given to those students who have shown academic promise and leadership qualities. • Final decisions are based on th...', url: ''),
  _SchoolScholarship(name: 'Anne and Alex Bernhardt Scholarship - Education Foundation of Caldwell County, Inc.', amount: 'Varies', details: 'Deadline: Return to Mrs. Mack by 2/26 and she will deliver to Education Center or due to Education Center by 3/1/26. • Demonstrate outstanding work ethics, leadership qualities and who have a history of philanthropic service • It is the donors desire that preference in the selection accrue to employees, or studen...', url: ''),
  _SchoolScholarship(name: 'Mary Bernhardt Busko Memorial - Education Foundation of Caldwell County, Inc.', amount: 'Varies', details: 'Deadline: Return to Mrs. Mack by 2/26 and she will deliver to Education Center or due to Education Center by 3/1/26. • Must demonstrate financial need, academic achievement, leadership ability, community service, and outstanding work ethic • Preference may be given to applicant whose family members are or were em...', url: ''),
  _SchoolScholarship(name: 'Bobby Price Memorial Scholarship - Education Foundation of Caldwell County, Inc.', amount: 'up to USD 5,000', details: 'Deadline: Return to Mrs. Mack by 2/27 and she will deliver by 3/1/26. • Must be from the Kings Creek area • Have a high school GPA of 3.0 or higher • Consideration is given to those students who have shown academic promise, leadership qualities, and community involve...', url: ''),
  _SchoolScholarship(name: 'Excellence in Leadership - Education Foundation of Caldwell County, Inc.', amount: 'Varies', details: 'Deadline: Return to Mrs. Mack by 2/27 and she will deliver by 3/1/26. • Applicant must demonstrate a consistent and positive leadership role in furthering a positive environment  • Students can self-nominate or be teacher-nominated • Recommendation from a teacher, th...', url: ''),
  _SchoolScholarship(name: 'NC Alpha Delta Kappa Student Achievement Scholarship', amount: 'Varies', details: 'Deadline: Mar 03, 2026. • Unweighted GPA between 2.5 & 3.5 • SAT score 900-1050 • GPA and test scores must fall within these ranges • Service to school, community and church', url: ''),
  _SchoolScholarship(name: 'NC Alpha Delta Kappa Omicron Scholarship', amount: 'Varies', details: 'Deadline: Mar 01, 2026. Locally funded USD 1000 scholarships given to a few Caldwell, Alexander, or Wilkes High School seniors planning to attend college to pursue a degree and career in education', url: ''),
  _SchoolScholarship(name: 'NC Alpha Delta Kappa Fine Arts Scholarship', amount: '2000', details: 'Deadline: 3/1/2026                             Must be recevied by due date.. •Clare Johnson Marley-Mary Earle Berger Fine Arts Scholarship for male or female attending a 4 year college and major in the area of fine arts, top 20% of class, minimum SAT or ACT score           ...', url: ''),
  _SchoolScholarship(name: 'NC Alpha Delta Kappa Scholarship', amount: '2000', details: 'Deadline: 3/1/2026                       Must be recevied by due date.. • Eunice Riggins Memorial Scholarship for females attending a 4 year college, top 10% of class, Minimum SAT or ACT score                                   ***For the 2020/2021 scholarship applicati...', url: ''),
  _SchoolScholarship(name: 'NC Alpha Delta Kappa Scholarship', amount: '2000', details: 'Deadline: 3/1/2026                              Must be recevied by due date.. • Mary Rose Mills-Linda Rankin Memorial Scholarship for male or female attending a 4 year college, top 10% of class, minimum SAT or ACT score          ***For the 2020/2021 scholarship application, ...', url: ''),
  _SchoolScholarship(name: 'NC Community Foundation Disaster Relief and Resilience Scholarship', amount: 'Varies', details: 'Deadline: Mar 03, 2026. Provides support for residents of counties in Western NC whose ability to pay for college or university has been adversely impacted by Hurricane Helene', url: 'https://www.nccommunityfoundation.org/scholarship/north-carolina-community-foundation-disaster-relief-and-resilience-scholarship'),
  _SchoolScholarship(name: 'Coffey Scholarship', amount: 'Varies~ approx. USD 8000 a year', details: 'Deadline: 2/25/2026                                                                          Due to Mrs. Mack. Top 5% of graduating class. Have not received 80% of funding to college of choice. Demonstrate leadership, character, and community involvement.', url: ''),
  _SchoolScholarship(name: 'NC Farm Bureau                R. Flake Shaw', amount: '4000', details: 'Deadline: 3/2/2026 Completed application and financial forms. NC Farm Bureau offers these scholarships (six university level scholarships valued at USD 4,000 per year for four years of student at a college or university in an agricultural-related field and tw...', url: ''),
  _SchoolScholarship(name: 'Lenoir Womans Club', amount: 'USD 2000-5000', details: 'Deadline: Must be received by 3/15/2026 by mail or hand delivery. • Male or Female may apply • Academic achievement • Financial need', url: ''),
  _SchoolScholarship(name: 'SECU People Helping People Scholarship', amount: '10000', details: 'Deadline: Due to Mrs. Mack 02/26/2026. • Must be a SECU member or eligible for membership through parent/guardian • US citizen • Minimum GPA 2.5 • Accepted and planning to attend an NC Public University • Demonstrated leadership, excell...', url: ''),
  _SchoolScholarship(name: 'Charles Edward Cathey Masonic Scholarship', amount: '1000', details: 'Deadline: 4/1/2026                       Application-online, mail in supporting documents. The Cathey Scholarship, funded by the Freemasons of North Carolina through the Grand Lodge of Ancient, Free and Accepted Masons, rewards high school seniors who have demonstrated academic achieveme...', url: ''),
  _SchoolScholarship(name: 'Lenoir Service League', amount: 'USD 1,000 per year (USD 4,000 total)', details: 'Deadline: Must be received or postmarked by 3/15/26 by mail. • Needs based scholarship for any female (super)senior living in Caldwell County who has maintained at least a B average • Will need to include SAI number from FAFSA • Community    • 3 Rec. letters', url: ''),
  _SchoolScholarship(name: 'CWFF Scholarship Program', amount: '10000', details: 'Deadline: Apr 15, 2026. • Applicants must identify as a Black or Brown student and be a rising freshman accepted at one of the eligible institutions  • Applicants will be asked to share a meaningful life experience that h...', url: 'https://thecwff.org/scholarship-program'),
  _SchoolScholarship(name: 'North Carolina Society of Surveyors', amount: 'up to USD 2,500', details: 'Deadline: Mar 15, 2025. 1. Bachelor of Science in Surveying 2. Bachelor of Science in Geomatics 3. Associate of Applied Science in Surveying Technology 4. Any degree with a major or curriculum that is substantially the sa...', url: ''),
  _SchoolScholarship(name: 'NC Cooperative Extension Administrative Professional Assoc. Herter-ONeal Scholarship', amount: '750', details: 'Deadline: Mar 18, 2025. • Pursuing a degree in Business', url: ''),
  _SchoolScholarship(name: 'Delta Sigma Theta Sorority, Inc Hickory Alumnae Chapter', amount: '4 awards of 1,200 and 4 awards of 500 for books', details: 'Deadline: Mar 23, 2025. • Females of African American descent  • Attending a 4-year college or university  • A physical resident of Burke, Caldwell, Catawba, or Iredell counties   • All majors/areas of academics can apply', url: ''),
  _SchoolScholarship(name: 'Caldwell County Nurseryman Association', amount: '750', details: 'Deadline: May 01, 2026. • Must plan to enroll in a Horticulture program at an accredited institution in North Carolina • Must reside in Caldwell County', url: ''),
  _SchoolScholarship(name: 'Janice M. Scott Memorial Scholarship', amount: 'Varies', details: 'Deadline: Mar 31, 2026. • GPA of 3.0 or higher • Must plan to enroll full time at a 4-year college in any state • Parental income of less than USD 50,000 combined per year   • Selection is based on financial need, academi...', url: ''),
  _SchoolScholarship(name: 'Blue Ridge Healthcare Foundation Scholarship', amount: 'Varies', details: 'Deadline: All required documents must be postmarked by 3/20/26. • Must be planning to pursue a healthcare related degree • Provide responses to 5 short answer essay questions related to UNC Health Blue Ridge, career goals, and student involvement  • Submit comp...', url: ''),
  _SchoolScholarship(name: 'Blue Ridge Energy Leadership Track Scholarship', amount: '4000', details: 'Deadline: See school counselor. Students participating in the Blue Ridge Energy Leadership Track will receive invitations to apply for up to eight USD 4,000 scholarships. Students will compete for these scholarships based on lead...', url: ''),
  _SchoolScholarship(name: 'Caldwell County Principal and Assistant Principal Association Scholarship', amount: '1000', details: 'Deadline: Applications due 3/27/26 to Mrs. Griffin. • Students must plan to enter a career in education • Applications must be signed by a principal and student • Essay', url: ''),
  _SchoolScholarship(name: 'Caldwell County Farm Bureau', amount: 'Varies', details: 'Deadline: 4/9/2026                          Due to Farm Bureau Office. • Pursue a career in agriculture or in an agriculture-related field  • Minimum GPA of 2.5 • Demonstrated financial need', url: ''),
  _SchoolScholarship(name: 'Charles and Lucille Suddreth Blue Ridge Energy', amount: 'Up to USD 2,000', details: 'Deadline: Apr 15, 2026. Scholarship is awarded to students pursuing a degree at CCC&TI.', url: ''),
  _SchoolScholarship(name: 'SEANC', amount: 'Varies', details: 'Deadline: Postmarked by 4/15/2026. • Student or parent must be a member of SEANC • Category I Scholarship-need based • Category II Scholarship -merit based', url: ''),
  _SchoolScholarship(name: 'Rotary Club of Lenoir Scholarship', amount: '2000', details: 'Deadline: Apr 30, 2026. • Must be a Caldwell County resident                                                                                                                                                                 ...', url: ''),
  _SchoolScholarship(name: 'Rotary Club of Lenoir              Ed Tutor Baseball Scholarship', amount: '1294', details: 'Deadline: Apr 30, 2026. • Must have played baseball  • Must be a Caldwell County resident                                                                                                                                    ...', url: ''),
  _SchoolScholarship(name: 'NC Hispanic College Fund', amount: 'USD 1,000-USD 2,000', details: 'Deadline: Apr 30, 2026. Graduates of NC high schools who are of Hispanic/Latino descent Must enroll in a degree program at a 2 or 4-year college A four-year cumulative GPA of 2.5 or higher on a 4.0 scale 2 letters of reco...', url: ''),
  _SchoolScholarship(name: 'Rotary Club of Caldwell County Scholarship', amount: '1500', details: 'Deadline: 4/9/2025                          Due to Mrs. Mack. • 2 letters of recommendation (Counselor will provide one)                                                                                                                                           ...', url: ''),
  _SchoolScholarship(name: 'Caldwell County Association of Educators', amount: '250', details: 'Deadline: 4/9/2025 due to Mrs. Mack. • Plan to pursue a career in education                                                                                                                                                               ...', url: ''),
  _SchoolScholarship(name: 'Hibriten Lodge # 262 Masonic Scholarship', amount: '500', details: 'Deadline: Due to Mrs. Mack by May 5th. • Essay  • Financial need', url: ''),
  _SchoolScholarship(name: 'Kiwanis Club of Lenoir', amount: '500', details: 'Deadline: May 30, 2026. Any student planning to attend a 4‑year college or university in North Carolina', url: ''),
  _SchoolScholarship(name: 'McCain Funeral Home & Cremations Merit Scholarship', amount: '500', details: 'Deadline: Must be received by 5/15/26 by 4pm by email, mail, or dropped off at address on packet. • Must submit official transcript • Provide proof of college acceptance • 2 letters of recommendation and an essay of 500 words • Minimum 2.75 GPA', url: ''),
  _SchoolScholarship(name: 'Ladies in Action Scholarship', amount: 'Varies', details: 'Deadline: Jun 06, 2026. • Minimum 2.5 GPA                                                                                                                                                                                    ...', url: ''),
  _SchoolScholarship(name: 'The Sylvia Ann Greene Arts, Music, Education, History & Innovation Scholarship', amount: '500', details: 'Deadline: Apr 30, 2026. • Graduating senior of a Caldwell County high school • Member of a minority group • Will be enrolled as a full-time student of a 2- or 4-year college or university in the upcoming fall semester • F...', url: ''),
  _SchoolScholarship(name: 'Sallie Maes Bridging the Dream Scholarship', amount: 'Up to USD 10,000', details: 'Deadline: Apr 24, 2026. • Enrolled as a Pell-Grant eligible high school senior for 2026-2027 academic year. • Plan to enroll as a first-time, incoming freshman at an accredited postsecondary institution or continuous educ...', url: ''),
  _SchoolScholarship(name: 'COLLETTSVILLE RURITAN CLUB:  JOE GLASS MEMORIAL SCHOLARSHIP', amount: 'USD 500.00 per year for four years', details: 'Deadline: May 1st, 2026. Maintain a GPA of 2.5 or higher in years two through four at an accredited college or university', url: ''),
  _SchoolScholarship(name: 'Delta Sigma Theta Sorority, Inc.', amount: 'USD 1000 per service area', details: 'Deadline: Apr 24, 2026. Any graduating African American female student residing in Burke, Caldwell, Catawba, or Iredell counties', url: 'https://bit.ly/2026HACAppl'),
  _SchoolScholarship(name: 'Army ROTC Scholarship', amount: 'Pays room and board OR 100% of tuition and fees', details: 'Deadline: Mar 17, 2026. • Scholar criteria is determined from your high school grades and SAT or ACT scores.                                                                                 • Athlete criteria is determined...', url: ''),
  _SchoolScholarship(name: 'Quest Bridge', amount: 'Full Scholarship', details: 'Deadline: Sep 30, 2025. • Qualify for free/reduced lunch or familys (family of four) total household income is less than USD 65,000 annually • In top 5-10% of class • Must be interested in applying to one of the 40 partne...', url: ''),
  _SchoolScholarship(name: 'Morehead Cain Scholarship', amount: 'Full tuition, Room, Board, and fees', details: 'Deadline: Applications due:             10/1/2025. Selections are based on:                                                                                                     • Scholarship • Leadership • Moral Force of Character • Physical Vigor •...', url: ''),
  _SchoolScholarship(name: 'Levine Scholars', amount: 'Full', details: 'Deadline: Oct 15, 2025. • Apply to UNC Charlotte by November 1, 2021 • Typical GPA of 3.8 – 4.00 (unweighted)  • Typical SAT score of 1900 – 2400 or ACT composite of 29 – 36 • Community service,  knowledge, leadership • S...', url: ''),
  _SchoolScholarship(name: 'NC State Park Scholarship', amount: 'Full', details: 'Deadline: Applications due: 11/1/25. Selections are based on:                                                                                                     • Scholarship • Leadership • Character • Service                        ...', url: ''),
  _SchoolScholarship(name: 'Gardner-Webb University-Tucker Scholarship', amount: 'Full', details: 'Deadline: Nominations are due 11/10/24 Application/essay deadline 11/17/24 finalist interview early Dec.. Selections are based on: Heart, Soul, Mind, Strength •  Interview process if finalist', url: ''),
  _SchoolScholarship(name: 'UNCC Scholarships', amount: 'Varies', details: 'Deadline: Varies. • All UNCC scholarship are now available on the UNCC website', url: ''),
  _SchoolScholarship(name: 'Lenoir-Rhyne Tuition-Free Guarantee', amount: 'Full', details: 'Deadline: Priority deadline 11/15/2025. New first-year and transfer students from North and South Carolina with a family adjusted gross income (AGI) of USD 100,000 or less', url: ''),
  _SchoolScholarship(name: 'Warren Wilson College Free College Program', amount: 'Full', details: 'Deadline: Rolling deadline until full. • Eligible for Pell Grant (from FAFSA) or NC-Need-Based Scholarships • File a current FAFSA and sent it to WWC • Live on campus and work in work program', url: ''),
  _SchoolScholarship(name: 'Access Scholarship', amount: 'Full', details: 'Deadline: Admissions application due:  11/15/2025                                    FAFSA due: 1/1/26. • Must submit the admissions application by Nov. 1st. Submit transcripts and test scores by Nov. 15th.  • Must complete the FAFSA by Dec. 1st for priority consideration • Family gross income must b...', url: ''),
  _SchoolScholarship(name: 'Robertson Scholars Leadership Program', amount: 'Full Tuition, Room, Board, and fees', details: 'Deadline: Nov 15, 2025. •Students must apply for admission to either UNC Chapel Hill or Duke •Students who have applied to the Morehead Cain scholarship are not eligible to also apply for the Robertson Scholars Program •S...', url: 'http://robertsonscholars.org/'),
  _SchoolScholarship(name: 'UNC Chapel Hill Thomas Wolfe Scholarship', amount: 'Full Tuition, Room, Board, and fees', details: 'Deadline: Admissions application due: 10/15/25   Scholarship appclication due: 11/15/2025. • Demonstrate talent and interest in creative writing • Artistic merit is the chief criterion of selection', url: ''),
  _SchoolScholarship(name: 'Cheatham-White Scholarship at NCCU', amount: 'Full', details: 'Deadline: 11/1/2025                       Self nominate deadline. • Either school nominated or self nominated by the nomination deadline • See Mrs. Mack or Ms. Long for nomination • GPA 4.0 weighted • SAT 1280 or ACT 28 (TEST SCORES ARE OPTIONAL)', url: ''),
  _SchoolScholarship(name: 'UNCG Guarantee', amount: 'Full', details: 'Deadline: Mar 14, 2026. • Complete pre-screening to ensure eligibility • SAT 1030 or ACT 20 • Weighted GPA of 3.0 or higher • Have a Student Aid Index (SAI) of -1500 on the 2026-2027 FAFSA', url: ''),
  _SchoolScholarship(name: 'CCC&TI Foundation Scholarships', amount: 'Varies', details: 'Deadline: Final Deadline 7/1/26. Complete FAFSA, short application and essay questions', url: ''),
  _SchoolScholarship(name: 'CVCC Foundation Scholarships', amount: 'Varies', details: 'Deadline: Mar 06, 2026. Complete FAFSA, short application and essay questions', url: 'https://cvcc.edu/student-services/financial-aid/scholarships/'),
  _SchoolScholarship(name: 'UNC-G Spartan Education Scholars Program', amount: 'Up to USD 28,000', details: 'Deadline: See school counselor. • Students must major in Deaf Education, Elementary Education, Middle Grades Education, Special Education, or Dual (Elementary and Special) Education • GPA 3.8 weighted GPA is recommended • Scholar...', url: 'https://soe.uncg.edu/soe-scholarships-funding/spartan-ed-scholar/'),
  _SchoolScholarship(name: 'Odyssey Program at Elon University', amount: 'Full tuition', details: 'Deadline: Jan 15, 2025. • This scholarship is open to all first-year applicants • Upon access to your Acorn Account (after submitting an undergraduate application), the Odyssey Program application will be available via th...', url: ''),
  _SchoolScholarship(name: 'NC Teaching Fellows', amount: 'Up to USD 5,000 per semester', details: 'Deadline: Jan 31, 2026. • Strongly encouraged to submit an SAT and/or ACT score • Be willing to teach in a STEM (Science, Technology, Engineering, Math) OR Special Education licensure area in NC • Applicants with more tha...', url: ''),
  _SchoolScholarship(name: 'Abernathy Education Scholarship', amount: '20000', details: 'Deadline: Jan 15, 2026. • Plan to teach math, or science after graduation • GPA: unweighted min 3.0 • SAT: 1080 or ACT: 21 • Must be admitted to East Carolina University and apply through the universitys ECUAWard portal', url: ''),
  _SchoolScholarship(name: 'Community Blood Center of the Carolinas Scholarship', amount: '1000', details: 'Deadline: Year round. • Host a blood drive • Students with the top producing blood drives', url: ''),
  _SchoolScholarship(name: 'Carolinas Credit Union Foundation Scholarship', amount: 'Varies', details: 'Deadline: See school counselor. • Member of a NC Credit Union • 3.0 unweighted GPA or higher • Can apply for multiple scholarships within fund', url: ''),
  _SchoolScholarship(name: 'CFNC Financial Literacy', amount: '500', details: 'Deadline: Monthly. Complete CFNC financial literacy and be entered to win USD 500', url: ''),
  _SchoolScholarship(name: 'The College Foundation of North Carolina', amount: 'Varies', details: 'Deadline: Varies. Visit the site for a comprehensive list of scholarships available through the College Foundation of North Carolina', url: ''),
  _SchoolScholarship(name: 'Foundation for the Carolinas', amount: 'Varies', details: 'Deadline: 2026-27 Application Cycle is open November 10, 2025 through February 27, 2026. • There are 39 scholarships available to NC students through the Foundation for the Carolinas Scholarship Funds                                                                                      ...', url: ''),
  _SchoolScholarship(name: 'The Community Foundation of Western North Carolina: Harry W. Clarke Award and William A. Hart Award', amount: 'USD 2,000 for 2-year schools, USD 4,000 for 4-year schools', details: 'Deadline: Jan 16, 2026. • Open to North Carolina residents who are public high school seniors • Financial need, academic achievement, moral character, & community service are all considered', url: ''),
  _SchoolScholarship(name: 'NC Community Foundation-Scholarship Search Page', amount: 'Varies', details: 'Deadline: January - April. Visit the site for a comprehensive list of scholarships available through the North Carolina Community Foundation', url: ''),
  _SchoolScholarship(name: 'Lettie Pate Whitehead Foundation', amount: 'Varies', details: 'Deadline: Varies. • Must contact participating college to find out how to apply • Must identify as a Christian female', url: ''),
  _SchoolScholarship(name: 'NCHSAA Endowed Scholarships', amount: 'Varies', details: 'Deadline: February. Several scholarships available to eligible student-athletes', url: ''),
  _SchoolScholarship(name: 'College Board Opportunity Scholarship', amount: 'Varies', details: 'Deadline: See school counselor. • More challenges you complete, the more money you have the chance of earning • Begins with the Class of 2020', url: ''),
  _SchoolScholarship(name: 'Going Merry Scholarship Search', amount: 'Varies', details: 'Deadline: See school counselor. Build your profile, get matched and start applying.', url: ''),
  _SchoolScholarship(name: 'Fastweb', amount: 'Varies', details: 'Deadline: See school counselor. Connection to scholarships, colleges, and financial aid.', url: ''),
  _SchoolScholarship(name: 'Humanity Rising Scholarship', amount: 'USD 500-USD 2,000', details: 'Deadline: See school counselor. Awarded thousands of dollars in college scholarships to students who are making a difference in the world through volunteerism or creating their own service project.', url: ''),
  _SchoolScholarship(name: 'College Prowler No Essay Scholarship', amount: '2000', details: 'Deadline: Monthly. • Open to all students • The monthly winner will be determined by random drawing • One entry per person, per month', url: ''),
  _SchoolScholarship(name: 'Chegg', amount: 'varies', details: 'Deadline: Monthly. • Open to all students • Sign up to receive monthly notifications of new scholarships', url: ''),
  _SchoolScholarship(name: 'Guaranteed Scholarship', amount: 'Varies', details: 'Deadline: See school counselor. Students who meet the published criteria for a scholarship and attend the college offering it receive it...no ands, ifs or buts', url: ''),
  _SchoolScholarship(name: 'Scholarships 360', amount: 'Varies', details: 'Deadline: See school counselor. Varied qualifications', url: ''),
  _SchoolScholarship(name: 'Student Scholarships', amount: 'Varies', details: 'Deadline: See school counselor. Varied qualifications', url: ''),
  _SchoolScholarship(name: 'The Gates Scholarship', amount: 'Varies based on financial need', details: 'Deadline: Sep 15, 2025. •Be of African American, American Indian/Alaska Native, Asian American or Pacific Islander, or Hispanic American ethnicity as defined by the US Census •Be a US citizen, national, or permanent resid...', url: ''),
  _SchoolScholarship(name: 'Golden Doors', amount: 'Up to 4-yr tuition and room.board', details: 'Deadline: Oct 01, 2024. • Students must be eligible for DACA (Deferred Action for Childhood Arrivals) or TPS (Temporary Protected Status)                                                   • Strong priority is given to stu...', url: ''),
  _SchoolScholarship(name: 'Coca Cola Scholarship', amount: '20000', details: 'Deadline: Sep 30, 2025. • Students must be a current high school senior • Minimum GPA of 3.0 • High academic achievement, service-oriented, and commitment to their community', url: ''),
  _SchoolScholarship(name: 'Elks Most Valuable Scholarship', amount: 'Up to USD 12,500 per year', details: 'Deadline: Nov 12, 2025. • Applicants will be judged on scholarship, leadership, and financial need • Applicants need not be related to a member of the Elks.', url: ''),
  _SchoolScholarship(name: 'Jack Kent Cooke Foundation Scholarship', amount: 'Up to USD 40,000 Annually', details: 'Deadline: Nov 12, 2025. • Unweighted minimum GPA of 3.5  • Not requiring test scores this year.  • Income up to USD 95,000', url: ''),
  _SchoolScholarship(name: 'Greenhouse Scholars', amount: 'Up to USD 5,000 per academic year', details: 'Deadline: Nov 13, 2025. • Be a graduating senior planning to attend a 4-year college • Be a U.S. citizen or permanent resident and a legal resident of NC • Have a cumulative, unweighted GPA of 3.5 or above • Demonstrate f...', url: 'https://apply.greenhousescholars.com/'),
  _SchoolScholarship(name: 'National Beta Scholarship Program', amount: 'USD 1,000 - USD 20,000', details: 'Deadline: Jan 15, 2026. • High academic achievement  • Demonstrated leadership • School and community service • SAT and/or ACT score', url: ''),
  _SchoolScholarship(name: 'Opportunity Scholarship from The Dream US', amount: 'Up to USD 20,000', details: 'Deadline: Jan 31, 2026. • GPA 2.5 or higher • Live in locked-out state (NC qualifies) • Came to US before 16th birthday • Have DACA, TP or meet DACA eligibility • Plan to attend one of their partner colleges              ...', url: ''),
  _SchoolScholarship(name: 'The Fidelity Scholars Program', amount: 'Varies', details: 'Deadline: Jan 29, 2026. *2.5 – 3.5 unweighted GPA *Pell-eligible and/or demonstrate financial need *Attend as an incoming freshman at a four-year accredited college or university in the state that you reside *Student appl...', url: ''),
  _SchoolScholarship(name: 'American College Foundation - Visionary Scholarship', amount: 'Varies', details: 'Deadline: Dec 01, 2025. • Completed scholarship application  • Most recent unofficial high school transcript  • 500-word essay on Why College is Important to Me', url: 'https://americancollegefoundation.org/college-planning-visionary-scholarship-details/'),
  _SchoolScholarship(name: 'Equitable Excellence Scholarship', amount: 'USD 20,000 total', details: 'Deadline: Dec 18, 2025. • Demonstrate ambition and self-drive • Have a minimum GPA of 2.5  • Recipients are selected on the basis of financial need, leadership, work experience', url: 'https://equitable.com/foundation/equitable-excellence-scholarship'),
  _SchoolScholarship(name: 'Hagan Scholarship Foundation', amount: 'up to USD 7,500', details: 'Deadline: Mar 15, 2026. • Must have achieved a 3.5 GPA • Must enroll in an eligible college or university the first semester following graduation • Must maintain a 4 year or less graduation schedule • Adjusted Gross House...', url: ''),
  _SchoolScholarship(name: 'Elks National Foundation Legacy Scholarship', amount: '4000', details: 'Deadline: Feb 02, 2026. • Must be a child or grandchild (or step-child, step-grandchild, or legal ward) of a living Elk who joined the order on or before April 1, 2023, or a charter member of a Lodge that was instituted o...', url: ''),
  _SchoolScholarship(name: 'Hispanic Scholarship Fund - HSF Scholar Program', amount: 'USD 500-USD 5,000', details: 'Deadline: Feb 15, 2026. • Min. GPA 3.0 unweighted • US Citizen, Permanent Resident, DACA or Eligible Non-Citizen • Completed FAFSA', url: ''),
  _SchoolScholarship(name: 'Red Thread Foundation for Women', amount: 'Varies', details: 'Deadline: Application will open on 2/2/26. Applicants must be women of an international background, including immigrants or first-generation Americans, who are planning to attend a 4-year college The application consists of short-answer que...', url: ''),
  _SchoolScholarship(name: 'AFAs Alzheimers Awareness', amount: 'Varies', details: 'Deadline: Mar 01, 2026. • Must be a high school senior planning to attend college in the fall of 2026 Can submit either a written essay (less than 1,500 words) or a video (less than 4 minutes) • Applicant must describe ho...', url: ''),
  _SchoolScholarship(name: 'McDonalds HACER Scholarship', amount: 'Varies', details: 'Deadline: Feb 17, 2026. • Legal U.S. Resident, U.S. Citizen or a DREAMER/DACA recipient • Minimum 2.8 GPA • Plan to enroll full-time at a 2-year or 4-year college', url: ''),
  _SchoolScholarship(name: 'HOLA at Microsoft', amount: 'Varies', details: 'Deadline: Mar 16, 2026. • Be a U.S. based, high school senior of Hispanic and Latinx descent • Be a U.S. citizen, permanent legal resident or be an individual granted deferred action status under the Deferred Action for C...', url: ''),
  _SchoolScholarship(name: 'Fontana Transport Inc', amount: 'Varies', details: 'Deadline: Mar 13, 2026. • Must be a first generation high school senior from an underrepresented community • Must plan to attend a 4-year university and study one of the following fields: Math, Science, Engineering, Archi...', url: ''),
  _SchoolScholarship(name: 'Create-a-Greeting Card Scholarship Contest', amount: '10000', details: 'Deadline: Mar 09, 2026. • This contest is open to all high school students enrolled during the time period of the contest in an academic program designed to conclude with the awarding of a diploma • Design a greeting card...', url: ''),
  _SchoolScholarship(name: 'The HITEC Foundation Scholarship', amount: 'Varies', details: 'Deadline: Mar 16, 2026. • Be of Hispanic heritage  • Be a graduating high school senior with a minimum 3.0 GPA • Major in Technology or an approved technology-related major such as Computer Science, Cybersecurity, Informa...', url: ''),
  _SchoolScholarship(name: 'Abbott & Fenner', amount: '1000', details: 'Deadline: Jun 08, 2026. • Must be a high school senior planning to attend a 2-year or 4-year college • Write a 500-1,000 word essay about their educational career and life goals', url: ''),
  _SchoolScholarship(name: 'Regions Riding Forward Scholarship Contest', amount: '8000', details: 'Deadline: Jun 30, 2026. • Cumulative 2.0 GPA or higher • Must submit a video (no more than 3 minutes in length) or written essay (500 words or less) about an individual they know personally who has inspired them', url: ''),
  _SchoolScholarship(name: 'Skechers Scholarship', amount: 'Varies', details: 'Deadline: Apr 15, 2026. • Apply directly with your Scholarships360 profile. Scholarship applications include 1-2 essay questions and short answer questions. • The scholarship program has 4 individual scholarship opportuni...', url: ''),
  _SchoolScholarship(name: 'Hannah Leitner Scholarship', amount: '2000', details: 'Deadline: Jan 05, 2026. *North Carolina Beta seniors*                                                                                                                                                                       A...', url: ''),
  _SchoolScholarship(name: 'TheDream.US’s National Scholarship', amount: 'Up to USD 16,500 for an associate degree and up to USD 33,000 to pursue a bachelor’s degree', details: 'Deadline: Feb 28, 2026. • First generation immigrant students with or without DACA or TPS who arrived in the country before turning 16 and before Nov. 1, 2020.                                                              ...', url: ''),
];

// ── CAPE HATTERAS SECONDARY SCHOOL SCHOLARSHIPS (DARE COUNTY) ───
const List<_SchoolScholarship> _capeHatterasScholarships = [
  _SchoolScholarship(name: 'Outer Banks Community Foundation Scholarships', amount: 'USD 250,000+ awarded in 2025', details: 'The main source for CHSS scholarships. Apply through OBCF portal. Multiple awards available including renewable scholarships. Apply early each spring.', url: 'https://obcf.org/scholarships/'),
  _SchoolScholarship(name: 'R. Stewart Couch Hatteras Island Scholarship', amount: 'Varies (renewable)', details: 'For Cape Hatteras Secondary School seniors. Renewable scholarship. Apply through Outer Banks Community Foundation portal.', url: 'https://obcf.org/scholarships/'),
  _SchoolScholarship(name: 'Dare County Association of Fire Officers Scholarship', amount: 'Varies', details: 'For Cape Hatteras Secondary School seniors. Apply through Outer Banks Community Foundation portal.', url: 'https://obcf.org/scholarships/'),
  _SchoolScholarship(name: 'Outer Banks Association of Realtors Scholarship', amount: 'USD 1,500', details: 'For graduating seniors from Dare County and Ocracoke Island including CHSS. Leadership and community involvement. Awarded annually at each school awards night.', url: 'https://obcf.org/scholarships/'),
  _SchoolScholarship(name: 'Love of Learning Scholarship', amount: 'Varies', details: 'Established 2025. For Cape Hatteras Secondary School seniors. Apply through Outer Banks Community Foundation portal.', url: 'https://obcf.org/scholarships/'),
  _SchoolScholarship(name: 'Ray Gray Jr. Scholarship', amount: 'Varies', details: 'Established 2025. For Cape Hatteras Secondary School seniors. Apply through Outer Banks Community Foundation portal.', url: 'https://obcf.org/scholarships/'),
  _SchoolScholarship(name: 'Celia Rollinson Meekins Scholarship', amount: 'Varies', details: 'For graduating seniors from Manteo High School or Cape Hatteras Secondary School pursuing a career in education. Apply through OBCF portal.', url: 'https://obcf.org/scholarships/'),
  _SchoolScholarship(name: 'Denver Lindley Jr. Arts Scholarship', amount: 'Varies', details: 'For Dare County seniors pursuing studies in the visual arts. Named after prominent expressionist painter. Apply through OBCF portal.', url: 'https://obcf.org/scholarships/'),
  _SchoolScholarship(name: 'Ben Birindelli Memorial Scholarship', amount: 'Varies (renewable)', details: 'For Dare County seniors who are members of the National Honor Society. Preference for history and literature majors. Renewable merit-based. Apply through OBCF portal.', url: 'https://obcf.org/scholarships/'),
  _SchoolScholarship(name: 'First Flight Rotary Scholarship', amount: 'Varies (renewable)', details: 'Needs-based, renewable. For Dare County seniors pursuing a bachelor degree with service club experience. Apply through OBCF portal.', url: 'https://obcf.org/scholarships/'),
  _SchoolScholarship(name: 'W.R. Davis Scholarship Fund', amount: 'Varies (renewable)', details: 'Established by Bethany Church of Wanchese. Needs-based, renewable. For Dare County students attending a public NC institution. Apply through OBCF portal.', url: 'https://obcf.org/scholarships/'),
  _SchoolScholarship(name: 'Outer Banks Orthodontics Scholarship', amount: 'Varies', details: 'Need-based. For Dare County and Ocracoke seniors who have worked to help pay for their education. COA graduates may also apply. Apply through OBCF portal.', url: 'https://obcf.org/scholarships/'),
  _SchoolScholarship(name: 'Outer Banks Home Builders Association Scholarship', amount: 'Varies (4 awards)', details: 'Child of registered OBHBA builder or associate member OR pursuing construction-related trade at tech school or community college. 2 of 4 awards reserved for construction field. Apply through CHSS counselor.', url: 'https://chs.daretolearn.org/academics/guidance/scholarships/local-scholarships'),
  _SchoolScholarship(name: 'Dare County Bar and Bench Foundation Scholarship', amount: 'Varies', details: 'Financial need statement, 2 letters of recommendation, essay, transcript, SAT/ACT scores required. Apply through CHSS counselor. Check for current deadline.', url: 'https://chs.daretolearn.org/academics/guidance/scholarships/local-scholarships'),
  _SchoolScholarship(name: 'Mt. Olivet Scholarship', amount: 'Varies', details: 'Application form, 2 recommendation forms, statement of financial need, and applicant letter and resume required. Get packet from CHSS counselor.', url: 'https://chs.daretolearn.org/academics/guidance/scholarships/local-scholarships'),
  _SchoolScholarship(name: 'Hugh A. McCullen Scholarship', amount: 'Varies (renewable)', details: 'For Manteo High School seniors planning to attend a 4-year NC college or university. Renewable. Apply through OBCF portal. Check eligibility with counselor.', url: 'https://obcf.org/scholarships/'),
  _SchoolScholarship(name: 'CHSS Local Scholarships Page', amount: 'Varies', details: 'Check the school counselor page for all current local scholarships and deadlines. Contact Mrs. Karla Jarvis, Guidance Counselor, for applications.', url: 'https://chs.daretolearn.org/academics/guidance/scholarships/local-scholarships'),
  _SchoolScholarship(name: 'CHSS National Scholarships Page', amount: 'Varies', details: 'Check the national scholarships page maintained by the CHSS counselor for current national opportunities.', url: 'https://chs.daretolearn.org/academics/guidance/scholarships/national-scholarships'),
  _SchoolScholarship(name: 'NC Need-Based Grant', amount: 'Up to USD 9,300/yr', details: 'For NC residents with financial need attending NC colleges. Apply via FAFSA as early as possible.', url: 'https://www.cfnc.org/pay-for-college/financial-aid/nc-need-based-grant/'),
  _SchoolScholarship(name: 'NextNC Scholarship', amount: 'USD 3,000-USD 5,000/yr', details: 'NC public high school senior. Family income under USD 80,000. Just submit FAFSA by June 1. No separate application needed.', url: 'https://nextncscholarship.org/'),
  _SchoolScholarship(name: 'QuestBridge Match Scholarship', amount: 'Full Ride', details: 'High-achieving, low-income first-gen students. Top 5-10% of class. Household income under USD 65,000. Open to undocumented/DACA. Deadline: Sept. 26.', url: 'https://www.questbridge.org'),
  _SchoolScholarship(name: 'CFNC.org Scholarship Search', amount: 'Varies', details: 'Search hundreds of NC scholarships. Free to use. Great starting point for Dare County students.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
];

// ── CHATHAM CENTRAL HIGH SCHOOL SCHOLARSHIPS ────────────────────
const List<_SchoolScholarship> _chathamCentralScholarships = [
  // School-endorsed competitive scholarships
  _SchoolScholarship(name: 'Davidson College Belk Scholarship', amount: 'Full Merit Scholarship', details: 'CCHS endorses ONE senior to apply. Up to 6 freshmen chosen nationwide. Highly competitive. See your counselor to be considered for the school endorsement.', url: 'https://www.davidson.edu/offices/financial-aid/scholarships-and-grants/belk-scholars'),
  _SchoolScholarship(name: 'NC State Park Scholarship', amount: 'Full Merit Scholarship', details: 'CCHS endorses 2 seniors. Self-endorsement also allowed. Must apply to NCSU by Nov. 1 first. Avg scholar has 1300 SAT and 100+ community service hours. See counselor.', url: 'https://park.ncsu.edu'),
  _SchoolScholarship(name: 'UNC Charlotte Levine Scholars Program', amount: 'Full Ride', details: 'Min 3.8 GPA, 1800 SAT or 29 ACT. Commitment to community service and ethical leadership. Counselor will nominate qualifying students.', url: 'https://levinescholars.charlotte.edu'),
  // Chatham County local
  _SchoolScholarship(name: 'Reginald and Mildred Womble Scholarship', amount: 'USD 2,500', details: 'For Chatham County seniors planning to attend an HBCU. Honors commitment to education. Apply through GWCCEC.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
  _SchoolScholarship(name: 'Business and Professional Women of the Triangle', amount: 'Varies', details: 'For NC women in Durham, Orange, Wake, or Chatham County. Enrolled or planning to enroll at an accredited college. Min 2.5 GPA. US citizen.', url: 'https://www.bpwtriangle.org/scholarships'),
  _SchoolScholarship(name: 'NC Community Foundation Chatham County Scholarships', amount: 'USD 1,000+', details: 'Multiple scholarships available for Chatham County students. Apply using NCCF Universal Application. Opens Dec. 16, closes March 3 annually. Apply at nccommunityfoundation.org.', url: 'https://www.nccommunityfoundation.org/scholarships'),
  _SchoolScholarship(name: 'Central Carolina Community College Foundation', amount: 'Varies', details: 'For students attending CCCC. Over 100 merit and need-based scholarships. FAFSA required. Chatham County students are eligible. Apply at cccc.edu.', url: 'https://www.cccc.edu/foundation/scholarships/'),
  _SchoolScholarship(name: 'CCHS Scholarship Page', amount: 'Varies', details: 'Check the official CCHS scholarship page for current local and national opportunities updated by the school counselor.', url: 'https://www.chatham.k12.nc.us/o/cchs/page/scholarships'),
  _SchoolScholarship(name: 'StudentScholarships.org', amount: 'Varies', details: 'Broad scholarship database with thousands of opportunities. Search by state, major, and background. Free to use.', url: 'https://studentscholarships.org'),
  // Statewide
  _SchoolScholarship(name: 'NC Need-Based Grant', amount: 'Up to USD 9,300/yr', details: 'For NC residents with financial need attending NC colleges. Apply via FAFSA as early as possible.', url: 'https://www.cfnc.org/pay-for-college/financial-aid/nc-need-based-grant/'),
  _SchoolScholarship(name: 'NextNC Scholarship', amount: 'USD 3,000-USD 5,000/yr', details: 'NC public high school senior. Family income under USD 80,000. Submit FAFSA by June 1. No separate application needed.', url: 'https://nextncscholarship.org/'),
  _SchoolScholarship(name: 'Golden LEAF Scholarship', amount: 'USD 12,000', details: 'Priority for NC students from rural and economically distressed communities. FAFSA required. Apply at CFNC by March 1.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
  _SchoolScholarship(name: 'QuestBridge Match Scholarship', amount: 'Full Ride', details: 'High-achieving, low-income first-gen students. Top 5-10% of class. Household income under USD 65,000. Open to undocumented/DACA. Deadline: Sept. 26.', url: 'https://www.questbridge.org'),
  _SchoolScholarship(name: 'SECU People Helping People Scholarship', amount: 'USD 10,000', details: 'NC public school senior. Must be SECU member. UNC system university. Min 2.5 GPA. Deadline: Mar. 20.', url: 'https://www.ncsecu.org/resources/scholarships.html'),
  _SchoolScholarship(name: 'CFNC.org Scholarship Search', amount: 'Varies', details: 'Search hundreds of NC scholarships matched to Chatham County students. Free to use.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
];

// ── E.E. SMITH HIGH SCHOOL SCHOLARSHIPS (CUMBERLAND COUNTY) ─────
const List<_SchoolScholarship> _eeSmithScholarships = [
  // E.E. Smith specific scholarships
  _SchoolScholarship(name: 'W.T. Brown Scholarship', amount: 'Varies', details: 'E.E. Smith graduating senior only. Min 3.5 unweighted GPA. Documented community service hours throughout high school. Strong leadership qualities. Apply through Cumberland Community Foundation.', url: 'https://www.cumberlandcf.org/scholarships'),
  _SchoolScholarship(name: 'Dr. John R. Griffin Jr. Memorial Scholarship', amount: 'Varies', details: 'E.E. Smith graduating senior only. Min 3.5 weighted GPA. First-gen college student preferred. Exemplary academic achievement and proven leader. Financial need considered. Apply through Cumberland Community Foundation.', url: 'https://www.cumberlandcf.org/scholarships'),
  _SchoolScholarship(name: 'E.E. Miller Scholarship Fund', amount: 'Varies', details: 'E.E. Smith graduating senior only. Must attend a 4-year college or university in NC. Apply through Cumberland Community Foundation.', url: 'https://www.cumberlandcf.org/scholarships'),
  _SchoolScholarship(name: 'John Thomas Gibson Scholarship', amount: 'Varies', details: 'E.E. Smith senior only. Min 2.5 unweighted GPA. Demonstrated leadership, charisma, and work ethic. Priority for students with financial need. Must attend NC A&T University. Apply through Cumberland Community Foundation.', url: 'https://www.cumberlandcf.org/scholarships'),
  _SchoolScholarship(name: 'Calvin Swinson Jr. Scholarship', amount: 'Varies', details: 'E.E. Smith, Westover, or 71st High School. African American male or female graduating senior. Min 3.0 GPA. Apply through Cumberland Community Foundation.', url: 'https://www.cumberlandcf.org/scholarships'),
  _SchoolScholarship(name: 'Booker T. and Juanita E. Coley Scholarship', amount: 'Varies', details: 'E.E. Smith preferred. Any Cumberland County senior. Min 3.0 GPA. Must plan to attend Fayetteville State University. Elementary education majors given priority. Character, work ethic, leadership. Opens Feb. 17, closes Mar. 20.', url: 'https://www.cumberlandcf.org/scholarships'),
  _SchoolScholarship(name: 'Kiwanis Club of Cape Fear Scholarship', amount: 'Varies', details: 'E.E. Smith, Douglas Byrd, or Village Christian Academy. Must be actively engaged in Key Club. Recommendation from Key Club Advisor required. Academic excellence and community service. Apply through Cumberland Community Foundation.', url: 'https://www.cumberlandcf.org/scholarships'),
  _SchoolScholarship(name: 'Fire Chief Benny Nichols Scholarship', amount: 'Varies', details: 'Cumberland County senior. Priority for E.E. Smith fire science curriculum students or FTCC fire science program. Must be member of volunteer or paid fire dept. Attend FTCC or FSU. Fire Science degree.', url: 'https://www.cumberlandcf.org/scholarships'),
  // Cumberland County-wide scholarships
  _SchoolScholarship(name: 'Robert H. Short Scholars Program', amount: 'Up to USD 7,500/yr (up to USD 30,000)', details: 'Cumberland County resident. Min 3.5 unweighted GPA and 4.2 weighted GPA. Community service and work history. Financial need. Renewable. Apply through Cumberland Community Foundation. Deadline: Apr. 12.', url: 'https://www.cumberlandcf.org/scholarships'),
  _SchoolScholarship(name: 'Alpha Phi Alpha: George L. Butler Memorial Scholarship', amount: 'Varies', details: 'Any Cumberland County high school. African American male. Community involvement, leadership, future plans. Financial need considered. 4-year accredited college. Apply through Cumberland Community Foundation.', url: 'https://www.cumberlandcf.org/scholarships'),
  _SchoolScholarship(name: 'Brenda C. McFayden Scholarship', amount: 'Varies', details: 'Any Cumberland County senior. Min 3.0 unweighted GPA. Special consideration for single-parent children. Financial need. Renewable. Apply through Cumberland Community Foundation.', url: 'https://www.cumberlandcf.org/scholarships'),
  _SchoolScholarship(name: 'Carter Ray Nimocks and Barbara Deville Nimocks Scholarship', amount: 'Varies', details: 'Any Cumberland County senior. Min 2.5 GPA. Financial need. Renewable. Apply through Cumberland Community Foundation.', url: 'https://www.cumberlandcf.org/scholarships'),
  _SchoolScholarship(name: 'Dorothy A. Howard Memorial Scholarship', amount: 'Varies', details: 'Any Cumberland County senior. Female. Strong academics. Leadership, character, community involvement, religious participation. Financial need. Education or education-related field at a NC college. Apply through Cumberland Community Foundation.', url: 'https://www.cumberlandcf.org/scholarships'),
  _SchoolScholarship(name: 'Dorothy Gilmore FCCYC and Monroe Evans Scholarships', amount: 'Varies', details: 'Any Cumberland County senior. Competitive applicants have 3.8+ unweighted GPA and top 5% class rank. Strong community service and academic awards record. Apply through Cumberland Community Foundation.', url: 'https://www.cumberlandcf.org/scholarships'),
  _SchoolScholarship(name: 'Janie Chavis Lucas Scholarship', amount: 'Varies', details: 'Any high school senior. Min 3.0 weighted GPA. Active in at least 2 school organizations. Financial need considered. Any accredited college or university. Apply through Cumberland Community Foundation.', url: 'https://www.cumberlandcf.org/scholarships'),
  _SchoolScholarship(name: 'Lula T. and James L. Crosby Scholarship', amount: 'Varies', details: 'Cumberland, Hoke, or Harnett County senior. Min 3.0 unweighted GPA. Active church member. Financial need. Elementary education degree preferred. Renewable. Apply through Cumberland Community Foundation.', url: 'https://www.cumberlandcf.org/scholarships'),
  _SchoolScholarship(name: 'Pay It Forward Scholarship', amount: 'Varies', details: 'Any Cumberland County senior. Min 3.0 unweighted GPA. Financial need. Renewable. Any accredited institution. Apply through Cumberland Community Foundation.', url: 'https://www.cumberlandcf.org/scholarships'),
  _SchoolScholarship(name: 'Gurney and Olive McLaughlin Scholarship', amount: 'Varies', details: 'High school seniors. Child of active duty or retired military at Ft. Bragg, or child of military parent killed in action. Citizenship. Financial need considered. Renewable. Any accredited college.', url: 'https://www.cumberlandcf.org/scholarships'),
  _SchoolScholarship(name: 'Susan Townsend Barnes Scholarship', amount: 'Varies', details: 'NEW 2025. Cumberland County senior. Min 3.0 unweighted GPA. At least one parent employed by a 501c3 public charity in Cumberland County. Character and work ethic. Renewable. Apply through Cumberland Community Foundation.', url: 'https://www.cumberlandcf.org/scholarships'),
  _SchoolScholarship(name: 'FTCC Foundation Scholarships for High School Seniors', amount: 'Varies', details: 'Planning to attend FTCC full-time (12+ credit hours) in Fall. Min 2.5 unweighted GPA. US citizen and NC resident. FAFSA required. Deadline: Apr. 12. Apply through FTCC Financial Aid.', url: 'https://www.faytechcc.edu/enrollment-management/financial-aid/scholarships/'),
  _SchoolScholarship(name: 'FCHRC Dr. Martin Luther King Jr. Scholarship', amount: 'Varies', details: 'Any Cumberland County senior (min 1 year residency). Min 2.5 GPA. Financial need, academics, leadership, essay, and references. Any accredited NC institution. Apply on Fayetteville-Cumberland Human Relations Commission website.', url: 'https://www.cumberlandcf.org/scholarships'),
  _SchoolScholarship(name: 'SECU People Helping People Scholarship', amount: 'USD 10,000', details: 'NC public school senior. Must be SECU member. UNC system university. Min 2.5 GPA. Deadline: Mar. 20.', url: 'https://www.ncsecu.org/resources/scholarships.html'),
  _SchoolScholarship(name: 'NC Teaching Fellows Scholarship', amount: 'Up to USD 4,125/semester', details: 'NC resident planning to teach in NC public schools. Competitive. Apply through NCSEAA. Strong academics and commitment to teaching required.', url: 'https://www.cfnc.org/pay-for-college/financial-aid/nc-teaching-fellows/'),
  _SchoolScholarship(name: 'Cumberland Community Foundation Scholarships', amount: 'Multiple awards', details: 'Over 40 scholarships for Cumberland County students. Apply through the CCF portal. Many E.E. Smith-specific awards available. Check cumberlandcf.org for the full list and deadlines.', url: 'https://www.cumberlandcf.org/scholarships'),
  _SchoolScholarship(name: 'NC Need-Based Grant', amount: 'Up to USD 9,300/yr', details: 'NC residents with financial need attending NC colleges. Apply via FAFSA as early as possible.', url: 'https://www.cfnc.org/pay-for-college/financial-aid/nc-need-based-grant/'),
  _SchoolScholarship(name: 'NextNC Scholarship', amount: 'USD 3,000-USD 5,000/yr', details: 'NC public high school senior. Family income under USD 80,000. Submit FAFSA by June 1. No separate application needed.', url: 'https://nextncscholarship.org/'),
  _SchoolScholarship(name: 'QuestBridge Match Scholarship', amount: 'Full Ride', details: 'High-achieving, low-income first-gen students. Top 5-10% of class. Household income under USD 65,000. Open to undocumented/DACA. Deadline: Sept. 26.', url: 'https://www.questbridge.org'),
  _SchoolScholarship(name: 'CFNC.org Scholarship Search', amount: 'Varies', details: 'Search hundreds of NC scholarships matched to Cumberland County students. Free to use.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
];

// ── EAST SURRY HIGH SCHOOL SCHOLARSHIPS ────────────────────────
const List<_SchoolScholarship> _eastSurryScholarships = [
  _SchoolScholarship(name: 'Gage Edwards Memorial Scholarship', amount: 'USD 2,700', details: 'Deadline: Apr 23, 2025. *Varsity Athlete *3.0 Weighted GPA *Nominated by coach or self-nomination by Athlete        **Passion for sport        **Commitment to team, team player        **Strong work ethic *Minimum of one letter of recommendat...', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'Jacob Pettitt Memorial Scholarship', amount: 'USD 2,600', details: 'Deadline: Apr 23, 2025. *Minimum cumulative 3.8 weighted GPA *Pursue a career in the health and or science field *Completed student activity resume *2 Teacher recommendations *Completed student application *High School Transcript *ESHS Stude...', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'Eldora Ruritan Club', amount: 'USD 1,000', details: 'Deadline: April 23rd. Must live in the 27007 zip code, financial need.  Please contact your counselor with questions.', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'Ezra Goldbach Foundation Scholarship Award', amount: 'To be determined', details: 'Deadline: May 01, 2025. Must be on Golf Team, must be going to a 2 or 4 year college/university, GPA considered but the highest GPA may not be reason for the award, submit or provide an essay with their application, list of honors, awards, o...', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'National Assoc. of Univ. Women, Mt Airy Surry County Branch', amount: 'USD 500', details: 'Deadline: Apr 01, 2025. *Currently enrolled students who will complete high school in the 2024-2025 academic school year *Resides in Surry County and attends Surry County, Mt. Airy City, or Elkin City Schools *Student has been accepted to an...', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'Whitaker Chapel/Ted and Mabel Shelton Scholarship', amount: 'USD 1,000', details: 'Deadline: Apr 23, 2025. *Financial Need, Academic Achievement, Integrity and work habits *Payable to college of choice.  USD 500.00 first semester and USD 500.00 second semester provided the student returns to school and maintains a 2.0 GPA.', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'Sheppard Scholarship/Surry Chemical', amount: 'SCC tuition and fees, renewable to 1 year', details: 'Deadline: April 23rd. *East Surry High School Senior planning to enroll at Surry Community College during the next school year.', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'PM Ruritan Club', amount: 'USD 1,000', details: 'Deadline: April 23rd. Must live in ESHS district; Surry Community  preferred. College students', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'PM Civic Club', amount: 'USD 2400 over 2 yr', details: 'Deadline: April 23rd. *East Surry High School student that plans to enroll at SCC during the next school year. *The scholarship is for two years. *Required to attend a civic club meeeting each year **To keep scholarship you must maintain a...', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'PM Masonic Lodge', amount: 'USD 500', details: 'Deadline: April 23rd. *Available to an ESHS student that plans to enroll at SCC during the next school year. The scholarship is for two years.', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'NCRSP Retired Personnel', amount: 'USD 1,200', details: 'Deadline: March 31st. *Planning to attend SCC *Character *Academic promise *Financial Need *Career Potential *Recommendations *Scholarship', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'Delta Kappa Gamma Society-Alpha Theta Chapter Grant', amount: 'USD 1,000', details: 'Deadline: Apr 30, 2025. *Qualifications *Need *Demonstrated academic aptitude *Stated goal of a career in education *Attested leadership qualities in school, church, and community *Acceptance toa 4-year institution of higher education.  More...', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'Marine Corps Scholarship Foundation', amount: '', details: 'Deadline: Febraury 29. www.mcsf.org/eligibility.', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'Hugh Chatham Memorial Scholarship', amount: 'Amount Dependent on School.  See applicaiton for details.', details: 'Deadline: Feb 28, 2025. Individual must be entering or continuing an accredited college or university with the intentions of majoring in a medical field, (including, but not limited to nursing, physical therapy, administraton, radiology, etc.)', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'Ryan Davis Scholarship', amount: 'USD 300', details: 'Deadline: April 25th. *GPA 3.0 or higher *Not receiving another major scholarship *Perfect attendance (or not missed more than 4 school days this year) Flexible *Leadership, initiative, strong work ethic', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'Sammy Long Scholarship', amount: 'Minimum USD 500.00', details: 'Deadline: April 25th. *Strong candidate considered if pursuing business *Leadership skills, self confidence, outstanding character', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'Golden Leaf Scholarship', amount: 'Up to USD 14,000 USD 3,500/year', details: 'Deadline: Mar 01, 2025. *Must be a North Carolina Resident and graduating high school senior. *Must have a minimum cumulative GPA of 2.5. *Applicant must have completed the FAFSA and must express intent to return to a rural NC community upon...', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'Frontier Gas', amount: 'USD 500', details: 'Deadline: May 01, 2024. *Be a US Citizen *Applicant can not have a family member who is employed by Frontier Natural Gas Company *Reside in either Watauga, Ashe, Wilkes, Surry, Yadkin or Warren County *Graduate from high school in 2025 *Majo...', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'Surry Arts Council', amount: 'Amount Varies', details: 'Deadline: May 09, 2025. *Surry County Resident', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'NC Society of Accountants Scholarship Foundation', amount: 'USD 1,000', details: 'Deadline: May 01, 2025. *NC Resident *Enrolled in an accredited school of higher education in NC *Must enroll in an accounting degree program with six or more credit hours per semester. *Must show a firm intention to continue in the field of...', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'Robin Hardy Hodgin Scholarship, Northern Hospital', amount: 'USD 5,000', details: 'Deadline: Mar 28, 2025. *Resident of Surry, Carroll, or Patrick County *Full-time student at their college of choice *Complete application by the noted deadline *More details listed on the application **RETURN THE APPLICATION TO NORTHERN REG...', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'Criminal Justice Fellows Program', amount: '100% Forgiveable Loan', details: 'Deadline: Apr 30, 2023. Please see more detail at https://ncdoj.gov/law-enforcement-training/criminal-justice-fellows-program/', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'Bob R. McGuire Memorial Scholarship NC Child Support Council Scholarship', amount: 'USD 2,500', details: 'Deadline: Apr 18, 2025. *Resident of NC *Completed Application *Accepted into a NC school of higher learning *Maintained a C average or above during high school *MORE details on application', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'Whitlow-Osborne Scholarship, EMS', amount: '2 year USD 2000.00', details: 'Deadline: March 31st. Please see qualifications on application forms.', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'Shoals Ruritan Club', amount: 'USD 750.00 with potential for a renewal for one additional year.', details: 'Deadline: Apr 23, 2024. *Must live in the 27043 area *Highest GPA of senior in the Shoals district who is NOT receiving any other major scholarships', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'The Don Riddle Memorial Scholarship', amount: 'USD 500', details: 'Deadline: Apr 18, 2025. *Student must have maintained a 2.0 GPA or higher *Applicant must be a Senior in high school *Must be a member in an Emergency Services Organization or have a parent that is a member in an Emergency Services Organizat...', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'Surry County Farm Bureau Scholarship', amount: 'USD 1000 per year, see details', details: 'Deadline: Mar 31, 2025. *Intention to pursue a career in agriculture or in an agriculture-related field or a field that will help our community. *Must demonstrate financial need. *Leadership potential *An evident understanding of the agricul...', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'South Westfield Ruritan Club', amount: 'SCC Tuition for 2 years', details: 'Deadline: Apr 23, 2025. *Additional APPLICATION to be submitted with local application.  Click HERE for Application. *Must be from South Westfield Area (Cook School Rd, Old Westfield Rd, Jessup Grove Church Rd., Simmons Grove Church Rd., Mat...', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'Silver Penn Scholarship', amount: 'Up to USD 2,500', details: 'Deadline: Feb 16, 2025. *Applicants must be current high school seniors & attend a school within a 25 mile radius of the community. *Write a 1000 word essay on the assigned topic. Please see application for the asisgned topic. *For more info...', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'NC Society Daughters of the American Revolution Endowment Fund Gift Scholarships', amount: 'Varies', details: 'Deadline: Jan 31, 2025. See website for the different scholarship details and amounts.', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'State EmployeesCredit Union People Helping People Scholarship', amount: 'USD 10,000', details: 'Deadline: March 14 This deadline has been extended from original deadline.. *Current senior at a NC public HS *SECU member or eligile for membership through a parent/guardian *NC resident and eligible for in-state tuition *Accepted to attend one of the 16 UNC system universities as a full-tim...', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'The Aubrey Lee Brooks Foundation', amount: 'Up to USD 12,000', details: 'Deadline: Mar 01, 2025. Aubrey Lee Brooks Flyer *NC Resident *Graduating high school senior', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'Horatio Alger Association', amount: 'Many Awards', details: 'Deadline: Mar 01, 2025. *High School Senior *Critical financial need (USD 55,000 or less adjusted gross income per family is required) *Integrity and perseverance in overcoming adversity *United States citizenship *For more specific eligibil...', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'North Carolina Extension & Community Association, Inc.', amount: 'USD 300/USD 800', details: 'Deadline: Feb 14, 2025. *Senior in High School *Priority given to Family and Consumer Sciences', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'North Carolina Association of School Resource Officers', amount: 'USD 500', details: 'Deadline: Mar 31, 2024. *High School Senior on track to graduate *Resident of North Carolina *Minimum Un-Weighted GPA of 2.5', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'Clingman Medical Center Scholarship', amount: 'USD 5,000', details: 'Deadline: Mar 15, 2023. Applicants must be entering or continuing an accredited college or university with the intentions of majoring in a medical field, (including, but not limited to nursing, physical therapy, administration, radiology, etc.)', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'Alliance Insurance Services Scholarship', amount: 'Up to USD 3,500.00', details: 'Deadline: Mar 31, 2025. Open to any student planning to enroll in a community college or university this fall This requires a video submission as the application', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'Herter-ONeal Scholarship', amount: 'USD 750', details: 'Deadline: Mar 19, 2025. *Current and enrolling college students pursuing an Associate or Bachelors degree in business or a business related field. *Applicants must be a legal resident of North Carolina. *See application for complete details.', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'Surry County Master Gardener Volunteers Program Scholarship', amount: 'USD 1,500', details: 'Deadline: May 01, 2025. *Surry County graduate *Horticulture or a related agricultural field of study *Submit forms to the EMGV Program Scholarship Committee by April 1', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'Anne Gore Memorial Culinary Arts Scholarship', amount: 'USD 1,200', details: 'Deadline: Apr 21, 2023. *Complete Application *Must be pursueing a culinary profession', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'Pilot Mountain Garden Club', amount: 'USD 1,000', details: 'Deadline: Apr 23, 2025. Horticulture/Farming Interest/Environmental', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'Martha Joyce Scholarship Foundation', amount: 'Potential for USD 500 Possibly more.', details: 'Deadline: May 15, 2025. *African-American high school student *Resides in Surry County *16-18 years old', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'Foundation of Rural Service Scholarship Program', amount: 'Varies', details: 'Deadline: Feb 14, 2026. Visit frs.org/programs/youth-programs/scholarships to find a link to the scholarship platform, Kaleidoscope.  You must access the application via the Kaleidoscope link.', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'Wemco Contracting Inc. Scholarship', amount: 'USD 2,500 per year', details: 'Deadline: Apr 01, 2025. *Flyer with additional details *High School Senior *Planning to attend Surry Community College *Exhibits passion about the construction field and leadership in their schools and communities', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'Armfield Scholarship', amount: 'Varies', details: 'Deadline: Feb 28, 2025. https://armfieldscholars.communityforce.com/Funds/Search.aspx#4371597136646D517975544F5976596D4E73384E69673D3D', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'VFW Auxiliary Scholarship', amount: 'Funds are for tuition and books.  Unsure of exact amount.', details: 'Deadline: Oct 31, 2025. All can apply, but failure to send any of the requested materials will result in automatic disqualification.', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'Workforce Development Regional Scholarship', amount: 'USD 1,000', details: 'Deadline: Apr 30, 2024. *Scholarships will be awarded to students who are entering a program considered to be a skilled trade in the residential construction industry (i.e., carpentry, welding, plumbing, electrical, masonry, etc.). *They do ...', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'NC Alpha Delta Kappa Student Achievment Scholarhsips', amount: 'USD 2,000', details: 'Deadline: Mar 03, 2025. ', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'Farm Kids for College Scholarship', amount: 'USD 1,000', details: 'Deadline: Feb 18, 2025. Open to students pursuring an agricultural-related degree at a college or university', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'Hinton James Masonic Scholarship', amount: 'USD 1,000', details: 'Deadline: Apr 15, 2024. High school seniors with records of academic achievement and community service and who have been accepted at UNC-Chapel Hill are encouraged to apply.', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'NC Home Builders Educational & Charitable Foundation, Inc.', amount: 'Up to USD 1,000', details: 'Deadline: Apr 30, 2024. *Students entering Community Colleges or Technical Schools.', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'NEXT NC Scholarship', amount: 'USD 3,000 to USD 5,000', details: 'Deadline: Jun 01, 2024. See qualifications under application link.', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'Farm to Table Scholarship', amount: 'USD 2,000 with potential for an additional USD 5,000', details: 'Deadline: May 31, 2025. Be nominated by an educator or school representative Maintain a B average or better Be an active participant in agriculture or culinary programs Exhibit community leadership', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'American Legion Scholarship', amount: 'Full tuition to SCC', details: 'Deadline: Apr 23, 2025. *ESHS student planning to attend SCC full time.', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'NC Community Foundation', amount: 'Varies', details: 'Deadline: Most are due on March 3. *Students planning to attend all types of institutions, including community colleges *Non-Traditional students', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'Skills USA Scholarships', amount: 'Varies', details: 'Deadline: Varies. *Must be a registered SkillsUSA member More qualiftications on website.', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'R. Flake Shaw Scholarship Program NC Farm Bureau Community College Scholarship', amount: 'USD 1,000 per year', details: 'Deadline: March 3rd. See details on application.', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'R. Flake Shaw Scholarship Program NC Farm Bureau University Scholarship', amount: 'USD 5,000 per year', details: 'Deadline: March 3rd. See details on application.', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'Angela H. Llewellyn Foundation', amount: 'USD 3,000', details: 'Deadline: Mar 21, 2025. A graduating senior this academic year. The student must be pursuing a degree in the performing arts, music, dance, visual arts, design, writing, or library sciences to qualify for the scholarship. *Return application...', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'Hagan Scholarship', amount: 'Up to USD 7,500', details: 'Deadline: Mar 15, 2025. Qualification Flyer', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'Rotary Club of Mount Airy', amount: 'USD 1,000', details: 'Deadline: Apr 30, 2025. *That student must be currently enrolling – for the first time – in an institution of higher education *Live in Surry County *Be an Interact Member', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'J. Howard Coble Scholarship', amount: 'USD 2,500', details: 'Deadline: Mar 27, 2025. *Reside in Surry County *High moral character *Good citizenship', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'WSSU National Alumni Association', amount: '', details: 'Deadline: Apr 11, 2025. Requirements Letter', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'Barry Gates Memorial Scholarship', amount: 'USD 1,000', details: 'Deadline: Apr 14, 2025. Please see details of scholarship for eligibility attached to the application.', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'SkillsUSA Scholarships', amount: 'USD 1,000+', details: 'Deadline: Apr 15, 2025. Please click on application which will take you to the website where you will find several different scholarships.', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'Kyle Byrd Memorial Scholarship', amount: 'USD 500.00 with potential for USD 1,000', details: 'Deadline: Jan 09, 2026. See important information HERE pertaining to this scholarship.', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'NC Home Builders Educational & Charitable Foundation, Inc.', amount: 'Up to USD 1,000', details: 'Deadline: Accepting Applications between Jan. - April. *Students entering Community Colleges or Technical Schools.', url: 'https://www.surry.k12.nc.us/o/esh'),
  _SchoolScholarship(name: 'Marine Corps Scholarship Foundation', amount: '', details: 'Deadline: Mar 01, 2026. www.mcsf.org/eligibility.', url: 'https://www.surry.k12.nc.us/o/esh'),
];

// ── EASTERN GUILFORD HIGH SCHOOL (GUILFORD COUNTY) ──────────────
const List<_SchoolScholarship> _easternGuilfordScholarships = [
  _SchoolScholarship(name: 'shift_ed Scholarship', amount: 'Last-dollar tuition', details: 'For Guilford County Schools seniors. Covers remaining tuition at NC public colleges and partnered private NC institutions. Apply through GCS scholarship portal.', url: 'https://shift-ed.org/'),
  _SchoolScholarship(name: 'Access Amazing Scholarship (GTCC)', amount: 'Full tuition and fees', details: 'Last-dollar scholarship for Guilford County HS graduates attending GTCC. Submit FAFSA. Apply early.', url: 'https://www.gtcc.edu/admissions-and-aid/how-to-pay-for-college/financial-aid/access-amazing-scholarship'),
  _SchoolScholarship(name: 'Kay Hagan Memorial Scholarship', amount: 'USD 1,000/yr (renewable)', details: 'Female senior with passion for community and civic leadership. Renewable 4 years with 3.0 GPA. Apply through CFGG portal. Deadline: Feb. 15.', url: 'https://cfgg.org/students/'),
  _SchoolScholarship(name: 'John R. Kernodle Jr. Memorial Scholarship', amount: 'USD 10,000 (renewable)', details: 'Guilford County seniors committing to teach in NC public schools 3+ years. Preference for NC colleges and Guilford County teachers. Deadline: Feb. 1.', url: 'https://cfgg.org/students/'),
  _SchoolScholarship(name: 'Herman and Earline Herbin Scholarship', amount: 'USD 1,750 (renewable)', details: 'Two awards for Guilford County seniors. Primarily need-based. Renewable 4 years. Apply through CFGG portal. Deadline: Mar. 2.', url: 'https://cfgg.org/students/'),
  _SchoolScholarship(name: 'Jason Christopher James Memorial Scholarship', amount: 'USD 7,500', details: 'Guilford County senior interested in foreign affairs or international relations. Apply through CFGG portal.', url: 'https://cfgg.org/students/'),
  _SchoolScholarship(name: 'Tannenbaum-Sternberger Foundation', amount: 'Varies', details: 'Guilford County residents attending partner NC colleges. Apply at tsfoundation.com.', url: 'https://www.tsfoundation.com/scholarships'),
  _SchoolScholarship(name: 'Eberhart Scholarship Enrichment Fund', amount: 'Varies', details: 'Guilford County senior. Two recs required. Mail to PO Box 10208, Greensboro NC 27404. Deadline: Apr. 15.', url: 'https://cfgg.org/students/'),
  _SchoolScholarship(name: 'Greensboro Mens Club Foundation', amount: 'USD 2,500 (5 awards)', details: 'Male Guilford County senior. Transcript, 2 recs, FAFSA SAR required. Deadline: Apr. 30.', url: 'https://www.greensboromensclub.org/scholars-program'),
  _SchoolScholarship(name: 'SECU People Helping People Scholarship', amount: 'USD 10,000', details: 'NC public school senior. Must be SECU member. UNC system university. Min 2.5 GPA. Deadline: Mar. 20.', url: 'https://www.ncsecu.org/resources/scholarships.html'),
  _SchoolScholarship(name: 'Community Foundation of Greater Greensboro', amount: 'Multiple awards', details: 'Search all CFGG scholarships for Guilford County seniors in one portal.', url: 'https://cfgg.org/students/'),
  _SchoolScholarship(name: 'NC Need-Based Grant', amount: 'Up to USD 9,300/yr', details: 'NC residents with financial need attending NC colleges. Apply via FAFSA.', url: 'https://www.cfnc.org/pay-for-college/financial-aid/nc-need-based-grant/'),
  _SchoolScholarship(name: 'CFNC.org Scholarship Search', amount: 'Varies', details: 'Search hundreds of NC scholarships matched to Guilford County students.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
];

// ── EASTERN RANDOLPH HIGH SCHOOL (RANDOLPH COUNTY) ──────────────
const List<_SchoolScholarship> _easternRandolphScholarships = [
  _SchoolScholarship(name: 'ERHS Student Services Scholarship Page', amount: 'Varies', details: 'Check the ERHS Student Services page for current local scholarships. Contact counselors Lisa Miller (A-K) or Ryan Brown (L-Z) at 336-824-2351.', url: 'https://sites.google.com/randolph.k12.nc.us/erhs-student-services'),
  _SchoolScholarship(name: 'Randolph County Local Scholarships', amount: 'Varies', details: 'Multiple scholarships for Randolph County seniors including Davidson Water, NC Farm Bureau, and others. See counselor Mrs. White or check the Randolph County counseling page.', url: 'https://sites.google.com/randolph.k12.nc.us/thscounseling/local-scholarships'),
  _SchoolScholarship(name: 'Ferree Foundation', amount: 'Varies', details: 'Low interest loans and limited scholarships for Randolph County students pursuing higher education. Apply at ferreefoundation.org.', url: 'https://ferreefoundation.org/'),
  _SchoolScholarship(name: 'Davidson Water Scholarship', amount: 'USD 1,500 (2 awards)', details: 'Parent or guardian must be a member of Davidson Water, Inc. Financial need, scholastic achievement, extracurriculars. Accredited 4-year college. Deadline: Mar. 25.', url: 'https://sites.google.com/randolph.k12.nc.us/thscounseling/local-scholarships'),
  _SchoolScholarship(name: 'Randolph Communications Scholarship', amount: 'USD 1,000 (7 awards)', details: 'Must be a customer or parent is a customer of Randolph Communications. Must enroll in accredited NC school of higher education. Apply through school counselor.', url: 'https://rtmc.net/scholarships/'),
  _SchoolScholarship(name: 'NC Farm Bureau R. Flake Shaw Scholarship', amount: 'Varies', details: 'Related to a current Randolph County Farm Bureau Member. Pursuing agriculture degree. Deadline: Apr. 1. See counselor for application.', url: 'https://www.ncfb.org/about-us/scholarships/'),
  _SchoolScholarship(name: 'Randolph Community College Foundation', amount: 'Varies', details: 'For students attending RCC. Multiple scholarships available. Apply through RCC financial aid office.', url: 'https://www.randolph.edu/financial-assistance/types-of-financial-assistance/scholarships.aspx'),
  _SchoolScholarship(name: 'NC Need-Based Grant', amount: 'Up to USD 9,300/yr', details: 'NC residents with financial need attending NC colleges. Apply via FAFSA.', url: 'https://www.cfnc.org/pay-for-college/financial-aid/nc-need-based-grant/'),
  _SchoolScholarship(name: 'Golden LEAF Scholarship', amount: 'USD 12,000', details: 'NC students from rural and economically distressed communities. FAFSA required. Apply at CFNC by March 1.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
  _SchoolScholarship(name: 'CFNC.org Scholarship Search', amount: 'Varies', details: 'Search hundreds of NC scholarships matched to Randolph County students.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
];

// ── ELKIN HIGH SCHOOL (ELKIN CITY / SURRY COUNTY) ───────────────
const List<_SchoolScholarship> _elkinScholarships = [
  _SchoolScholarship(name: 'EEF Blue and Gold Scholarship', amount: 'Up to USD 2,000 (USD 500/semester)', details: 'Elkin High School students and alumni (within 5 years of graduation). Need-based. Vocational-technical fields. Min 2.0 GPA. Applications accepted Mar. 1 - Apr. 1. See Kerri Mullis, Guidance Counselor, or download at elksfoundation.com.', url: 'https://elksfoundation.com/scholarship/'),
  _SchoolScholarship(name: 'Elkin Educational Foundation Grants', amount: 'Varies', details: 'Supports Elkin City Schools students and alumni pursuing vocational-technical degrees. Also provides internships and mentoring. Apply at elksfoundation.com.', url: 'https://elkinacademics.org/'),
  _SchoolScholarship(name: 'Edward M. Armfield Sr. Foundation Scholarship', amount: 'USD 3,600-USD 12,500/yr (renewable)', details: 'For Surry County high school graduates including Elkin. Covers 4-year and community college students. Renewable. Apply through Surry Community College.', url: 'https://surry.edu/scholarships'),
  _SchoolScholarship(name: 'Donna Easter Student Ethics Award', amount: 'USD 2,500', details: 'Open to Surry County seniors. Leadership, ethics, community service, and academic history. Essay required. Sponsored by BBB Education Foundation of Central and Northwest NC.', url: 'https://www.bbb.org/all-events/scholarships'),
  _SchoolScholarship(name: 'NC Community Foundation Surry County Scholarships', amount: 'USD 1,000+', details: 'Multiple scholarships for Surry County students. Apply using NCCF Universal Application. Opens Dec. 16, closes March 3.', url: 'https://www.nccommunityfoundation.org/scholarships'),
  _SchoolScholarship(name: 'Surry Community College Foundation', amount: 'Varies', details: 'For students attending SCC. Multiple merit and need-based scholarships. Apply through SCC financial aid office.', url: 'https://surry.edu/paying-for-college/scholarships'),
  _SchoolScholarship(name: 'NC Need-Based Grant', amount: 'Up to USD 9,300/yr', details: 'NC residents with financial need attending NC colleges. Apply via FAFSA.', url: 'https://www.cfnc.org/pay-for-college/financial-aid/nc-need-based-grant/'),
  _SchoolScholarship(name: 'CFNC.org Scholarship Search', amount: 'Varies', details: 'Search hundreds of NC scholarships matched to Surry County students.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
];

// ── FAIRMONT HIGH SCHOOL (ROBESON COUNTY) ───────────────────────
const List<_SchoolScholarship> _fairmontScholarships = [
  _SchoolScholarship(name: 'NTHS/Jon H. Poteat Scholarship', amount: 'USD 225,000 total pool', details: 'For active NTHS members. Must log in to apply at nths.org. Advisor approval required. Demonstrates skill, honesty, service, responsibility, scholarship, citizenship, and leadership.', url: 'https://www.nths.org'),
  _SchoolScholarship(name: 'NTHS/HOSA Scholarship', amount: 'USD 2,000', details: 'For active HOSA members who are also current NTHS members in good standing. Apply at hosa.org.', url: 'https://www.hosa.org'),
  _SchoolScholarship(name: 'NTHS/SkillsUSA Scholarship', amount: 'USD 1,000 (2 awards)', details: 'For SkillsUSA members who are also NTHS members. Awarded at SkillsUSA National Leadership Conference. Apply at skillsusa.org.', url: 'https://www.skillsusa.org'),
  _SchoolScholarship(name: 'NTHS/DECA Scholarship', amount: 'USD 1,000 (2 awards)', details: 'For DECA and NTHS members. Apply at deca.org.', url: 'https://www.deca.org'),
  _SchoolScholarship(name: 'NTHS/FCCLA Scholarship', amount: 'Varies', details: 'For FCCLA and NTHS members. Apply at fccla.com.', url: 'https://www.fccla.com'),
  _SchoolScholarship(name: 'NTHS/FBLA-PBL Scholarship', amount: 'Varies', details: 'For FBLA-PBL and NTHS members. Check fbla-pbl.org for current award details.', url: 'https://www.fbla-pbl.org'),
  _SchoolScholarship(name: 'NTHS/BPA Scholarship', amount: 'USD 1,000 (2 awards)', details: 'For BPA and NTHS members. One high school, one college award. Apply at bpanet.org.', url: 'https://www.bpa.org'),
  _SchoolScholarship(name: 'Robeson County Public Schools Scholarships', amount: 'Varies', details: 'Check the district scholarship page for all current opportunities for Robeson County seniors.', url: 'https://www.robeson.k12.nc.us/page/scholarships'),
  _SchoolScholarship(name: 'Lumbee Tribe Education Scholarships', amount: 'Varies', details: 'For enrolled members of the Lumbee Tribe. Apply through the Lumbee Tribe education office.', url: 'https://www.lumbeetribe.com/education'),
  _SchoolScholarship(name: 'Golden LEAF Scholarship', amount: 'USD 12,000', details: 'NC students from rural and economically distressed communities. Robeson County students are strong candidates. FAFSA required. Deadline: March 1.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
  _SchoolScholarship(name: 'NC Need-Based Grant', amount: 'Up to USD 9,300/yr', details: 'NC residents with financial need attending NC colleges. Apply via FAFSA.', url: 'https://www.cfnc.org/pay-for-college/financial-aid/nc-need-based-grant/'),
  _SchoolScholarship(name: 'CFNC.org Scholarship Search', amount: 'Varies', details: 'Search hundreds of NC scholarships matched to Robeson County students.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
];

// ── FARMVILLE CENTRAL HIGH SCHOOL (PITT COUNTY) ─────────────────
const List<_SchoolScholarship> _farmvilleCentralScholarships = [
  _SchoolScholarship(name: 'Almire Major Smith Scholarship', amount: 'Varies', details: 'PCS graduating senior attending a community college or NC college/university. Must show community service and educational achievement. ROTC membership preferred. Apply through Pitt County Educational Foundation.', url: 'https://www.pittcountyeducationalfoundation.com/student-scholarships.html'),
  _SchoolScholarship(name: 'Bill Grimm Scholarship', amount: 'Varies', details: 'PCS senior planning a career in sports medicine. Apply through Pitt County Educational Foundation.', url: 'https://www.pittcountyeducationalfoundation.com/student-scholarships.html'),
  _SchoolScholarship(name: 'James J. and Mamie R. Perkins Health Professions Scholarship', amount: '4-year scholarship (ECU) and 2-year (PCC)', details: 'Two PCS seniors awarded annually. Must pledge to remain employed in ECU Health or Pitt County healthcare for the number of scholarship years. Apply through Pitt County Educational Foundation.', url: 'https://www.pittcountyeducationalfoundation.com/student-scholarships.html'),
  _SchoolScholarship(name: 'Michael Bonner Scholarship', amount: 'USD 1,000', details: 'Attending South Greenville Elementary during primary years required. Community college or university. Paid directly to institution. Apply through Pitt County Educational Foundation.', url: 'https://www.pittcountyeducationalfoundation.com/student-scholarships.html'),
  _SchoolScholarship(name: 'Nancy B. Wynne Scholarship', amount: 'Varies', details: 'PCS graduating senior planning a career in a science field. Apply through Pitt County Educational Foundation.', url: 'https://www.pittcountyeducationalfoundation.com/student-scholarships.html'),
  _SchoolScholarship(name: 'Parker-Jernigan Scholarship', amount: 'USD 30,000 (USD 7,500/yr for 4 years)', details: 'Highly motivated PCS student. Academics, employment, extracurriculars, community involvement. Health Science or Business career path. Apply through Pitt County Educational Foundation.', url: 'https://www.pittcountyeducationalfoundation.com/student-scholarships.html'),
  _SchoolScholarship(name: 'PCS Educator Fellow Scholarship', amount: 'Up to USD 20,000 (USD 5,000/yr)', details: 'For PCS students becoming a teacher. Must commit to 4 years as a PCS classroom teacher after graduation. Apply through Pitt County Educational Foundation.', url: 'https://www.pittcountyeducationalfoundation.com/student-scholarships.html'),
  _SchoolScholarship(name: 'Pitt County Educational Foundation Scholarships', amount: 'Multiple awards', details: 'Multiple scholarships for all Pitt County Schools graduating seniors. Apply at pittcountyeducationalfoundation.com for full list and deadlines.', url: 'https://www.pittcountyeducationalfoundation.com/student-scholarships.html'),
  _SchoolScholarship(name: 'Pitt Community College Foundation', amount: 'Varies', details: 'For students attending PCC. Multiple merit and need-based awards. Apply through PCC financial aid office.', url: 'https://www.pittcc.edu/foundation/'),
  _SchoolScholarship(name: 'NC Need-Based Grant', amount: 'Up to USD 9,300/yr', details: 'NC residents with financial need attending NC colleges. Apply via FAFSA.', url: 'https://www.cfnc.org/pay-for-college/financial-aid/nc-need-based-grant/'),
  _SchoolScholarship(name: 'Golden LEAF Scholarship', amount: 'USD 12,000', details: 'NC students from rural and economically distressed communities. FAFSA required. Apply at CFNC by March 1.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
  _SchoolScholarship(name: 'CFNC.org Scholarship Search', amount: 'Varies', details: 'Search hundreds of NC scholarships matched to Pitt County students.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
];

// ── FIKE HIGH SCHOOL (WILSON COUNTY) ────────────────────────────
const List<_SchoolScholarship> _fikeScholarships = [
  _SchoolScholarship(name: 'Bridging the Dream Scholarship for High School Seniors', amount: 'Up to USD 10,000', details: 'NC public school senior. Financial need, academic achievement, extracurricular involvement. 40 students awarded. Deadline: Apr. 25. Apply at salliemae.com/landing/bridging-the-dream/.', url: 'https://www.salliemae.com/landing/bridging-the-dream/'),
  _SchoolScholarship(name: 'Wilson County Schools Scholarship Information', amount: 'Varies', details: 'Check the Wilson County Schools scholarship page for district-wide and local opportunities for Fike seniors.', url: 'https://www.wilsonschoolsnc.net/families/scholarship-information'),
  _SchoolScholarship(name: 'Wilson Education Partnership Scholarships', amount: 'Varies', details: 'Community business partners award scholarships to Wilson County students excelling in academics, leadership, arts, and athletics. Check with Fike counselor for current awards.', url: 'https://www.wilsonschoolsnc.net/community/community-partners'),
  _SchoolScholarship(name: 'Barton College Scholarships', amount: 'Varies', details: 'Fike graduates attending Barton College may qualify for institutional scholarships. Check barton.edu/admissions/scholarships.', url: 'https://www.barton.edu/admissions/scholarships/'),
  _SchoolScholarship(name: 'NC Need-Based Grant', amount: 'Up to USD 9,300/yr', details: 'NC residents with financial need attending NC colleges. Apply via FAFSA.', url: 'https://www.cfnc.org/pay-for-college/financial-aid/nc-need-based-grant/'),
  _SchoolScholarship(name: 'NextNC Scholarship', amount: 'USD 3,000-USD 5,000/yr', details: 'NC public high school senior. Family income under USD 80,000. Submit FAFSA by June 1.', url: 'https://nextncscholarship.org/'),
  _SchoolScholarship(name: 'QuestBridge Match Scholarship', amount: 'Full Ride', details: 'High-achieving, low-income first-gen students. Top 5-10% of class. Open to undocumented/DACA. Deadline: Sept. 26.', url: 'https://www.questbridge.org'),
  _SchoolScholarship(name: 'CFNC.org Scholarship Search', amount: 'Varies', details: 'Search hundreds of NC scholarships matched to Wilson County students.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
];

// ── FIRST FLIGHT HIGH SCHOOL (DARE COUNTY) ──────────────────────
const List<_SchoolScholarship> _firstFlightScholarships = [
  _SchoolScholarship(name: 'Outer Banks Community Foundation Scholarships', amount: 'USD 250,000+ total', details: 'Primary scholarship source for all Dare County seniors. Apply through OBCF portal. 60+ scholarships available. Apply each spring.', url: 'https://obcf.org/scholarships/'),
  _SchoolScholarship(name: 'Courtney M. Burgess Scholarship', amount: 'Varies (renewable)', details: 'For MHS and FFHS graduates only. Merit-based. Apply through OBCF portal.', url: 'https://obcf.org/scholarships/'),
  _SchoolScholarship(name: 'Jerry and Arlene Davis Scholarship', amount: 'Varies (renewable)', details: 'For MHS or FFHS graduates only. Needs-based. Must interview. Apply through OBCF portal.', url: 'https://obcf.org/scholarships/'),
  _SchoolScholarship(name: 'Rex Sample Scholarship for Courage and Determination', amount: 'Varies', details: 'FFHS graduates only. Athletics participation. Must show courage and determination. Apply through OBCF portal.', url: 'https://obcf.org/scholarships/'),
  _SchoolScholarship(name: 'Robert E. Rollason Jr. Scholarship', amount: 'Varies', details: 'FFHS graduates only. Merit-based. Must attend NC colleges or universities. Apply through OBCF portal.', url: 'https://obcf.org/scholarships/'),
  _SchoolScholarship(name: 'Osborne Scholarship', amount: 'Varies', details: 'For FHS, MHS, or CHSS graduates only. NC colleges and universities only. Needs-based preference. Invited to compete. Apply through OBCF portal.', url: 'https://obcf.org/scholarships/'),
  _SchoolScholarship(name: 'Outer Banks Association of Realtors Scholarship', amount: 'USD 1,500 (8 awards)', details: 'For graduating seniors from Dare County. Merit and needs-based. Students interview with OBAR. Apply through OBCF portal.', url: 'https://obcf.org/scholarships/'),
  _SchoolScholarship(name: 'Milton A. Jewell Academic Scholarship', amount: 'Varies (renewable)', details: 'Merit-based. Two essay requirements. Must interview. For all Dare County seniors. Apply through OBCF portal.', url: 'https://obcf.org/scholarships/'),
  _SchoolScholarship(name: 'Bill Jones Memorial Scholarship', amount: 'Varies (renewable)', details: 'Required NC State University attendance. For all Dare County seniors. Apply through OBCF portal.', url: 'https://obcf.org/scholarships/'),
  _SchoolScholarship(name: 'First Flight Rotary Scholarship', amount: 'Varies (renewable)', details: 'Dare County graduates. Needs-based. For those pursuing a bachelor degree with service club experience. Apply through OBCF portal.', url: 'https://obcf.org/scholarships/'),
  _SchoolScholarship(name: 'Ben Birindelli Memorial Scholarship', amount: 'Varies (renewable)', details: 'Dare County seniors in National Honor Society. History or Literature major preferred. Apply through OBCF portal.', url: 'https://obcf.org/scholarships/'),
  _SchoolScholarship(name: 'OBX Scholars', amount: 'Varies (renewable)', details: 'Most diverse OBCF scholarship. Needs-based preference. For all Dare County seniors. Apply through OBCF portal.', url: 'https://obcf.org/scholarships/'),
  _SchoolScholarship(name: 'NC Need-Based Grant', amount: 'Up to USD 9,300/yr', details: 'NC residents with financial need attending NC colleges. Apply via FAFSA.', url: 'https://www.cfnc.org/pay-for-college/financial-aid/nc-need-based-grant/'),
  _SchoolScholarship(name: 'CFNC.org Scholarship Search', amount: 'Varies', details: 'Search hundreds of NC scholarships matched to Dare County students.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
];

// ── GARINGER HIGH SCHOOL (MECKLENBURG COUNTY) ───────────────────
const List<_SchoolScholarship> _garingerScholarships = [
  _SchoolScholarship(name: 'Garinger Education Foundation Scholarships', amount: 'Varies (approaching USD 1 million total awarded)', details: 'Scholarships specifically for graduating Garinger High School students. Apply through the GHS Student Services scholarship portal. Check sites.google.com/cms.k12.nc.us/garingerstudentservices/scholarships.', url: 'https://sites.google.com/cms.k12.nc.us/garingerstudentservices/scholarships'),
  _SchoolScholarship(name: 'Brighthouse Scholar Connections', amount: 'Up to USD 10,000/yr (renewable)', details: 'For underrepresented students at Charlotte-area schools including Garinger. Up to USD 40,000 total. Need-based. Renewable with re-application.', url: 'https://www.scholarships.com/financial-aid/college-scholarships/scholarships-by-state/north-carolina-scholarships'),
  _SchoolScholarship(name: 'Sarah Scott Schofield Scholarship (Zetas of Charlotte)', amount: 'Varies', details: 'For outstanding Mecklenburg County high school students. Established 2003. Recognizes accomplishments and future potential. Apply through the Benevolent Foundation.', url: 'https://www.scholarships.com/financial-aid/college-scholarships/scholarships-by-state/north-carolina-scholarships'),
  _SchoolScholarship(name: 'Foundation for the Carolinas Scholarships', amount: 'Varies', details: 'Multiple scholarships for Charlotte and Mecklenburg County students. Includes Sam Mills Memorial, Charlotte Central Lions Club, and others. Apply at fftc.org.', url: 'https://fftcscholarships.communityforce.com'),
  _SchoolScholarship(name: 'PEARL Scholarships', amount: 'USD 1,500', details: 'Academic, character, and financial need-based scholarships for Mecklenburg County graduating high school seniors and college undergraduates. Apply through Smart Start of Mecklenburg County.', url: 'https://www.smartstartofmeck.org/scholarship-opps/'),
  _SchoolScholarship(name: 'CMS Senior Scholarship Portal', amount: 'Varies', details: 'Access the GCS Senior Scholarship Portal for all current CMS scholarship opportunities updated by the school counselor.', url: 'https://shift-ed.org/'),
  _SchoolScholarship(name: 'NC Need-Based Grant', amount: 'Up to USD 9,300/yr', details: 'NC residents with financial need attending NC colleges. Apply via FAFSA.', url: 'https://www.cfnc.org/pay-for-college/financial-aid/nc-need-based-grant/'),
  _SchoolScholarship(name: 'NextNC Scholarship', amount: 'USD 3,000-USD 5,000/yr', details: 'NC public high school senior. Family income under USD 80,000. Submit FAFSA by June 1.', url: 'https://nextncscholarship.org/'),
  _SchoolScholarship(name: 'QuestBridge Match Scholarship', amount: 'Full Ride', details: 'High-achieving, low-income first-gen students. Top 5-10% of class. Open to undocumented/DACA. Deadline: Sept. 26.', url: 'https://www.questbridge.org'),
  _SchoolScholarship(name: 'CFNC.org Scholarship Search', amount: 'Varies', details: 'Search hundreds of NC scholarships matched to Mecklenburg County students.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
];

// ── GATES COUNTY HIGH SCHOOL (GATES COUNTY) ─────────────────────
const List<_SchoolScholarship> _gatesCountyScholarships = [
  _SchoolScholarship(name: 'Parker-Jernigan Scholarship', amount: 'USD 30,000 (USD 7,500/yr for 4 years)', details: 'Given by children of Earl and Betty Parker of Gates County, NC. Highly motivated student. Academics, employment, extracurriculars, community involvement. Health Science or Business career path. Apply through Pitt County Educational Foundation.', url: 'https://www.pittcountyeducationalfoundation.com/student-scholarships.html'),
  _SchoolScholarship(name: 'Roanoke Electric Cooperative Scholarship', amount: 'Varies', details: 'For students whose parents are customers of Roanoke Electric Cooperative, which serves Gates County. Apply using the link on the cooperative website.', url: 'https://www.roanokecooperative.com'),
  _SchoolScholarship(name: 'NC Community Foundation Scholarships', amount: 'USD 1,000+', details: 'Multiple scholarships for Gates County students. Apply using NCCF Universal Application. Opens Dec. 16, closes March 3.', url: 'https://www.nccommunityfoundation.org/scholarships'),
  _SchoolScholarship(name: 'Aubrey Lee Brooks Scholarship', amount: 'USD 12,000', details: 'NC senior in Alamance, Bertie, Caswell, Durham, Forsyth, Granville, Guilford, Orange, Person, Rockingham, Stokes, Surry, Swain or Warren county. WAIT - Gates County students should confirm eligibility. Apply through CFNC. Deadline: March 1.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
  _SchoolScholarship(name: 'Golden LEAF Scholarship', amount: 'USD 12,000', details: 'NC students from rural and economically distressed communities. Gates County qualifies. FAFSA required. Apply at CFNC by March 1.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
  _SchoolScholarship(name: 'Self Help Credit Union Community Scholarship', amount: 'Varies', details: 'Available to Gates County students. See school counselor for application.', url: 'https://www.self-help.org'),
  _SchoolScholarship(name: 'NC Need-Based Grant', amount: 'Up to USD 9,300/yr', details: 'NC residents with financial need attending NC colleges. Apply via FAFSA.', url: 'https://www.cfnc.org/pay-for-college/financial-aid/nc-need-based-grant/'),
  _SchoolScholarship(name: 'NextNC Scholarship', amount: 'USD 3,000-USD 5,000/yr', details: 'NC public high school senior. Family income under USD 80,000. Submit FAFSA by June 1.', url: 'https://nextncscholarship.org/'),
  _SchoolScholarship(name: 'QuestBridge Match Scholarship', amount: 'Full Ride', details: 'High-achieving, low-income first-gen students. Top 5-10% of class. Open to undocumented/DACA. Deadline: Sept. 26.', url: 'https://www.questbridge.org'),
  _SchoolScholarship(name: 'CFNC.org Scholarship Search', amount: 'Varies', details: 'Search hundreds of NC scholarships for Gates County students.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
];

// ── GRAHAM HIGH SCHOOL (ALAMANCE COUNTY) ────────────────────────
const List<_SchoolScholarship> _grahamScholarships = [
  _SchoolScholarship(name: 'Aubrey Lee Brooks Scholarship', amount: 'USD 12,000 (renewable)', details: 'Alamance County resident. Attend NC State, UNC-Chapel Hill, or UNC-Greensboro. Financial need required. FAFSA and SAI not to exceed 12,000. Deadline: March 1. Apply at CFNC.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
  _SchoolScholarship(name: 'Alamance County Scholarships (CampusReel)', amount: 'Varies', details: '346 scholarships totaling USD 818,493 available for Alamance County residents. Browse the full list at campusreel.org for scholarships matched to your background.', url: 'https://www.campusreel.org/scholarships/location/north-carolina-scholarships/alamance-county'),
  _SchoolScholarship(name: 'ABSS Scholarship Opportunities', amount: 'Varies', details: 'Alamance-Burlington School System posts current local scholarship opportunities. Check with your Graham HS counselor for the most current list.', url: 'https://graham.abss.k12.nc.us'),
  _SchoolScholarship(name: 'Alamance Community College Foundation', amount: 'Varies', details: 'For students attending ACC. Multiple merit and need-based scholarships. Apply through ACC financial aid.', url: 'https://www.alamancecc.edu/foundation/scholarships/'),
  _SchoolScholarship(name: 'Golden LEAF Scholarship', amount: 'USD 12,000', details: 'NC students from rural and economically distressed communities. FAFSA required. Apply at CFNC by March 1.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
  _SchoolScholarship(name: 'SECU People Helping People Scholarship', amount: 'USD 10,000', details: 'NC public school senior. Must be SECU member. UNC system university. Min 2.5 GPA. Deadline: Mar. 20.', url: 'https://www.ncsecu.org/resources/scholarships.html'),
  _SchoolScholarship(name: 'NC Need-Based Grant', amount: 'Up to USD 9,300/yr', details: 'NC residents with financial need attending NC colleges. Apply via FAFSA.', url: 'https://www.cfnc.org/pay-for-college/financial-aid/nc-need-based-grant/'),
  _SchoolScholarship(name: 'NextNC Scholarship', amount: 'USD 3,000-USD 5,000/yr', details: 'NC public high school senior. Family income under USD 80,000. Submit FAFSA by June 1.', url: 'https://nextncscholarship.org/'),
  _SchoolScholarship(name: 'QuestBridge Match Scholarship', amount: 'Full Ride', details: 'High-achieving, low-income first-gen students. Top 5-10% of class. Open to undocumented/DACA. Deadline: Sept. 26.', url: 'https://www.questbridge.org'),
  _SchoolScholarship(name: 'CFNC.org Scholarship Search', amount: 'Varies', details: 'Search hundreds of NC scholarships matched to Alamance County students.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
];

// ── HARNETT CENTRAL HIGH SCHOOL ─────────────────────────────────
const List<_SchoolScholarship> _harnettCentralScholarships = [
  _SchoolScholarship(name: 'C. Reid Ross Rotary Scholarship for Educators', amount: 'Varies', details: 'For Harnett Central seniors pursuing a degree in Education. Apply through NC Community Foundation. Deadline: March 3.', url: 'https://www.nccommunityfoundation.org/scholarships'),
  _SchoolScholarship(name: 'Robert E. Barnhill Sr. Scholarship', amount: 'Varies', details: 'NC resident planning to attend a 4-year college. Leadership, community involvement, academic achievement, financial need. Special consideration for Barnhill Contracting family. Essay required. Apply through NCCF.', url: 'https://www.nccommunityfoundation.org/scholarships'),
  _SchoolScholarship(name: 'Harnett County Medical Scholarship', amount: 'Varies', details: 'For Harnett County graduates pursuing nursing, medical technology, radiology, pharmacy, or other medical fields. Preference for those near Erwin, NC. Apply through NCCF.', url: 'https://www.nccommunityfoundation.org/scholarships'),
  _SchoolScholarship(name: 'Harnett High School Alumni Association Scholarships', amount: 'Varies', details: 'Multiple family-named scholarships (McCall, Pellam, Williams, Burnette, Herring). For Harnett County students. Contact harnetthighalumni.com for the current application.', url: 'https://harnetthighalumni.com/scholarships/'),
  _SchoolScholarship(name: 'HCHS Scholarship Search Site', amount: 'Varies', details: 'Harnett Central maintains a scholarship search site for local and state opportunities. Check with your counselor for current deadlines.', url: 'https://sites.google.com/harnett.k12.nc.us/hchsscholarships/home'),
  _SchoolScholarship(name: 'Central Carolina Community College Foundation', amount: 'Varies', details: 'For students attending CCCC. Multiple merit and need-based awards. Apply through CCCC financial aid.', url: 'https://www.cccc.edu/foundation/scholarships/'),
  _SchoolScholarship(name: 'Golden LEAF Scholarship', amount: 'USD 12,000', details: 'NC students from rural and economically distressed communities. FAFSA required. Apply at CFNC by March 1.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
  _SchoolScholarship(name: 'NC Need-Based Grant', amount: 'Up to USD 9,300/yr', details: 'NC residents with financial need attending NC colleges. Apply via FAFSA.', url: 'https://www.cfnc.org/pay-for-college/financial-aid/nc-need-based-grant/'),
  _SchoolScholarship(name: 'NextNC Scholarship', amount: 'USD 3,000-USD 5,000/yr', details: 'NC public high school senior. Family income under USD 80,000. Submit FAFSA by June 1.', url: 'https://nextncscholarship.org/'),
  _SchoolScholarship(name: 'CFNC.org Scholarship Search', amount: 'Varies', details: 'Search hundreds of NC scholarships matched to Harnett County students.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
];

// ── HAWTHORNE ACADEMY OF HEALTH SCIENCES (MECKLENBURG) ──────────
const List<_SchoolScholarship> _hawthorneAcademyScholarships = [
  _SchoolScholarship(name: 'Foundation for the Carolinas Scholarships', amount: 'Varies', details: 'Nearly 150 scholarship funds for Charlotte and Mecklenburg County students. Includes health sciences focused awards. Apply at fftcscholarships.communityforce.com.', url: 'https://fftcscholarships.communityforce.com'),
  _SchoolScholarship(name: 'shift-ed Scholarship', amount: 'Last-dollar tuition', details: 'For CMS graduates covering remaining tuition at NC public colleges. Apply through shift-ed.org.', url: 'https://shift-ed.org/'),
  _SchoolScholarship(name: 'PEARL Scholarships', amount: 'USD 1,500', details: 'Academic, character, and financial need-based for Mecklenburg County graduating seniors. Apply through Smart Start of Mecklenburg County.', url: 'https://www.smartstartofmeck.org/scholarship-opps/'),
  _SchoolScholarship(name: 'NC Teaching Fellows Scholarship', amount: 'Up to USD 4,125/semester', details: 'NC resident planning to teach in NC public schools. Competitive. Apply through NCSEAA.', url: 'https://www.cfnc.org/pay-for-college/financial-aid/nc-teaching-fellows/'),
  _SchoolScholarship(name: 'NC Need-Based Grant', amount: 'Up to USD 9,300/yr', details: 'NC residents with financial need attending NC colleges. Apply via FAFSA.', url: 'https://www.cfnc.org/pay-for-college/financial-aid/nc-need-based-grant/'),
  _SchoolScholarship(name: 'NextNC Scholarship', amount: 'USD 3,000-USD 5,000/yr', details: 'NC public high school senior. Family income under USD 80,000. Submit FAFSA by June 1.', url: 'https://nextncscholarship.org/'),
  _SchoolScholarship(name: 'QuestBridge Match Scholarship', amount: 'Full Ride', details: 'High-achieving, low-income first-gen students. Open to undocumented/DACA. Deadline: Sept. 26.', url: 'https://www.questbridge.org'),
  _SchoolScholarship(name: 'CFNC.org Scholarship Search', amount: 'Varies', details: 'Search hundreds of NC scholarships matched to Mecklenburg County students.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
];

// ── HERTFORD COUNTY HIGH SCHOOL ──────────────────────────────────
const List<_SchoolScholarship> _hertfordCountyScholarships = [
  _SchoolScholarship(name: 'Roanoke Electric Cooperative Scholarship', amount: 'Varies', details: 'For students whose parents or guardians are Roanoke Electric customers serving Hertford County. Apply through the cooperative website.', url: 'https://www.roanokecooperative.com'),
  _SchoolScholarship(name: 'NC Community Foundation Hertford County Scholarships', amount: 'USD 1,000+', details: 'Multiple scholarships for Hertford County students. Apply using NCCF Universal Application. Opens Dec. 16, closes March 3.', url: 'https://www.nccommunityfoundation.org/scholarships'),
  _SchoolScholarship(name: 'College of the Albemarle Foundation Scholarships', amount: 'Varies', details: 'For students attending COA in northeastern NC. Multiple scholarships available. Apply through COA financial aid office.', url: 'https://www.albemarle.edu/student-resources/financial-aid/scholarships/'),
  _SchoolScholarship(name: 'Self Help Credit Union Community Scholarship', amount: 'Varies', details: 'Available to Hertford County students. See your school counselor for the application.', url: 'https://www.self-help.org'),
  _SchoolScholarship(name: 'Golden LEAF Scholarship', amount: 'USD 12,000', details: 'NC students from rural and economically distressed communities. Hertford County qualifies strongly. FAFSA required. Deadline: March 1.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
  _SchoolScholarship(name: 'NC Need-Based Grant', amount: 'Up to USD 9,300/yr', details: 'NC residents with financial need attending NC colleges. Apply via FAFSA.', url: 'https://www.cfnc.org/pay-for-college/financial-aid/nc-need-based-grant/'),
  _SchoolScholarship(name: 'NextNC Scholarship', amount: 'USD 3,000-USD 5,000/yr', details: 'NC public high school senior. Family income under USD 80,000. Submit FAFSA by June 1.', url: 'https://nextncscholarship.org/'),
  _SchoolScholarship(name: 'QuestBridge Match Scholarship', amount: 'Full Ride', details: 'High-achieving, low-income first-gen students. Open to undocumented/DACA. Deadline: Sept. 26.', url: 'https://www.questbridge.org'),
  _SchoolScholarship(name: 'CFNC.org Scholarship Search', amount: 'Varies', details: 'Search hundreds of NC scholarships for Hertford County students.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
];

// ── HIBRITEN HIGH SCHOOL (CALDWELL COUNTY) — REAL DATA ─────────
const List<_SchoolScholarship> _hibritenScholarships = [
  _SchoolScholarship(name: 'ETSU - Frank Rutherford Balanced Man Scholarships', amount: 'USD 1', details: 'Deadline: Aug 04, 2025. Open to ALL Incoming 1st year Students attending ETSU', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'NC State University Park Scholarship', amount: 'Valued at USD 120,000 over 4 years', details: 'Deadline: Nov 01, 2025. Minimum unweighted GPA of 3.5 or weighted GPA of 4.0; Be a US citizen, permanent resident of the US, or graduated from a high school in the US; Apply for fall- 1st year addmission into a program at NC State University.', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'Elks Lodge Most Valuable Student Scholarship', amount: 'Ranging from USD 1,000 per year to USD 7,500 per year', details: 'Deadline: Nov 01, 2025. Current high school seniors, or the equivalent, who are citizens of the United States are eligible to apply.; Do not need to be related to a member of the Elks; Must be planning to attend a 4 year college or university', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'Hagan Scholarship', amount: 'USD 7,500', details: 'Deadline: Dec 01, 2025. Must attend a high school located in the US; Must have achieved an unweighted GPA of 3.5 GPA based on a 4.0 scale; Must enroll in a 4 year college or university; Must work 240 hours from Jan 1, 2026 to Sept 1, 2026; P...', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'Jackie Robinson Foundation Scholarship', amount: 'Varies', details: 'Deadline: Jan 09, 2025. ', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'National Association of Federal Education Program Administrators', amount: 'Up to USD 5,000.00', details: 'Deadline: Jan 10, 2025. High school students who are on track to graduate by the conclusion of the current academic year; Applicants must be enrolled in a public school district with at least one current NAFEPA member (Mrs. Jenny McNulty at ...', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'William A Hart Award', amount: 'USD 1,000', details: 'Deadline: Jan 22, 2025. Application completed online', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'Catherine Tucker Memorial Scholarship', amount: 'Varies', details: 'Deadline: Jan 25, 2025. African American female from Caldwell Co; Minimum weighted GPA 3.0; Acceptance to a 2 or 4 year college or university in NC', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'National Society Daughters of the American Revolution:  The NCSDAR Cordon Street Endowment Gift Scholarship', amount: 'USD 1,500', details: 'Deadline: Jan 26, 2025. Application; Letters of reference; Essay written by applicant; Transcript; Resume', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'The Fidelity Scholars Program', amount: 'Varies', details: 'Deadline: Jan 30, 2025. 2.5-3.6 unweighted GPA; Demonstrate financial need; Attending a 4-year college or university; Underrepresented populations', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'Members Credit Union', amount: '', details: 'Deadline: Feb 01, 2025. Member of the Credit Union; be enrolled or plan to be enrolled full-time in a college or university', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'Caldwell Womens Club:  Sally Southall Colten Scholarship; Pick up application from Ms. Rudicil in the Counseling Office', amount: 'USD 1,000', details: 'Deadline: Feb 03, 2025. Top 25% of Class; Applicable to ALL Seniors; Recent photograph; Personal letter explaining as to why he/she desires to continue his/her education, his/her future plans, and why financial aid is necessary.', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'C. L. Robbins Foundation Scholarship', amount: 'Depends on funds available', details: 'Deadline: Feb 05, 2025. Be a resident of the city of Lenoir or Caldwell County;  Minimum cumulative GPA of 2.0; Demonstrate academic achievement; Demonstrate financial need; Demonstrate traits of high personal character and leadership; Atten...', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'The Coffey Foundation Scholarship', amount: 'USD 40,000', details: 'Deadline: Feb 24, 2025. Be ranked in the top 5% of their graduating class; Have not received 80% of the total cost of their college; Be accepted to a 4-year college; Completed the application and required documents', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'Education Foundation Marvin Courtney Memorial Scholarship', amount: 'Funding amounts are dependent on interest from the Robert Marvin Courtney Endowment.', details: 'Deadline: Mar 01, 2025. ', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'Education Foundation Tyler Sims Memorial Scholarship', amount: 'USD 1,600', details: 'Deadline: Mar 01, 2025. ', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'Education Foundation:  Connie Patterson Scholarship', amount: 'USD 500', details: 'Deadline: Mar 01, 2025. Application completed and returned to the Education Center', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'Education Foundation:  Janet H. Wilson Memorial Scholarship', amount: 'USD 500', details: 'Deadline: Mar 01, 2025. Applications completed and returned to the Education Center', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'Education Foundation:  The Price Memorial Scholarship', amount: 'Funding amounts are dependent on Endowment.', details: 'Deadline: Mar 01, 2025. Applications completed and returned to the Education Center', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'Education Foundation:  Thomas Marshall Jack Robbins Scholarship', amount: 'USD 500', details: 'Deadline: Mar 01, 2025. Application completed and returned to the Education Center', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'Golden Leaf Scholarship', amount: 'Up to USD 14,000 (USD 3,500/ year for up to 4 years)', details: 'Deadline: Mar 01, 2025. Application, FAFSA, and Transcript', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'NC Alpha Delta Kappa--The Eunice Riggins Memorial Scholarship', amount: 'USD 2,000', details: 'Deadline: Mar 01, 2025. Top 10% of class in rank; Minimum SAT score of 1220 or ACT composite score of 25; Good character and participation in extra-curricular activities (school and community); Financial need is not the primary consideration', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'NC Alpha Delta Kappa--The Mary Rose Mills- Linda Rankin Memorial Scholarship', amount: 'USD 2,000', details: 'Deadline: Mar 01, 2025. Top 10% of class in rank; Minimum SAT score of 1290 or ACT composite score of 27; Good character and participation in extra-curricular activities (school and community); Financial need is not the primary consideration', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'NC Alpha Delta Kappa--The Omicron Alpha Delta Kappa Scholarship', amount: 'USD 1,000', details: 'Deadline: Mar 01, 2025. Planning to study in the field of education', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'Blue Ridge HealthCare Foundation Scholarship:  J. Grayson Brothers Scholarship', amount: '', details: 'Deadline: Mar 14, 2025. Completed application, proof of acceptance into a health care related program; recommendation; GPA of 2.5 or higher; official transcript; must reside in Caldwell Co.; complete the application, print it out and sign it...', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'Blue Ridge HealthCare Foundation Scholarship:  VanNoppen Scholarship', amount: '', details: 'Deadline: Mar 14, 2025. Completed application, proof of acceptance into a health care related program; recommendation; GPA of 2.5 or higher; official transcript; must reside in Caldwell Co.; complete the application, print it out and sign it...', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'Lenoir Service League', amount: 'USD 1,000', details: 'Deadline: Mar 15, 2025. Current resident of Caldwell County; Be female; Have financial need; Be accepted to an institution of higher learning', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'National Restaurant Association Education Foundation', amount: 'Up to USD 10,000', details: 'Deadline: Mar 15, 2025. ', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'Jonathan Bryant Memorial Scholarship', amount: 'Varies', details: 'Deadline: Mar 19, 2025. Eligible applicants must have completed an advanced social studies course (AP World, AP Government, AP U.S. History, AP Psychology, History 131 or History 132) with a final grade of an A or B; accepted to a post-secon...', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'Delta Sigma Theta Sorority Hickory Alumnae Chaper (HAC) Scholarship', amount: 'USD 1,200', details: 'Deadline: Mar 22, 2025. Applicants must reside in Burke, Caldwell, Catawba, or Iredell County; Be female and of African American descent; Be attending a four-year college/ university in the Fall of 2024', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'Michael A. DeMayo Arrive Alive Scholarship Program', amount: 'USD 2,500', details: 'Deadline: Mar 24, 2025. ', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'UNCF STEM Scholarship', amount: 'Up to USD 25,000', details: 'Deadline: Mar 24, 2025. Be African American, Hispanic American, Asian Pacific Islander American, American Indian / Alaskan Native; Have a cumulative GPA of 3.0 on an unweighted 4.0; Pursued a rigorous course of study in high school in math a...', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'Caldwell County Principal and Assistant Principal Association (CCPAPA)', amount: 'USD 1,000', details: 'Deadline: Mar 27, 2025. Application form with principals signature; essay; current student transcript.', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'Mike Beard Memorial Scholarship', amount: 'USD 2,500', details: 'Deadline: Mar 31, 2025. NC resident; Weighted GPA of 4.2 or better; signed a National Letter of Intent to play collegiate atheletics; Display a need for financial assistance; exhibit personal characteristics that are in alignments with the l...', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'Rotary Club of Lenoir Ed Tutor Baseball Scholarship (not offering 2024-25)', amount: 'USD 647', details: 'Deadline: Mar 31, 2025. Completed application; Typed letter stating your reasons for applying and intended major; Resume; Completed essay answering application question; Recommendation from a coach or team member', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'Rotary Club of Lenoir Scholarship (Not offering 2024-25)', amount: 'USD 500', details: 'Deadline: Mar 31, 2025. Full-time resident of Caldwell County; Special consideration is given to students active in their schools Interact Club; Civic and community involvement is favorably considered; Consideration of financial need is impo...', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'CCC&TI Foundation Scholarships', amount: 'USD 250', details: 'Deadline: Fall 2025 Deadline:  March 31st; Fall 2025 Final Deadline:  July 1st. Apply to CCC&TI; Complete the FAFSA; Complete the CCC&TI Foundation Scholarship application; Complete email to submit SAR or Financial Aid Award letter to Financial Aid Office.', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'National Technical Honor Society/ Build Your Future Scholarship', amount: 'USD 1,000', details: 'Deadline: Apr 01, 2025. Current National Technical Honor Society Members who are studying a construction related discpline.', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'Patriot Jerky: Patriotism Scholarship', amount: 'USD 2', details: 'Deadline: Apr 01, 2025. Senior from Catawba, Caldwell, or Burke Co.; Accepted to community college or 4 year college/ university; GPA; 3.0; American Citizenship; 50 hrs of community service; 2 letters of reference; Essay explaining What Patr...', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'Rotary Club of Caldwell County Scholarship', amount: 'USD 1,500', details: 'Deadline: Apr 09, 2025. Be a graduate of Caldwell County HS graduate; Minimum of a 2.0 GPA; Completed application with 2 letters of recommendation; Must exhibit scholarship, leadership, citizenship, and ambition; All other factors being equa...', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'East Caldwell All Stars', amount: 'USD 2,000', details: 'Deadline: Apr 11, 2025. Application, School Transcript, and Typed Essay; Consideration is given to students who have a financial need and who have shown academic progress.', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'Caldwell County Farm Bureau Scholarship', amount: 'USD 2,000', details: 'Deadline: Apr 15, 2025. Intention to pursue a career in agriculture or in an agriculturally related field; Financial need; Minimum GPA of 2.5; An evident understanding of agriculture and/ or agribusiness community; Leadership potential', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'CCC&TI ONLY:  Charles and Lucille Suddreth Scholarship', amount: 'USD 800', details: 'Deadline: Apr 15, 2025. Online application', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'Firehouse Subs Public Safety Foundation Scholarship', amount: 'Varies', details: 'Deadline: Apr 15, 2025. Plan to enroll in a part-time or full-time firefighter, law enforcement, or an emergency medical (paramedic or EMT) program at an accredited two-year or four-year college, university, or vocational-technical school fo...', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'SEANC: State Employees Association of North Carolina', amount: 'Varies', details: 'Deadline: Apr 15, 2025. Different categories/ criteria; Look at application for further information of each criteria', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'SkillsUSA/ National Technical Honor Society', amount: 'USD 1,000', details: 'Deadline: Apr 15, 2025. Applicant must be current member of both SkillsUSA and National Technical Honor Society', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'HOSA/ National Technical Honor Society', amount: 'USD 1,000', details: 'Deadline: Apr 15, 2025. Applicant must be current member of both HOSA and National Technical Honor Society', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'FBLA/ National Technical Honor Society', amount: 'USD 1,000', details: 'Deadline: Apr 15, 2025. Applicant must be current members of both FBLA and National Technical Honor Society', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'GySgt Christopher Eckard Scholarship', amount: 'USD 500', details: 'Deadline: Apr 15, 2025. Minimum GPA of 3.0; Proven leadership ability; Participation in church and community service activities;', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'Bob R. McGuire Memorial Scholarship', amount: 'USD 1,000', details: 'Deadline: Apr 18, 2025. At least one parent must be a member of the North Carolina Child Support Council or a client of the Child Support Program (through either Child Support services or Clerk of Court services); Be a high school senior and...', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'WKBC Scholarship (Not offered this year)', amount: 'USD 5,000', details: 'Deadline: Apr 19, 2025. High School Senior; Provide a HS transcript; 2 letters of recommendation; typed essay of 500 words.', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'Bridging the Dream Scholarship', amount: 'USD 10,000', details: 'Deadline: Apr 25, 2025. Create a 2-minute video responding to the following:  What unique perspective, passion, or curiosity drives your academic interests? How do you envision it shaping your future as a scholar and leader in your field?', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'The Sylvia Ann Greene Arts, Music, Education, History & Innovation Scholarship', amount: 'USD 500', details: 'Deadline: Apr 28, 2025. Graduating Senior of Caldwell County Schools; Member of a minority group; Will be enrolled in a 2 or 4 year college or university in the Fall; Financial need will be a consideration', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'Jon H. Poteat Scholarship', amount: 'USD 1,000', details: 'Deadline: May 01, 2025. Active National Technical Honor Society Membership', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'McCain Merit Scholarship', amount: 'USD 500', details: 'Deadline: May 13, 2025. Senior graduating from Caldwell Co; Minimum unweighted GPA of 2.75; official transcript; proof of acceptance to a 2 or 4 year post-secondary institution; 2 selated letters of recommentation; 500 word essaty on topic g...', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'Jack n Granny Oak Hill Ruritan Club Scholarship', amount: 'Depends on funds available', details: 'Deadline: May 23, 2025. Students attended Oak Hill School; Plan on furthering their education; Completed application; High School transcript; essay about your educational and career aspirations/ interests/ goals.', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'Kiwanis Club of Lenoir', amount: 'Depends on funds available', details: 'Deadline: May 30, 2025. Completed application, incuding GPA and two (2) letters of recommendation from persons who know you well and are not related to you; Must be a Caldwell County student attending a four (4) year College or University wi...', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'AppState ONLY:  Norman Cheek Memorial Project Graduation Scholarship', amount: 'USD 6,500', details: 'Deadline: May 30, 2025. Be attending AppState in the fall; Graduating from Caldwell County Schools; Holds at least a 3.0 GPA; Participates in Project Graduation', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'CCC&TI ONLY:  SECU Foundation People Helping People', amount: 'USD 5,000', details: 'Deadline: Jun 13, 2025. GPA of 2.5 or higher; Exhibits leadership, excellence of character, integrity, and community involvement; Filed FAFSA as part of their college application', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'Caldwell County Association of Educators Scholarship', amount: 'USD 500', details: 'Deadline: . Students must be interested in a career in Education; Two letters of recommendation from teachers or administration', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'CCC&TI ONLY:  Project Graduation Scholarship', amount: 'USD 1,500', details: 'Deadline: . Complete application and essay prompt', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'Ladies in Action Scholarship', amount: 'USD 250', details: 'Deadline: . Minority Student; Minimum GPA of 2.5 or higher; Acceptance to a College or University in the Fall', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'National Scholarships Newsletter', amount: '', details: 'Deadline: . ', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'HHS Scholarship Folder', amount: 'Varies', details: 'Full list of local and national scholarships maintained by the HHS counselor. Contact Ms. Rudicil at drudicil@caldwellschools.com for more info.', url: 'https://hhs.caldwellschools.com/99466_3'),
  _SchoolScholarship(name: 'NC Community Foundation Caldwell County', amount: 'USD 1,000+', details: 'Multiple scholarships for Caldwell County students. Apply using NCCF Universal Application. Opens Dec. 16, closes March 3.', url: 'https://www.nccommunityfoundation.org/scholarships'),
];

// ── HIGH POINT CENTRAL HIGH SCHOOL (GUILFORD COUNTY) ────────────
const List<_SchoolScholarship> _highPointCentralScholarships = [
  _SchoolScholarship(name: 'Aubrey Lee Brooks Scholarship', amount: 'USD 12,000 (renewable)', details: 'Guilford County resident attending NC State, UNC-Chapel Hill, or UNC-Greensboro. Financial need required. Deadline: March 1. Apply at CFNC.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
  _SchoolScholarship(name: 'shift-ed Scholarship', amount: 'Last-dollar tuition', details: 'For GCS seniors covering remaining tuition at NC public colleges. Apply through shift-ed.org.', url: 'https://shift-ed.org/'),
  _SchoolScholarship(name: 'Access Amazing Scholarship (GTCC)', amount: 'Full tuition and fees', details: 'Last-dollar scholarship for Guilford County HS graduates attending GTCC. Submit FAFSA. Apply early.', url: 'https://www.gtcc.edu/admissions-and-aid/how-to-pay-for-college/financial-aid/access-amazing-scholarship'),
  _SchoolScholarship(name: 'Reginald and Mildred Womble Scholarship', amount: 'USD 2,500', details: 'Guilford County seniors planning to attend an HBCU. Apply through GWCCEC.', url: 'https://cfgg.org/students/'),
  _SchoolScholarship(name: 'Pearl Berlin Scholarship', amount: 'Varies', details: 'LGBTQ+ students and allies in Guilford County. Courage and leadership required. Apply through CFGG.', url: 'https://cfgg.org/students/'),
  _SchoolScholarship(name: 'High Point University Merit Scholarships', amount: 'Up to USD 20,000/yr', details: 'High Point Central graduates attending HPU may qualify for merit scholarships. Check highpoint.edu/financialaid for current awards.', url: 'https://www.highpoint.edu/financialaid/scholarships/'),
  _SchoolScholarship(name: 'Community Foundation of Greater Greensboro', amount: 'Multiple awards', details: 'Search all CFGG scholarships for Guilford County seniors in one portal.', url: 'https://cfgg.org/students/'),
  _SchoolScholarship(name: 'NC Need-Based Grant', amount: 'Up to USD 9,300/yr', details: 'NC residents with financial need attending NC colleges. Apply via FAFSA.', url: 'https://www.cfnc.org/pay-for-college/financial-aid/nc-need-based-grant/'),
  _SchoolScholarship(name: 'CFNC.org Scholarship Search', amount: 'Varies', details: 'Search hundreds of NC scholarships matched to Guilford County students.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
];

// ── HILLSIDE HIGH SCHOOL (DURHAM COUNTY) ─────────────────────────
const List<_SchoolScholarship> _hillsideScholarships = [
  // Local Durham scholarships
  _SchoolScholarship(name: 'Durham County African American Male Scholarship', amount: 'Varies', details: 'For African American male students in Durham County pursuing four-year college degrees. Apply through access scholarships portal.', url: 'https://accessscholarships.com/scholarships-by-state/north-carolina-scholarships/'),
  _SchoolScholarship(name: 'Lenovo and Durham Bulls STEM Scholarship', amount: 'USD 2,500 (2 awards)', details: 'Triangle area students in a STEM-based program at a NC university or community college. Family income under USD 105,000. Min 2.5 GPA.', url: 'https://sites.google.com/wcpss.net/whsstudentservices/college-planning/scholarships'),
  _SchoolScholarship(name: 'Couch Oil Cares Scholarship', amount: 'Varies', details: 'Durham and surrounding counties. First-year college students. Max age 25. Deadline: May 1.', url: 'https://sites.google.com/wcpss.net/whsstudentservices/college-planning/scholarships'),
  _SchoolScholarship(name: 'Sigma Rho Zeta Phi Beta Scholarship', amount: 'Varies', details: 'Durham area students. Application window opens Dec. 1, deadline Feb. 28. Apply at sigmarhozetazphib.org.', url: 'https://sigmarhozetazphib.org/srz-annual-scholarship'),
  _SchoolScholarship(name: 'NC Central University Merit Scholarships', amount: 'Varies', details: 'Durham-area students applying to NCCU may qualify for institutional merit scholarships. NCCU is a strong HBCU option for Durham students.', url: 'https://www.nccu.edu/tuition-aid/financial-aid/scholarships'),
  // National scholarships from Hillside counselor doc
  _SchoolScholarship(name: 'Bridging the Dream Scholarship', amount: 'Varies', details: 'Financial need, academic achievement, and extracurricular involvement. Apply at salliemae.com/landing/bridging-the-dream/.', url: 'https://www.salliemae.com/landing/bridging-the-dream/'),
  _SchoolScholarship(name: 'Coca-Cola Scholars Foundation', amount: 'USD 20,000', details: 'Highly competitive national scholarship for high-achieving seniors. Apply at coca-colascholarsfoundation.org.', url: 'https://www.coca-colascholarsfoundation.org/apply/'),
  _SchoolScholarship(name: 'Cooke College Scholarship Program', amount: 'Up to USD 40,000', details: 'For students with financial need and exceptional promise. Apply through Jack Kent Cooke Foundation.', url: 'https://www.jkcf.org/our-scholarships/college-scholarship-program/'),
  _SchoolScholarship(name: 'Elks National Foundation Scholarship', amount: 'USD 4,000-USD 50,000', details: 'Most Valuable Student scholarship for leadership, academics, and financial need. Apply at elks.org.', url: 'https://www.elks.org/scholars/scholarships/mvs.cfm'),
  _SchoolScholarship(name: 'Foot Locker Scholar Athletes', amount: 'USD 20,000', details: 'For student athletes who demonstrate academic excellence and community involvement. Apply at footlockerscholarathletes.com.', url: 'https://www.footlockerscholarathletes.com/'),
  _SchoolScholarship(name: 'Hagan Scholarship', amount: 'Up to USD 7,500/yr', details: 'For first-generation college students with financial need attending qualifying colleges. Apply at haganscholarships.org.', url: 'https://haganscholarships.org/application/'),
  _SchoolScholarship(name: 'Hispanic Scholarship Fund', amount: 'USD 500-USD 5,000', details: 'For Hispanic students with min 3.0 GPA. Apply at hsf.net.', url: 'https://www.hsf.net/'),
  _SchoolScholarship(name: 'Latino Community Credit Union Scholarship', amount: 'Varies', details: 'For Latino students in NC. Apply at latinoccu.org/community-impact/scholarship-fund/.', url: 'https://latinoccu.org/community-impact/scholarship-fund/'),
  _SchoolScholarship(name: 'National Federation of the Blind Scholarship', amount: 'USD 3,000-USD 12,000', details: 'For legally blind students pursuing higher education. Apply at nfb.org.', url: 'https://nfb.org/programs-services/scholarships-and-awards/scholarship-program'),
  _SchoolScholarship(name: 'QuestBridge Match Scholarship', amount: 'Full Ride', details: 'High-achieving, low-income first-gen students. Open to undocumented/DACA. Deadline: Sept. 26.', url: 'https://www.questbridge.org'),
  _SchoolScholarship(name: 'Ron Brown Scholar Program', amount: 'USD 10,000/yr', details: 'For African American seniors with exceptional academic achievement, leadership, and community involvement. Apply at ronbrown.org.', url: 'https://ronbrown.org/apply/ron-brown-scholarship/'),
  _SchoolScholarship(name: 'PIMCO Future Leaders Scholarship', amount: 'Varies', details: 'For Black and Latinx students demonstrating academic excellence. Apply through PIMCO careers page.', url: 'https://careers.pimco.com/careers/FolderDetail/2022-PIMCO-Future-Leaders-Scholarship/33012'),
  _SchoolScholarship(name: 'Equitable Excellence Scholarship', amount: 'USD 5,000', details: 'For students demonstrating academic achievement, leadership, and community involvement. Apply at equitable.com/foundation.', url: 'https://equitable.com/foundation/equitable-excellence-scholarship'),
  _SchoolScholarship(name: 'Hillside Counselor Scholarship Page', amount: 'Varies', details: 'Full list of national and local scholarships maintained by the Hillside HS counselor. Contact your counselor for the most current opportunities.', url: 'https://hillside.dpsnc.net'),
  _SchoolScholarship(name: 'NC Need-Based Grant', amount: 'Up to USD 9,300/yr', details: 'NC residents with financial need attending NC colleges. Apply via FAFSA.', url: 'https://www.cfnc.org/pay-for-college/financial-aid/nc-need-based-grant/'),
  _SchoolScholarship(name: 'CFNC.org Scholarship Search', amount: 'Varies', details: 'Search hundreds of NC scholarships matched to Durham County students.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
];

// ── HOKE COUNTY HIGH SCHOOL ──────────────────────────────────────
const List<_SchoolScholarship> _hokeCountyScholarships = [
  _SchoolScholarship(name: 'Lula T. and James L. Crosby Scholarship', amount: 'Varies (renewable)', details: 'For Cumberland, Hoke, or Harnett County seniors. Min 3.0 unweighted GPA. Active church member. Financial need. Elementary education degree preferred. Apply through Cumberland Community Foundation.', url: 'https://www.cumberlandcf.org/scholarships'),
  _SchoolScholarship(name: 'NC Community Foundation Hoke County Scholarships', amount: 'USD 1,000+', details: 'Multiple scholarships for Hoke County students. Apply using NCCF Universal Application. Opens Dec. 16, closes March 3.', url: 'https://www.nccommunityfoundation.org/scholarships'),
  _SchoolScholarship(name: 'Lumbee Tribe Education Scholarships', amount: 'Varies', details: 'For enrolled members of the Lumbee Tribe attending college. Hoke County has a significant Lumbee population. Apply through the Lumbee Tribe education office.', url: 'https://www.lumbeetribe.com/education'),
  _SchoolScholarship(name: 'Golden LEAF Scholarship', amount: 'USD 12,000', details: 'NC students from rural and economically distressed communities. Hoke County qualifies. FAFSA required. Deadline: March 1.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
  _SchoolScholarship(name: 'NC Need-Based Grant', amount: 'Up to USD 9,300/yr', details: 'NC residents with financial need attending NC colleges. Apply via FAFSA.', url: 'https://www.cfnc.org/pay-for-college/financial-aid/nc-need-based-grant/'),
  _SchoolScholarship(name: 'NextNC Scholarship', amount: 'USD 3,000-USD 5,000/yr', details: 'NC public high school senior. Family income under USD 80,000. Submit FAFSA by June 1.', url: 'https://nextncscholarship.org/'),
  _SchoolScholarship(name: 'QuestBridge Match Scholarship', amount: 'Full Ride', details: 'High-achieving, low-income first-gen students. Open to undocumented/DACA. Deadline: Sept. 26.', url: 'https://www.questbridge.org'),
  _SchoolScholarship(name: 'CFNC.org Scholarship Search', amount: 'Varies', details: 'Search hundreds of NC scholarships matched to Hoke County students.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
];

// ── HUGH M. CUMMINGS HIGH SCHOOL (ALAMANCE COUNTY) ──────────────
const List<_SchoolScholarship> _cummingsScholarships = [
  _SchoolScholarship(name: 'Aubrey Lee Brooks Scholarship', amount: 'USD 12,000 (renewable)', details: 'Alamance County resident attending NC State, UNC-Chapel Hill, or UNC-Greensboro. Financial need required. Deadline: March 1. Apply at CFNC.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
  _SchoolScholarship(name: 'Pearl Berlin Scholarship', amount: 'Varies', details: 'LGBTQ+ students and allies in Alamance County. Courage and leadership required. Apply through CFGG.', url: 'https://cfgg.org/students/'),
  _SchoolScholarship(name: 'Alamance County Scholarships (CampusReel)', amount: 'Varies', details: '346 scholarships totaling USD 818,493 available for Alamance County students. Browse at campusreel.org.', url: 'https://www.campusreel.org/scholarships/location/north-carolina-scholarships/alamance-county'),
  _SchoolScholarship(name: 'Alamance Community College Foundation', amount: 'Varies', details: 'For students attending ACC. Multiple merit and need-based scholarships. Apply through ACC financial aid office.', url: 'https://www.alamancecc.edu/foundation/scholarships/'),
  _SchoolScholarship(name: 'ABSS Scholarship Opportunities', amount: 'Varies', details: 'Alamance-Burlington School System posts current local scholarship opportunities. Check with your Cummings HS counselor for the most current list.', url: 'https://www.abss.k12.nc.us'),
  _SchoolScholarship(name: 'SECU People Helping People Scholarship', amount: 'USD 10,000', details: 'NC public school senior. Must be SECU member. UNC system university. Min 2.5 GPA. Deadline: Mar. 20.', url: 'https://www.ncsecu.org/resources/scholarships.html'),
  _SchoolScholarship(name: 'NC Need-Based Grant', amount: 'Up to USD 9,300/yr', details: 'NC residents with financial need attending NC colleges. Apply via FAFSA.', url: 'https://www.cfnc.org/pay-for-college/financial-aid/nc-need-based-grant/'),
  _SchoolScholarship(name: 'NextNC Scholarship', amount: 'USD 3,000-USD 5,000/yr', details: 'NC public high school senior. Family income under USD 80,000. Submit FAFSA by June 1.', url: 'https://nextncscholarship.org/'),
  _SchoolScholarship(name: 'CFNC.org Scholarship Search', amount: 'Varies', details: 'Search hundreds of NC scholarships matched to Alamance County students.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
];

// ── HUNT HIGH SCHOOL (WILSON COUNTY) ────────────────────────────
const List<_SchoolScholarship> _huntScholarships = [
  _SchoolScholarship(name: 'Couch Oil Cares Scholarship', amount: 'Varies', details: 'For Wilson and surrounding county students accepted as first-year college students. Max age 25. Min 2.5 GPA. Deadline: May 1.', url: 'https://sites.google.com/wcpss.net/whsstudentservices/college-planning/scholarships'),
  _SchoolScholarship(name: 'Wilson County Schools Scholarship Information', amount: 'Varies', details: 'Wilson County Schools posts all current local and district-wide scholarship opportunities. Check with your Hunt HS counselor for the most current list.', url: 'https://www.wilsonschoolsnc.net/families/scholarship-information'),
  _SchoolScholarship(name: 'Bridging the Dream Scholarship', amount: 'Up to USD 10,000', details: 'Financial need, academic achievement, extracurricular involvement. 40 awards nationally. Deadline: Apr. 25. Apply at salliemae.com.', url: 'https://www.salliemae.com/landing/bridging-the-dream/'),
  _SchoolScholarship(name: 'Barton College Scholarships', amount: 'Varies', details: 'Hunt graduates attending Barton College in Wilson may qualify for institutional merit scholarships. Check barton.edu for current awards.', url: 'https://www.barton.edu/admissions/scholarships/'),
  _SchoolScholarship(name: 'Golden LEAF Scholarship', amount: 'USD 12,000', details: 'NC students from rural and economically distressed communities. FAFSA required. Apply at CFNC by March 1.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
  _SchoolScholarship(name: 'NC Need-Based Grant', amount: 'Up to USD 9,300/yr', details: 'NC residents with financial need attending NC colleges. Apply via FAFSA.', url: 'https://www.cfnc.org/pay-for-college/financial-aid/nc-need-based-grant/'),
  _SchoolScholarship(name: 'NextNC Scholarship', amount: 'USD 3,000-USD 5,000/yr', details: 'NC public high school senior. Family income under USD 80,000. Submit FAFSA by June 1.', url: 'https://nextncscholarship.org/'),
  _SchoolScholarship(name: 'QuestBridge Match Scholarship', amount: 'Full Ride', details: 'High-achieving, low-income first-gen students. Open to undocumented/DACA. Deadline: Sept. 26.', url: 'https://www.questbridge.org'),
  _SchoolScholarship(name: 'CFNC.org Scholarship Search', amount: 'Varies', details: 'Search hundreds of NC scholarships matched to Wilson County students.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
];

// ── iMECK ACADEMY (MECKLENBURG COUNTY) ──────────────────────────
const List<_SchoolScholarship> _imeckScholarships = [
  _SchoolScholarship(name: 'Foundation for the Carolinas Scholarships', amount: 'Varies', details: 'Nearly 150 scholarship funds for Charlotte and Mecklenburg County students. Apply at fftcscholarships.communityforce.com.', url: 'https://fftcscholarships.communityforce.com'),
  _SchoolScholarship(name: 'shift-ed Scholarship', amount: 'Last-dollar tuition', details: 'For CMS graduates covering remaining tuition at NC public colleges. Apply through shift-ed.org.', url: 'https://shift-ed.org/'),
  _SchoolScholarship(name: 'PEARL Scholarships', amount: 'USD 1,500', details: 'Academic, character, and financial need-based for Mecklenburg County graduating seniors. Apply through Smart Start of Mecklenburg County.', url: 'https://www.smartstartofmeck.org/scholarship-opps/'),
  _SchoolScholarship(name: 'Advocates for African Americans Carolinas Scholarship', amount: 'Varies', details: 'Duke Energy employee resource group scholarship for African American students in Charlotte area. Apply through Foundation for the Carolinas.', url: 'https://fftcscholarships.communityforce.com'),
  _SchoolScholarship(name: 'NC Need-Based Grant', amount: 'Up to USD 9,300/yr', details: 'NC residents with financial need attending NC colleges. Apply via FAFSA.', url: 'https://www.cfnc.org/pay-for-college/financial-aid/nc-need-based-grant/'),
  _SchoolScholarship(name: 'NextNC Scholarship', amount: 'USD 3,000-USD 5,000/yr', details: 'NC public high school senior. Family income under USD 80,000. Submit FAFSA by June 1.', url: 'https://nextncscholarship.org/'),
  _SchoolScholarship(name: 'QuestBridge Match Scholarship', amount: 'Full Ride', details: 'High-achieving, low-income first-gen students. Open to undocumented/DACA. Deadline: Sept. 26.', url: 'https://www.questbridge.org'),
  _SchoolScholarship(name: 'CFNC.org Scholarship Search', amount: 'Varies', details: 'Search hundreds of NC scholarships matched to Mecklenburg County students.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
];

// ── J.M. MOREHEAD HIGH SCHOOL (ROCKINGHAM COUNTY) ───────────────
const List<_SchoolScholarship> _moreheadScholarships = [
  _SchoolScholarship(name: 'Pearl Berlin Scholarship', amount: 'Varies', details: 'LGBTQ+ students and allies in Rockingham County. Courage and leadership required. Apply through CFGG portal.', url: 'https://cfgg.org/students/'),
  _SchoolScholarship(name: 'J. Howard Coble Scholarship', amount: 'Varies', details: 'Students demonstrating leadership and good citizenship. Priority for children of military/veterans, Scouts, and ROTC. Must reside in Rockingham County. Apply through school counselor.', url: 'https://sites.google.com/randolph.k12.nc.us/thscounseling/local-scholarships'),
  _SchoolScholarship(name: 'NC Community Foundation Rockingham County Scholarships', amount: 'USD 1,000+', details: 'Multiple scholarships for Rockingham County students. Apply using NCCF Universal Application. Opens Dec. 16, closes March 3.', url: 'https://www.nccommunityfoundation.org/scholarships'),
  _SchoolScholarship(name: 'Rockingham Community College Foundation', amount: 'Varies', details: 'For students attending RCC. Multiple merit and need-based scholarships available. Apply through RCC financial aid office.', url: 'https://www.rockinghamcc.edu/current-students/financial-aid/scholarships/'),
  _SchoolScholarship(name: 'NC Farm Bureau R. Flake Shaw Scholarship', amount: 'Varies', details: 'For NC students planning to enroll full-time at any NC college. Rural county priority. Apply through NC Farm Bureau. Deadline: Apr. 1.', url: 'https://www.ncfb.org/about-us/scholarships/'),
  _SchoolScholarship(name: 'Golden LEAF Scholarship', amount: 'USD 12,000', details: 'NC students from rural and economically distressed communities. FAFSA required. Apply at CFNC by March 1.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
  _SchoolScholarship(name: 'NC Need-Based Grant', amount: 'Up to USD 9,300/yr', details: 'NC residents with financial need attending NC colleges. Apply via FAFSA.', url: 'https://www.cfnc.org/pay-for-college/financial-aid/nc-need-based-grant/'),
  _SchoolScholarship(name: 'NextNC Scholarship', amount: 'USD 3,000-USD 5,000/yr', details: 'NC public high school senior. Family income under USD 80,000. Submit FAFSA by June 1.', url: 'https://nextncscholarship.org/'),
  _SchoolScholarship(name: 'QuestBridge Match Scholarship', amount: 'Full Ride', details: 'High-achieving, low-income first-gen students. Open to undocumented/DACA. Deadline: Sept. 26.', url: 'https://www.questbridge.org'),
  _SchoolScholarship(name: 'CFNC.org Scholarship Search', amount: 'Varies', details: 'Search hundreds of NC scholarships matched to Rockingham County students.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
];

// ── JAMES B. DUDLEY HIGH SCHOOL — REAL DATA ────────────────────
const List<_SchoolScholarship> _dudleyScholarships = [
  _SchoolScholarship(name: 'Gates Scholarship', amount: 'Tuition, room and board', details: 'Deadline: September 15,2025. All seniors. High school seniors with a 3.3GPA or higher who identify as African- American, American Indian/Alaska Native*, Asian & Pacific Islander American, and/or Hispanic American, and ar', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'QuestBridge Match Scholarship', amount: 'Tuition, room and board, books/supplies, travel expenses at partner institutes', details: 'Deadline: September 30,2025. All seniors. High school seniors in the top 10% with SAT scores above 1300 or ACT scores above 28 who have faced financial hardships.', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'Sallie Mae No Essay Scholarship', amount: 'USD 2, 000', details: 'Deadline: October 31st, 2025. Juniors and Seniors. 2. A student currently enrolled in a U.S. college or university.', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'Coca Cola Scholarship', amount: 'USD 20,000 per year', details: 'Deadline: September 30, 2025. All seniors. High school senior with a 3.0 GPA or greater who has demonstrated their capacity to lead and serve in their schools and community.', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'UNC Morehead Cain Scholarship', amount: 'Tuition, room and board at UNC-Chapel Hill', details: 'Deadline: Endorsement Form Due September 18th. All seniors. High school senior with a 4.0 GPA interested in UNC Chapel Hill who have demonstrated scholarship, leadership, character, and physical vigor. *must also apply t', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'AES Engineering Scholarship', amount: '500', details: 'Deadline: October 8, 2025. All seniors. High School Seniors who are motivated in furthering their education. Applicants do not need to be interested/studying engineering. Must answer essay questions in 500-1000 words.', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'UNC Charlotte Levine Scholarship', amount: 'Tuition, room and board at UNC Charlotte', details: 'Deadline: Endorsement Form Due Octoberber 6th. All seniors. High school senior with a 3.5 GPA interested in UNC Charlotte who demonstrates academic achievement, leadership, and character.', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'Niche Scholarship', amount: '40000', details: 'Deadline: October 15,2025. All seniors. and then contacted directly and announced in Niches e-newsletter and on the Scholarship Winners page.', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'Robertson Scholars', amount: 'eight semesters of full tuition, room and board, and most mandatory fees for Scholars at Duke and UNC-Chapel Hill &  enrichment experiences', details: 'Deadline: October 15, 2025. All seniors. High school seniors who demonstrate high academic success, purposeful leadership, strength of character, intellectual curiosity, and collaborative spirit who are interested in att', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'Chick-fil-A Community Scholars Program', amount: 'Up to USD 25,000 (13 awards given)', details: 'Deadline: October 28,2025. All Seniors. to application. You will be asked to share in what ways you were able to make an impact', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'Overcoming Adversity Through Sports Scholarship', amount: '2000', details: 'Deadline: October 30,2025. Senior Ahtlete. Plans to attend an acredited college or university in the U.S.', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'Omega Psi Phi Fraternity,Inc. International High School Essay Contest', amount: '1st USD 5,000: 2nd USD 3,000; 3rd USD 2,000; 4th USD 1,000', details: 'Deadline: October 31st, 2025. All seniors. Highschool seniors who submit an essay application through a Chapter of the Fraternity.', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'Golden Door Scholars', amount: 'Tuition, room and board', details: 'Deadline: Application Due October 31, 2025. For High School Seniors with DACA status. Strong preference will be given to students who plan to study Engineering, Computer Science, Technology or Math. Gpa Requirement of 3.', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'Big Future Scholarships', amount: 'USD 500 &  USD 40,000 Monthly drawings until February, 2025', details: 'Deadline: October 31,2025. High school seniors. High school seniors who are attending college or university no later than Fall 2026', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'Voice of Democracy Scholarship', amount: '', details: 'Deadline: October 31, 2025. 9th-12th grade students. High school students (9th-12th grade) who are enrolled in a public, private, or parochial high school or home study program in the United States', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'UNC Charlotte Levine Scholarship', amount: 'Tuition, room and board at UNC Charlotte', details: 'Deadline: November 1,2025 Honor College Application                                                                                                          November 15,2025 Scholarship Application. All seniors. High sch', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'Track to the Trades', amount: '2500', details: 'Deadline: November 7th, 2025. current trade school student or high school. Any current trade school student or high school senior who will enroll in trade school after graduation may apply for this scholarship if they’re', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'Cheatham-White Scholarship at NC A&T or NCCU', amount: '', details: 'Deadline: Application for scholarship. All seniors. Apply NC A & T https://bit.ly/3lvUOFe', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'Regeneron Science Talent Search', amount: '250000', details: 'Deadline: November 6,2025. All seniors. High school seniors who submit original work in a critically important scientific study.', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'Jack Kent Cooke Scholarship', amount: 'Receive up to USD 55,000 per year for 4 years', details: 'Deadline: November 12. 2025. All seniors. All high school students, regardless of citizenship, with an unweighted GPA of 3.75 or above and who demonstrate significant unmet financial need. Must showcase persistence and l', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'Greenhouse Scholars', amount: 'USD 20,000 over 4 years; Scholars can additionally receive up to USD 6,000 annually through Flex Funding grants to use towards personal, professional, or academic enrichment.', details: 'Deadline: Round 1: November 13,2025. All seniors. High school seniors living in North Carolina with a 3.5 GPA or higher and demonstrated financial need. Applicants must possess excellent leadership skills, an ability to ', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'Dowdy Scholars Enrichment Program at NC A&T', amount: 'full 4-year renewable scholarship which includes tuition and related fees, room and board. May also use award to study abroad (fall and spring only)', details: 'Deadline: . All seniors. High school seniors with 3.75 GPA or above, minimum SAT (Math & Evidence-Based Reading) score of 1270 or minimum ACT of 27*, and must show exceptional characteristics of leadership', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'February 1 Scholars at NC A&T', amount: 'Tuition, student fees, housing, and meals', details: 'Deadline: November 15,2025. All seniors. High school seniors with 3.75 GPA or above, minimum SAT (Math & Evidence-Based Reading) score of 1270 or minimum ACT of 27*. Must pursue a degree within the College of Arts, Human', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'Odenza Marketing Group Scholarship', amount: '500', details: 'Deadline: November 15,2025. Everyone ages 16-25. Students (ages 16-25) who have a GPA of 2.5 or higher.', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'SM Scholarship', amount: '2000', details: 'Deadline: November 30,2025. High School junior or senior. a student who is currently enrolled as a high school junior or senior who intends to enroll in an accredited college or university located with the United States,', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'Dell Scholars', amount: '', details: 'Deadline: . High school seniors. Plan to enroll full-time in a bachelor’s degree program right after high school.', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'Barbara Lotze Scholarship', amount: '3000', details: 'Deadline: Decemeber 1, 2025. All seniors who have been accepted to a 2 or 4-year college/university. All high school seniors who have been accepted into a 2 or 4-year college/university who plan on becoming a physics tea', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'Lamber-Goodnow Scholarships', amount: '', details: 'Deadline: . . https://lambergoodnow.com/lg-scholarships/', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'McGovern Legacy Scholarship', amount: '1000', details: 'Deadline: December 6,2025. High school senior in foster care. Must currently be in foster care or aged out of foster care.', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'North Carolina State Elks Association Nursing Scholarship', amount: '1000', details: 'Deadline: December 9,2025. High school seniors. Applicants must submit a letter of recommendation, must display financial need', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'Burger King General High School Senior Track Scholarship', amount: '1000', details: 'Deadline: December 15,2025. High School Senior. Applicant must be a U.S. citizen, have a cumulitive GPA of 2.0 or higher and plan to enroll into an accredited 2 or 4 year college. https://app.goingmerry.com/scholarships/', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'Burger King Scholars', amount: 'USD 1,000-USD 50,000', details: 'Deadline: . All high school seniors and Burger King employees. High school students with  a 2.5 gpa or higher, demonstrate community involvement through volunteering, sports, clubs and/or religious organizations', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'RonranGlee Literary Scholarship', amount: '2000', details: 'Deadline: December 17,2025. HIgh School Senior. Applicant  must write a short essay expounding your understanding of the writers underlying meaning.', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'Amazon Future Engineer Scholarship', amount: 'USD  10,000 per year for 4 years for total of USD 40,000', details: 'Deadline: November 30th, 2025. High School Senior. Applicant must have completed or currently enrolled in a computer science course (if not a brief assessemt is available) . Applicant must plan to obatin a bachelors degr', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'Hispanic League Scholarship', amount: '', details: 'Deadline: . HIgh school senior of Hispanic/ Latino descent. Applicant must be Hispanic or Latino with minimun GPA  2.70', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'Path to Pro Scholarship Program', amount: '', details: 'Deadline: December 31,2025. high school senior, high school graduate or have a GED equivalent. Focused on Carpentry, Electrical, HVAC, Plumbing, or Construction Management', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'Winter Wonderland Scholarship', amount: '2000', details: 'Deadline: December 31,2025. 13 or older. https://www.collegexpress.com/reg/signup?campaign=winterwonderland&utm_campaign=studentscholarships&utm_medium=link&utm_source=studentscholarships', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'MIT THINK Scholars Program', amount: 'USD 1000 All expenses paid trip to MIT that includes: • Meetings with MIT professors in the finalists’ area of interest • Personalized tours of MIT research laboratories • Attending MIT classes and experiencing MIT st...', details: 'Deadline: January 1,2026. All high school students. Full-time high school students must submit a project proposal that can be completed in one semester with a USD 1,000 budget. Ideas span many fields, from green technolo', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'Reagan Foundation Scholarship Program', amount: 'USD 10,000 per year for 4 years', details: 'Deadline: Janurary 5,2026. All Seniors. High school seniors with a 3.0 GPA on a 4.0 scale, must be a US citizen with demonstrated leadership and community involvement.', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'Taco Bell Live Más Scholarship (Taco Bell Foundation)', amount: 'Amount varies, award up to USD 1 million total', details: 'Deadline: January 6, 2026. All seniors. High school seniors with a life passion will submit a 2-minute video explaining why you should be considered for a Live Más Scholarship', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'Jackie Robinson Foundation Scholarship', amount: 'USD 35,000 over four years', details: 'Deadline: January 7,2026. Minority high school seniors. High school seniors that will enroll in a 4-year college/university with at least a 4.0 GPA, demonstrated community service/involvement and academic success.', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'FloSports Indoor Track & Field Scholarship', amount: '1000', details: 'Deadline: January 9,2026. . 4. Must complete graduation requirements in 2026 Spring semester from an NCHSAA member high school and plan to enroll, or already be enrolled, for the Fall 2026 semester in an accr', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'Elon Fellows and Scholars Programs', amount: 'USD 5,500 - USD 13,500 per year', details: 'Deadline: January 10,2026. All seniors. High school seniors who have applied to Elon and are interested in their Fellows or Scholarship programs (available to various majors including education, communications, business,', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'Profile in Courage Essay Scholarship', amount: 'Awards range from USD 100-10,000', details: 'Deadline: . All seniors. US citizens under the age of 20 years old', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'APIA Scholarship Program', amount: 'Award ranges from USD 2,500-USD 20,000', details: 'Deadline: January 15,2026. Asian-American seniors. High school seniors who are of Asian or Pacific Islander ethnicity with a 2.7+ GPA on a 4.0 scale and will be attending college in the Fall.', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'The Bezos Scholars Program', amount: 'Year-long leadership program', details: 'Deadline: January 15,2026. All juniors. High school juniors with demonstrated leadership in their school and/or community, have taken the PSAT/ACT/SAT, and have a strong academic record.', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'Profile in Courage Essay Scholarship', amount: 'Awards range from USD 100-10,000', details: 'Deadline: January 12,2026. All seniors. The contest is open to United States high school students in grades nine through twelve attending public, private, parochial, or home schools; U.S. students under the age of twenty', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'John Lennon Scholarships', amount: '(3) USD 20,000', details: 'Deadline: January 15,2026. Age 17-25 by Feb 15, 2026. Emphasize originality and emotional impact in your composition, reflecting John Lennons legacy of innovation and storytelling.', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'Mary Morrow- Edna Richards Scholarships', amount: 'Amount varies', details: 'Deadline: January 30,2026. Seniors. Applicants must be North Carolina residents enrolled or who plan to enroll in a teacher-education program. Applicants must be in their  SENIOR IN HIGH SCHOOL and willing to teach i', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'A Better Financial Future Scholarship', amount: '2000', details: 'Deadline: January 31,2026. Seniors. One (1) entry will be selected at random at the end of the Scholarship entry window. The drawings will be performed by an employee of LeverEdge Association, whose decisions are fin', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'Kay Hagan Memorial Scholarship', amount: 'USD 1,000 (renewable up to 4 years)', details: 'Deadline: February 1,2026. All seniors. This scholarship is intended for a female high school senior with a passion for community and civic leadership.', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'Future Food Scholarship Competition', amount: 'Select participants will be awarded JWU academic scholarships, with finalists invited to a JWU campus (Providence or Charlotte) to showcase their recipe in person for top scholarship consideration.', details: 'Deadline: February 1,2026. Seniors. The Scholarship application process is open to U.S. high school seniors who have applied, been accepted, or deposited to an eligible on-ground JWU undergraduate program before Febr', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'The John R. Kernodle, Jr. Memorial Teaching Scholarship', amount: 'USD 10,000 renewable', details: 'Deadline: February 1,2026. . The John R. Kernodle, Jr. Memorial Teaching Scholarship was established in1996 for the purpose of awarding a USD 10,000 per year renewable scholarship to a senior at a Guilford Cou', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'GCS Schools Only', amount: '', details: 'Deadline: . All Seniors. Apply here: https://cfgg.org/students/', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: '2026 DR. MARTIN L. KING JR SCHOLARSHIP', amount: 'Amount varies', details: 'Deadline: February 2,2026. Seniors. This scholarship is awarded by the North Carolina Association of Educators (NCAE) and the North Carolina Foundation for Public School Children (NCFPSC) to North Carolina high schoo', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'Cheatham-White Merit Scholarship (NC A&T and NC Central)', amount: 'Full Ride (tuition, fees, housing, meals, textbooks)', details: 'School endorsement required. Covers NC A&T or NC Central University for 4 years. Contact Ms. Wilkinson at wilkinf@gcsnc.com. Apply through DHS counseling. Deadline: TBD.', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'Morehead-Cain Scholarship (UNC-Chapel Hill)', amount: 'Full Ride', details: 'Highly competitive. School endorsement required. Access the Dudley endorsement form at tinyurl.com/DHSMoreheadCain. Contact Ms. Wilkinson. Deadline: Oct. 1.', url: 'https://dudleyhs.gcsnc.com/counseling-department/scholarship-information'),
  _SchoolScholarship(name: 'DHS PTSA Scholarships', amount: 'Varies', details: 'Scholarships offered directly by the Dudley PTSA for graduating seniors. Contact the PTSA or see the counseling page for current awards.', url: 'https://dudleyhs.gcsnc.com/parents-61/ptsa/dhs-ptsa-scholarships'),
];

// ── JORDAN-MATTHEWS HIGH SCHOOL (CHATHAM COUNTY) ─────────────────
const List<_SchoolScholarship> _jordanMatthewsScholarships = [
  _SchoolScholarship(name: 'Jay Spence Memorial Scholarship', amount: 'USD 2,000/yr (renewable up to USD 8,000)', details: 'For college-bound graduating seniors and alumni from Jordan-Matthews High School and Chatham Charter. Must identify as Christian and have a passion for making a difference. Renewable with good academic standing.', url: 'https://scholarships360.org/scholarships/top-north-carolina-scholarships/'),
  _SchoolScholarship(name: 'Chatham County Scholarship (Durham-Orange-Wake-Chatham)', amount: 'Varies', details: 'Permanent residents of Chatham County planning to attend a 4-year public or private NC college. Min 2.5 GPA, financial need, commitment to community. Apply through Access Scholarships portal.', url: 'https://accessscholarships.com/scholarships-by-state/north-carolina-scholarships/'),
  _SchoolScholarship(name: 'Reginald and Mildred Womble Scholarship', amount: 'USD 2,500', details: 'Chatham County seniors planning to attend an HBCU. Apply through GWCCEC.', url: 'https://cfgg.org/students/'),
  _SchoolScholarship(name: 'Central Carolina Community College Foundation', amount: 'Varies', details: 'For students attending CCCC in Harnett, Lee, or Chatham County. Multiple scholarships available. Apply through CCCC financial aid.', url: 'https://www.cccc.edu/foundation/scholarships/'),
  _SchoolScholarship(name: 'CCHS Scholarship Page', amount: 'Varies', details: 'Check the official Jordan-Matthews scholarship page for current local and state opportunities updated by the school counselor.', url: 'https://www.chatham.k12.nc.us/o/jmhs'),
  _SchoolScholarship(name: 'NC Need-Based Grant', amount: 'Up to USD 9,300/yr', details: 'NC residents with financial need attending NC colleges. Apply via FAFSA.', url: 'https://www.cfnc.org/pay-for-college/financial-aid/nc-need-based-grant/'),
  _SchoolScholarship(name: 'NextNC Scholarship', amount: 'USD 3,000-USD 5,000/yr', details: 'NC public high school senior. Family income under USD 80,000. Submit FAFSA by June 1.', url: 'https://nextncscholarship.org/'),
  _SchoolScholarship(name: 'Golden LEAF Scholarship', amount: 'USD 12,000', details: 'NC students from rural and economically distressed communities. FAFSA required. Apply at CFNC by March 1.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
  _SchoolScholarship(name: 'QuestBridge Match Scholarship', amount: 'Full Ride', details: 'High-achieving, low-income first-gen students. Open to undocumented/DACA. Deadline: Sept. 26.', url: 'https://www.questbridge.org'),
  _SchoolScholarship(name: 'CFNC.org Scholarship Search', amount: 'Varies', details: 'Search hundreds of NC scholarships matched to Chatham County students.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
];

// ── JULIUS L. CHAMBERS HIGH SCHOOL (MECKLENBURG COUNTY) ─────────
const List<_SchoolScholarship> _chambersScholarships = [
  _SchoolScholarship(name: 'Foundation for the Carolinas Scholarships', amount: 'Varies', details: 'Nearly 150 scholarship funds for Charlotte and Mecklenburg County students. Apply at fftcscholarships.communityforce.com.', url: 'https://fftcscholarships.communityforce.com'),
  _SchoolScholarship(name: 'CMS Orphan Scholarship', amount: 'Varies', details: 'For graduating CMS seniors who have experienced the death of one or both parents. Must be a legal Mecklenburg County resident planning a 4-year degree. Apply through Foundation for the Carolinas.', url: 'https://fftcscholarships.communityforce.com'),
  _SchoolScholarship(name: 'Brighthouse Scholar Connections', amount: 'Up to USD 10,000/yr (renewable)', details: 'For underrepresented Charlotte-area students. Up to USD 40,000 total over 4 years. Need-based. Apply through Brighthouse.', url: 'https://www.scholarships.com/financial-aid/college-scholarships/scholarships-by-state/north-carolina-scholarships'),
  _SchoolScholarship(name: 'shift-ed Scholarship', amount: 'Last-dollar tuition', details: 'For CMS graduates covering remaining tuition at NC public colleges. Apply through shift-ed.org.', url: 'https://shift-ed.org/'),
  _SchoolScholarship(name: 'Ron Brown Scholar Program', amount: 'USD 10,000/yr', details: 'For African American seniors with exceptional academic achievement, leadership, and community involvement. Apply at ronbrown.org.', url: 'https://ronbrown.org/apply/ron-brown-scholarship/'),
  _SchoolScholarship(name: 'PEARL Scholarships', amount: 'USD 1,500', details: 'Academic, character, and financial need-based for Mecklenburg County graduating seniors. Apply through Smart Start of Mecklenburg County.', url: 'https://www.smartstartofmeck.org/scholarship-opps/'),
  _SchoolScholarship(name: 'Advocates for African Americans Carolinas Scholarship', amount: 'Varies', details: 'Duke Energy employee resource group scholarship for African American students in Charlotte area. Apply through Foundation for the Carolinas.', url: 'https://fftcscholarships.communityforce.com'),
  _SchoolScholarship(name: 'NC Need-Based Grant', amount: 'Up to USD 9,300/yr', details: 'NC residents with financial need attending NC colleges. Apply via FAFSA.', url: 'https://www.cfnc.org/pay-for-college/financial-aid/nc-need-based-grant/'),
  _SchoolScholarship(name: 'NextNC Scholarship', amount: 'USD 3,000-USD 5,000/yr', details: 'NC public high school senior. Family income under USD 80,000. Submit FAFSA by June 1.', url: 'https://nextncscholarship.org/'),
  _SchoolScholarship(name: 'QuestBridge Match Scholarship', amount: 'Full Ride', details: 'High-achieving, low-income first-gen students. Open to undocumented/DACA. Deadline: Sept. 26.', url: 'https://www.questbridge.org'),
  _SchoolScholarship(name: 'CFNC.org Scholarship Search', amount: 'Varies', details: 'Search hundreds of NC scholarships matched to Mecklenburg County students.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
];

// ── KINSTON HIGH SCHOOL (LENOIR COUNTY) ─────────────────────────
const List<_SchoolScholarship> _kinstonScholarships = [
  _SchoolScholarship(name: 'Tri-County EMC Scholarship (USD 750)', amount: 'USD 750', details: 'For Kinston High School seniors who are a member, child of a member, or live in a home served by Tri-County Electric. Attending a 4-year university. Apply through Tri-County EMC.', url: 'https://scholarships360.org/scholarships/top-north-carolina-scholarships/'),
  _SchoolScholarship(name: 'Tri-County EMC Scholarship (USD 250)', amount: 'USD 250', details: 'For Kinston High School seniors who are a member, child of a member, or live in a home served by Tri-County Electric. Attending a junior college, community college, vocational, or technical college. Apply through Tri-County EMC.', url: 'https://scholarships360.org/scholarships/top-north-carolina-scholarships/'),
  _SchoolScholarship(name: 'NC Community Foundation Lenoir County Scholarships', amount: 'USD 1,000+', details: 'Multiple scholarships for Lenoir County students. Apply using NCCF Universal Application. Opens Dec. 16, closes March 3.', url: 'https://www.nccommunityfoundation.org/scholarships'),
  _SchoolScholarship(name: 'Lenoir Community College Foundation', amount: 'Varies', details: 'For students attending LCC. Multiple merit and need-based scholarships. Apply through LCC financial aid office.', url: 'https://www.lenoircc.edu/student-services/financial-aid/scholarships/'),
  _SchoolScholarship(name: 'Golden LEAF Scholarship', amount: 'USD 12,000', details: 'NC students from rural and economically distressed communities. Lenoir County qualifies strongly. FAFSA required. Apply at CFNC by March 1.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
  _SchoolScholarship(name: 'NC Need-Based Grant', amount: 'Up to USD 9,300/yr', details: 'NC residents with financial need attending NC colleges. Apply via FAFSA.', url: 'https://www.cfnc.org/pay-for-college/financial-aid/nc-need-based-grant/'),
  _SchoolScholarship(name: 'NextNC Scholarship', amount: 'USD 3,000-USD 5,000/yr', details: 'NC public high school senior. Family income under USD 80,000. Submit FAFSA by June 1.', url: 'https://nextncscholarship.org/'),
  _SchoolScholarship(name: 'QuestBridge Match Scholarship', amount: 'Full Ride', details: 'High-achieving, low-income first-gen students. Open to undocumented/DACA. Deadline: Sept. 26.', url: 'https://www.questbridge.org'),
  _SchoolScholarship(name: 'CFNC.org Scholarship Search', amount: 'Varies', details: 'Search hundreds of NC scholarships matched to Lenoir County students.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
];

// ── LEXINGTON SENIOR HIGH SCHOOL (DAVIDSON COUNTY) ───────────────
const List<_SchoolScholarship> _lexingtonScholarships = [
  _SchoolScholarship(name: 'Winston-Salem Foundation Scholarships', amount: 'Varies', details: 'For students in Davidson County. Numerous scholarships with varying requirements. Apply through the Winston-Salem Foundation portal.', url: 'https://www.wsfoundation.org/grants-scholarships/scholarships/'),
  _SchoolScholarship(name: 'Nido Qubein Scholarship', amount: 'Varies', details: 'Must reside in High Point, Archdale, or Trinity city limits for 24+ months. Full-time enrollment at any NC college. Good grades and financial need. FAFSA required. Multiple items needed - start early. See counselor.', url: 'https://sites.google.com/randolph.k12.nc.us/thscounseling/local-scholarships'),
  _SchoolScholarship(name: 'Salem Glen College Assistance Program', amount: 'Varies', details: 'Helps adults return to school for a 2-year degree or career certification from Davidson-Davie County Community College. Includes mentor pairing. Apply through Salem Glen.', url: 'https://www.scholarships.com/financial-aid/college-scholarships/scholarships-by-state/north-carolina-scholarships'),
  _SchoolScholarship(name: 'Davidson-Davie Community College Foundation', amount: 'Varies', details: 'For students attending Davidson-Davie CC. Multiple merit and need-based scholarships. Apply through DDCC financial aid office.', url: 'https://www.davidsondavie.edu/paying-for-college/scholarships/'),
  _SchoolScholarship(name: 'NC Community Foundation Davidson County Scholarships', amount: 'USD 1,000+', details: 'Multiple scholarships for Davidson County students. Apply using NCCF Universal Application. Opens Dec. 16, closes March 3.', url: 'https://www.nccommunityfoundation.org/scholarships'),
  _SchoolScholarship(name: 'NC Farm Bureau R. Flake Shaw Scholarship', amount: 'Varies', details: 'NC students from rural counties. Davidson County qualifies. Apply through NC Farm Bureau. Deadline: Apr. 1.', url: 'https://www.ncfb.org/about-us/scholarships/'),
  _SchoolScholarship(name: 'Golden LEAF Scholarship', amount: 'USD 12,000', details: 'NC students from rural and economically distressed communities. FAFSA required. Apply at CFNC by March 1.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
  _SchoolScholarship(name: 'NC Need-Based Grant', amount: 'Up to USD 9,300/yr', details: 'NC residents with financial need attending NC colleges. Apply via FAFSA.', url: 'https://www.cfnc.org/pay-for-college/financial-aid/nc-need-based-grant/'),
  _SchoolScholarship(name: 'NextNC Scholarship', amount: 'USD 3,000-USD 5,000/yr', details: 'NC public high school senior. Family income under USD 80,000. Submit FAFSA by June 1.', url: 'https://nextncscholarship.org/'),
  _SchoolScholarship(name: 'CFNC.org Scholarship Search', amount: 'Varies', details: 'Search hundreds of NC scholarships matched to Davidson County students.', url: 'https://www.cfnc.org/money-for-college/find-scholarships/'),
];

// ── FIND MY SCHOOL SCREEN ────────────────────────────────────────

class FindMySchoolScreen extends StatefulWidget {
  const FindMySchoolScreen({super.key});
  @override
  State<FindMySchoolScreen> createState() => _FindMySchoolScreenState();
}

class _FindMySchoolScreenState extends State<FindMySchoolScreen> {
  String? _selectedSchool;

  List<_SchoolScholarship> get _results =>
      _selectedSchool == null ? [] : _getScholarships(_selectedSchool!);

  @override
  Widget build(BuildContext context) {
    final results = _results;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Builder(builder: (ctx) => _Header(
          t(ctx, 'nav_timeline') == 'Timeline' ? 'Find My School' : 'Encontrar Mi Escuela',
          t(ctx, 'nav_timeline') == 'Timeline'
            ? 'Pick your high school to see scholarships matched to you.'
            : 'Elige tu escuela para ver becas que se ajustan a ti.',
        )),
        Expanded(child: ListView(padding: const EdgeInsets.all(16), children: [
          _Card(child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Your School. Your Scholarships.', style: TextStyle(color: navy, fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Select your high school and we will show you scholarships matched to students from your area. All links go to safe, verified sources.',
              style: TextStyle(color: Color(0xFF3D5A6E), fontSize: 13, height: 1.6)),
            SizedBox(height: 8),
            Row(children: [
              Icon(Icons.lock_outline, color: navy, size: 16), SizedBox(width: 8),
              Expanded(child: Text('No personal information collected — just select your school.',
                style: TextStyle(color: Color(0xFF1A5C8A), fontSize: 12))),
            ]),
          ])),
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12),
              border: Border.all(color: borderColor, width: 1.5),
              boxShadow: [BoxShadow(color: navy.withOpacity(0.05), blurRadius: 6)]),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _selectedSchool,
                isExpanded: true,
                hint: const Text('Select your high school...', style: TextStyle(color: textGray, fontSize: 13)),
                icon: const Icon(Icons.expand_more, color: navy),
                onChanged: (v) => setState(() => _selectedSchool = v),
                items: _ctecSchools.map((s) => DropdownMenuItem(
                  value: s,
                  child: Text(s, style: const TextStyle(color: green, fontSize: 13, fontWeight: FontWeight.w500)),
                )).toList(),
              ),
            ),
          ),
          if (_selectedSchool != null) ...[
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(color: navy, borderRadius: BorderRadius.circular(10)),
              child: Row(children: [
                const Icon(Icons.school, color: Colors.white, size: 20),
                const SizedBox(width: 10),
                Expanded(child: Text(_selectedSchool!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13))),
                Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(20)),
                  child: Text('\${results.length} scholarships / becas', style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold))),
              ]),
            ),
            ...results.map((s) => _SchoolScholarshipTile(scholarship: s)),
          ],
          if (_selectedSchool == null)
            Container(
              margin: const EdgeInsets.only(top: 8, bottom: 16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: navyPale, borderRadius: BorderRadius.circular(14),
                border: Border.all(color: borderColor)),
              child: const Column(children: [
                Icon(Icons.school, color: navy, size: 48),
                SizedBox(height: 12),
                Text('Select your school above', style: TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 15)),
                SizedBox(height: 6),
                Text('We will show you scholarships matched to students from your high school and community.',
                  style: TextStyle(color: textGray, fontSize: 13), textAlign: TextAlign.center),
              ]),
            ),
          const SizedBox(height: 8),
          _Card(color: navyPale, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Always Search CFNC Too / Busca También en CFNC', style: TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(height: 6),
            const Text('CFNC has hundreds of NC-specific scholarships updated every year. Free and takes 5 minutes. / CFNC tiene cientos de becas específicas de NC. Gratis y toma 5 minutos.', style: TextStyle(color: Color(0xFF3D5A6E), fontSize: 12, height: 1.5)),
            const SizedBox(height: 10),
            _CallBtn('Search CFNC.org / Buscar en CFNC', () => _openUrl('https://www.cfnc.org/money-for-college/find-scholarships/')),
            _CallBtn('Going Merry — One App, Many Scholarships', () => _openUrl('https://www.goingmerry.com')),
          ])),
          const SizedBox(height: 30),
        ])),
      ]),
    );
  }
}

class _SchoolScholarship {
  final String name, amount, details, url;
  const _SchoolScholarship({required this.name, required this.amount, required this.details, required this.url});
}

class _SchoolScholarshipTile extends StatelessWidget {
  final _SchoolScholarship scholarship;
  const _SchoolScholarshipTile({required this.scholarship});
  @override
  Widget build(BuildContext context) {
    final s = scholarship;
    return Container(
      margin: const EdgeInsets.only(bottom: 12), padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14),
        border: Border.all(color: borderColor, width: 1.5),
        boxShadow: [BoxShadow(color: navy.withOpacity(0.04), blurRadius: 6, offset: const Offset(0, 2))]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Container(width: 36, height: 36,
            decoration: BoxDecoration(color: navy.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
            child: const Icon(Icons.star, color: navy, size: 18)),
          const SizedBox(width: 12),
          Expanded(child: Text(s.name, style: const TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 14))),
        ]),
        const SizedBox(height: 8),
        Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(color: const Color(0xFFE8F5E9), borderRadius: BorderRadius.circular(6)),
          child: Text(s.amount, style: const TextStyle(color: Color(0xFF2E7D32), fontWeight: FontWeight.w600, fontSize: 12))),
        const SizedBox(height: 8),
        Text(s.details, style: const TextStyle(color: Color(0xFF3D5A6E), fontSize: 13, height: 1.5)),
        if (s.url.isNotEmpty) ...[
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () => _openUrl(s.url),
            child: Container(width: double.infinity, padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(color: navy, borderRadius: BorderRadius.circular(10)),
              child: const Center(child: Text('Apply / Solicitar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13))))),
        ],
      ]),
    );
  }
}


class _CollegeScholarshipPicker extends StatefulWidget {
  const _CollegeScholarshipPicker();
  @override
  State<_CollegeScholarshipPicker> createState() => _CollegeScholarshipPickerState();
}

class _CollegeScholarshipPickerState extends State<_CollegeScholarshipPicker> {
  String? _selectedCollege;

  @override
  Widget build(BuildContext context) {
    final results = _selectedCollege == null ? <_CollegeScholarship>[] : _getCollegeScholarships(_selectedCollege!);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor, width: 1.5),
          boxShadow: [BoxShadow(color: navy.withOpacity(0.05), blurRadius: 6)]),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: _selectedCollege,
            isExpanded: true,
            hint: const Text('Select a NC college... / Selecciona un colegio de NC...', style: TextStyle(color: textGray, fontSize: 13)),
            icon: const Icon(Icons.expand_more, color: navy),
            onChanged: (v) => setState(() => _selectedCollege = v),
            items: _ncColleges.map((s) => DropdownMenuItem(
              value: s,
              child: Text(s, style: const TextStyle(color: Color(0xFF2E7D32), fontSize: 13, fontWeight: FontWeight.w500)),
            )).toList(),
          ),
        ),
      ),
      if (_selectedCollege != null) ...[
        Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(color: const Color(0xFF2E7D32), borderRadius: BorderRadius.circular(10)),
          child: Row(children: [
            const Icon(Icons.account_balance, color: Colors.white, size: 18),
            const SizedBox(width: 8),
            Expanded(child: Text(_selectedCollege!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13))),
            Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(20)),
              child: Text('\${results.length} scholarships / becas', style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold))),
          ]),
        ),
        ...results.map((s) => _CollegeScholarshipTile(scholarship: s)),
      ],
    ]);
  }
}

class _CollegeScholarshipTile extends StatelessWidget {
  final _CollegeScholarship scholarship;
  const _CollegeScholarshipTile({required this.scholarship});
  @override
  Widget build(BuildContext context) {
    final s = scholarship;
    return Container(
      margin: const EdgeInsets.only(bottom: 12), padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14),
        border: Border.all(color: borderColor, width: 1.5),
        boxShadow: [BoxShadow(color: navy.withOpacity(0.04), blurRadius: 6, offset: const Offset(0, 2))]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Container(width: 36, height: 36,
            decoration: BoxDecoration(color: const Color(0xFF2E7D32).withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
            child: const Icon(Icons.school, color: Color(0xFF2E7D32), size: 18)),
          const SizedBox(width: 12),
          Expanded(child: Text(s.name, style: const TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 13))),
        ]),
        const SizedBox(height: 8),
        Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(color: const Color(0xFFE8F5E9), borderRadius: BorderRadius.circular(6)),
          child: Text(s.amount, style: const TextStyle(color: Color(0xFF2E7D32), fontWeight: FontWeight.w600, fontSize: 12))),
        if (s.deadline.isNotEmpty) ...[
          const SizedBox(height: 6),
          Row(children: [
            const Icon(Icons.calendar_today, size: 12, color: textGray),
            const SizedBox(width: 4),
            Expanded(child: Text('Deadline: \${s.deadline}', style: const TextStyle(color: textGray, fontSize: 11))),
          ]),
        ],
        if (s.reqs.isNotEmpty) ...[
          const SizedBox(height: 6),
          Text(s.reqs, style: const TextStyle(color: Color(0xFF3D5A6E), fontSize: 12, height: 1.4)),
        ],
        if (s.url.isNotEmpty) ...[
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () => _openUrl(s.url),
            child: Container(width: double.infinity, padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(color: const Color(0xFF2E7D32), borderRadius: BorderRadius.circular(10)),
              child: const Center(child: Text('Apply / Learn More', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13))))),
        ],
      ]),
    );
  }
}


Future<void> _callPhone(String number) async {
  final uri = Uri(scheme: 'tel', path: number);
  if (await canLaunchUrl(uri)) await launchUrl(uri);
}

Future<void> _openUrl(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) await launchUrl(uri, mode: LaunchMode.externalApplication);
}

// ── MAJOR EXPLORER QUIZ ──────────────────────────────────────────

class MajorExplorerScreen extends StatefulWidget {
  const MajorExplorerScreen({super.key});
  @override
  State<MajorExplorerScreen> createState() => _MajorExplorerScreenState();
}

class _MajorExplorerScreenState extends State<MajorExplorerScreen> {
  int _step = 0;
  final Map<int, int> _answers = {};
  bool _showResults = false;

  static final _questions = [
    _MajorQuestion(
      en: 'What sounds most like you after school?',
      es: '¿Qué te describe más después de la escuela?',
      options: [
        _MajorOption(en: 'Helping people through a tough time', es: 'Ayudar a personas en momentos difíciles', clusters: ['Health', 'Education', 'Social']),
        _MajorOption(en: 'Building or fixing something with my hands', es: 'Construir o arreglar algo con mis manos', clusters: ['Trades', 'Engineering']),
        _MajorOption(en: 'Solving a puzzle or figuring out how things work', es: 'Resolver un problema o entender cómo funcionan las cosas', clusters: ['STEM', 'Engineering', 'Business']),
        _MajorOption(en: 'Creating something — music, art, writing, video', es: 'Crear algo — música, arte, escritura, video', clusters: ['Arts', 'Communications']),
        _MajorOption(en: 'Running things and making decisions', es: 'Dirigir cosas y tomar decisiones', clusters: ['Business', 'Public Service']),
      ],
    ),
    _MajorQuestion(
      en: 'Which class do you actually enjoy (or enjoy most)?',
      es: '¿Cuál clase disfrutas más (o la que más te gusta)?',
      options: [
        _MajorOption(en: 'Science or Health', es: 'Ciencias o Salud', clusters: ['Health', 'STEM']),
        _MajorOption(en: 'Math', es: 'Matemáticas', clusters: ['STEM', 'Engineering', 'Business']),
        _MajorOption(en: 'English or Writing', es: 'Inglés o Escritura', clusters: ['Communications', 'Education', 'Arts']),
        _MajorOption(en: 'Shop, CTE, or Technology', es: 'Taller, CTE o Tecnología', clusters: ['Trades', 'Engineering', 'STEM']),
        _MajorOption(en: 'Social Studies or Government', es: 'Estudios Sociales o Gobierno', clusters: ['Public Service', 'Social', 'Business']),
      ],
    ),
    _MajorQuestion(
      en: 'What kind of work environment fits you best?',
      es: '¿Qué tipo de ambiente de trabajo te va mejor?',
      options: [
        _MajorOption(en: 'Outdoors or on a job site', es: 'Al aire libre o en un sitio de trabajo', clusters: ['Trades', 'Engineering']),
        _MajorOption(en: 'Hospital, clinic, or school', es: 'Hospital, clínica o escuela', clusters: ['Health', 'Education']),
        _MajorOption(en: 'Office or behind a computer', es: 'Oficina o frente a una computadora', clusters: ['Business', 'STEM', 'Communications']),
        _MajorOption(en: 'Stage, studio, or creative space', es: 'Escenario, estudio o espacio creativo', clusters: ['Arts', 'Communications']),
        _MajorOption(en: 'Community — courts, nonprofits, government', es: 'Comunidad — tribunales, organizaciones sin fines de lucro, gobierno', clusters: ['Public Service', 'Social']),
      ],
    ),
    _MajorQuestion(
      en: 'What would make you feel proud at the end of a workday?',
      es: '¿Qué te haría sentir orgulloso al final del día de trabajo?',
      options: [
        _MajorOption(en: 'I helped someone feel better or learn something', es: 'Ayudé a alguien a sentirse mejor o aprender algo', clusters: ['Health', 'Education', 'Social']),
        _MajorOption(en: 'I built something that will last', es: 'Construí algo que durará', clusters: ['Trades', 'Engineering']),
        _MajorOption(en: 'I solved a problem nobody else could', es: 'Resolví un problema que nadie más pudo', clusters: ['STEM', 'Engineering', 'Business']),
        _MajorOption(en: 'I created something that moved people', es: 'Creé algo que emocionó a la gente', clusters: ['Arts', 'Communications']),
        _MajorOption(en: 'I made something run better or more fairly', es: 'Hice que algo funcionara mejor o más justamente', clusters: ['Business', 'Public Service']),
      ],
    ),
    _MajorQuestion(
      en: 'How do you prefer to work?',
      es: '¿Cómo prefieres trabajar?',
      options: [
        _MajorOption(en: 'With people — talking, listening, helping', es: 'Con personas — hablando, escuchando, ayudando', clusters: ['Education', 'Social', 'Health', 'Communications']),
        _MajorOption(en: 'With tools, machines, or technology', es: 'Con herramientas, máquinas o tecnología', clusters: ['Trades', 'Engineering', 'STEM']),
        _MajorOption(en: 'With data, numbers, or research', es: 'Con datos, números o investigación', clusters: ['STEM', 'Business', 'Engineering']),
        _MajorOption(en: 'With ideas and creativity', es: 'Con ideas y creatividad', clusters: ['Arts', 'Communications', 'Business']),
        _MajorOption(en: 'On my own — independently', es: 'Solo — de manera independiente', clusters: ['Trades', 'STEM', 'Arts']),
      ],
    ),
    _MajorQuestion(
      en: 'What does money mean to you in a career?',
      es: '¿Qué significa el dinero para ti en una carrera?',
      options: [
        _MajorOption(en: 'I want to earn well — top salary matters', es: 'Quiero ganar bien — el salario alto importa', clusters: ['Engineering', 'Business', 'Health', 'STEM']),
        _MajorOption(en: 'Steady paycheck and good benefits', es: 'Sueldo estable y buenos beneficios', clusters: ['Trades', 'Education', 'Public Service']),
        _MajorOption(en: 'I want to do what I love, money is secondary', es: 'Quiero hacer lo que amo, el dinero es secundario', clusters: ['Arts', 'Social', 'Communications']),
        _MajorOption(en: 'I want to start my own business', es: 'Quiero iniciar mi propio negocio', clusters: ['Business', 'Trades']),
      ],
    ),
    _MajorQuestion(
      en: 'Pick the sentence that fits you most:',
      es: 'Elige la oración que más te describe:',
      options: [
        _MajorOption(en: 'I want to save lives or improve people\'s health', es: 'Quiero salvar vidas o mejorar la salud de las personas', clusters: ['Health']),
        _MajorOption(en: 'I want to teach, coach, or mentor the next generation', es: 'Quiero enseñar, entrenar o guiar a la próxima generación', clusters: ['Education']),
        _MajorOption(en: 'I want to design, code, or engineer solutions', es: 'Quiero diseñar, programar o desarrollar soluciones', clusters: ['Engineering', 'STEM']),
        _MajorOption(en: 'I want to run a business or climb the corporate ladder', es: 'Quiero manejar un negocio o crecer corporativamente', clusters: ['Business']),
        _MajorOption(en: 'I want to work in the community and make a difference', es: 'Quiero trabajar en la comunidad y marcar la diferencia', clusters: ['Social', 'Public Service']),
        _MajorOption(en: 'I want to create — music, art, film, writing', es: 'Quiero crear — música, arte, cine, escritura', clusters: ['Arts', 'Communications']),
        _MajorOption(en: 'I want to work with my hands and build things', es: 'Quiero trabajar con mis manos y construir cosas', clusters: ['Trades']),
      ],
    ),
    _MajorQuestion(
      en: 'How much school after high school are you open to?',
      es: '¿Cuánta escuela después de la secundaria estás dispuesto a hacer?',
      options: [
        _MajorOption(en: 'Trade or technical certificate (6 months – 2 years)', es: 'Certificado técnico o vocacional (6 meses – 2 años)', clusters: ['Trades']),
        _MajorOption(en: '2-year community college degree', es: 'Título de colegio comunitario de 2 años', clusters: ['Trades', 'Health', 'Business']),
        _MajorOption(en: '4-year university degree', es: 'Título universitario de 4 años', clusters: ['Education', 'Business', 'Communications', 'Social', 'Arts']),
        _MajorOption(en: 'Graduate school or professional degree (6-8+ years)', es: 'Posgrado o título profesional (6-8+ años)', clusters: ['Health', 'Engineering', 'STEM', 'Public Service']),
        _MajorOption(en: 'Not sure yet', es: 'Aún no estoy seguro/a', clusters: ['Health', 'Business', 'Education', 'STEM', 'Trades', 'Arts', 'Communications', 'Social', 'Engineering', 'Public Service']),
      ],
    ),
  ];

  static final _clusters = {
    'Health': _ClusterResult(
      nameEn: 'Health Sciences',
      nameEs: 'Ciencias de la Salud',
      emoji: '🏥',
      descEn: 'You care about people and want to make a real difference in their health and wellbeing.',
      descEs: 'Te importan las personas y quieres hacer una diferencia real en su salud y bienestar.',
      majorsEn: ['Nursing', 'Pre-Medicine', 'Radiology Technology', 'Dental Hygiene', 'Physical Therapy', 'Health Administration', 'Pharmacy', 'EMT/Paramedic'],
      majorsEs: ['Enfermería', 'Pre-Medicina', 'Tecnología de Radiología', 'Higiene Dental', 'Fisioterapia', 'Administración de Salud', 'Farmacia', 'EMT/Paramédico'],
      salaryEn: 'USD 45,000 – USD 120,000+/year depending on role',
      salaryEs: 'USD 45,000 – USD 120,000+/año según el rol',
      collegesEn: 'ECU (top nursing & health sciences), UNC-Chapel Hill, Fayetteville State, Pitt Community College, Robeson Community College',
      collegesEs: 'ECU (enfermería top), UNC-Chapel Hill, Fayetteville State, Pitt Community College, Robeson Community College',
      dayEn: 'Caring for patients, running tests, educating families, working as part of a medical team.',
      dayEs: 'Cuidar pacientes, realizar pruebas, educar a familias, trabajar en un equipo médico.',
    ),
    'Education': _ClusterResult(
      nameEn: 'Education & Teaching',
      nameEs: 'Educación y Enseñanza',
      emoji: '📚',
      descEn: 'You love helping others grow and learn. You have patience, energy, and a gift for explaining things.',
      descEs: 'Te encanta ayudar a otros a crecer y aprender. Tienes paciencia, energía y un don para explicar las cosas.',
      majorsEn: ['Elementary Education', 'Secondary Education', 'Special Education', 'Early Childhood Education', 'School Counseling', 'Physical Education', 'Educational Administration'],
      majorsEs: ['Educación Primaria', 'Educación Secundaria', 'Educación Especial', 'Educación Infantil', 'Consejería Escolar', 'Educación Física', 'Administración Educativa'],
      salaryEn: 'USD 35,000 – USD 75,000+/year. NC Teaching Fellows can help pay for school.',
      salaryEs: 'USD 35,000 – USD 75,000+/año. NC Teaching Fellows puede ayudar a pagar la escuela.',
      collegesEn: 'UNC-Pembroke, Fayetteville State, Appalachian State, NC Central, Winston-Salem State',
      collegesEs: 'UNC-Pembroke, Fayetteville State, Appalachian State, NC Central, Winston-Salem State',
      dayEn: 'Planning lessons, working with students, collaborating with colleagues, making learning come alive.',
      dayEs: 'Planificar clases, trabajar con estudiantes, colaborar con colegas, hacer que el aprendizaje cobre vida.',
    ),
    'STEM': _ClusterResult(
      nameEn: 'Science, Technology & Research',
      nameEs: 'Ciencia, Tecnología e Investigación',
      emoji: '🔬',
      descEn: 'You think analytically, love discovering how things work, and want to push the boundaries of knowledge.',
      descEs: 'Piensas analíticamente, te encanta descubrir cómo funcionan las cosas y quieres expandir el conocimiento.',
      majorsEn: ['Computer Science', 'Biology', 'Chemistry', 'Data Science', 'Environmental Science', 'Mathematics', 'Cybersecurity', 'Information Technology'],
      majorsEs: ['Ciencias de la Computación', 'Biología', 'Química', 'Ciencia de Datos', 'Ciencias Ambientales', 'Matemáticas', 'Ciberseguridad', 'Tecnología de la Información'],
      salaryEn: 'USD 55,000 – USD 130,000+/year. One of the highest-paying fields.',
      salaryEs: 'USD 55,000 – USD 130,000+/año. Uno de los campos mejor pagados.',
      collegesEn: 'NC State, UNC-Chapel Hill, NC A&T (top STEM HBCU), Duke, UNCG',
      collegesEs: 'NC State, UNC-Chapel Hill, NC A&T (HBCU top en STEM), Duke, UNCG',
      dayEn: 'Running experiments, writing code, analyzing data, building models, presenting findings.',
      dayEs: 'Realizar experimentos, escribir código, analizar datos, construir modelos, presentar hallazgos.',
    ),
    'Engineering': _ClusterResult(
      nameEn: 'Engineering & Technology',
      nameEs: 'Ingeniería y Tecnología',
      emoji: '⚙️',
      descEn: 'You are a problem-solver who thinks in systems and loves designing solutions that actually work.',
      descEs: 'Eres un solucionador de problemas que piensa en sistemas y ama diseñar soluciones que realmente funcionan.',
      majorsEn: ['Civil Engineering', 'Mechanical Engineering', 'Electrical Engineering', 'Computer Engineering', 'Biomedical Engineering', 'Industrial Engineering', 'Construction Management'],
      majorsEs: ['Ingeniería Civil', 'Ingeniería Mecánica', 'Ingeniería Eléctrica', 'Ingeniería de Computadoras', 'Ingeniería Biomédica', 'Ingeniería Industrial', 'Gestión de Construcción'],
      salaryEn: 'USD 65,000 – USD 140,000+/year. Strong job demand across NC.',
      salaryEs: 'USD 65,000 – USD 140,000+/año. Gran demanda laboral en todo NC.',
      collegesEn: 'NC State (top engineering), NC A&T, UNC Charlotte, Duke',
      collegesEs: 'NC State (ingeniería top), NC A&T, UNC Charlotte, Duke',
      dayEn: 'Designing systems, running tests, collaborating with teams, solving technical challenges.',
      dayEs: 'Diseñar sistemas, realizar pruebas, colaborar en equipo, resolver desafíos técnicos.',
    ),
    'Business': _ClusterResult(
      nameEn: 'Business & Entrepreneurship',
      nameEs: 'Negocios y Emprendimiento',
      emoji: '💼',
      descEn: 'You are driven, strategic, and want to lead. You see opportunities where others see problems.',
      descEs: 'Eres ambicioso, estratégico y quieres liderar. Ves oportunidades donde otros ven problemas.',
      majorsEn: ['Business Administration', 'Marketing', 'Finance', 'Accounting', 'Management', 'Entrepreneurship', 'Supply Chain', 'Human Resources'],
      majorsEs: ['Administración de Empresas', 'Mercadotecnia', 'Finanzas', 'Contabilidad', 'Gerencia', 'Emprendimiento', 'Cadena de Suministro', 'Recursos Humanos'],
      salaryEn: 'USD 45,000 – USD 120,000+/year. Extremely flexible career paths.',
      salaryEs: 'USD 45,000 – USD 120,000+/año. Caminos de carrera extremadamente flexibles.',
      collegesEn: 'UNC-Chapel Hill (Kenan-Flagler), Wake Forest, NC State, UNCW, Elon',
      collegesEs: 'UNC-Chapel Hill (Kenan-Flagler), Wake Forest, NC State, UNCW, Elon',
      dayEn: 'Analyzing markets, managing teams, building strategy, meeting with clients, solving operational problems.',
      dayEs: 'Analizar mercados, gestionar equipos, construir estrategias, reunirse con clientes, resolver problemas operativos.',
    ),
    'Trades': _ClusterResult(
      nameEn: 'Skilled Trades & Technical',
      nameEs: 'Oficios Especializados y Técnicos',
      emoji: '🔧',
      descEn: 'You are hands-on, practical, and want to see real results from your work. Trades are in high demand and pay well.',
      descEs: 'Eres práctico y quieres ver resultados reales de tu trabajo. Los oficios tienen alta demanda y pagan bien.',
      majorsEn: ['Electrical Technology', 'HVAC', 'Welding', 'Plumbing', 'Automotive Technology', 'Construction Trades', 'Culinary Arts', 'Cosmetology'],
      majorsEs: ['Tecnología Eléctrica', 'HVAC (Climatización)', 'Soldadura', 'Plomería', 'Tecnología Automotriz', 'Construcción', 'Artes Culinarias', 'Cosmetología'],
      salaryEn: 'USD 40,000 – USD 90,000+/year. Electricians and plumbers often earn USD 70,000+.',
      salaryEs: 'USD 40,000 – USD 90,000+/año. Los electricistas y plomeros frecuentemente ganan USD 70,000+.',
      collegesEn: 'Robeson Community College, Wake Tech, Central Piedmont CC, Cape Fear CC — all NC community colleges offer trades programs',
      collegesEs: 'Robeson Community College, Wake Tech, Central Piedmont CC, Cape Fear CC — todos los colegios comunitarios de NC ofrecen programas de oficios',
      dayEn: 'Installing systems, diagnosing problems, working on job sites, using specialized tools, serving customers.',
      dayEs: 'Instalar sistemas, diagnosticar problemas, trabajar en sitios de trabajo, usar herramientas especializadas, atender clientes.',
    ),
    'Arts': _ClusterResult(
      nameEn: 'Arts, Design & Media',
      nameEs: 'Arte, Diseño y Medios',
      emoji: '🎨',
      descEn: 'You are expressive, imaginative, and see the world differently. Your creativity is a real career skill.',
      descEs: 'Eres expresivo, imaginativo y ves el mundo de manera diferente. Tu creatividad es una habilidad de carrera real.',
      majorsEn: ['Graphic Design', 'Fine Arts', 'Film & Media Production', 'Music', 'Theatre', 'Animation', 'Interior Design', 'Photography'],
      majorsEs: ['Diseño Gráfico', 'Bellas Artes', 'Producción de Cine y Medios', 'Música', 'Teatro', 'Animación', 'Diseño de Interiores', 'Fotografía'],
      salaryEn: 'USD 35,000 – USD 85,000+/year. Freelance and entrepreneurship expand earning potential.',
      salaryEs: 'USD 35,000 – USD 85,000+/año. El trabajo independiente y el emprendimiento amplían el potencial de ingresos.',
      collegesEn: 'UNC School of the Arts, Elon (Communications), UNC-Chapel Hill, East Carolina University',
      collegesEs: 'UNC School of the Arts, Elon (Comunicaciones), UNC-Chapel Hill, East Carolina University',
      dayEn: 'Creating designs, editing video, performing, collaborating on creative projects, building portfolios.',
      dayEs: 'Crear diseños, editar video, actuar, colaborar en proyectos creativos, construir portafolios.',
    ),
    'Communications': _ClusterResult(
      nameEn: 'Communications & Media',
      nameEs: 'Comunicaciones y Medios',
      emoji: '📢',
      descEn: 'You connect with people through words, story, and media. You know how to make people listen.',
      descEs: 'Conectas con las personas a través de palabras, historias y medios. Sabes cómo hacer que la gente escuche.',
      majorsEn: ['Journalism', 'Public Relations', 'Broadcasting', 'Digital Media', 'English', 'Advertising', 'Social Media Management'],
      majorsEs: ['Periodismo', 'Relaciones Públicas', 'Radiodifusión', 'Medios Digitales', 'Inglés', 'Publicidad', 'Gestión de Redes Sociales'],
      salaryEn: 'USD 38,000 – USD 90,000+/year depending on specialization.',
      salaryEs: 'USD 38,000 – USD 90,000+/año según la especialización.',
      collegesEn: 'UNC-Chapel Hill (top journalism school), Elon, NC State, NC Central',
      collegesEs: 'UNC-Chapel Hill (escuela de periodismo top), Elon, NC State, NC Central',
      dayEn: 'Writing stories, managing social media, pitching campaigns, interviewing sources, producing content.',
      dayEs: 'Escribir historias, gestionar redes sociales, proponer campañas, entrevistar fuentes, producir contenido.',
    ),
    'Social': _ClusterResult(
      nameEn: 'Social Services & Counseling',
      nameEs: 'Servicios Sociales y Consejería',
      emoji: '🤝',
      descEn: 'You are empathetic, a great listener, and driven to help people through their hardest times.',
      descEs: 'Eres empático, buen oyente y estás impulsado a ayudar a las personas en sus momentos más difíciles.',
      majorsEn: ['Social Work', 'Psychology', 'Counseling', 'Human Services', 'Sociology', 'Criminal Justice', 'Child Development'],
      majorsEs: ['Trabajo Social', 'Psicología', 'Consejería', 'Servicios Humanos', 'Sociología', 'Justicia Criminal', 'Desarrollo Infantil'],
      salaryEn: 'USD 35,000 – USD 75,000+/year. MSW or LPC license increases earning significantly.',
      salaryEs: 'USD 35,000 – USD 75,000+/año. Licencia MSW o LPC aumenta significativamente los ingresos.',
      collegesEn: 'UNC-Chapel Hill, NC State, Fayetteville State, UNC-Greensboro, UNC-Pembroke',
      collegesEs: 'UNC-Chapel Hill, NC State, Fayetteville State, UNC-Greensboro, UNC-Pembroke',
      dayEn: 'Meeting with clients, writing case plans, connecting people to resources, advocating, making referrals.',
      dayEs: 'Reunirse con clientes, escribir planes de caso, conectar personas con recursos, abogar, hacer referencias.',
    ),
    'Public Service': _ClusterResult(
      nameEn: 'Public Service & Law',
      nameEs: 'Servicio Público y Derecho',
      emoji: '⚖️',
      descEn: 'You believe in justice, fairness, and making systems work better for everyone. You want to lead change.',
      descEs: 'Crees en la justicia, la equidad y hacer que los sistemas funcionen mejor para todos. Quieres liderar el cambio.',
      majorsEn: ['Political Science', 'Criminal Justice', 'Pre-Law', 'Public Administration', 'Homeland Security', 'Military Science', 'Urban Planning'],
      majorsEs: ['Ciencias Políticas', 'Justicia Criminal', 'Pre-Derecho', 'Administración Pública', 'Seguridad Nacional', 'Ciencias Militares', 'Planificación Urbana'],
      salaryEn: 'USD 40,000 – USD 120,000+/year. Lawyers and administrators can earn significantly more.',
      salaryEs: 'USD 40,000 – USD 120,000+/año. Los abogados y administradores pueden ganar significativamente más.',
      collegesEn: 'UNC-Chapel Hill, NC Central (law school), Campbell (law), Fayetteville State, NC State',
      collegesEs: 'UNC-Chapel Hill, NC Central (facultad de derecho), Campbell (derecho), Fayetteville State, NC State',
      dayEn: 'Serving the public, enforcing policy, advocating in court, managing government programs, protecting communities.',
      dayEs: 'Servir al público, hacer cumplir políticas, abogar en tribunales, gestionar programas gubernamentales, proteger comunidades.',
    ),
  };

  Map<String, int> _scoreResults() {
    final scores = <String, int>{};
    for (final entry in _answers.entries) {
      final q = _questions[entry.key];
      final option = q.options[entry.value];
      for (final cluster in option.clusters) {
        scores[cluster] = (scores[cluster] ?? 0) + 1;
      }
    }
    return scores;
  }

  List<MapEntry<String, int>> _topClusters() {
    final scores = _scoreResults();
    final sorted = scores.entries.toList()..sort((a, b) => b.value.compareTo(a.value));
    return sorted.take(3).toList();
  }

  @override
  Widget build(BuildContext context) {
    final isEn = t(context, 'nav_timeline') == 'Timeline';
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Builder(builder: (ctx) => _Header(
          isEn ? 'Major Explorer' : 'Explorador de Carreras',
          isEn ? 'Discover your best-fit career path.' : 'Descubre tu camino de carrera ideal.',
        )),
        Expanded(child: _showResults
          ? _buildResults(context, isEn)
          : _buildQuiz(context, isEn)),
      ]),
    );
  }

  Widget _buildQuiz(BuildContext context, bool isEn) {
    if (_step >= _questions.length) {
      WidgetsBinding.instance.addPostFrameCallback((_) => setState(() => _showResults = true));
      return const SizedBox();
    }
    final q = _questions[_step];
    final progress = (_step + 1) / _questions.length;
    return ListView(padding: const EdgeInsets.all(16), children: [
      // Progress bar
      Container(margin: const EdgeInsets.only(bottom: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(isEn ? 'Question ${_step + 1} of ${_questions.length}' : 'Pregunta ${_step + 1} de ${_questions.length}',
              style: const TextStyle(color: textGray, fontSize: 12)),
            Text('${(progress * 100).round()}%', style: const TextStyle(color: navy, fontSize: 12, fontWeight: FontWeight.bold)),
          ]),
          const SizedBox(height: 6),
          ClipRRect(borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(value: progress, backgroundColor: borderColor,
              valueColor: const AlwaysStoppedAnimation<Color>(green), minHeight: 6)),
        ])),
      // Question card
      Container(margin: const EdgeInsets.only(bottom: 20), padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: navy, borderRadius: BorderRadius.circular(16)),
        child: Text(isEn ? q.en : q.es,
          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold, height: 1.4))),
      // Options
      ...q.options.asMap().entries.map((entry) {
        final idx = entry.key;
        final opt = entry.value;
        final selected = _answers[_step] == idx;
        return GestureDetector(
          onTap: () => setState(() {
            _answers[_step] = idx;
            Future.delayed(const Duration(milliseconds: 300), () {
              if (mounted) setState(() => _step = (_step + 1).clamp(0, _questions.length));
            });
          }),
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: selected ? green.withOpacity(0.1) : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: selected ? green : borderColor, width: selected ? 2 : 1.5),
            ),
            child: Row(children: [
              Container(width: 24, height: 24, decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selected ? green : Colors.transparent,
                border: Border.all(color: selected ? green : textGray, width: 1.5)),
                child: selected ? const Icon(Icons.check, color: Colors.white, size: 14) : null),
              const SizedBox(width: 12),
              Expanded(child: Text(isEn ? opt.en : opt.es,
                style: TextStyle(color: selected ? green : const Color(0xFF3D5A6E), fontSize: 13, fontWeight: selected ? FontWeight.w600 : FontWeight.normal))),
            ]),
          ),
        );
      }),
      // Back button
      if (_step > 0)
        GestureDetector(
          onTap: () => setState(() => _step--),
          child: Container(margin: const EdgeInsets.only(top: 8), padding: const EdgeInsets.all(12),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Icon(Icons.arrow_back, color: textGray, size: 16), const SizedBox(width: 6),
              Text(isEn ? 'Back' : 'Atrás', style: const TextStyle(color: textGray, fontSize: 13)),
            ])),
        ),
    ]);
  }

  Widget _buildResults(BuildContext context, bool isEn) {
    final top = _topClusters();
    return ListView(padding: const EdgeInsets.all(16), children: [
      // Header celebration
      Container(margin: const EdgeInsets.only(bottom: 16), padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: navy, borderRadius: BorderRadius.circular(16)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(isEn ? '🎉 Your Career Matches!' : '🎉 ¡Tus Coincidencias de Carrera!',
            style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(isEn ? 'Based on your answers, here are your top 3 career paths. Tap each one to explore.' : 'Según tus respuestas, aquí están tus 3 mejores caminos de carrera. Toca cada uno para explorar.',
            style: const TextStyle(color: Colors.white70, fontSize: 13, height: 1.4)),
        ])),
      // Top 3 clusters
      ...top.asMap().entries.map((entry) {
        final rank = entry.key;
        final clusterName = entry.value.key;
        final result = _clusters[clusterName];
        if (result == null) return const SizedBox();
        final rankColors = [green, navy, const Color(0xFF8B6914)];
        final rankLabels = isEn ? ['Best Match', 'Great Match', 'Strong Match'] : ['Mejor Coincidencia', 'Gran Coincidencia', 'Coincidencia Fuerte'];
        return _MajorResultCard(result: result, isEn: isEn, rank: rank, rankColor: rankColors[rank], rankLabel: rankLabels[rank]);
      }),
      // Retake button
      const SizedBox(height: 8),
      GestureDetector(
        onTap: () => setState(() { _answers.clear(); _step = 0; _showResults = false; }),
        child: Container(
          width: double.infinity, padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(border: Border.all(color: navy), borderRadius: BorderRadius.circular(12)),
          child: Center(child: Text(isEn ? 'Retake Quiz' : 'Volver a Tomar el Quiz',
            style: const TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 14))),
        ),
      ),
      const SizedBox(height: 30),
    ]);
  }
}

class _MajorResultCard extends StatefulWidget {
  final _ClusterResult result;
  final bool isEn;
  final int rank;
  final Color rankColor;
  final String rankLabel;
  const _MajorResultCard({required this.result, required this.isEn, required this.rank, required this.rankColor, required this.rankLabel});
  @override
  State<_MajorResultCard> createState() => _MajorResultCardState();
}

class _MajorResultCardState extends State<_MajorResultCard> {
  late bool _expanded;
  @override
  void initState() { super.initState(); _expanded = widget.rank == 0; }
  @override
  Widget build(BuildContext context) {
    final r = widget.result;
    final isEn = widget.isEn;
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: widget.rankColor, width: widget.rank == 0 ? 2.5 : 1.5),
        boxShadow: [BoxShadow(color: widget.rankColor.withOpacity(0.08), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Column(children: [
        GestureDetector(
          onTap: () => setState(() => _expanded = !_expanded),
          child: Container(padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: _expanded ? widget.rankColor.withOpacity(0.06) : Colors.white,
              borderRadius: BorderRadius.circular(12)),
            child: Row(children: [
              Text(r.emoji, style: const TextStyle(fontSize: 28)),
              const SizedBox(width: 12),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(color: widget.rankColor, borderRadius: BorderRadius.circular(8)),
                  child: Text(widget.rankLabel, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold))),
                const SizedBox(height: 4),
                Text(isEn ? r.nameEn : r.nameEs,
                  style: TextStyle(color: widget.rankColor, fontSize: 16, fontWeight: FontWeight.bold)),
              ])),
              Icon(_expanded ? Icons.expand_less : Icons.expand_more, color: textGray),
            ])),
        ),
        if (_expanded)
          Padding(padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Divider(),
              const SizedBox(height: 8),
              Text(isEn ? r.descEn : r.descEs,
                style: const TextStyle(color: Color(0xFF3D5A6E), fontSize: 13, height: 1.5)),
              const SizedBox(height: 12),
              _ResultSection(icon: Icons.school, label: isEn ? 'Possible Majors' : 'Carreras Posibles',
                content: (isEn ? r.majorsEn : r.majorsEs).join(' • '), color: widget.rankColor),
              const SizedBox(height: 8),
              _ResultSection(icon: Icons.attach_money, label: isEn ? 'Salary Range' : 'Rango de Salario',
                content: isEn ? r.salaryEn : r.salaryEs, color: green),
              const SizedBox(height: 8),
              _ResultSection(icon: Icons.account_balance, label: isEn ? 'NC Colleges to Consider' : 'Colegios de NC a Considerar',
                content: isEn ? r.collegesEn : r.collegesEs, color: navy),
              const SizedBox(height: 8),
              _ResultSection(icon: Icons.wb_sunny, label: isEn ? 'A Day in This Career' : 'Un Día en Esta Carrera',
                content: isEn ? r.dayEn : r.dayEs, color: const Color(0xFF8B6914)),
            ])),
      ]),
    );
  }
}

class _ResultSection extends StatelessWidget {
  final IconData icon;
  final String label, content;
  final Color color;
  const _ResultSection({required this.icon, required this.label, required this.content, required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(
      color: color.withOpacity(0.06), borderRadius: BorderRadius.circular(10)),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Icon(icon, color: color, size: 18),
        const SizedBox(width: 10),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(label, style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(content, style: const TextStyle(color: Color(0xFF3D5A6E), fontSize: 12, height: 1.5)),
        ])),
      ]));
  }
}

class _MajorQuestion {
  final String en, es;
  final List<_MajorOption> options;
  _MajorQuestion({required this.en, required this.es, required this.options});
}

class _MajorOption {
  final String en, es;
  final List<String> clusters;
  _MajorOption({required this.en, required this.es, required this.clusters});
}

class _ClusterResult {
  final String nameEn, nameEs, emoji, descEn, descEs, salaryEn, salaryEs, collegesEn, collegesEs, dayEn, dayEs;
  final List<String> majorsEn, majorsEs;
  _ClusterResult({required this.nameEn, required this.nameEs, required this.emoji, required this.descEn, required this.descEs, required this.majorsEn, required this.majorsEs, required this.salaryEn, required this.salaryEs, required this.collegesEn, required this.collegesEs, required this.dayEn, required this.dayEs});
}

