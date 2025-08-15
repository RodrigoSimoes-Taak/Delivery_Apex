public with sharing class Pedido {


    public Cliente cliente {get; set;}
    public Restaurante restaurante {get; set;}
    public List<ItemPedido> itens {get; set;} 
    public StatusPedido status {get; set;}
    public double total {get; private set;}

    public Pedido(Cliente cliente, Restaurante restaurante) {
        this.cliente = cliente;
        this.Restaurante = restaurante;
        this.itens = new List<ItemPedido>();
        this.Status = StatusPedido.CARRINHO;
        
    }

    public void adicionarItemPedido(Produto produto, integer quantidade){
        if(restaurante.cardapio.contains(produto)) {
            Boolean jaExiste = false;
            for(ItemPedido item : itens ){
                if(item.produto == produto){
                    jaExiste = true;
                    item.quantidade += quantidade;
                    break;
                }
            }
            if(!jaExiste) itens.add(new ItemPedido(produto,quantidade));

        
        }
        else System.debug('Produto não encontrado no cardápio do restaurante.');
        
    }

    public void CalcularTotal(){
        for (ItemPedido item : itens){
            total += item.subTotal;
        }
    }

    public void confirmarPedido(){
        if(status == StatusPedido.CARRINHO && itens.size() > 0){
            status = StatusPedido.EM_PROCESSAMENTO;
            System.debug('Pedido confirmado e em processamento.');
        }
        else System.debug('Não foi possivel confirmar o pedido.');

    }

    public void exibirPedido(){
        System.debug('Pedido do cliente: ' + cliente.nome);
        System.debug('Restaurante: ' + restaurante.nome);
        System.debug('Status do pedido: ' + status);
        System.debug('Itens do pedido:');
        for(ItemPedido item : itens){
            System.debug('Produto: ' + item.produto.nome + ', Quantidade: ' + item.quantidade + ', Subtotal: ' + item.subTotal);
        }
        System.debug('Total do pedido: ' + total);
    }




}