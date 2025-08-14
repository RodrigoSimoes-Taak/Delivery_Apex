public with sharing class Restaurante {
    public String nome;
    public String endereco;
    public CategoriaRestaurante categoria;
    public Produto[] cardapio;

    public Restaurante(String nome,CategoriaRestaurante categoria,String endereco) {
        this.nome = nome;
        this.categoria = categoria;
        this.endereco = endereco;
        cardapio = new Produto[]{};
    }
    public void adicionarProduto(Produto produto){
        for (Produto icard:this.cardapio){
            if (icard.nome.equalsIgnoreCase(produto.nome)){
                System.debug('Ja existe!');
                return;
            }
        }
        this.cardapio.add(produto);
    }
    public void exibirCardapio(){
        if (this.cardapio.isEmpty()){
            System.debug('Ta vazio!');
            return;
        }
        for (Integer i = 0; i < this.cardapio.size(); ++i){
            System.debug(String.valueOf(i+1) + '. ' + this.cardapio[i]);
        }
    }
    public Produto[] buscarProdutos(String termoBusca){
        Produto[] resultBusca = new Produto[]{};
        for (Produto icard:this.cardapio){
            if (icard.nome.toLowerCase().contains(termoBusca.toLowerCase())){
                resultBusca.add(icard);
                
            }
        }
        if (resultBusca.isEmpty()){
            System.debug('Nenhum produto encontrado para '+termoBusca);
        }
        return resultBusca;
    }

}