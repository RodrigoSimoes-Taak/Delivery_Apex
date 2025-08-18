public with sharing class RelatoriosNew {
    public RelatoriosNew() {

    }
    public Map<produto, Integer> gerarRelatorioProdutosMaisVendidos(List<Pedido> pedidos) {
        Map<Produto, Integer> relatorio = new Map<Produto, Integer>();

        //loop que coloca todos os pedidos e seus itens no relatorio
        if(pedidos == null || pedidos.isEmpty()) {
            System.debug('Nenhum pedido encontrado para gerar o relatório.');
            return relatorio;
        }
        for(Pedido pedido : pedidos) {
            for(ItemPedido item : pedido.itens) {
                Produto produto = item.produto;
                if(relatorio.containsKey(produto)) {
                    relatorio.put(produto, relatorio.get(produto) + item.quantidade);
                } else {
                    relatorio.put(produto, item.quantidade);
                }
            }
        }

        List<Produto> produtos = new List<Produto>(relatorio.keySet());
        List<Integer> quantidades = new List<Integer>(relatorio.values());

        // Ordena os produtos por quantidade vendida em ordem decrescente
        for (Integer i = 0; i < produtos.size() - 1; i++) {
            for (Integer j = i + 1; j < produtos.size(); j++) {
                if (relatorio.get(produtos[i]) < relatorio.get(produtos[j])) {
                    // Troca os produtos
                    Produto tempProduto = produtos[i];
                    produtos[i] = produtos[j];
                    produtos[j] = tempProduto;

                    // Troca as quantidades correspondentes
                    Integer tempQuantidade = quantidades[i];
                    quantidades[i] = quantidades[j];
                    quantidades[j] = tempQuantidade;
                }
            }
        }

        // Exibe o relatório ordenado
        System.debug('Relatório de Produtos Mais Vendidos:');
        System.debug('-----------------------------------');
        System.debug('Produto - Quantidade Vendida');
        for(integer i = 0; i < 3; i++) {
            System.debug('Produto: ' + produtos[i].nome + ', Quantidade Vendida: ' + quantidades[i]);
        }

        return relatorio;
    }
}