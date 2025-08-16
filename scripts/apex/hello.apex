Cliente cliente = new Cliente('Ana', '123.456.789-00', 'Rua Central, 123', '(11) 99999-8888');
Restaurante restaurante = new Restaurante('Bella Pizza', 'Av antártico 381', CategoriaRestaurante.PIZZARIA);
Produto produto = new Produto('Pizza Mussarela', 35.00);
Produto produto2 = new Produto('Pizza Calabresa', 38.00);
Produto produto3 = new Produto('Refrigerante', 8.00);
Produto produto4 = new Produto('Pastel', 6.50);
Pedido pedido = new Pedido(cliente, restaurante);

Teste.testAdicionarProduto(produto, restaurante);
Teste.testAdicionarProduto(produto2, restaurante);
Teste.testAdicionarProduto(produto3, restaurante);
Teste.testAdicionarProduto(produto4, restaurante);

Teste.testExibirCardapio(restaurante);

Teste.testBuscarProdutos('Pizza', restaurante);
Teste.testBuscarProdutos('Calabresa', restaurante);
Teste.testBuscarProdutos('Batata', restaurante);

// Teste.testCriarPedidoComProdutosValidos(pedido);
Teste.testAdicionarProdutoInvalido(pedido);
