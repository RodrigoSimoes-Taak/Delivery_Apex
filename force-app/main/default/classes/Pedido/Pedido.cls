public with sharing class Pedido {
    private Cliente _cliente;
    private Restaurante _restaurante;
    private List<ItemPedido> itens;
    private StatusPedido _Status;
    private double _total = 0;

    public Cliente cliente {get{ return _cliente;} set{_cliente = value;}}
    public Restaurante restaurante {get{ return _Restaurante;} set{_Restaurante = value;}}
    public List<ItemPedido> itens {get{ return itens;} set{itens = value;}}
    public StatusPedido status {get{ return _Status;} set{_Status = value;}}
    public double total {get{ return _total;} set{_total = value;}}

    public Pedido(Cliente cliente, Restaurante restaurante) {
        this._cliente = cliente;
        this._Restaurante = restaurante;
        this.itens = new List<ItemPedido>();
        this._Status = StatusPedido.CARRINHO;
        
    }

    public adicionarItemPedido(Produto produto, int quantidade){
        if(restaurante.cardapio.contains(produto)) {
            if(itens.contains(produto))itens.get(itens.indexOf[produto]).quantidade+=quantidade;
            else itens.add(new ItemPedido(produto,quantidade));
        
        }
        else System.debug('Produto não encontrado no cardápio do restaurante.');
        
    }

    public void CalcularTotal(){
        for (Double item : itens){
            total += item.subTotal;
        }
    }

    public void confirmarPedido(){
        if(status = StatusPedido.CARRINHO && itens.size() > 0){
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