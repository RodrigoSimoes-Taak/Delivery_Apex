// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:c
//     SFDX: Execute Anonymous Apex with Editor Contents

//Testes etapa 2
System.debug('Testes etapa 2');
Restaurante restaurante = new Restaurante('Bella Pizza', 'Av antártico 381', CategoriaRestaurante.PIZZARIA);
restaurante.exibirCardapio(); 

Produto produto1 = new Produto('Pizza Mussarela', 35.00d);
Produto produto2 = new Produto('Pizza calabresa', 38.00d);
Produto produto3 = new Produto('Refrigerante', 8.00d);
Produto produto4 = new Produto('Pastel', 6.50d);

restaurante.adicionarProduto(produto1);
restaurante.adicionarProduto(produto1);
restaurante.adicionarProduto(produto2);
System.debug('Quantidade de itens no cardápio: ' + restaurante.cardapio.size());

restaurante.exibirCardapio();

restaurante.adicionarProduto(produto3);
//restaurante.adicionarProduto(produto4);
restaurante.buscarProdutos('pizza');
restaurante.buscarProdutos('calabresa');
restaurante.buscarProdutos('batata');


//Testes etapa 3
System.debug('Testes etapa 3');
Cliente cliente1 = new Cliente('Ana', '123.456.789-00', 'Rua Central, 123', '(11) 99999-9999');
Pedido pedido1 = new Pedido(cliente1, restaurante);
pedido1.adicionarItemPedido(produto1, 2);
pedido1.adicionarItemPedido(produto3, 1);
pedido1.exibirResumo();
pedido1.confirmarPedido();
System.debug(pedido1.status);

Pedido pedido2 = new Pedido(cliente1, restaurante);
pedido2.adicionarItemPedido(produto4, 2);
pedido2.confirmarPedido();
pedido2.adicionarItemPedido(produto2, 1);
pedido2.confirmarPedido();
pedido2.exibirResumo();


//Testes etapa 4

Cliente cliente2 = new Cliente('Carlos', '987.654.321-00', 'Rua das Flores, 45', '(11) 98888-7777');
Cliente cliente3 = new Cliente('Julia', '111.222.333-44', 'Av. Brasil, 100', '(11) 97777-6666');
Pedido pedido3 = new Pedido(cliente2, restaurante);
pedido3.adicionarItemPedido(produto1, 2);
pedido3.adicionarItemPedido(produto2, 2);
Pedido pedido4 = new Pedido(cliente3, restaurante);
pedido4.adicionarItemPedido(produto2, 5);


List<Pedido> pedidos = new List<Pedido>{pedido1, pedido2, pedido3};

Pedido.gerarRelatorioProdutosMaisVendidos(pedidos);

Pedido.gerarRelatorioPedidosPorCliente(pedidos, new List<String>{cliente1.cpf, cliente2.cpf, cliente3.cpf});






