public with sharing class Produto {
    public String nome;
    public Decimal preco;
    public Produto(String nome, Decimal preco) {
        this.nome = nome;
        this.preco = preco; 
    }
    public override String toString(){
        return this.nome+' - R$'+this.preco;
    }
    
}