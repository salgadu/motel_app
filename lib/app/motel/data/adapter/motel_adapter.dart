import 'package:motel_list/app/motel/interactor/entities/motel.dart';

class MotelAdapter {
  MotelAdapter._();

  static MotelData fromJson(Map<String, dynamic> json) {
    return MotelData(
      pagina: json['pagina'] ?? 1,
      maxPaginas: (json['maxPaginas'] as num?)?.toInt() ?? 1,
      qtdPorPagina: json['qtdPorPagina'] ?? 10,
      raio: json['raio'] ?? 0,
      totalMoteis: json['totalMoteis'] ?? 0,
      totalSuites: json['totalSuites'] ?? 0,
      moteis: (json['moteis'] as List<dynamic>?)
              ?.map((e) => _fromMotelJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  static Motel _fromMotelJson(Map<String, dynamic> json) {
    return Motel(
      fantasia: json['fantasia'] ?? '',
      logo: json['logo'] ?? '',
      bairro: json['bairro'] ?? '',
      distancia: (json['distancia'] as num?)?.toDouble() ?? 0.0,
      qtdFavoritos: json['qtdFavoritos'] ?? 0,
      suites: (json['suites'] as List<dynamic>?)
              ?.map((e) => _suiteFromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      qtdAvaliacoes: json['qtdAvaliacoes'] ?? 0,
      media: (json['media'] as num?)?.toDouble() ?? 0.0,
    );
  }

  static Suite _suiteFromJson(Map<String, dynamic> json) {
    return Suite(
      nome: json['nome'] ?? '',
      qtd: json['qtd'] ?? 0,
      exibirQtdDisponiveis: json['exibirQtdDisponiveis'] ?? false,
      fotos: (json['fotos'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      itens: (json['itens'] as List<dynamic>?)
              ?.map((e) => _itemFromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      categoriaItens: (json['categoriaItens'] as List<dynamic>?)
              ?.map((e) => _categoriaItemFromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      periodos: (json['periodos'] as List<dynamic>?)
              ?.map((e) => _periodoFromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  static Item _itemFromJson(Map<String, dynamic> json) {
    return Item(nome: json['nome'] ?? '');
  }

  static CategoriaItem _categoriaItemFromJson(Map<String, dynamic> json) {
    return CategoriaItem(
      nome: json['nome'] ?? '',
      icone: json['icone'] ?? '',
    );
  }

  static Periodo _periodoFromJson(Map<String, dynamic> json) {
    return Periodo(
      tempoFormatado: json['tempoFormatado'] ?? '',
      tempo: json['tempo'] ?? 0,
      valor: (json['valor'] as num?)?.toDouble() ?? 0.0,
      valorTotal: (json['valorTotal'] as num?)?.toDouble() ?? 0.0,
      temCortesia: json['temCortesia'] ?? false,
      desconto:
          json['desconto'] == null ? null : _descontoFromJson(json['desconto']),
    );
  }

  static Desconto _descontoFromJson(Map<String, dynamic> json) {
    return Desconto(
      desconto: (json['desconto'] as num?)?.toDouble() ?? 0.0,
    );
  }
}
