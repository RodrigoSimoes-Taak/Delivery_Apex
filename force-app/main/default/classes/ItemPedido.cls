public class ItemPedido {
    public Produto produto { get; set; }
    public Integer quantidade { get; set; }
    public Double subTotal { get; set; }

    public ItemPedido(Produto produto, Integer quantidade) {
        this.produto = produto;
        this.quantidade = quantidade;
        this.subTotal = calcularSubTotal();
    }

    public double calcularSubTotal() {
        return this.produto.preco * this.quantidade;
    }
}