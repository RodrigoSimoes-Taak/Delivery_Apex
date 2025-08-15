public with sharing class Restaurante {
 

    public String nome {get; set;}
    public String endereco {get; set;}
    public List<Produto> cardapio {get; set;}
    public Categoria categoria {get; set;}
    
    public Restaurante() {
        cardapio = new List<Produto>();
    }
    public Restaurante(String nome, String endereco, List<Produto> cardapio, Categoria categoria) {
        this.nome = nome;
        this.endereco = endereco;
        this.cardapio = cardapio;
        this.categoria = categoria;
    }

    public void adicionarProduto(Produto produto){
        
        Boolean existente = false;
        for(Produto p : cardapio){
            if(p.nome.toLowerCase() == produto.nome.toLowerCase()) {
                existente = true;
            }
        }
        if(existente) System.debug('Erro ao adicionar produto, ele ja existe');
        else {
            cardapio.add(produto);
            System.debug('Produto adicionado com sucesso ao cardapio');
        }
    }
    
    public void exibirCardapio(){
        for(integer i = 0; i < cardapio.size(); i++){
            System.debug(i+1 + ' Nome: ' + cardapio[i].nome + ', Preço: ' + cardapio[i].preco);
        }

    }

    public void buscarProduto(string termoBusca){
        termoBusca = termoBusca.toLowerCase();
        Boolean achado = false;
        for(Produto produto : cardapio){
            if(produto.nome.containsIgnoreCase(termoBusca)) {
                System.debug(' Nome: ' + produto.nome + ', Preço: ' + produto.preco);
                achado = true;
            }

        }
        if(!achado) System.debug('Nenhum produto encontrado com o termo: ' + termoBusca);
    }





}