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


