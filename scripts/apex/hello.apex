// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

//Teste de restaurante
public void testAdicionarProduto(){
    Restaurante Restaurante = new Restaurante();
    Restaurante.nome = 'Bella Pizza';
    Restaurante.categoria = Categoria.PIZZARIA;
    Restaurante.adicionarProduto(new Produto('Pizza Mussarela', 24));
    Restaurante.adicionarProduto(new Produto('Pizza Mussarela', 24));
    Restaurante.adicionarProduto(new Produto('Refrigerante', 4));
}

testAdicionarProduto();

public void testExibirCardapio(){
    Restaurante Restaurante = new Restaurante();
    Restaurante.nome = 'Bella Pizza';
    Restaurante.categoria = Categoria.PIZZARIA;
    Restaurante.adicionarProduto(new Produto('Pizza Mussarela', 24));
    Restaurante.adicionarProduto(new Produto('Refrigerante', 4));
    Restaurante.exibirCardapio();
}

testExibirCardapio();

public void testBuscarProduto(){
    Restaurante Restaurante = new Restaurante();
    Restaurante.nome = 'Bella Pizza';
    Restaurante.categoria = Categoria.PIZZARIA;

    Restaurante.adicionarProduto(new Produto('Pizza Mussarela', 24));
    Restaurante.adicionarProduto(new Produto('Pizza calabresa', 24));
    System.debug('Teste buscar pizza');
    Restaurante.buscarProduto('Pizza');
    System.debug('Teste buscar calabresa');
    Restaurante.buscarProduto('calabresa');
    System.debug('Teste buscar batata');
    Restaurante.buscarProduto('batata');

}

testBuscarProduto();

//Testes de Pedido

public void testCriarPedidoComProdutosValidos(){
    Restaurante restaurante = new Restaurante();
    restaurante.nome = 'Bella Pizza';
    restaurante.adicionarProduto(new Produto('Pizza Mussarela', 24));
    restaurante.adicionarProduto(new Produto('Refrigerante', 4));
    restaurante.categoria = Categoria.PIZZARIA;

    Cliente cliente = new Cliente('Ana', '123.456.789-00', 'Rua Central, 123', '(11) 99999-8888');

    Pedido pedido = new Pedido(cliente,restaurante );

    pedido.adicionarItemPedido(restaurante.cardapio.get(0), 2);
    pedido.adicionarItemPedido(restaurante.cardapio.get(1), 1);

    pedido.exibirPedido();
    pedido.confirmarPedido();
    System.debug('Status do pedido: ' + pedido.status);

}

testCriarPedidoComProdutosValidos();

public void testAdicionarProdutoInvalido(){
    Restaurante restaurante = new Restaurante();
    restaurante.nome = 'Bella Pizza';
    restaurante.adicionarProduto(new Produto('Pizza Mussarela', 24));
    restaurante.adicionarProduto(new Produto('Refrigerante', 4));
    restaurante.categoria = Categoria.PIZZARIA;

    Cliente cliente = new Cliente('Ana', '123.456.789-00', 'Rua Central, 123', '(11) 99999-8888');

    Pedido pedido = new Pedido(cliente,restaurante );

    Produto produtoInvalido = new Produto('Pastel', 10);

    pedido.adicionarItemPedido(produtoInvalido, 67);

    pedido.confirmarPedido();
    System.debug('Status do pedido: ' + pedido.status);
    
    pedido.adicionarItemPedido(restaurante.cardapio.get(0), 2);
    pedido.confirmarPedido();
    System.debug('Status do pedido: ' + pedido.status);

    pedido.exibirPedido();


}

testAdicionarProdutoInvalido();

//Teste de relatorio

public void testRelatorioProdutosMaisVendidos(){
    Restaurante restaurante = new Restaurante();
    restaurante.nome = 'Bella Pizza';
    restaurante.adicionarProduto(new Produto('Pizza Mussarela', 24));
    restaurante.adicionarProduto(new Produto('Pizza Calabresa', 24));
    restaurante.adicionarProduto(new Produto('Refrigerante', 4));
    restaurante.adicionarProduto(new Produto('Pastel', 4));
    restaurante.categoria = Categoria.PIZZARIA;

    Cliente cliente = new Cliente('Ana', '123.456.789-00', 'Rua Central, 123', '(11) 99999-8888');

    Pedido pedido1 = new Pedido(cliente,restaurante);
    pedido1.itens = new List<ItemPedido>{
        new ItemPedido(restaurante.cardapio[0],2),
        new ItemPedido(restaurante.cardapio[1],3)
    };

    Pedido pedido2 = new Pedido(cliente,restaurante);
    pedido2.itens = new List<ItemPedido>{
        new ItemPedido(restaurante.cardapio[0],3),
        new ItemPedido(restaurante.cardapio[2],1)
    };

    Pedido pedido3 = new Pedido(cliente,restaurante);
    pedido3.itens = new List<ItemPedido>{
        new ItemPedido(restaurante.cardapio[0],2),
        new ItemPedido(restaurante.cardapio[3],2)
    };


    List<Pedido> pedidos = new List<Pedido>{
        pedido1,
        pedido2,
        pedido3
    };

    Map<Produto,Integer> RelatorioResult = Relatorio.gerarRelatorioMaisVendidos(pedidos);
    
}


testRelatorioProdutosMaisVendidos();

public void  TestRelatorioPediidosPorCliente(){
    List<Cliente> clientes = new List<Cliente>();
    Restaurante restaurante = new Restaurante();
    restaurante.nome = 'Bella Pizza';
    restaurante.adicionarProduto(new Produto('Pizza Mussarela', 24));
    restaurante.adicionarProduto(new Produto('Pizza Calabresa', 24));
    restaurante.adicionarProduto(new Produto('Refrigerante', 4));
    restaurante.adicionarProduto(new Produto('Pastel', 4));
    restaurante.categoria = Categoria.PIZZARIA;

    Cliente cliente1 = new Cliente('Ana', '123.456.789-00', 'Rua Central, 123', '(11) 99999-8888');
    Cliente cliente2 = new Cliente('Bruno', '987.654.321-00', 'Avenida Paulista, 456', '(11) 98888-7777');
    Cliente cliente3 = new Cliente('Carla', '456.789.123-00', 'Rua das Flores, 789', '(11) 97777-6666');
    
    clientes.add(cliente1);
    clientes.add(cliente2);
    clientes.add(cliente3);

    List<String> cpfs = new List<String>{
        cliente1.cpf,
        cliente2.cpf
    };

        Pedido pedido1 = new Pedido(cliente1,restaurante);
    pedido1.itens = new List<ItemPedido>{
        new ItemPedido(restaurante.cardapio[0],2),
        new ItemPedido(restaurante.cardapio[1],3)
    };

    Pedido pedido2 = new Pedido(cliente1,restaurante);
    pedido2.itens = new List<ItemPedido>{
        new ItemPedido(restaurante.cardapio[0],3),
        new ItemPedido(restaurante.cardapio[2],1)
    };

    Pedido pedido3 = new Pedido(cliente2,restaurante);
    pedido3.itens = new List<ItemPedido>{
        new ItemPedido(restaurante.cardapio[0],2),
        new ItemPedido(restaurante.cardapio[3],2)
    };

    List<Pedido> pedidos = new List<Pedido>{
        pedido1,
        pedido2,
        pedido3
    };

    Map<String, List<Pedido>> relatorio = Relatorio.gerarRelatorioPedidosPorCliente(pedidos, cpfs);

}

TestRelatorioPediidosPorCliente();