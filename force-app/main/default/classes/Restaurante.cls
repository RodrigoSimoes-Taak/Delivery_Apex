public with sharing class Restaurante {
    private String nome;
    private String endereco;
    private CategoriaRestaurante categoria;
    private List<Produto> cardapio;

    public Restaurante(String nome, String endereco, CategoriaRestaurante categoria) {
        this.nome = nome;
        this.endereco = endereco;
        this.categoria = categoria;
        this.cardapio = new List<Produto>();
    }

    public String getNome() {
        return this.nome;
    }

    public String getEndereco() {
        return this.endereco;
    }

    public CategoriaRestaurante getCategoria() {
        return this.categoria;
    }

    public List<Produto> getCardapio() {
        return this.cardapio;
    }

    public void adicionarProduto(Produto produto) {
        if(produto != null) {
            for(Produto p : this.cardapio) {
                if(p.getNome().equalsIgnoreCase(produto.getNome())) {
                    System.debug('Produto já está no cardápio');
                    return;
                }
            }
            this.cardapio.add(produto);
            System.debug('Produto adicionado com sucesso: ' + produto);
        }else{
            System.debug('Insira um produto válido');
        }
    }

    public void exibirCardapio(){
        if(this.cardapio.isEmpty()){
            System.debug('Cardápio vazio');
            return;
        }
        for(Integer i = 0; i < this.cardapio.size(); i++) {
            System.debug((i + 1) + '. ' + this.cardapio[i]);
        }
    }

    public List<Produto> buscarProdutos(String termoBusca){
        List<Produto> produtos = new List<Produto>();
        for(Produto p : this.cardapio){
            if(p.getNome().containsIgnoreCase(termoBusca)){
                produtos.add(p);
            }
        }
        return produtos;
    }
}