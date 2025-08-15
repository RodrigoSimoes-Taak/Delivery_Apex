

Produto pizza1 = new Produto('Calabresa', 15);
Produto pizza2 = new Produto('Quatro Queijos', 20);
Produto pizza3 = new Produto('Dois Queijos', 18);
Produto pizza4 = new Produto('Calabresa', 18);


List<Produto> cardapioInicial = new List<Produto>{pizza1, pizza2, pizza3};


Restaurante restaurante1 = new Restaurante('Pizzaria Luigi', 'Estrada Alta', cardapioInicial);

restaurante1.exibirCardapio();
restaurante1.buscarProdutos('queijo');
restaurante1.adicionarProduto(pizza4);
restaurante1.exibirCardapio();

