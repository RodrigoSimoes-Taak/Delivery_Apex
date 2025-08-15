public with sharing class ItemPedido {


    public Produto produto {get; set;}
    public integer quantidade {get; set{quantidade = value; subTotal = calcularSubTotal(); }}
    public Double subTotal {get; set;}

    public ItemPedido(Produto produto, integer quantidade) {
        this.produto = produto;
        this.quantidade = quantidade;
        this.subTotal = calcularSubTotal();
    }

    private Double calcularSubTotal(){
        return subTotal = produto.preco * quantidade;
    }
}