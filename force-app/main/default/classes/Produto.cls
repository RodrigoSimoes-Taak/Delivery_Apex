public with sharing class Produto {
    public string nome {get; private set;}
    public double preco {get; private set;}
    //construtores
    public Produto(string nome, decimal preco) {
        this.nome = nome.toLowerCase();
        this.preco = preco;
    }
}