public with sharing class Restaurante {
    private String _nome;
    private String _endereco;
    private Liust<Produto> _cardapio = new List<Produto>();
    private Categoria _categoria;

    public String nome {get{ _nome;} set{_nome = value;}}
    public String endereco {get{ _endereco;} set{_endereco = value;}}
    public List<Produto> cardapio {get{ return _cardapio;} set{_cardapio = value;}}
    public Categoria categoria {get{ return _categoria;} set{_categoria = value;}}
    
    public Restaurante() {
        
    }
    public Restaurante(String nome, String endereco, List<Produto> cardapio, Categoria categoria) {
        this._nome = nome;
        this._endereco = endereco;
        this._cardapio = cardapio;
        this._categoria = categoria;
    }

    public void adicionarProduto(Produto produto){
        if(cardapio.containsIgnoreCase(produto.nome)) System.debug('Erro ao adiciona produto, ele ja existe');
        else {
            produto.nome = produto.nome.toLowerCase();
            cardapio.add(produto);
        }
    }
    
    public void exibirCardapio(){
        for(int i = 0; i < cardapio.size(); i++){
            System.debug(i+1 + ' Nome: ' + cardapio[i].nome + ', Preço: ' + produto[i].preco);
        }

    }

    public void buscarProduto(string termoBusca){
        termoBusca = termoBusca.toLowerCase();
        Boolean achado = false;
        for(Produto produto : cardapio){
            if(produto.nome.containsIgnoreCase(termoBusca)) {
                System.debug(' Nome: ' + cardapio.nome + ', Preço: ' + produto.preco);
                achado = true;
            }

        }
        if(!achado) System.debug('Nenhum produto encontrado com o termo: ' + termoBusca);
    }





}