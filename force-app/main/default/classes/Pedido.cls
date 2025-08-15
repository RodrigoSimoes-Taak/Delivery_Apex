public with sharing class Pedido {
    public Cliente cliente;
    public Restaurante restaurante;
    public List<ItemPedido> itens = new List<ItemPedido>();
    public StatusPedido status;
    public Double Total;

    public Pedido() {
    }
    public Pedido(Cliente cliente, Restaurante restaurante) {
        this.cliente = cliente;
        this.restaurante = restaurante;
        this.status = StatusPedido.CARRINHO;
    }
    public void adicionarItemPedido(Produto produto, Integer quantidade){
        Boolean jaAdicionado = false;
        if(restaurante.cardapio.contains(produto)){
            ItemPedido itemPedido = new ItemPedido(produto, quantidade);
            for(ItemPedido i: itens){
                if(i.produto.nome == itemPedido.produto.nome){
                    jaAdicionado = true;
                    i.quantidade += itemPedido.quantidade;
                    calcularTotal();
                }
            }
            if(jaAdicionado == false){
                itens.add(itemPedido);
                calcularTotal();
            }
            System.debug('Produto adicionado com sucesso!');
        }else{
            System.debug(produto.nome + ' não está disponível');
        }
    }
    public void calcularTotal(){
        Total = 0.0;
        for(ItemPedido i: itens){
            i.calcularSubtotal();
            Total += i.subTotal;
        }
    }
    public void confirmarPedido(){
        if(status == StatusPedido.CARRINHO && itens.size()>0){
            status = StatusPedido.EM_PROCESSAMENTO;
            System.debug('Pedido confirmado com sucesso!');
        }
        else if (itens.size()==0){
          System.debug('Erro: a lista está vazia')  ;
        }
        else{
            System.debug('Erro: status do pedido precisa ser carrinho para concluir o pedido');
        }
    }
    public void exibirResumo(){
        System.debug('* ' + cliente.nome);
        System.debug('* ' + restaurante.nome);
        for(ItemPedido p: itens){
            System.debug('* ' + p);
        }
        System.debug('* Total: ' + total);
        System.debug('* ' + status);
    }
}