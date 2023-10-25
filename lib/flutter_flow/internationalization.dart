import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
  }) =>
      [enText, esText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // cadastro
  {
    'gyo5nz4v': {
      'en': 'Cadastrar',
      'es': '',
    },
    'l2mzg09p': {
      'en': 'TECH ZOOM',
      'es': '',
    },
    '2bfd3ly9': {
      'en': 'Nome:',
      'es': '',
    },
    'v2xpnxfy': {
      'en': 'Apelido:',
      'es': '',
    },
    '20jqudjx': {
      'en': 'Email:',
      'es': '',
    },
    'm51khfpb': {
      'en': 'Senha:',
      'es': '',
    },
    '83ipiu79': {
      'en': 'Confirmar senha:',
      'es': '',
    },
    'xklritch': {
      'en': 'Cadastrar',
      'es': '',
    },
    'dhj397q9': {
      'en': 'Home',
      'es': '',
    },
  },
  // login
  {
    'gh5ylvzd': {
      'en': 'Login',
      'es': '',
    },
    '74pic22d': {
      'en': 'TECH ZOOM',
      'es': '',
    },
    'kkgnqdcg': {
      'en': 'Email:',
      'es': '',
    },
    'cwm8kwlu': {
      'en': 'Senha:',
      'es': '',
    },
    '7k6ilrrp': {
      'en': 'Esqueceu a senha?',
      'es': '',
    },
    'k20059yd': {
      'en': 'Entrar',
      'es': '',
    },
    'o04yvtdl': {
      'en': 'Cadastrar',
      'es': '',
    },
    'k8n9lc09': {
      'en': 'Home',
      'es': '',
    },
  },
  // HomePage
  {
    '5vxf8d4q': {
      'en': 'TechZoom',
      'es': '',
    },
    'gnpn7oka': {
      'en': 'Pesquisa',
      'es': '',
    },
    'pq7ywobx': {
      'en': 'Lançamentos',
      'es': '',
    },
    'efsbn9m1': {
      'en': 'Lançamentos',
      'es': '',
    },
    'nzd4llhc': {
      'en': 'Acessorios para o seu computador',
      'es': '',
    },
    'ch0ft7j6': {
      'en': 'Mouse',
      'es': '',
    },
    '2dja2sfv': {
      'en': 'Teclado',
      'es': '',
    },
    'p2boazll': {
      'en': 'Monitor',
      'es': '',
    },
    '16939cxt': {
      'en': 'Headset',
      'es': '',
    },
    'vn2s1aye': {
      'en': 'Home',
      'es': '',
    },
  },
  // busca
  {
    'xt3y0u8n': {
      'en': 'Busca',
      'es': '',
    },
    'xpf0ud6s': {
      'en': 'Pesquisa',
      'es': '',
    },
    'dwzxmxl9': {
      'en': '20 resultados encontrados',
      'es': '',
    },
    'vd263tee': {
      'en': 'Apple',
      'es': '',
    },
    'f1w09wkv': {
      'en': 'Iphone 11',
      'es': '',
    },
    'pyj4zhwm': {
      'en': '5.0',
      'es': '',
    },
    'g1g5i175': {
      'en': 'Home',
      'es': '',
    },
  },
  // configuracao
  {
    '3r2lkr66': {
      'en': 'Configurações',
      'es': '',
    },
    'edmiqr6c': {
      'en': 'Minha conta',
      'es': '',
    },
    '4plav6ws': {
      'en': 'Conta',
      'es': '',
    },
    'qri3zotv': {
      'en': 'Modo Claro',
      'es': '',
    },
    'kygbs1et': {
      'en': 'Modo Escuro',
      'es': '',
    },
    '1eqpocpb': {
      'en': 'Home',
      'es': '',
    },
  },
  // categoria
  {
    'lc9z4tt0': {
      'en': 'Categoria',
      'es': '',
    },
    '9zv2nluw': {
      'en': 'Pesquisar produtos...',
      'es': '',
    },
    '8nvxtpxo': {
      'en': 'Smartphone',
      'es': '',
    },
    'f18bs10q': {
      'en': 'Computador',
      'es': '',
    },
    'qrxq3cma': {
      'en': 'Tablet',
      'es': '',
    },
    '2knjmtoi': {
      'en': 'Notebook',
      'es': '',
    },
  },
  // perfil2
  {
    'ivdwznvd': {
      'en': 'Perfil',
      'es': '',
    },
    'tvbvb3ff': {
      'en': 'Nome:',
      'es': '',
    },
    's7qq23pa': {
      'en': 'Apelido:',
      'es': '',
    },
    '7oky8qt2': {
      'en': 'Email',
      'es': '',
    },
    '26j24elk': {
      'en': 'Sair da Conta',
      'es': '',
    },
  },
  // resultado
  {
    '1csnndnh': {
      'en': 'Resultado',
      'es': '',
    },
    'es9u4t4y': {
      'en': 'Avaliações',
      'es': '',
    },
    '7b8hc80u': {
      'en': '4.3%',
      'es': '',
    },
    '4yivtfyh': {
      'en': '50 pessoas deram nota pra  esse produto',
      'es': '',
    },
    'pd7ms0z7': {
      'en': '70%',
      'es': '',
    },
    'txmigl0v': {
      'en': '20%',
      'es': '',
    },
    '2eax9hl9': {
      'en': '10%',
      'es': '',
    },
    '6gy0w7ol': {
      'en': '0%',
      'es': '',
    },
    '5rvfr3xq': {
      'en': '0%',
      'es': '',
    },
    'sv0f96qh': {
      'en': 'comentar',
      'es': '',
    },
    'h3g49hai': {
      'en': 'Comentarios:',
      'es': '',
    },
    'mf25iyqy': {
      'en': 'Filtrar',
      'es': '',
    },
    'vf6ae4y9': {
      'en': 'Curtida:',
      'es': '',
    },
    'nen9mk0o': {
      'en': 'Home',
      'es': '',
    },
  },
  // categoriaCopy
  {
    'm41cs7yc': {
      'en': 'Categoria',
      'es': '',
    },
    'fws4h6fm': {
      'en': 'Pesquisar produtos...',
      'es': '',
    },
    'qxjh0kdu': {
      'en': 'Categorias',
      'es': '',
    },
    'pfekvkwh': {
      'en': 'Smartphone',
      'es': '',
    },
  },
  // comentar
  {
    'g5bls6f7': {
      'en': 'Comentario',
      'es': '',
    },
    'p7nv14m3': {
      'en': 'Seu comentario',
      'es': '',
    },
    'fz6kk8b3': {
      'en': 'Avaliar:',
      'es': '',
    },
    'wckdav3z': {
      'en': 'Postar',
      'es': '',
    },
    'leshcyxe': {
      'en': 'Comentar',
      'es': '',
    },
    '094h89k2': {
      'en': 'Home',
      'es': '',
    },
  },
  // coementarios
  {
    '8o9fvh55': {
      'en': 'Respostas',
      'es': '',
    },
    '2itzrtkm': {
      'en': 'Home',
      'es': '',
    },
  },
  // comentarCopy
  {
    'l5rsrtvh': {
      'en': 'Comentario',
      'es': '',
    },
    'yytmoyxh': {
      'en': 'Seu comentario',
      'es': '',
    },
    '5do9vc90': {
      'en': 'Postar',
      'es': '',
    },
    'ebmitcxq': {
      'en': 'Comentar',
      'es': '',
    },
    'd7q3l4i7': {
      'en': 'Home',
      'es': '',
    },
  },
  // delete
  {
    '9jrbzc64': {
      'en': 'Edit Post',
      'es': '',
    },
    'zslbrbt8': {
      'en': 'Delete Story',
      'es': '',
    },
    'tkgg2c90': {
      'en': 'Cancel',
      'es': '',
    },
  },
  // Miscellaneous
  {
    'q8msh1gx': {
      'en': '',
      'es': '',
    },
    'zqx56c0r': {
      'en': '',
      'es': '',
    },
    'jkahbu6p': {
      'en': 'permtir q vc sea notificado',
      'es': '',
    },
    'ya7o4k0x': {
      'en': '',
      'es': '',
    },
    'h6l6hp0g': {
      'en': '',
      'es': '',
    },
    '846xi1dm': {
      'en': '',
      'es': '',
    },
    '8spe97zh': {
      'en': '',
      'es': '',
    },
    'lhs7zjqs': {
      'en': '',
      'es': '',
    },
    'z7kldmlb': {
      'en': '',
      'es': '',
    },
    'o9y03v8g': {
      'en': '',
      'es': '',
    },
    '4gr78jly': {
      'en': '',
      'es': '',
    },
    'oip8vv6i': {
      'en': '',
      'es': '',
    },
    '9zjsdnkb': {
      'en': '',
      'es': '',
    },
    'ftveq3ss': {
      'en': '',
      'es': '',
    },
    'f5jr7ppi': {
      'en': '',
      'es': '',
    },
    'alp0dsde': {
      'en': '',
      'es': '',
    },
    'rurfz89q': {
      'en': '',
      'es': '',
    },
    '34mlya7i': {
      'en': '',
      'es': '',
    },
    'yurejdua': {
      'en': '',
      'es': '',
    },
    'x2bkhshq': {
      'en': '',
      'es': '',
    },
    'neh13dso': {
      'en': '',
      'es': '',
    },
    'p61dhohi': {
      'en': '',
      'es': '',
    },
    'k7kt09mi': {
      'en': '',
      'es': '',
    },
    'w8nc1e1h': {
      'en': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
