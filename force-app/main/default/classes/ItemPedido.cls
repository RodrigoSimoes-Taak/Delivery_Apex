public with sharing class ItemPedido {
    public Produto produto;
    public Integer quantidade;
    public Double subTotal;

    public ItemPedido() {
    }
    public ItemPedido(Produto produto, Integer quantidade) {
        this.produto = produto;
        this.quantidade = quantidade;
    }

    public void calcularSubtotal(){
        subTotal = produto.preco * quantidade;
    }

    public override String toString(){
        return 'Item: ' + produto.nome + ' - Quantidade: ' + quantidade + ' - Subtotal: R$' + subTotal;
    }
}