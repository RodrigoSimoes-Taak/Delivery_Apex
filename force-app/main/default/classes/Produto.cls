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

    public Boolean equals(Object obj) {
        if (obj == null || !(obj instanceof Produto)) return false;
        Produto produto = (Produto) obj;
        return String.valueOf(this.nome) == String.valueOf(produto.nome) &&
               this.preco == produto.preco;
    }

    public Integer hashCode() {
        Integer hash = 7;
        hash = 31 * hash + (this.nome != null ? this.nome.hashCode() : 0);
        hash = 31 * hash + (this.preco != null ? this.preco.hashCode() : 0);
        return hash;
    }

    public override String toString() {
        return this.nome + ' - R$' + this.preco.setScale(2);
    }
}