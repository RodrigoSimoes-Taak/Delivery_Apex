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
}