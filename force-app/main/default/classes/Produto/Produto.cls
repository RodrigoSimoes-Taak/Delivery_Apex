public with sharing class Produto {


    public String nome {get; set;}
    public Double preco {get; set;}

    public Produto() {
        
    }

    public Produto(String nome, Double preco) {
        this.nome = nome;
        this.preco = preco;
    
    }
}