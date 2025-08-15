public with sharing class ItemPedido {
    Produto produto;
    Integer quantidade;
    Double subTotal;
    StatusPedido status;
    
public ItemPedido(Produto produto, Integer quantidade){
    this.produto = produto;
    this.quantidade = quantidade;
    this.status = StatusPedido.CARRINHO;
    this.subTotal = this.quantidade * this.produto.preco;

}

    public Double calcularSubtotal(){
        return this.quantidade * this.produto.preco;
    }
}
