public with sharing class ItemPedido {
    public Produto produto;
    public Integer quantidade;
    public Decimal subTotal;
    public ItemPedido(Produto produto, Integer quantidade) {
        this.produto = produto;
        this.quantidade = quantidade;
        calcularSubtotal();
    }
    public void calcularSubtotal(){
        this.subTotal = this.produto.preco*this.quantidade;
    }
    public override String toString(){
        return this.produto.nome+' - '+ this.quantidade +' R$'+this.subTotal;
    }
}