public with sharing class ItemPedido {
    Produto produto;
    integer quantidade;
    Double subTotal;
    public ItemPedido(Produto produto, integer quantidade) {
        this.produto = produto;
        this.quantidade = quantidade;
    }

    public double calcularSubTotal() {
        this.subTotal = this.produto.preco * this.quantidade;
    }
}