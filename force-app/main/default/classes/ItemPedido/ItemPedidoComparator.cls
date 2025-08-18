public with sharing class ItemPedidoComparator implements Comparable{
    public ItemPedido item {get; set;}
    public ItemPedidoComparator(ItemPedido item) {
        this.item = item;
    }

    public Integer compareTo(Object obj) {
        ItemPedidoComparator other = (ItemPedidoComparator)obj;
        if (this.item.quantidade > other.item.quantidade) return -1;
        if (this.item.quantidade < other.item.quantidade) return 1;
        return 0;
    }
}