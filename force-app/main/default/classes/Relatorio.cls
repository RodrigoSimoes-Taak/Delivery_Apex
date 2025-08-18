public class Relatorio {
    public static Map<Produto, Integer> gerarRelatorioProdutosMaisVendidos(List<Pedido> pedidos){
        Map<Produto, Integer> relatorios = new Map<Produto, Integer>();
        for(Pedido pedido : pedidos){
            for(ItemPedido item : pedido.getItens()){
                Produto produto = item.getProduto();
                Integer quantidade = item.getQuantidade();

                if(relatorios.containsKey(produto)){
                    relatorios.put(produto, relatorios.get(produto) + quantidade);
                } else {
                    relatorios.put(produto, quantidade);
                }
            }
        }

        return relatorios;
    }

    public static Map<String, List<Pedido>> gerarRelatorioPedidosPorCliente(List<Pedido> pedidos, List<String> cpfs) {
        Map<String, List<Pedido>> relatorios = new Map<String, List<Pedido>>();
        for(String cpf : cpfs){
            relatorios.put(cpf, new List<Pedido>());
        }

        for(Pedido p : pedidos){
            for(String cpf : cpfs){
                if(p.getCliente().getCpf().equals(cpf)) {
                    relatorios.get(cpf).add(p);
                }
            }
        }
        return relatorios;
    }

}