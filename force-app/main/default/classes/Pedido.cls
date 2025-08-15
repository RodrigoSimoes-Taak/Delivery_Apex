public with sharing class Pedido {
    private Cliente cliente;
    private Restaurante restaurante;
    private List<ItemPedido> itens;
    private StatusPedido status;
    public double total {get; private set;}

    //construtor
    public Pedido(Cliente cliente, Restaurante restaurante) {
        this.cliente = cliente;
        this.restaurante = restaurante;
        this.status = status.CARRINHO;
        this.itens = new List<ItemPedido>();
        this.total = 0.0;
    }
    //metodos

    //verifica se o item exite no cardapio do restaurante e adiciona ao pedido
    public void adicionarItemPedido(Produto produto, integer quantidade) {
        if(Restaurante.cardapio.contains(produto)) {
            if(!itens.contains(produto)) {
                for(integer i = 0; i <= quantidade; i++) {
                    itens.add(produto);
                }
                system.debug('adicionado os itens com sucesso');
                calcularTotal();
            } else {
                itens.get(produto).quantidade += quantidade; 
                system.debug('adicionado mais itens com sucesso');
                calcularTotal();
            } 
        } else system.debug('produto nao encontrado no cardapio');
    }

    //calcula valor total do carrinho
    public void calcularTotal() {
        this.total = 0.0;
        for(ItemPedido item : itens) {
            this.total += item.calcularSubTotal();
        }
        system.debug('total atualizado ');
    }

    //leva o pedido a fase de processamento caso o carrinho nao esteja vazio e tiver algum item na lista
    public void confirmarPedido() {
        if(this.status == status.CARRINHO && itens != null) {
            this.status = status.EM_PROCESSAMENTO;
            system.debug('pedido confirmado e em processamento');
        } else {
            system.debug('pedido nao pode ser confirmado, verifique o status ou itens');
        }
    }

    public void exibirResumo() {
        system.debug('Resumo do Pedido:');
        system.debug('Cliente: ' + cliente.nome);
        system.debug('Restaurante: ' + restaurante.nome);
        system.debug('Status: ' + status);
        system.debug('Itens:');
        for(ItemPedido item : itens) {
            system.debug(item.produto.nome + ' - Quantidade: ' + item.quantidade + ' - Subtotal: ' + item.calcularSubTotal());
        }
        system.debug('Total do Pedido: ' + this.total);
    }

}