public with sharing class Pedido {
    public Pedido() {
        Cliente cliente;
        Restaurante restaurante;
        List<Produtos> itensPedido;
        Double total;
        StatusPedido status;
    }
    
    public pedido(Cliente cliente , Restaurante restaurante){
        this.cliente = cliente;
        this.restaurante = restaurante;
    }


    public void CalcularTotal(){
        this.total = 0;
        for(ItemPedido item : itensPedido){
            this.total += item.calcularSubtotal();
        }
    }

    public void adicionarItemPedido(Produto produto , Integer quantidade){
        if(this.Restaurante.cardapio.contains(produto)){
            ItemPedido novoItemPedido = new ItemPedido( produto, quantidade);
            this.itensPedido.add(novoItemPedido);
            System.debug('item Adicionado ao pedido');

        }
        else{
            System.debug('Item nao disponivel no cardapio');
        }
    }

    public void confirmarPedido(){
        if(this.Status == Status.CARRINHO && this.itensPedido != null){
            this.Status = status.EM_PROCESSAMENTO;
            System.debug('Pedido em processamento');
        }
        else{
            System.debug('Pedido nao pode ser confirmado, verifique se tem algum item no carrinho');
        }
        
    }
}