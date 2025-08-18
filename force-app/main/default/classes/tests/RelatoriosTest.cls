@isTest
private class RelatoriosTest {

    static Cliente cliente1 = new Cliente('Ana', '000.456.789-00', 'Rua Central, 123', '(11) 99999-8888');
    static Cliente cliente2 = new Cliente('Carlos', '111.456.789-00', 'Rua das Flores, 45', '(11) 99999-7777');
    static Cliente cliente3 = new Cliente('Julia', '222.456.789-00', 'Av. Brasil, 100', '(11) 99999-6666');

    static Restaurante restaurante = new Restaurante('Bella Pizza', 'Av antártico 381', CategoriaRestaurante.PIZZARIA);
    static Produto pizzaMussarela = new Produto('Pizza Mussarela', 35.00);
    static Produto pizzaCalabresa = new Produto('Pizza Calabresa', 38.00);
    static Produto pizzaPortuguesa = new Produto('Pizza Portuguesa', 37.00);
    static Produto refrigerante = new Produto('Refrigerante', 8.00);
    static Produto pastel = new Produto('Pastel', 6.50);
    
    @isTest
    static void testRelatorioProdutosMaisVendidos() {
        
        //Adicionando produtos ao restaurante
        restaurante.adicionarProduto(pizzaMussarela);
        restaurante.adicionarProduto(pizzaCalabresa);
        restaurante.adicionarProduto(pizzaPortuguesa);

        //Criando pedidos
        Pedido pedido1 = new Pedido(cliente1, restaurante);
        pedido1.adicionarItemPedido(pizzaMussarela, 2);
        pedido1.adicionarItemPedido(pizzaCalabresa, 3);

        Pedido pedido2 = new Pedido(cliente2, restaurante);
        pedido2.adicionarItemPedido(pizzaMussarela, 3);
        pedido2.adicionarItemPedido(refrigerante, 1);

        Pedido pedido3 = new Pedido(cliente3, restaurante);
        pedido3.adicionarItemPedido(pizzaMussarela, 2);
        pedido3.adicionarItemPedido(pastel, 2);
        
        List<Pedido> pedidos = new List<Pedido>{pedido1, pedido2, pedido3};

        restaurante.gerarRelatorioProdutosMaisVendidos(pedidos);
        System.assertEquals(7, restaurante.gerarRelatorioProdutosMaisVendidos(pedidos).get('Pizza Mussarela'));
        System.assertEquals(3, restaurante.gerarRelatorioProdutosMaisVendidos(pedidos).get('Pizza Calabresa'));
        System.assertEquals(null, restaurante.gerarRelatorioProdutosMaisVendidos(pedidos).get('Pizza Portuguesa'));
        System.assertEquals(null, restaurante.gerarRelatorioProdutosMaisVendidos(pedidos).get('Refrigerante'));
        System.assertEquals(null, restaurante.gerarRelatorioProdutosMaisVendidos(pedidos).get('Pastel'));
    }

    @isTest
    static void testRelatorioPedidosPorCliente() {
        
        //Adicionando produtos ao restaurante
        restaurante.adicionarProduto(pizzaMussarela);
        restaurante.adicionarProduto(pizzaCalabresa);
        restaurante.adicionarProduto(pizzaPortuguesa);

        //Criando pedidos
        Pedido pedido1 = new Pedido(cliente1, restaurante);
        pedido1.adicionarItemPedido(pizzaMussarela, 2);
        pedido1.adicionarItemPedido(pizzaCalabresa, 3);

        Pedido pedido2 = new Pedido(cliente2, restaurante);
        pedido2.adicionarItemPedido(pizzaMussarela, 3);
        pedido2.adicionarItemPedido(refrigerante, 1);

        Pedido pedido3 = new Pedido(cliente3, restaurante);
        pedido3.adicionarItemPedido(pizzaMussarela, 2);
        pedido3.adicionarItemPedido(pastel, 2);

        Pedido pedido4 = new Pedido(cliente3, restaurante);
        pedido4.adicionarItemPedido(pizzaCalabresa, 1);
        pedido4.adicionarItemPedido(pizzaPortuguesa, 1);

        Pedido pedido5 = new Pedido(cliente3, restaurante);
        pedido5.adicionarItemPedido(pizzaPortuguesa, 2);
        pedido5.adicionarItemPedido(refrigerante, 2);

        Pedido pedido6 = new Pedido(cliente2, restaurante);
        pedido6.adicionarItemPedido(pizzaPortuguesa, 2);
        pedido6.adicionarItemPedido(refrigerante, 2);

        Pedido pedido7 = new Pedido(cliente2, restaurante);
        pedido7.adicionarItemPedido(pizzaPortuguesa, 2);
        pedido7.adicionarItemPedido(refrigerante, 2);

        List<Pedido> pedidos = new List<Pedido>{pedido1, pedido2, pedido3, pedido4, pedido5, pedido6, pedido7};

        List<String> cpfs = new List<String>{'111.456.789-00', '222.456.789-00'};

        restaurante.gerarRelatorioPedidosPorCliente(pedidos, cpfs);
        System.assertEquals(3, restaurante.gerarRelatorioPedidosPorCliente(pedidos, cpfs).get('Carlos').size());
        System.assertEquals(3, restaurante.gerarRelatorioPedidosPorCliente(pedidos, cpfs).get('Julia').size());
        System.assertEquals(null, restaurante.gerarRelatorioPedidosPorCliente(pedidos, cpfs).get('Ana'));
    }
}