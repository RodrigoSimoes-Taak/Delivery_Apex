public with sharing class ItemPedido {
    private Produto produto;
    private int quantidade;
    private Double subTotal;

    public Produto produto {get { return produto; } set { produto = value; }}
    public int quantidade {get { return quantidade; } set { quantidade = value; calcularSubTotal(); }}
    public Double subTotal {get { return subTotal; } set { subTotal = value; }}

    public ItemPedido(Produto produto, int quantidade) {
        this.produto = produto;
        this.quantidade = quantidade;
        this.subTotal = calcularSubTotal();
    }

    private void calcularSubTotal(){
        subTotal = produto.preco * quantidade;
    }
}