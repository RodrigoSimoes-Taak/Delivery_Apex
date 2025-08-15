public with sharing class Restaurante {
   
    String nome;
    String endereco;
    List<Produto> cardapio;
  
    public Restaurante(String nome , String endereco , List<Produto> cardapio){
        this.nome = nome;
        this.endereco = endereco;
        this.cardapio = cardapio;
    }

    public void adicionarProduto(Produto novoProduto){
    Boolean existe = false;
    for (Produto p : cardapio) {
        if (p.nome.equalsIgnoreCase(novoProduto.nome)) {
            existe = true;
            break;
        }
    }
    if (existe) {
        System.debug('Item já consta no cardápio');
    } else {
        cardapio.add(novoProduto);
        System.debug('Item adicionado com sucesso');
    }
}

    public void exibirCardapio(){
        Integer i = 1;
        for(Produto item : cardapio){
            System.debug(i + '. ' + item.nome + ' - R$' + item.preco);
            i++;
        }
    }
    
    public void buscarProdutos(String itemDeInteresse){
        Boolean naoTemItem = true;
        i = 1;
        for(Produto item: cardapio){
            if(item.nome.toLowerCase().contains(itemDeInteresse.toLowerCase())){
                System.debug(i + 'Resultado busca - ' + item.nome + ' - R$' + item.preco);
                naoTemItem = false;
            }
            i++;
        }
        if(naoTemItem){
            System.debug('Nenhum produto encontrado para: ' + itemDeInteresse);
        }
    }
}
