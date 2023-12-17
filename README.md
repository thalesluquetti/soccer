# SOCCER

## Descrição do Projeto
Este projeto é desenvolvido em Swift, seguindo uma arquitetura MVVM-C (Model-View-ViewModel com Coordinators) e adotando os princípios do Clean Architecture. A implementação utiliza o framework Combine para facilitar a programação reativa, além de alguns conceitos de viewCode, como, por exemplo, o uso de "Chain action", melhorando a legibilidade do código ao montar elementos de tela e diminuindo o tempo de codificação (algo semelhante ao que temos nos frameworks declarativos hoje, como SwiftUI, Flutter, etc.). Foram utilizadas algumas libs externas confiáveis para adiantar algumas implementações, como, por exemplo, o Lottie para realizar a animação da splash e o AlamofireImage para um gerenciamento de download e cache de imagens.

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

## Próximos Passos
Os próximos passos para o desenvolvimento deste projeto podem ser:

- Inclusão de testes de controller com utilização de Snapshots
- Inclusão de testes de UI, validando comportamento dos fluxos
- Aplicar conceito de MiFeatures monorepo, tornando o código mais eficiente, melhorando gestão de dependências e colaboração (diminuindo a incidência de conflitos, por exemplo).
