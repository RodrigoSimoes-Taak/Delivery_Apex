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

}