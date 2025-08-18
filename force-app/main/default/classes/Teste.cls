public class Teste {
    public static void testAdicionarProduto(Produto produto, Restaurante restaurante) {
        restaurante.adicionarProduto(produto);
        System.debug('Quantidade de produtos no cardapio: ' + restaurante.getCardapio().size());
        System.debug('Teste de adicionar produto concluído');
    }

    public static void testExibirCardapio(Restaurante restaurante) {
        restaurante.exibirCardapio();
        System.debug('Teste de exibir cardápio concluído');
    }

    public static void testBuscarProdutos(String termoBusca, Restaurante restaurante) {
        List<Produto> produtosEncontrados = restaurante.buscarProdutos(termoBusca);
        if (produtosEncontrados.isEmpty()) {
            System.debug('Nenhum produto encontrado para ' + termoBusca);
        }else{
            System.debug('Produtos encontrados: ' + produtosEncontrados);
        }
        System.debug('Teste de busca de produtos concluído');
    }

    public static void testCriarPedidoComProdutosValidos(Pedido pedido) {
        Produto produto = new Produto('Pizza Mussarela', 35.00);
        Produto produto2 = new Produto('Refrigerante', 8.00);
        pedido.adicionarItemPedido(produto, 2);
        pedido.adicionarItemPedido(produto2, 1);
        pedido.adicionarItemPedido(produto, 1);
        pedido.exibirResumo();
        pedido.confirmarPedido();
        System.debug('Status do pedido: ' + pedido.getStatus());
        System.debug('Teste de criação de pedido com produtos válidos concluído');
    }

    public static void testAdicionarProdutoInvalido(Pedido pedido) {
        Produto produto = new Produto('Ovo', 0.99);
        pedido.adicionarItemPedido(produto, 2);
        pedido.confirmarPedido();
        Produto produto2 = new Produto('Pizza Calabresa', 38.00);
        pedido.adicionarItemPedido(produto2, 1);
        pedido.exibirResumo();
        System.debug('Teste de criação de pedido com produtos inválidos concluído');
    }

    public static void testRelatorioProdutosMaisVendidos(List<Pedido> pedidos){
        Map<Produto, Integer> relatorios = Relatorio.gerarRelatorioProdutosMaisVendidos(pedidos);
        for(Produto p : relatorios.keySet()) {
            System.debug('Produto: ' + p.getNome() + ', Vendidos: ' + relatorios.get(p));
        }
    }

    public static void testRelatorioPedidosPorCliente(List<Pedido> pedidos, List<String> cpfs, Restaurante restaurante) {
        for(Integer i = 0; i < pedidos.size(); i++) {
            if(!pedidos[i].getRestaurante().getNome().equals(restaurante.getNome())) {
                pedidos.remove(i);
                i--;
            }
        }

        Map<String, List<Pedido>> relatoriosPorCliente = Relatorio.gerarRelatorioPedidosPorCliente(pedidos, cpfs);

        for(String cpf : relatoriosPorCliente.keySet()) {
            List<Pedido> pedidosCliente = relatoriosPorCliente.get(cpf);
            if(pedidosCliente.size() > 1) {
                System.debug('Cliente: ' + cpf + ' - ' + pedidosCliente.size() + ' pedidos');
            }else{
                System.debug('Cliente: ' + cpf + ' - ' + pedidosCliente.size() + ' pedido');
            }
        }
    }
}