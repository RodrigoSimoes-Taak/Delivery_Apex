public class Pedido {
    public Cliente cliente {get; private set;}
    private Restaurante restaurante;
    public List<ItemPedido> itens;
    private StatusPedido status ;
    public double total {get; private set;}

    //construtor
    public Pedido(Cliente cliente, Restaurante restaurante, StatusPedido status) {
        this.cliente = cliente;
        this.restaurante = restaurante;
        this.status = status;
        this.itens = new List<ItemPedido>(); 

    }
    //metodos

    //verifica se o item exite no cardapio do restaurante e adiciona ao pedido
    public void adicionarItemPedido(Produto produto, integer quantidade) {
        if(restaurante.cardapio.contains(produto)) {
            if(itens.isEmpty()) {
                ItemPedido novoItem = new ItemPedido(produto, quantidade);
                    itens.add(novoItem);
                    system.debug('adicionado item novo ao carrinho: ' + produto.nome);
                    calcularTotal();
            } else{
                for(ItemPedido item : itens) {
                if(item.produto.nome != produto.nome) {
                    ItemPedido novoItem = new ItemPedido(produto, quantidade);
                    itens.add(novoItem);
                    system.debug('adicionado item novo ao carrinho: ' + produto.nome);
                    calcularTotal();
                    break;
                    
                } else {
                    item.quantidade += quantidade;
                    system.debug('adicionado mais itens com sucesso');
                    calcularTotal();
                    break;
                } 
            }
            }
            
        } else System.debug('nao foi encontrado esse item no cardapio, verifique e tente novamente');
    }

    //calcula valor total do carrinho
    public void calcularTotal() {
        this.total = 0.0;
        for(ItemPedido item : itens) {
            this.total += item.calcularSubTotal();
        }
        system.debug('total atualizado, novo total: R$' + this.total);
    }

    //leva o pedido a fase de processamento caso o carrinho nao esteja vazio e tiver algum item na lista
    public void confirmarPedido() {
        if(status == StatusPedido.CARRINHO && itens != null) {
            status = StatusPedido.EM_PROCESSAMENTO;
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
            system.debug(item.produto.nome + ' - Quantidade: ' + item.quantidade + ' - Subtotal: ' + item.subTotal);
        }
        system.debug('Total do Pedido: ' + this.total);
    }

}