
Restaurante BellaPizzas = new Restaurante('Bella Pizzas', 'Av antartico 381', CategoriaRestaurante.pizzaria);
Produto pizzaMussarela = new Produto('Pizza de Mussarela', 29.90);
Produto pizzaCala = new Produto('Pizza de Calabresa', 27.90);
Produto coca = new Produto('Coca-Cola lata', 6.50);
Produto pastelPizza = new Produto('Pastel de Pizza', 12.00);
BellaPizzas.adicionarProduto(pizzaMussarela);
BellaPizzas.adicionarProduto(pizzaCala);
BellaPizzas.adicionarProduto(coca);
BellaPizzas.adicionarProduto(pastelPizza);

BellaPizzas.exibirCardapio();

BellaPizzas.buscarProduto('pizza');