public with sharing class Pedido {
    public Cliente cliente;
    public Restaurante restaurante;
    public List<ItemPedido> itens;
    public StatusPedido status;
    public Decimal total;

    public Pedido(Cliente cliente, Restaurante restaurante) {
        this.cliente = cliente;
        this.restaurante = restaurante;
        this.itens = new List<ItemPedido>();
        this.status = StatusPedido.CARRINHO;
        this.total = 0.0;
    }

    public void adicionarItemPedido(Produto produto, Integer quantidade) {
        Boolean produtoExiste = False;
        for (Produto p : restaurante.cardapio) {
            if (p.nome.toLowerCase() == produto.nome.toLowerCase()) {
                produtoExiste = True;
                break;
            }
        }
        if (!produtoExiste) {
            System.debug('Este produto não está disponível nesse restaurante.');
        } else {
            boolean produtoAdicionado = False;
            for (ItemPedido item : this.itens) {
                if (item.produto.nome.toLowerCase() == produto.nome.toLowerCase()) {
                    item.quantidade += quantidade;
                    produtoAdicionado = True;
                    break;
                }
            }
            if (!produtoAdicionado) {
                System.debug('Item adicionado com sucesso.');
                this.itens.add(new ItemPedido(produto, quantidade));
            }
            calcularTotal();
        }
    }

    public void calcularTotal() {
        for (ItemPedido item : this.itens) {
            this.total += item.subTotal;
        }
    }

    public void confirmarPedido() {
        if (this.status == StatusPedido.CARRINHO && !this.itens.isEmpty()) {
            this.status = StatusPedido.EM_PROCESSAMENTO;
            System.debug('Pedido confirmado com sucesso.');
        } else if (this.itens.isEmpty()) {
            System.debug('Erro: Não há itens nesse pedido.');
        } else {
            System.debug('Erro: O pedido está em processamento ou já foi confirmado.');
        }
    }

    public void exibirResumo() {
        System.debug(this.cliente.nome);
        System.debug(this.restaurante.nome);
        for (ItemPedido item : this.itens) {
            System.debug(item.toString());
        }
        System.debug('Total: R$' + this.total.setScale(2).format());
        System.debug(this.status);
    }
}