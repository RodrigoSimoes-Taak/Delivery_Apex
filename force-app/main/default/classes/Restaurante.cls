public with sharing class Restaurante {
    public String nome;
    public String endereco;
    public Categoria categoria;
    public List<Produto> cardapio;

    public Restaurante(String nome, String endereco, Categoria categoria, List<Produto> cardapio) {
        this.nome = nome;
        this.endereco = endereco;
        this.categoria = categoria;
        this.cardapio = cardapio;
    }

    public override String toString() {
        return categoria + ' ' + nome; 
    }

    public Boolean adicionarProduto(Produto produto) {
        for (Produto p : this.cardapio) {
            if (p.nome.toLowerCase() == produto.nome.toLowerCase()) {
                System.debug('Erro: produto já está adicionado no cardápio.');
                return False;
            }
        }
        this.cardapio.add(produto);
        return True;
    }

    public void exibirCardapio() {
        if (this.cardapio.isEmpty()) {
            System.debug('Não há itens no cardápio.');
        } else {
            for (Produto p : this.cardapio) {
                System.debug(p.toString());
            }
        }
    }

    public void buscarProdutos(String termoBusca) {
        boolean encontrado = False;
        for (Produto p : this.cardapio) {
            if (p.nome.toLowerCase().contains(termoBusca.toLowerCase())) {
                System.debug(p.toString());
                encontrado = True;
            }
        }
        if (!encontrado) {
            System.debug('Nenhum produto foi encontrado.');
        }
    }

    public Map<Produto, Integer> gerarRelatorioProdutosMaisVendidos(List<Pedido> pedidos) {
        Map<Produto, Integer> relatorio = new Map<Produto, Integer>();
        for (Pedido pedido : pedidos) {
            for (ItemPedido item : pedido.itens) {
                if (relatorio.containsKey(item.produto)) {
                    relatorio.put(item.produto, relatorio.get(item.produto) + item.quantidade);
                } else {
                    relatorio.put(item.produto, item.quantidade);
                }
            }
        }
        List<ComparadorProduto> comparador = new List<ComparadorProduto>();
        for (Produto produto : relatorio.keySet()) {
            comparador.add(new ComparadorProduto(produto, relatorio.get(produto)));
        }
        comparador.sort();
        for (Integer i = 0; i < 3 && i < comparador.size(); i++) {
            System.debug(comparador[i].produto.nome + ' - ' + comparador[i].vendas + ' unidades');
        }
        return relatorio;
    }

    public Map<String, List<Pedido>> gerarRelatorioPedidosPorCliente(List<Pedido> pedidos, List<String> cpfs) {
        Map<String, List<Pedido>> relatorio = new Map<String, List<Pedido>>();
        for (String cpf : cpfs) {
            for (Pedido pedido : pedidos) {
                if (pedido.cliente.cpf == cpf) {
                    if (!relatorio.containsKey(cpf)) {
                        relatorio.put(cpf, new List<Pedido>());
                    }
                    relatorio.get(cpf).add(pedido);
                }
            }
            System.debug('Cliente: ' + cpf + ' - ' + relatorio.get(cpf).size() + ' pedidos');
        }
        return relatorio;
    }
}