# tutoras_08

A new Flutter project.

// --- // --- //

Singleton é um padrão de projeto que assegura que exista apenas uma instância de uma classe durante toda a execução do programa.

Vantagens:

- Permite o compartilhamento de dados entre diferentes telas.

- Ajuda a economizar memória.

- Centraliza o gerenciamento dos dados.

No projeto, a classe Database segue o padrão Singleton. Ou seja, quando qualquer tela criar uma instância com:

Database db = Database();

ela receberá exatamente a mesma instância da classe.

// --- // --- //

Construtor padrão:
- Sempre cria uma nova instância do objeto.
- Utilizado quando precisamos de um objeto novo.

Construtor factory:
- Não é obrigado a criar uma nova instância.
- Pode retornar um objeto já existente.
- Muito utilizado em Singletons e conversões de JSON.

Exemplo:
OrderService.fromJson()

O factory recebe um Map JSON e devolve um objeto OrderService já montado.

// --- // --- //

setState() informa ao Flutter que houve alteração nos dados de uma tela Stateful.

Quando chamado, o método build() é executado novamente e a interface é atualizada.

No FloatingActionButton, após adicionar uma nova ordem de serviço, utilizamos setState() para reconstruir a tela e exibir imediatamente o novo item na lista.