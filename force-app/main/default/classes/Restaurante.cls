public with sharing class Restaurante {
    private String nome;
    private String endereco;
    private CategoriaRestaurante categoria;
    private Produto produto;

    public Restaurante(String nome, String endereco, CategoriaRestaurante categoria, Produto produto) {
        this.nome = nome;
        this.endereco = endereco;
        this.categoria = categoria;
        this.produto = produto;
    }

    public String getNome() {
        return nome;
    }

    public String getEndereco() {
        return endereco;
    }

    public CategoriaRestaurante getCategoria() {
        return categoria;
    }

    public Produto getProduto() {
        return produto;
    }
}