
Restaurante BellaPizzas = new Restaurante('Bella Pizzas', 'Av antartico 381', CategoriaRestaurante.pizzaria);
Produto pizzaMussarela = new Produto('Pizza de Mussarela', 35.00);
Produto pizzaCala = new Produto('Pizza de Calabresa', 38.00);
Produto coca = new Produto('Coca-Cola lata', 8.00);
Produto pastel = new Produto('Pastel', 6.50);
BellaPizzas.adicionarProduto(pizzaMussarela);
BellaPizzas.adicionarProduto(pizzaCala);
BellaPizzas.adicionarProduto(coca);


Cliente clienteTest = new Cliente('Ana', '123.456.789.00', 'Rua Central, 123', '(11)99999-8888');

Pedido pedido = new Pedido(clienteTest, BellaPizzas, StatusPedido.CARRINHO);
pedido.adicionarItemPedido(pizzaMussarela, 2);
pedido.adicionarItemPedido(coca, 1);

pedido.exibirResumo();
pedido.confirmarPedido();
pedido.exibirResumo();

System.debug('');
System.debug('');
System.debug('');
System.debug('');
System.debug('');
List<Pedido> pedidosDoMes = new List<Pedido>();
pedidosDoMes.add(pedido);
RelatoriosNew relatorio = new RelatoriosNew();
Map<Produto, Integer> relatorioMaisVendidos = relatorio.gerarRelatorioProdutosMaisVendidos(pedidosDoMes);
for(integer i = 0; i < relatorioMaisVendidos.size(); i++) {
    System.debug('Produto: ' + relatorioMaisVendidos.keySet(i).nome + ', Vendas: ' + relatorioMaisVendidos.values()[i]);
    }