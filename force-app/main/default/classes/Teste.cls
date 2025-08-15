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
}