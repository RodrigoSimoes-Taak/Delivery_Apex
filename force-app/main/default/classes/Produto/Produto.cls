public with sharing class Produto {
    private String _nome;
    private Double _preco;

    public String nome {get{ _nome;} set{_nome = value;}}
    public Double preco {get{ _preco;} set{  _preco = value;}}

    public Produto() {
        
    }

    public Produto(String nome, Double preco) {
        this._nome = nome;
        this._preco = preco;
    
    }
}