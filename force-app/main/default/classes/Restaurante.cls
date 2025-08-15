public with sharing class Restaurante {
    public string nome {get; private set;}
    public string endereco {get; private set;}
    private public List<Produto> cardapio = new List<Produto>();
    public CategoriaRestaurante categoria;
   
     public Restaurante() {

    }

    public Restaurante(string nome,string endereco, CategoriaRestaurante categoria) {
        this.nome = nome;
        this.endereco = endereco;
        this.categoria = categoria;
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

    public void exibirCardapio() {
        integer contatdor = 1;
        for(Produto produto : cardapio) {
            System.debug(contatdor + '.  ' + produto.nome.capitalize() + ', Preço: R$' + produto.preco);
            contatdor++;
        }
    }

    public void buscarProduto(String nome) {
        system.debug('ping');
        for(Produto produto : cardapio) {
            if(produto.nome.contains(nome)) {
                System.debug('Produto encontrado: ' + produto.nome + ', Preço: R$' + produto.preco);               
            }
        }
    }
}