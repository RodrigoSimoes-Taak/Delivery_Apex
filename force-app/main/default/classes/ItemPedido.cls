public with sharing class ItemPedido {
    public Produto produto;
    public Integer quantidade;
    public Double subTotal;

    public ItemPedido(Produto produto, Integer quantidade) {
        this.produto = produto;
        this.quantidade = quantidade;
        calcularSubTotal();
    }

    private void calcularSubTotal() {
        this.subTotal = produto.preco * quantidade;
    }
}