public with sharing class Pedido {
    public Cliente cliente;
    public Restaurante restaurante;
    public ItemPedido[] itens;
    public StatusPedido status;
    public Decimal total;
    public Pedido(Cliente cliente, Restaurante restaurante) {
        this.cliente = cliente;
        this.restaurante = restaurante;
        itens = new ItemPedido[]{};
        status = StatusPedido.CARRINHO;
        total = 0;

    }
    public void adicionarItemPedido(Produto produto,Integer quantidade){
        Boolean produtoCadastrado = false;
        if (restaurante.cardapio.indexOf(produto)!= -1){
            for (ItemPedido iItem: itens){
                if(iItem.produto.nome == produto.nome){
                    iItem.quantidade += quantidade;
                    iItem.calcularSubtotal();
                    produtoCadastrado = true;
                    break;
                }
            }
            if (!produtoCadastrado){
                itens.add(new ItemPedido(produto,quantidade));
            }
            calcularTotal();
            System.debug(produto.nome + ' Adicionado ao carrinho!');
        }
        else{
            System.debug('Item nao disponivel!');
        }
    }
    public void calcularTotal(){
        this.total = 0;
        for (ItemPedido iItens:itens){
            this.total+=iItens.subTotal;
        }
    }
    public void confirmarPedido(){
        if (status == StatusPedido.CARRINHO && !itens.isEmpty()){
            status = StatusPedido.EM_PROCESSAMENTO;
            System.debug('EM PROCESSAMENTO!');
        }
        else{
            System.debug('ERRO!');
        }
    }
    public void exibirResumo(){
        System.debug(cliente.nome +' '+ restaurante.nome);
        for (ItemPedido iItem:itens){
            System.debug(iItem);
        }
        System.debug(this.total + ' Status: ' + status);
    }
}