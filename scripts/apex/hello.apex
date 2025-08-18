Cliente cliente = new Cliente('Ana', '123.456.789-00', 'Rua Central, 123', '(11) 99999-8888');
Cliente cliente2 = new Cliente('João', '987.654.321-00', 'Rua Leste, 456', '(11) 88888-7777');
Cliente cliente3 = new Cliente('Maria', '111.222.333-44', 'Rua Sul, 789', '(11) 77777-6666');
Cliente cliente4 = new Cliente('José', '222.333.444-55', 'Rua Norte, 159', '(11) 66666-5555');
Restaurante restaurante = new Restaurante('Bella Pizza', 'Av antártico 381', CategoriaRestaurante.PIZZARIA);
Restaurante restaurante2 = new Restaurante('Sushi Place', 'Av. Japão 123', CategoriaRestaurante.JAPONES);
Produto produto = new Produto('Pizza Mussarela', 35.00);
Produto produto2 = new Produto('Pizza Calabresa', 38.00);
Produto produto3 = new Produto('Refrigerante', 8.00);
Produto produto4 = new Produto('Pastel', 6.50);
Pedido pedido = new Pedido(cliente, restaurante);
Pedido pedido2 = new Pedido(cliente2, restaurante);
Pedido pedido3 = new Pedido(cliente3, restaurante);
Pedido pedido4 = new Pedido(cliente, restaurante);
Pedido pedido5 = new Pedido(cliente, restaurante2);

Teste.testAdicionarProduto(produto, restaurante);
Teste.testAdicionarProduto(produto2, restaurante);
Teste.testAdicionarProduto(produto3, restaurante);
Teste.testAdicionarProduto(produto4, restaurante);

Teste.testAdicionarProduto(produto, restaurante2);
Teste.testAdicionarProduto(produto2, restaurante2);
Teste.testAdicionarProduto(produto3, restaurante2);
Teste.testAdicionarProduto(produto4, restaurante2);

Teste.testExibirCardapio(restaurante);

Teste.testBuscarProdutos('Pizza', restaurante);
Teste.testBuscarProdutos('Calabresa', restaurante);
Teste.testBuscarProdutos('Batata', restaurante);

Teste.testCriarPedidoComProdutosValidos(pedido);
Teste.testCriarPedidoComProdutosValidos(pedido3);
Teste.testAdicionarProdutoInvalido(pedido2);
Teste.testCriarPedidoComProdutosValidos(pedido4);
Teste.testCriarPedidoComProdutosValidos(pedido5);

List<Pedido> pedidos = new List<Pedido>{pedido, pedido2, pedido3, pedido4, pedido5};

Teste.testRelatorioProdutosMaisVendidos(pedidos);

List<String> cpfs = new List<String>{cliente.getCpf(), cliente2.getCpf()};
Teste.testRelatorioPedidosPorCliente(pedidos, cpfs, restaurante);
