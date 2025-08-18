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

        for(Produto produto : relatorio.keySet()) {
            Integer quantidade = relatorio.get(produto);
            System.debug(produto.nome + ': ' + quantidade);
        }

        return relatorio;
    }
}