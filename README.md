
# Coleta Seletiva Comunitária

Aplicativo móvel desenvolvido em **Flutter (Dart)** com o objetivo de facilitar a organização e o acompanhamento da coleta seletiva comunitária, oferecendo aos moradores informações sobre os cronogramas de coleta e um canal de comunicação para solicitar atendimentos extraordinários relacionados ao descarte de resíduos.

O projeto foi desenvolvido como parte de uma atividade acadêmica do curso de **Análise e Desenvolvimento de Sistemas (ADS) da Universidade do Vale do Itajaí (UNIVALI)**, utilizando práticas de desenvolvimento ágil com **Scrum** e a abordagem de qualidade de software **TDD (Test-Driven Development)**.

---

## Sobre o Projeto

A falta de informações claras sobre os dias e horários da coleta seletiva é um problema recorrente em diversas comunidades. Essa dificuldade pode resultar no descarte inadequado de resíduos, acúmulo de lixo nas vias públicas e prejuízos à organização e à limpeza dos bairros.

O aplicativo Coleta Seletiva Comunitária foi idealizado para centralizar essas informações em uma plataforma acessível, permitindo que os moradores acompanhem os cronogramas de coleta e tenham um meio de comunicação para informar situações que necessitem de atenção.

### Objetivo Geral

Desenvolver uma aplicação móvel que facilite o acesso às informações sobre a coleta seletiva, incentive o descarte correto de resíduos e contribua para uma melhor organização dos serviços de coleta nas comunidades.

### Problema Identificado

Muitos moradores não possuem acesso fácil e confiável às informações sobre os dias e horários da coleta seletiva em seus bairros. Além disso, a ausência de um canal direto de comunicação dificulta a solicitação de atendimento em situações de acúmulo irregular de resíduos.

### Solução Proposta

Disponibilizar um aplicativo que reúna informações essenciais sobre a coleta seletiva, permitindo que os moradores consultem os cronogramas, configurem lembretes e solicitem atendimento extraordinário quando necessário.

---

## Funcionalidades

O aplicativo contempla as seguintes funcionalidades:

- **Cronograma de Coleta:** consulta aos dias e horários programados para a coleta seletiva, organizados por bairro.
- **Lembretes Configuráveis:** possibilidade de configurar notificações para lembrar os moradores dos dias de coleta.
- **Solicitação de Coleta Extraordinária:** canal para comunicar situações de acúmulo de resíduos que necessitem de atendimento.
- **Interface Intuitiva:** organização das informações para proporcionar uma experiência simples e acessível.
- **Persistência Local:** armazenamento de informações e preferências utilizando Shared Preferences.

---

## 🧪 Metodologia de Desenvolvimento

### Scrum

O projeto utiliza Scrum como estrutura de gerenciamento ágil, permitindo organizar as atividades em etapas, priorizar funcionalidades e acompanhar a evolução do desenvolvimento.

A organização do trabalho contempla:

- **Product Backlog:** registro e priorização dos requisitos e funcionalidades.
- **Sprints:** divisão do desenvolvimento em ciclos de trabalho.
- **Acompanhamento:** monitoramento das atividades e do progresso.
- **Validação:** verificação das funcionalidades implementadas.

O Trello foi utilizado como ferramenta de apoio para organização das atividades, acompanhamento das tarefas e visualização do fluxo de desenvolvimento.

### TDD (Test-Driven Development)

A abordagem TDD foi adotada para fortalecer a qualidade e a confiabilidade do software.

O processo consiste em:

1. **Red:** escrever um teste que inicialmente falha, definindo o comportamento esperado.
2. **Green:** implementar o código mínimo necessário para fazer o teste passar.
3. **Refactor:** melhorar a estrutura do código, mantendo os testes aprovados.

Essa abordagem contribui para identificar problemas antecipadamente, reduzir regressões e manter o comportamento esperado das funcionalidades.

### Integração Contínua (CI)

O projeto utiliza GitHub Actions para automatizar etapas de validação do código, auxiliando na identificação de erros e na manutenção da qualidade durante o desenvolvimento.

---

## Como testar o aplicativo

O projeto disponibiliza duas formas de experimentação, permitindo que o avaliador escolha a opção mais conveniente.

### Opção 1 — Instalação do APK (Android)

É possível instalar diretamente a versão compilada do aplicativo em um dispositivo Android.

**Passo a passo:**

1. Acesse a página de Releases do projeto:
   [ownload do aplicativo — Releases](https://github.com/Felipixel-Martins/coleta-seletiva-app/releases/tag/v1.0.0)
2. Localize a seção **Assets**.
3. Faça o download do arquivo `app-release.apk`.
4. Transfira o arquivo para um dispositivo Android.
5. Abra o arquivo baixado e siga as instruções de instalação.
6. Caso necessário, autorize a instalação de aplicativos provenientes daquela fonte nas configurações do Android.

**Observação:** a instalação pode apresentar um aviso de segurança por se tratar de um APK distribuído diretamente, fora da Google Play Store.

### Opção 2 — Versão Web

Também está disponível uma versão web para demonstração e avaliação rápida, sem necessidade de instalação.

🌐 **[Acessar Coleta Seletiva Comunitária — Versão Web](https://felipixel-martins.github.io/coleta-seletiva-app/)**

**Importante:** a versão web possui finalidade demonstrativa. Recursos que dependem de funcionalidades nativas do Android, como notificações push, podem apresentar limitações ou não funcionar da mesma maneira que na versão APK.

---

## Como executar o projeto localmente

Para desenvolvedores que desejam acessar o código-fonte, executar o aplicativo ou realizar modificações, siga as instruções abaixo.

### Pré-requisitos

Antes de iniciar, verifique se os seguintes recursos estão instalados:

- Flutter SDK 3.38.10 ou superior.
- Dart SDK compatível com a versão do Flutter.
- Git.
- Emulador Android, dispositivo físico ou navegador Google Chrome.

### 1. Clonar o repositório

Abra o terminal e execute:

```bash
git clone https://github.com/Felipixel-Martins/coleta-seletiva-app.git
```

### 2. Acessar o diretório do projeto

```bash
cd coleta-seletiva-app
```

### 3. Verificar o ambiente Flutter

```bash
flutter doctor
```

Esse comando verifica a instalação do Flutter e identifica possíveis dependências ou configurações pendentes.

### 4. Instalar as dependências

```bash
flutter pub get
```

O comando baixa e configura os pacotes necessários para executar o projeto.

### 5. Executar os testes

```bash
flutter test
```

Esse comando executa os testes automatizados disponíveis no projeto.

### 6. Executar o aplicativo

Para iniciar no dispositivo ou emulador Android:

```bash
flutter run
```

Para executar diretamente no navegador Chrome:

```bash
flutter run -d chrome
```

---

## Versionamento e Repositório

O código-fonte e o histórico de desenvolvimento estão disponíveis publicamente no GitHub.

**Repositório oficial:**

[Felipixel-Martins/coleta-seletiva-app](https://github.com/Felipixel-Martins/coleta-seletiva-app)

**Versão disponibilizada:**

[v1.0.0 — Releases](https://github.com/Felipixel-Martins/coleta-seletiva-app/releases/tag/v1.0.0)

O Git foi utilizado para controlar as alterações do projeto, registrar a evolução do desenvolvimento e manter o histórico de versões.

---

## Considerações Finais

O Coleta Seletiva Comunitária representa uma proposta tecnológica voltada à resolução de um problema presente no cotidiano das comunidades.

Por meio da centralização de informações, dos lembretes de coleta e do canal de comunicação para solicitações extraordinárias, o aplicativo busca facilitar a participação dos moradores e contribuir para uma gestão mais organizada dos resíduos.

Além do desenvolvimento técnico, o projeto proporciona a aplicação prática de conceitos de Engenharia de Software, desenvolvimento multiplataforma, testes automatizados, versionamento de código e metodologias ágeis.

---

**Desenvolvido por Felipe Martins — ADS | UNIVALI**

**Projeto acadêmico — Coleta Seletiva Comunitária**
