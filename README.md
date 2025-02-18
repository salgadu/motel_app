# 🏨 Aplicativo de Listagem de Motéis

Este é um aplicativo Flutter desenvolvido para listar motéis com informações detalhadas como nome, preço e imagem. Ele consome dados de uma API mock para exibir as informações de forma estruturada e organizada.

## 📌 Funcionalidades

- Listagem de motéis com nome, preço e imagem.
- Consumo de API utilizando o pacote `http`.
- Gerenciamento de estado eficiente.
- Testes unitários para os principais componentes.

## 🛠️ Tecnologias Utilizadas

- **Flutter** e **Dart** para o desenvolvimento do aplicativo.
- **Gerenciamento de Estado**: Provider / ChangeNotifier.
- **Consumo de API**: `http`.
- **Testes Unitários**: `flutter_test`.
- **GitHub** para versionamento de código.

## 🚀 Como Rodar o Projeto

### 1️⃣ Pré-requisitos
Certifique-se de ter instalado em sua máquina:
- [Flutter](https://flutter.dev/docs/get-started/install)
- [Dart](https://dart.dev/get-dart)
- [Android Studio](https://developer.android.com/studio) ou [VS Code](https://code.visualstudio.com/)

### 2️⃣ Clonar o Repositório

```bash
  git clone https://github.com/seu-usuario/seu-repositorio.git
  cd seu-repositorio
```

### 3️⃣ Instalar as Dependências

```bash
  flutter pub get
```

### 4️⃣ Executar o Aplicativo

```bash
  flutter run
```

Caso esteja rodando no emulador, certifique-se de que ele está aberto antes de executar o comando.

## 🔗 APIs Utilizadas
Os dados são obtidos das seguintes APIs mock:
- [API 1](https://jsonkeeper.com/b/1IXK)
- [API 2](https://www.npoint.io/docs/e728bb91e0cd56cc0711)

## 🧪 Testes
Para executar os testes unitários, utilize o seguinte comando:

```bash
  flutter test
```

Isso garantirá que os principais componentes da aplicação estejam funcionando corretamente.

## 📌 Estrutura do Projeto

O projeto segue uma estrutura modularizada para melhor organização do código

<!-- ```
/lib
│── main.dart         # Ponto de entrada do aplicativo
│── core/            # Configurações globais, temas e constantes
│── models/          # Definição dos modelos de dados
│── services/        # Camada de serviço e consumo de API
│── providers/       # Gerenciamento de estado
│── views/           # Telas e componentes visuais
│── widgets/         # Componentes reutilizáveis
│── tests/           # Arquivos de teste unitário
``` -->

## Demonstração

![Demonstração do app](assets/videos/demo.mp4)

## Demonstração

[![Assista à demonstração]](https://youtu.be/WEHf1ouH65A)



## 📜 Considerações Finais

Este projeto foi desenvolvido seguindo boas práticas de desenvolvimento, com um código limpo e modularizado. O gerenciamento de estado foi escolhido para garantir melhor manutenção e performance da aplicação.

Sinta-se à vontade para contribuir e sugerir melhorias! 🚀

