Restaurante r = new Restaurante('Bella Pizza', 'Av antártico, 381', Categoria.PIZZARIA, new List<Produto>());

Produto p1 = new Produto('Pizza Mussarela', 35.00);
Produto p2 = new Produto('Pizza Calabresa', 38.00);
Produto p3 = new Produto('Pizza Portuguesa', 40.00);
Produto p4 = new Produto('Refrigerante', 8.00);
Produto p5 = new Produto('Pastel', 6.50);

r.adicionarProduto(p1);
r.adicionarProduto(p2);
r.adicionarProduto(p3);
r.adicionarProduto(p4);
r.adicionarProduto(p5);

Cliente cl1 = new Cliente('Ana', '123.456.789-00', 'Rua Central, 123', '(11) 99999-8888');
Cliente cl2 = new Cliente('Carlos', '987.654.321-00', 'Rua das Flores, 45', '(11) 98888-7777');
Cliente cl3 = new Cliente('Julia', '111.222.333-44', 'Av. Brasil, 100', '(11) 97777-6666');

Pedido ped1 = new Pedido(cl1, r);
ped1.adicionarItemPedido(p1, 2);
ped1.adicionarItemPedido(p2, 3);

Pedido ped2 = new Pedido(cl2, r);
ped2.adicionarItemPedido(p1, 3);
ped2.adicionarItemPedido(p4, 1);

Pedido ped3 = new Pedido(cl3, r);
ped3.adicionarItemPedido(p1, 2);
ped3.adicionarItemPedido(p5, 2);

//Map<Produto, Integer> relatorioProdutos = r.gerarRelatorioProdutosMaisVendidos(new List<Pedido>{ped1, ped2, ped3});
Map<String, List<Pedido>> relatorioPedidos = r.gerarRelatorioPedidosPorCliente(new List<Pedido>{ped1, ped2, ped3}, new List<String>{cl1.cpf, cl2.cpf});