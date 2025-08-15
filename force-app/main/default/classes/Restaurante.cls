public with sharing class Restaurante {
    public String nome;
    public String endereco;
    public CategoriaRestaurante categoria;
    public List<Produto> cardapio = new List<Produto>();

    public Restaurante() {
    }
    public Restaurante(String nome, String endereco, CategoriaRestaurante categoria) {
        this.nome = nome;
        this.endereco = endereco;
        this.categoria = categoria;
    }
    public void adicionarProduto(Produto produto){
        Boolean adicionar = true;
        String nomeProduto = produto.nome.toLowerCase();
        for(Produto p: cardapio){
            if(p.nome.toLowerCase().equals(nomeProduto)){
                System.debug('Erro: produto já existe!');
                adicionar = false;
            }
        }
        if(adicionar == true){
            cardapio.add(produto);
            System.debug('Produto adcionado com sucesso!');
        }
    }
    public void exibirCardapio(){
        Integer i = 1;
        if(cardapio.size() == 0){
            System.debug('Cardápio vazio');
        }else{
            for(Produto p: cardapio){
                System.debug(i + '. ' + p.nome + ' - R$' + p.preco);
            }
        }
    }

    public void buscarProdutos(String termoBusca){
        Boolean existeProduto = false;
        String nomeTermo = termoBusca.toLowerCase();
        for(Produto p: cardapio){
            if(p.nome.toLowerCase().contains(nomeTermo)){
                existeProduto = true;
                System.debug(p.nome +' - R$'+ p.preco);
            }
        }
        if(existeProduto == false){
            System.debug('Nenhum produto enconrrado para ' + termoBusca);
        }
    }
}