public with sharing class ItemPedido {
    public Produto produto;
    public integer quantidade;
    public Double subTotal {get; private set;}
    public ItemPedido(Produto produto, integer quantidade) {
        this.produto = produto;
        this.quantidade = quantidade;
    }

    public double calcularSubTotal() {
        subTotal = produto.preco * quantidade;
        return subTotal;
    }
}