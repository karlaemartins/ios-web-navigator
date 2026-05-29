# WebNavigator

Aplicativo iOS desenvolvido em **Swift + UIKit**, com arquitetura **MVVM + Coordinator + Dependency Injection + Protocol**, que permite salvar e acessar rapidamente sites favoritos dentro do próprio app.

O projeto foi construído **100% programaticamente (sem Storyboard)** com foco em aprendizado de arquitetura, separação de responsabilidades, navegação em UIKit e testes unitários. 

---

## Funcionalidades

- Adicionar novos sites favoritos  
- Validação e normalização de URLs  
- Lista de sites utilizando `UITableView`  
- Abertura do site dentro do app com `WKWebView`  
- Exclusão de sites com **Swipe to Delete**  
- Persistência local com `UserDefaults`  
- Limite de até **10 sites salvos**
- Bloqueio de sites duplicados
- Recuperação dos últimos sites removidos
- Recuperação parcial quando o limite de favoritos é atingido
- Alertas para: 
    - URL inválida
    - Site duplicado
    - Limite de favoritos atingido
    - Recuperação parcial
- Reabertura do campo de inserção em caso de URL inválida  

---

## Arquitetura

O projeto utiliza **MVVM + Coordinator + Service Layer + Dependency Injection + Protocol**, garantindo separação clara de responsabilidades, baixo acoplamento e maior flexibilidade.

### View (ViewController)
Responsável pela interface e interação com o usuário.

- Exibe a lista de sites  
- Encaminha ações do usuário para o ViewModel
- Atualiza a interface através dos eventos recebidos do ViewModel

### ViewModel
Responsável pelas regras de negócio da aplicação.

- Gerencia a lista de sites  
- Adiciona e remove favoritos 
- Controla o limite máximo de 10 sites
- Impede a adição de sites duplicados
- Executa a recuperação de sites removidos
- Comunica eventos para a View através de Delegate
- Não cria dependências, apenas as recebe via Dependency Injection

### Services

**FavoritesStorageService**
Responsável pela persistência local utilizando `UserDefaults`

- Salva favoritos
- Recupera favoritos
- Salva o último conjunto de sites removidos
- Recupera sites para a funcionalidade de recovery

**URLValidator**
Responsável por validar e normalizar URLs. 

- Adiciona `https://` quando necessário
- Verifica se a URL possuí domínio válido
- Retorna uma URL válida ou `nil`

### Coordinator
Responsável pelos fluxos de navegação e apresentação.

- Cria e injeta dependências
- Controla a navegação entre telas
- Centraliza a exibição de alertas
- Mantém a ViewController desacoplada da navegação 

---

## Dependency Injection

O projeto utiliza **Dependency Injection** para reduzir acoplamento e facilitar manutenção e testes.

- O `ViewModel` recebe o `StorageServiceProtocol`
- O `ViewModel` recebe o `URLValidatorProtocol`  
- A `ViewController` recebe o `ViewModel`  
- O `Coordinator` é responsável por criar e injetar todas as dependências
  
---

## Protocols (Abstrações)

O projeto utiliza protocolos para desacoplar a camada de persistência.

**StorageServiceProtocol**
Define as operações de persistência: 

- Salvar favoritos
- Carregar favoritos
- Salvar sites removidos
- Recuperar sites removidos

**URLValidatorProtocol**
Define a responsabilidade de validação de URLs. 

Isso permite:

- Trocar implementações sem alterar o ViewModel
- Facilitar testes unitários
- Reduzir acoplamento entre camadas

---

## Testes

O projeto possui testes unitários utilizando **XCTest**

## Cobertura atual

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
- Comunicação com Delegate para eventos da aplicação

Para isolamento dos testes foram utilizados: 

- `MockStorageService`
- `MockURLValidator`
- `MockSiteListViewModelDelegate (Spy)

---

## Tecnologias utilizadas

- Swift  
- UIKit  
- WebKit  
- UserDefaults  
- AutoLayout programático  
- UINavigationController  

---

## Objetivo do projeto

Este projeto foi desenvolvido como parte do estudo de **desenvolvimento iOS com UIKit**, com foco em:

- Arquitetura MVVM
- Coordinator Pattern
- Dependency Injection
- Protocol-Oriented Design
- Persistência local
- Testes unitários
- Mocks e Spies
- Separação de responsabilidades
- Organização escalável de código
