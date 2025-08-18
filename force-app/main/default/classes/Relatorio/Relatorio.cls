public with sharing class Relatorio {

    
    public static Map<Produto, Integer> gerarRelatorioMaisVendidos(List<Pedido> pedidos){
        Map<Produto, Integer> relatorio = new Map<Produto, Integer>();
        for(Pedido pedido : pedidos){
            for(ItemPedido itemPedido : pedido.itens){
                if(!relatorio.containsKey(itemPedido.produto)){
                    relatorio.put(itemPedido.produto, itemPedido.quantidade);
                }
                else{
                    Integer quantidadeAtual = relatorio.get(itemPedido.produto);
                    relatorio.put(itemPedido.produto, quantidadeAtual + itemPedido.quantidade);
                }
            }
        }
        List<ItemPedidoComparator> itemPedidos = new List<ItemPedidoComparator>();
        for(Produto produto : relatorio.keySet()){
            itemPedidos.add(new ItemPedidoComparator(new ItemPedido(produto, relatorio.get(produto))));
        }
        itemPedidos.sort();
        relatorio.clear();

        for(ItemPedidoComparator itemPedido :  itemPedidos){
            relatorio.put(itemPedido.item.produto, itemPedido.item.quantidade);
        }

        System.debug('Top 3 produtos mais vendidos:');
        for(integer i = 0; i < 3; i++){
            System.debug(itemPedidos[i].item.produto.nome + ' - ' + itemPedidos[i].item.quantidade + ' unidades vendidas');
        }

        return relatorio;

    }

    public static Map<String, List<Pedido>> gerarRelatorioPedidosPorCliente(List<Pedido> pedidos, List<String> cpfs){
        Map<String, List<Pedido>> relatorio = new Map<String, List<Pedido>>();
        for(integer i = 0; i < cpfs.size(); i++){
            relatorio.put(cpfs[i], new List<Pedido>());
            for(Pedido pedido : pedidos){
                if (pedido.cliente.cpf == cpfs[i]) relatorio.get(cpfs[i]).add(pedido);
            }

        }

        for(String cpf : relatorio.keySet()){
            System.debug('Cliente: ' + cpf + ' - ' + relatorio.get(cpf).size() + ' pedidos');

        }
        return relatorio;

    }
    
}

