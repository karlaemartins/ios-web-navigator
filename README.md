# iOS Web Navigator - Projeto de Estudo

Aplicativo desenvolvido em **UIKit** que permite salvar, organizar e acessar rapidamente sites favoritos dentro do próprio app. O projeto foi construído com foco em arquitetura, separação de responsabilidades, navegação em UIKit e testes unitários, utilizando **MVVM**, **Coordinator**, **Dependency Injection** e **Protocol-Oriented Programming**.

## O que o app faz

- Adiciona novos sites favoritos
- Valida e normaliza URLs automaticamente
- Exibe os sites em uma UITableView
- Abre os sites dentro do aplicativo utilizando WKWebView
- Permite excluir favoritos com Swipe to Delete
- Persiste os dados utilizando UserDefaults
- Limita o armazenamento a 10 favoritos
- Impede a adição de sites duplicados
- Recupera os últimos sites removidos
- Permite recuperação parcial quando o limite de favoritos é atingido
- Exibe alertas para:
  - URL inválida
  - Site duplicado
  - Limite de favoritos atingido
  - Recuperação parcial
- Reabre automaticamente o campo de inserção quando uma URL inválida é informada

## Arquitetura

O projeto foi estruturado utilizando **MVVM**, **Coordinator**, **Service Layer**, **Dependency Injection** e **Protocol-Oriented Programming**, garantindo separação clara de responsabilidades, baixo acoplamento e maior flexibilidade.

### View

Responsável pela interface e interação com o usuário.

- Exibe a lista de sites
- Encaminha ações para o ViewModel
- Atualiza a interface através dos eventos recebidos do ViewModel

### ViewModel

Responsável pelas regras de negócio da aplicação.

- Gerencia a lista de favoritos
- Adiciona e remove sites
- Controla o limite máximo de favoritos
- Impede duplicações
- Executa a recuperação de sites removidos
- Comunica eventos para a View através de Delegate
- Recebe todas as dependências via Dependency Injection

### Services

**FavoritesStorageService**

- Salva favoritos
- Recupera favoritos
- Salva o último conjunto de sites removidos
- Recupera sites para a funcionalidade de recovery

**URLValidator**

- Normaliza URLs
- Adiciona `https://` quando necessário
- Valida o domínio informado
- Retorna uma URL válida ou `nil`

### Coordinator

Responsável pelo fluxo de navegação da aplicação.

- Cria e injeta dependências
- Controla a navegação entre telas
- Centraliza a apresentação de alertas
- Mantém as ViewControllers desacopladas da navegação

## Decisões importantes

- UIKit programático (sem Storyboard)
- Arquitetura MVVM
- Coordinator Pattern
- Service Layer
- Dependency Injection
- Protocol-Oriented Programming
- Persistência utilizando UserDefaults
- Navegação utilizando UINavigationController
- Validação de URLs antes da persistência
- Estrutura preparada para crescimento da aplicação

## Testes

O projeto possui testes unitários utilizando **XCTest**.

### Cobertura atual

**URLValidator**

- Retorno de URL válida
- Rejeição de URLs inválidas
- Adição automática de `https://`

**SiteListViewModel**

- Adição de sites válidos
- Rejeição de URLs inválidas
- Bloqueio de duplicação
- Limite máximo de favoritos
- Recuperação parcial de sites
- Comunicação com Delegate

Para isolamento dos testes foram utilizados:

- MockStorageService
- MockURLValidator
- MockSiteListViewModelDelegate (Spy)

## Conceitos praticados

- Swift
- UIKit
- WebKit
- WKWebView
- MVVM
- Coordinator Pattern
- Dependency Injection
- Protocol-Oriented Programming
- UserDefaults
- Auto Layout
- UITableView
- XCTest
- Mocks e Spies
- Persistência local
- Validação de URLs
