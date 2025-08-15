public with sharing class Produto {
    public string nome {get; private set;}
    public double preco {get; private set;}
    //construtores
    public Produto() {

    }

    public Produto(string nome, double preco) {
        this.nome = nome;
        this.preco = preco;
    }
}