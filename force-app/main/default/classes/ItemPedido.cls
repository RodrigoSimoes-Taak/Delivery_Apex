public with sharing class ItemPedido {
    private Produto produto;
    private Integer quantidade;
    private Decimal subTotal;

    public ItemPedido(Produto produto, Integer quantidade) {
        this.produto = produto;
        this.quantidade = quantidade;
        this.subTotal = this.calcularSubtotal();
    }

    public Decimal calcularSubtotal() {
        return this.produto.getPreco() * this.quantidade;
    }

    public Decimal getSubtotal() {
        return this.subTotal;
    }

    public Produto getProduto() {
        return this.produto;
    }

    public Integer getQuantidade() {
        return this.quantidade;
    }

    public void setQuantidade(Integer quantidade) {
        this.quantidade = quantidade;
    }

    public void setSubtotal(Decimal subTotal) {
        this.subTotal = subTotal;
    }

    public override String toString() {
        return 'Produto: ' + this.produto.getNome() + ' - Quantidade: ' + this.quantidade + ' - Subtotal: ' + this.subTotal;
    }
}