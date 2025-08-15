public with sharing class Restaurante {
    public string nome {get; private set;}
    public string endereco {get; private set;}
    public List<Produto> cardapio {get; private set;}
    public CategoriaRestaurante categoria;
   
     public Restaurante() {

    }

    public Restaurante(string nome,string endereco) {
        this.nome = nome;
        this.endereco = endereco;
    }

    //metodos
    public void adicionarProduto(Produto produtoNovo) {
        if(cardapio.contains(produtoNovo)) {
            system.debug('produto já existe no cardápio: '+ produtoNovo.nome);
        } else {
            cardapio.add(produtoNovo);
            System.debug('produto adicionado com sucesso '+ produtoNovo.nome);
        }
    }

    public void exibirCardapio() {}
}