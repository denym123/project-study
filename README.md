# 🛍️ Store Challenge

Este projeto é uma implementação de um catálogo de produtos consumindo a [Fake Store API](https://fakestoreapi.com/), desenvolvido como parte do desafio técnico para a vaga de Desenvolvedor Flutter Sênior.

O objetivo foi criar uma aplicação robusta, escalável e com foco em performance e qualidade de código.

## 📱 Funcionalidades

  * **Listagem de Produtos:** Consumo de API REST com tratamento de estados (Loading, Data, Error).
  * **Busca Local:** Filtragem reativa de produtos.
  * **Tratamento de Erros:** Feedback visual amigável e opção de "Tentar Novamente".
  * **Resiliência:** Mapeamento defensivo de dados para evitar crashes por inconsistências da API.

## 🛠️ Tech Stack & Decisões Arquiteturais

A arquitetura foi desenhada pensando em **Clean Code**, **SOLID** e **Manutenibilidade**.

| Tecnologia | Motivo da Escolha |
| :--- | :--- |
| **Flutter** | Framework UI. |
| **Signals** (`signals_flutter`) | Escolhido pela **reatividade de granulação fina** (fine-grained reactivity). Diferente de BLoC ou Provider que reconstroem widgets inteiros, o Signals permite atualizar apenas partes específicas da UI, garantindo alta performance em listas grandes e reduzindo boilerplate. |
| **Provider** | Utilizado estritamente para **Injeção de Dependência (DI)** e Service Locator, aproveitando seu sistema de escopo hierárquico (Scoped). |
| **GoRouter** | Para navegação declarativa, facilitando a implementação de Deep Links e Guards no futuro. |
| **Dio** | Cliente HTTP robusto para gerenciamento de interceptors e configurações de BaseUrl. |
| **Freezed** | Para geração de Models imutáveis e implementação automática de `Value Equality` e `copyWith`. |
| **Mocktail** | Para testes unitários, permitindo mocks type-safe sem a necessidade de geração de código lenta. |

## 🏗️ Arquitetura

O projeto segue os princípios da **Clean Architecture** modularizada:

  * **Domain Layer:** Contém as Entidades (`Models`) puras e agnósticas à API.
  * **Data Layer:** Contém os `DTOs` (Data Transfer Objects), `Mappers` (Extensions) e `Repositories`.
      * *Destaque:* Utilização do padrão **Mapper** para criar uma camada anticorrupção, blindando o app contra mudanças ou nulos vindos da API.
  * **Presentation Layer:** Contém os `Controllers` e `Pages`.
      * *Destaque:* Controllers desacoplados de UI (sem import de material.dart quando possível) e gerenciamento de estado via Signals.

### Estrutura de Pastas

```text
lib/
├── core/                # Configurações globais (HTTP, DI, Theme)
├── modules/
│   └── products/        # Módulo de Produtos
│       ├── controllers/ # Regra de Negócio (Signals)
│       ├── models/      # Entidades de Domínio (Puras)
│       ├── dtos/        # Espelhos da API e Mappers
│       ├── repositories/# Acesso a dados
│       └── views/       # Widgets e Pages
└── shared/              # Widgets e Helpers reutilizáveis e Utils
```

## ✨ Destaques Técnicos

### 1\. FutureHandler & Tratamento de Erros

Foi implementado um controle robusto de exceções. O app não apenas loga o erro, mas apresenta estados visuais claros para o usuário, evitando o "Loading Infinito" ou crashes inesperados.

### 2\. Ciclo de Vida Customizado

Para unir o poder do `Provider` com a necessidade de inicialização de recursos, foi utilizada uma abstração de `PageLifeCycle`, garantindo que recursos sejam alocados no `onInit` e limpos corretamente no `dispose`, prevenindo Memory Leaks.

### 3\. Programação Defensiva

Os DTOs foram configurados para aceitar campos nulos (`Nullable`), enquanto os Mappers garantem que os Models de domínio sempre tenham dados válidos (Null Safety), aplicando valores padrão (`Default Values`) onde necessário.

## 🚀 Como Rodar

**Pré-requisitos:** Flutter SDK instalado.

1.  **Clone o repositório:**

    ```bash
    git clone https://github.com/seu-usuario/kobe-store-challenge.git
    cd kobe-store-challenge
    ```

2.  **Instale as dependências:**

    ```bash
    flutter pub get
    ```

3.  **Gere os arquivos do Freezed (se necessário):**

    ```bash
    dart run build_runner build --delete-conflicting-outputs
    ```

4.  **Execute o App:**

    ```bash
    flutter run
    ```

## 🧪 Testes

O projeto possui cobertura de testes unitários focados nas camadas críticas (Repository, Controller, Mappers).

Para rodar os testes:

```bash
flutter test
```

-----

*Desenvolvido por Dênym Filho*