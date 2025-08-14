@IsTest
public with sharing class ClasseTeste {
    
    @IsTest
    public static void testAdicionarProduto(){
        Restaurante rest = new Restaurante('Bella Pizza',CategoriaRestaurante.PIZZARIA,'Av antártico 381');
        Produto mussarela = new Produto('Pizza Mussarela',35.00);
        Produto calabresa = new Produto('Pizza Calabresa',38.00);
        Produto refri = new Produto('Refrigerante',8.00);
        Produto pastel = new Produto('Pastel',6.50);
        rest.adicionarProduto(mussarela);
        rest.adicionarProduto(mussarela);
        rest.adicionarProduto(refri);
        System.debug(rest.cardapio.size());





    }
    @IsTest
    public static void testExibirCardapio(){
        Restaurante rest = new Restaurante('Bella Pizza',CategoriaRestaurante.PIZZARIA,'Av antártico 381');
        Produto mussarela = new Produto('Pizza Mussarela',35.00);
        Produto refri = new Produto('Refrigerante',8.00);
        rest.exibirCardapio();
        rest.adicionarProduto(mussarela);
        rest.adicionarProduto(refri);
        rest.exibirCardapio();
    }
    @IsTest
    public static void testBuscarProdutos(){
        Restaurante rest = new Restaurante('Bella Pizza',CategoriaRestaurante.PIZZARIA,'Av antártico 381');
        Produto mussarela = new Produto('Pizza Mussarela',35.00);
        Produto calabresa = new Produto('Pizza Calabresa',38.00);
        Produto refri = new Produto('Refrigerante',8.00);
        Produto pastel = new Produto('Pastel',6.50);

        rest.adicionarProduto(mussarela);
        rest.adicionarProduto(calabresa);
        rest.adicionarProduto(refri);
        rest.adicionarProduto(pastel);
        System.debug(rest.buscarProdutos('pizza'));
        System.debug(rest.buscarProdutos('calabresa'));
        System.debug(rest.buscarProdutos('batata'));
    }
    @IsTest
    public static void testCriarPedidoComProdutosValidos(){
        Restaurante rest = new Restaurante('Bella Pizza',CategoriaRestaurante.PIZZARIA,'Av antártico 381');
        Cliente cliente = new Cliente('Ana', '123.456.789-00','Rua Central,123', '(11) 99999-8888');
        Produto mussarela = new Produto('Pizza Mussarela',35.00);
        Produto calabresa = new Produto('Pizza Calabresa',38.00);
        Produto refri = new Produto('Refrigerante',8.00);
        Pedido novoPedido = new Pedido(cliente,rest);
        rest.adicionarProduto(mussarela);
        rest.adicionarProduto(calabresa);
        rest.adicionarProduto(refri);
        novoPedido.adicionarItemPedido(mussarela, 2);
        novoPedido.adicionarItemPedido(refri, 1);
        novoPedido.exibirResumo();
        novoPedido.confirmarPedido();
    }
    @IsTest
    public static void testAdicionarProdutoInvalido(){
        Restaurante rest = new Restaurante('Bella Pizza',CategoriaRestaurante.PIZZARIA,'Av antártico 381');
        Cliente cliente = new Cliente('Ana', '123.456.789-00','Rua Central,123', '(11) 99999-8888');
        Produto mussarela = new Produto('Pizza Mussarela',35.00);
        Produto calabresa = new Produto('Pizza Calabresa',38.00);
        Produto refri = new Produto('Refrigerante',8.00);
        Produto pastel = new Produto('Pastel',6.50);
        Pedido novoPedido = new Pedido(cliente,rest);
        rest.adicionarProduto(mussarela);
        rest.adicionarProduto(calabresa);
        rest.adicionarProduto(refri);
        novoPedido.adicionarItemPedido(pastel,1);
        novoPedido.confirmarPedido();
        novoPedido.adicionarItemPedido(calabresa, 1);
        novoPedido.confirmarPedido();

    }

}