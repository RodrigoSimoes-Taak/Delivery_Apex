Cliente cliente = new Cliente('Ana', '123.456.789-00', 'Rua Central, 123', '(11) 99999-8888');
Restaurante restaurante = new Restaurante('Bella Pizza', 'Av. Antártico, 381', CategoriaRestaurante.PIZZARIA);
Produto pizzaMussarela = new Produto('Pizza Mussarela', 35.00);
Produto pizzaCalabresa = new Produto('Pizza Calabresa', 38.00);
Produto refrigerante = new Produto('Refrigerante', 8.00);
Produto pastel = new Produto('Pastel', 6.50);

restaurante.adicionarProduto(pizzaMussarela);
restaurante.adicionarProduto(pizzaCalabresa);
restaurante.adicionarProduto(refrigerante);
restaurante.adicionarProduto(pastel);

Pedido pedido = new Pedido(cliente, restaurante);
pedido.adicionarItemPedido(pizzaMussarela, 1);
pedido.adicionarItemPedido(pizzaCalabresa, 2);
pedido.adicionarItemPedido(refrigerante, 4);
pedido.adicionarItemPedido(pastel, 3);
pedido.exibirResumo();
pedido.confirmarPedido();

List<Pedido> pedidos = new List<Pedido>();
pedidos.add(pedido);

List<String> cpfs = new List<String>();
cpfs.add(cliente.cpf);

restaurante.gerarRelatorioProdutosMaisVendidos(pedidos);
restaurante.gerarRelatorioPedidosPorCliente(pedidos, cpfs);
