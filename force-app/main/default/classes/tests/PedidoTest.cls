
@isTest
private class PedidoTest {
    static Cliente cliente = new Cliente('Ana', '123.456.789-00', 'Rua Central, 123', '(11) 99999-8888');
    static Restaurante restaurante = new Restaurante('Bella Pizza', 'Av. Antártico, 381', CategoriaRestaurante.PIZZARIA);
    static Produto pizzaMussarela = new Produto('Pizza Mussarela', 35.00);
    static Produto pizzaCalabresa = new Produto('Pizza Calabresa', 38.00);
    static Produto refrigerante = new Produto('Refrigerante', 8.00);
    static Produto pastel = new Produto('Pastel', 6.50);

    @isTest
    static void testCriarPedidoComProdutosValidos() {
        // Adiciona produtos ao cardápio do restaurante
        restaurante.adicionarProduto(pizzaMussarela);
        restaurante.adicionarProduto(pizzaCalabresa);
        restaurante.adicionarProduto(refrigerante);

        Pedido pedido = new Pedido(cliente, restaurante);
        pedido.adicionarItemPedido(pizzaMussarela, 2);
        pedido.adicionarItemPedido(refrigerante, 1);
        pedido.exibirResumo();
        pedido.confirmarPedido();

        System.assertEquals(2, pedido.itens.size());
        System.assertEquals(2, pedido.itens[0].quantidade);
        System.assertEquals(1, pedido.itens[1].quantidade);
        System.assertEquals(78.00, pedido.total);
        System.assertEquals(StatusPedido.EM_PROCESSAMENTO, pedido.status);
    }

    @isTest
    static void testAdicionarProdutoInvalido() {
        // Adiciona produtos ao cardápio do restaurante
        restaurante.adicionarProduto(pizzaMussarela);
        restaurante.adicionarProduto(pizzaCalabresa);
        restaurante.adicionarProduto(refrigerante);

        Pedido pedido = new Pedido(cliente, restaurante);
        pedido.adicionarItemPedido(pastel, 2); // Produto não está no cardápio
        pedido.confirmarPedido();
        System.assertEquals(0, pedido.itens.size());
        System.assertEquals(StatusPedido.CARRINHO, pedido.status);
        pedido.adicionarItemPedido(pizzaCalabresa, 1);
        pedido.confirmarPedido();
        System.assertEquals(1, pedido.itens.size());
        System.assertEquals(StatusPedido.EM_PROCESSAMENTO, pedido.status);
    }
}