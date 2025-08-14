
public with sharing class Restaurante {
    String nome;
    String endereco;
    CategoriaRestaurante categoria;
    Produto[] cardapio;

    public Restaurante(String nome,String endereco) {
        this.nome = nome;
        this.endereco = endereco;
        cardapio = new Produto[]{};
    }

}