public class Restaurante {
    public String nome { get; set; }
    public String endereco { get; set; }
    public CategoriaRestaurante categoria { get; set; }
    public List<Produto> cardapio { get; set; }

    public Restaurante(String nome, String endereco, CategoriaRestaurante categoria) {
        this.nome = nome;
        this.endereco = endereco;
        this.categoria = categoria;
        this.cardapio = new List<Produto>();
    }

    public void adicionarProduto(Produto produto) {
        if (this.cardapio.contains(produto)) {
            System.debug('Produto já existe no cardápio.');
            return;
        }
        this.cardapio.add(produto);
        System.debug('Produto adicionado ao cardápio: ' + produto.nome);
    }

    public void exibirCardapio() {
        if (cardapio.isEmpty()) {
            System.debug('O cardápio está vazio.');
            return;
        }
        for(Integer i = 0; i < this.cardapio.size(); i++) {
            Produto produto = this.cardapio[i];
            System.debug(i + '. ' + produto.nome + ' - R$' + produto.preco);
        }
    }

    public List<String> buscarProdutos(String termoBusca) {
        List<String> produtosEncontrados = new List<String>();
        String p;
        for (Produto produto : this.cardapio) {
            if (produto.nome.contains(termoBusca)) {
                p = produto.nome + ' - R$' + produto.preco;
                produtosEncontrados.add(p);
            }
        }
        if (produtosEncontrados.isEmpty()) {
            System.debug('Nenhum produto encontrado para ' + termoBusca + '.');
        }
        return produtosEncontrados;
    }

    public Map<String, Integer> gerarRelatorioProdutosMaisVendidos(List<Pedido> pedidos) {
        Map<String, Integer> vendas = new Map<String, Integer>();
        List<Integer> quantidades = new List<Integer>();

        for (Pedido pedido : pedidos) {
            for (ItemPedido item : pedido.itens) {
                if (vendas.containsKey(item.produto.nome)) {
                    vendas.put(item.produto.nome, vendas.get(item.produto.nome) + item.quantidade);
                } else {
                    vendas.put(item.produto.nome, item.quantidade);
                }
                quantidades.add(item.quantidade);
            }
        }

        quantidades.sort();

        System.debug('Relatório de Produtos Mais Vendidos:');
        // colocar os 3 itens mais pedidos em ordem decrescente
        List<String> produtosOrdenados = new List<String>(vendas.keySet());
        produtosOrdenados.sort();
        System.debug(quantidades);
        for(Integer j = 0; j < 3; j++) {
            for (Integer i = 0; i < produtosOrdenados.size(); i++) {
                String produto = produtosOrdenados[i];
                Integer quantidade = vendas.get(produto);
                if (quantidade >= quantidades[quantidades.size() - 1 - j]) {
                    System.debug(j + 1 + '. ' + produto + ': ' + quantidade + ' unidades vendidas');
                    produtosOrdenados.remove(i);
                }
            }
        }
        

        return vendas;
    }

    public Map<String, List<Pedido>> gerarRelatorioPedidosPorCliente(List<Pedido> pedidos, List<String> cpfs) {
        Map<String, List<Pedido>> relatorio = new Map<String, List<Pedido>>();

        for (Pedido pedido : pedidos) {
            if (cpfs.contains(pedido.cliente.cpf)) {
                if (!relatorio.containsKey(pedido.cliente.nome)) {
                    relatorio.put(pedido.cliente.nome, new List<Pedido>());
                }
                relatorio.get(pedido.cliente.nome).add(pedido);
            }

        }
        for (String clienteNome : relatorio.keySet()) {
            System.debug('Cliente: ' + clienteNome + ' - ' + relatorio.get(clienteNome).size() + ' Pedidos' );
        }
        return relatorio;
    }

}