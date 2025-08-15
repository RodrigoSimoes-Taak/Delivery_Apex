public with sharing class Produto {
    private String nome;
    private Decimal preco;

    public Produto(String nome, Decimal preco) {
        this.nome = nome;
        this.preco = preco;
    }

    public String getNome() {
        return nome;
    }

    public Decimal getPreco() {
        return preco;
    }
}