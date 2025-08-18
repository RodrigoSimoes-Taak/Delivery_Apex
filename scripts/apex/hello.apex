
Restaurante BellaPizzas = new Restaurante('Bella Pizzas', 'Av antartico 381', CategoriaRestaurante.pizzaria);
Produto pizzaMussarela = new Produto('Pizza de Mussarela', 35.00);
Produto pizzaCala = new Produto('Pizza de Calabresa', 38.00);
Produto pizzaPort = new Produto('Pizza portuguesa', 35.00);
Produto coca = new Produto('Coca-Cola lata', 8.00);
Produto pastel = new Produto('Pastel', 6.50);
BellaPizzas.adicionarProduto(pizzaMussarela);
BellaPizzas.adicionarProduto(pizzaCala);
BellaPizzas.adicionarProduto(coca);
BellaPizzas.adicionarProduto(pizzaPort);
BellaPizzas.adicionarProduto(pastel);


Cliente clienteAna = new Cliente('Ana', '123.456.789-00', 'Rua Central, 123', '(11)99999-8888');
Cliente clienteCarlos = new Cliente('Carlos', '987.654.321-00', 'Rua das Flores, 45', '(11)98888-777');
Cliente clienteJulia = new Cliente('Julia', '111.222.333-44', 'Av. Brasil, 100', '(11)97777-6666');

Pedido pedidoAna = new Pedido(clienteAna, BellaPizzas, StatusPedido.CARRINHO);
pedidoAna.adicionarItemPedido(pizzaMussarela, 2);
pedidoAna.adicionarItemPedido(pizzaCala, 3);

Pedido pedidoAna2 = new Pedido(clienteAna, BellaPizzas, StatusPedido.CARRINHO);
pedidoAna2.adicionarItemPedido(pizzaMussarela, 3);
pedidoAna2.adicionarItemPedido(coca, 1);

Pedido pedidoJulia = new Pedido(clienteJulia, BellaPizzas, StatusPedido.CARRINHO);
pedidoJulia.adicionarItemPedido(pizzaMussarela, 2);
pedidoJulia.adicionarItemPedido(pastel, 2);


System.debug('');
System.debug('');
System.debug('');
System.debug('');
System.debug('');
List<Pedido> pedidosDoMes = new List<Pedido>();
pedidosDoMes.add(pedidoAna);
pedidosDoMes.add(pedidoAna2);
pedidosDoMes.add(pedidoJulia);
RelatoriosNew relatorio = new RelatoriosNew();
//Map<Produto, Integer> relatorioMaisVendidos = relatorio.gerarRelatorioProdutosMaisVendidos(pedidosDoMes);

Map<Cliente, List<Pedido>> relatorioPedidoPorCliente = relatorio.gerarRelatorioPedidosPorCliente(pedidosDoMes);



System.debug('');