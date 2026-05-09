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
    // Home screen
    'home_hello': 'Hello,',
    'home_future': 'Future Student! 🎓',
    'home_journey': 'Your College Journey',
    'home_appname': 'Glory Daze',
    'home_subtitle': 'Complete guide from application to graduation',
    'home_sections': 'Explore Sections',
    'home_learnmore': 'Learn More',
    'home_consulting': 'College Readiness Consulting',
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
    'hdr_firstgen': "You're blazing the trail \u2014 we've got your back.",
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
    // Home screen
    'home_hello': '¡Hola,',
    'home_future': 'Futuro Estudiante! 🎓',
    'home_journey': 'Tu Camino a la Universidad',
    'home_appname': 'Glory Daze',
    'home_subtitle': 'Guía completa desde la solicitud hasta la graduación',
    'home_sections': 'Explorar Secciones',
    'home_learnmore': 'Más Información',
    'home_consulting': 'Consultoría de Preparación Universitaria',
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
          title: 'Glory Daze',
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
    final keys = ['nav_home','nav_timeline','nav_colleges','nav_mylist','nav_quiz','nav_preapp','nav_essay','nav_apply','nav_aid','nav_scholarships','nav_residency','nav_accepted','nav_campus','nav_firstgen'];
    final icons = [Icons.home, Icons.calendar_month, Icons.school, Icons.bookmark, Icons.quiz, Icons.checklist, Icons.draw, Icons.edit_document, Icons.attach_money, Icons.star, Icons.assignment, Icons.check_circle, Icons.apartment, Icons.favorite];
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
                const Text('College Readiness Consulting', style: TextStyle(color: green, fontWeight: FontWeight.bold, fontSize: 15)),
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
          _Card(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Your College Roadmap', style: TextStyle(color: navy, fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('Every month matters in your senior year. This timeline shows exactly what to do and when. The current month is highlighted — tap any month to see the full action list.',
              style: TextStyle(color: Color(0xFF3D5A6E), fontSize: 13, height: 1.6)),
            const SizedBox(height: 12),
            Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: navyPale, borderRadius: BorderRadius.circular(10)),
              child: const Row(children: [
                Icon(Icons.info_outline, color: navy, size: 18), SizedBox(width: 8),
                Expanded(child: Text('Pro tip: Start in August of your JUNIOR year — the earlier you begin, the more options you\'ll have!',
                  style: TextStyle(color: Color(0xFF1A5C8A), fontSize: 12, height: 1.5))),
              ])),
          ])),
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

  @override
  Widget build(BuildContext context) {
    final m = widget.month;
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
                  Text(m.name, style: TextStyle(color: _expanded ? Colors.white : green, fontWeight: FontWeight.bold, fontSize: 16)),
                  if (widget.isCurrent) ...[
                    const SizedBox(width: 8),
                    Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(color: _expanded ? Colors.white : m.color, borderRadius: BorderRadius.circular(10)),
                      child: Text('NOW', style: TextStyle(color: _expanded ? m.color : Colors.white, fontSize: 10, fontWeight: FontWeight.bold))),
                  ],
                ]),
                const SizedBox(height: 2),
                Text(m.subtitle, style: TextStyle(color: _expanded ? Colors.white70 : textGray, fontSize: 12)),
              ])),
              Row(children: [
                Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: _expanded ? Colors.white.withOpacity(0.2) : m.color.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                  child: Text('${m.tasks.length} tasks', style: TextStyle(color: _expanded ? Colors.white : m.color, fontSize: 11, fontWeight: FontWeight.w600))),
                const SizedBox(width: 8),
                Icon(_expanded ? Icons.expand_less : Icons.expand_more, color: _expanded ? Colors.white : textGray),
              ]),
            ]),
          ),
        ),
        if (_expanded)
          Padding(padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: m.tasks.map((task) => Padding(
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

class ScholarshipScreen extends StatelessWidget {
  const ScholarshipScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: Column(children: [
      Builder(builder: (ctx) => _Header(t(ctx,'nav_timeline') == 'Timeline' ? 'Scholarships' : 'Becas', t(ctx,'hdr_scholarships'))),
      Expanded(child: ListView(padding: const EdgeInsets.all(16), children: [
        Container(margin: const EdgeInsets.only(bottom: 16), padding: const EdgeInsets.all(18), decoration: BoxDecoration(color: navy, borderRadius: BorderRadius.circular(14)),
          child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Row(children: [Icon(Icons.star, color: Color(0xFFFFD700), size: 24), SizedBox(width: 8), Text('Scholarships = Free Money!', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold))]), SizedBox(height: 8), Text('Unlike loans, scholarships never need to be paid back. Apply early, apply often, and never pay to apply!', style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.5))])),
        Container(margin: const EdgeInsets.only(bottom: 16), padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: const Color(0xFF6B3A8F).withOpacity(0.08), borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFF6B3A8F).withOpacity(0.3))),
          child: Row(children: [const Icon(Icons.quiz, color: Color(0xFF6B3A8F), size: 24), const SizedBox(width: 12), const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Not sure which scholarships fit you?', style: TextStyle(color: Color(0xFF6B3A8F), fontWeight: FontWeight.bold, fontSize: 13)), SizedBox(height: 2), Text('Take the Scholarship Match Quiz for personalized matches!', style: TextStyle(color: Color(0xFF3D5A6E), fontSize: 12))])),
            GestureDetector(onTap: () { final nav = context.findAncestorStateOfType<_MainNavState>(); nav?.setState(() => nav._index = 4); },
              child: Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), decoration: BoxDecoration(color: const Color(0xFF6B3A8F), borderRadius: BorderRadius.circular(8)), child: const Text('Take Quiz', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12))))])),
        const _SectionHeader(icon: Icons.search, label: 'Free Scholarship Search Websites'),
        _Card(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [_CallBtn('CFNC.org — NC College Resources', () => _openUrl('https://www.cfnc.org')), _CallBtn('Fastweb.com', () => _openUrl('https://www.fastweb.com')), _CallBtn('Scholarships.com', () => _openUrl('https://www.scholarships.com')), _CallBtn('QuestBridge.org', () => _openUrl('https://www.questbridge.org')), _CallBtn('Bold.org Scholarships', () => _openUrl('https://bold.org/scholarships')), _CallBtn('Going Merry — One App, Many Scholarships', () => _openUrl('https://www.goingmerry.com'))])),
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

Future<void> _callPhone(String number) async {
  final uri = Uri(scheme: 'tel', path: number);
  if (await canLaunchUrl(uri)) await launchUrl(uri);
}

Future<void> _openUrl(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) await launchUrl(uri, mode: LaunchMode.externalApplication);
}
