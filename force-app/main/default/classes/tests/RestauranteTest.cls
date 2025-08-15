
@isTest
private class RestauranteTest {

    static Restaurante restaurante = new Restaurante('Bella Pizza', 'Av antártico 381', CategoriaRestaurante.PIZZARIA);
    static Produto pizzaMussarela = new Produto('Pizza Mussarela', 35.00);
    static Produto pizzaCalabresa = new Produto('Pizza Calabresa', 38.00);
    static Produto refrigerante = new Produto('Refrigerante', 8.00);
    static Produto pastel = new Produto('Pastel', 6.50);
    
    @isTest static void testAdicionarProduto() {
        restaurante.adicionarProduto(pizzaMussarela);
        restaurante.adicionarProduto(pizzaMussarela);
        restaurante.adicionarProduto(refrigerante);
        System.assertEquals(restaurante.cardapio.size(), 2);
    }

    @isTest static void testExibirCardapio() {
        System.assertEquals(restaurante.cardapio.size(), 0);
        restaurante.adicionarProduto(pizzaMussarela);
        restaurante.adicionarProduto(refrigerante);
        restaurante.exibirCardapio();
        System.assertEquals(restaurante.cardapio.size(), 2);
        System.debug(restaurante.cardapio);
    }

    @isTest static void testBuscarProduto() {
        restaurante.adicionarProduto(pizzaMussarela);
        restaurante.adicionarProduto(pizzaCalabresa);
        restaurante.adicionarProduto(refrigerante);
        restaurante.adicionarProduto(pastel);
        // teste busca por pizza
        List<String> produtoEncontrado = restaurante.buscarProdutos('Pizza');
        System.assertEquals(produtoEncontrado.size(), 2);
        System.assertEquals(produtoEncontrado[0], 'Pizza Mussarela - R$35.00');
        System.assertEquals(produtoEncontrado[1], 'Pizza Calabresa - R$38.00');
        produtoEncontrado = restaurante.buscarProdutos('Calabresa');
        System.assertEquals(produtoEncontrado.size(), 1);
        System.assertEquals(produtoEncontrado[0], 'Pizza Calabresa - R$38.00');
        produtoEncontrado = restaurante.buscarProdutos('batata');
        System.assertEquals(produtoEncontrado.size(), 0);
    }
}