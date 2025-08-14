public with sharing class Relatorios {
    
    
    
    public static Map<Produto,Integer> gerarRelatorioProdutosMaisVendidos(Pedido[] pedidos){ // nao esta ordenada
        Map<Produto,Integer> produtosVendidos = new Map<Produto,Integer>();
        Map<Produto,Integer> produtosVendidosOrdenado = new Map<Produto,Integer>();
        for (Pedido iPedido:pedidos){
            if (!iPedido.itens.isEmpty()){
                for (ItemPedido iItemPedido:iPedido.itens){
                    if (produtosVendidos.containsKey(iItemPedido.produto)){
                        produtosVendidos.put(iItemPedido.produto,produtosVendidos.get(iItemPedido.produto)+iItemPedido.quantidade);
                    }
                    else{
                        produtosVendidos.put(iItemPedido.produto,iItemPedido.quantidade);
                    }
                }
            }
        }
        Integer[] valores = produtosVendidos.values();
        valores.sort();
        Integer cont = 1;
        for (Integer i = produtosVendidos.size()-1; i>-1;--i){
            for (Produto iProduto :produtosVendidos.keySet()){
                if (produtosVendidos.get(iProduto) == valores[i]){
                    if (cont <4){
                        System.debug(cont + '. ' + iProduto.nome+ ' - ' + produtosVendidos.get(iProduto));
                        cont++;
                    }
                    produtosVendidosOrdenado.put(iProduto,produtosVendidos.get(iProduto));
                    break;
                }
                    
                
            }
        }
        
        return produtosVendidosOrdenado;
    }
    public static Map<String,List<Pedido>> gerarRelatorioPedidosPorCliente(Pedido[] pedidos,String[] cpfs){
        Map<String,List<Pedido>> pedidosPorCpf = new Map<String,List<Pedido>>();
        for (Pedido iPedido:pedidos){
            if (cpfs.contains(iPedido.cliente.cpf)){
                if (!pedidosPorCpf.containsKey(iPedido.cliente.cpf)){
                    pedidosPorCpf.put(iPedido.cliente.cpf, new Pedido[]{});
                }    
                pedidosPorCpf.get(iPedido.cliente.cpf).add(iPedido);
            }
        }
        for (String iCPF:pedidosPorCpf.keySet()){
            System.debug('Cliente: '+iCPF + ' ' + pedidosPorCpf.get(iCPF).size()+' Pedidos');
        }
        return pedidosPorCpf;
    }
}
