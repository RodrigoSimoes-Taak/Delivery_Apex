public with sharing class ComparadorProduto implements Comparable {
    public Produto produto;
    public Integer vendas;

    public ComparadorProduto(Produto produto, Integer vendas) {
        this.produto = produto;
        this.vendas = vendas;
    }

    public Integer compareTo(Object compareTo) {
        ComparadorProduto comparador = (ComparadorProduto) compareTo;
        if (this.vendas > comparador.vendas) {
            return -1;
        } else if (this.vendas < comparador.vendas) {
            return 1;
        } else if (this.produto.nome.toLowerCase() < comparador.produto.nome.toLowerCase()) {
            return -1;
        } else if (this.produto.nome.toLowerCase() > comparador.produto.nome.toLowerCase()) {
            return 1;
        } else {
            return 0;
        }
    }
}