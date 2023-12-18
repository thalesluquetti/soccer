# SOCCER

## Descrição do Projeto
Este projeto é desenvolvido em Swift, seguindo uma arquitetura MVVM-C (Model-View-ViewModel com Coordinators) e adotando os princípios do Clean Architecture. 
<br/><br/>A implementação utiliza o framework Combine para facilitar a programação reativa, viewCode com o conceito "chain action", melhorando a legibilidade do código ao montar elementos de tela e diminuindo o tempo de codificação (algo semelhante ao que temos nos frameworks mais declarativos hoje, como SwiftUI, Flutter, etc). 
<br/><br/>Para realizar o parse dos dados de APIs, utilizei o padrão de DTO "Data Transfer Object" encapsulando os dados relacionados em uma única estrutura, proporcionando uma forma organizada e coesa de representar informações, além de simplificar o processo de serialização que já é muito eficiente com o uso do Codable.
<br/><br/>Foram utilizadas algumas libs externas confiáveis para adiantar algumas implementações, como por exemplo, o Lottie para realizar a animação da splash, AlamofireImage para o gerenciamento de download e cache de imagens e Sourcery para geração de codigo ao realizar criptografia de chaves.

## Arquitetura MVVM-C (Model-View-ViewModel com Coordinators)
A arquitetura MVVM-C é escolhida para promover a separação de responsabilidades e facilitar a manutenção do código. As camadas principais incluem:

- Model: Representa os dados e a lógica de negócios.
- View: Responsável pela apresentação e interação com o usuário.
- ViewModel: Gerencia o estado da View e contém a lógica de apresentação.
- Coordinator: Controla o fluxo de navegação entre telas.

## Clean Architecture
A aplicação segue os princípios do Clean Architecture para garantir um projeto mais sustentável, flexível e testável, separando o código em camadas bem definidas, cada uma com responsabilidades específicas. As camadas são organizadas da seguinte forma:

- Entidades: Representam os objetos de negócios.
- Use Cases: Contêm a lógica de negócios da aplicação.
- Repositories: Abstraem o acesso a dados, dando mais liberdade para tratamentos específicos de APIs e promovendo a independência de frameworks externos.
- Provider: Implementação padrão para networking, com utilização de requests abstraídas para uma melhor separação de responsabilidades.

## Combine
Combine é utilizado para facilitar a programação reativa no projeto. Suas principais vantagens incluem:

- Fácil Composição: Combine permite encadear e combinar operadores para manipular fluxos de dados.
- Manuseio Simples de Erros: Fornece operadores que facilitam o tratamento de erros em pipelines de dados assíncronos.
- Desalocação Automática: Ajuda a evitar vazamentos de memória, já que os assinantes são automaticamente desalocados quando não são mais necessários.
- Compatibilidade Nativa: Como parte do ecossistema Swift, Combine se integra perfeitamente com outras APIs Swift, evitando o uso de libs externas e seus possíveis riscos.

## Testes
Foi implementado os testes unitarios das camadas core do app utilizando o padrão Given-When-Then para mais clareza do objetivo dos testes.
<br/>Para testes de tela (ViewController) foi uilizado uma [lib](https://github.com/pointfreeco/swift-snapshot-testing) para implementação de criação/analise de snapshots.

## Próximos Passos
Os próximos passos para o desenvolvimento deste projeto podem ser:

- Complementar implementação de testes de controller com utilização de Snapshots
- Inclusão de testes de UI, validando comportamento dos fluxos
- Aplicar conceito de MiFeatures monorepo, tornando o código mais eficiente, melhorando gestão de dependências e colaboração (diminuindo a incidência de conflitos, por exemplo).
