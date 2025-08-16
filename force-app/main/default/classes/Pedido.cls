public with sharing class Pedido {
    private Cliente cliente;
    private Restaurante restaurante;
    private List<ItemPedido> itens;
    private StatusPedido status;
    private Decimal total;

    public Pedido(Cliente cliente, Restaurante restaurante) {
        this.cliente = cliente;
        this.restaurante = restaurante;
        this.itens = new List<ItemPedido>();
        this.status = StatusPedido.CARRINHO;
    }


    public void adicionarItemPedido(Produto produto, Integer quantidade){
        for(Produto p : this.restaurante.getCardapio()){
            if(p.getNome().equalsIgnoreCase(produto.getNome())){
                for(ItemPedido ip : this.itens){
                    if(ip.getProduto().getNome().equalsIgnoreCase(produto.getNome())){
                        ip.setQuantidade(quantidade + ip.getQuantidade());
                        this.total = this.calcularTotal();
                        ip.setSubtotal(ip.calcularSubtotal());
                        System.debug('Quantidade atualizada para o produto: ' + ip.getProduto().getNome() + ' - Nova quantidade: ' + ip.getQuantidade());
                        return;
                    }
                }
                ItemPedido item = new ItemPedido(produto, quantidade);
                this.itens.add(item);
                this.total = this.calcularTotal();
                System.debug('Item adicionado ao pedido: ' + item);
                return;
            }
        }
        System.debug('Produto não disponível no cardápio do restaurante.');

    }

    public void confirmarPedido(){
        if(this.itens.isEmpty()){
            System.debug('Não é possível confirmar um pedido vazio.');
            return;
        }
        this.status = StatusPedido.EM_PROCESSAMENTO;
        System.debug('Pedido confirmado');
    }

    public void exibirResumo(){
        System.debug('Resumo do Pedido:');
        System.debug('Nome do cliente: ' + this.cliente.getNome());
        System.debug('Nome do Restaurante: ' + this.restaurante.getNome());
        for(ItemPedido item : this.itens){
            System.debug(item.getProduto() + ' x ' + item.getQuantidade() + ' = ' + item.getSubtotal());
        }
        System.debug('Total: ' + this.total);
        System.debug('Status do Pedido: ' + this.status);
    }

    private Decimal calcularTotal() {
        this.total = 0.00;
        for(ItemPedido item : this.itens){
            this.total += item.calcularSubtotal();
        }
        return this.total;
    }

    public Cliente getCliente() {
        return this.cliente;
    }

    public Restaurante getRestaurante() {
        return this.restaurante;
    }

    public Decimal getTotal() {
        return this.total;
    }

    public StatusPedido getStatus() {
        return this.status;
    }

    public List<ItemPedido> getItens() {
        return this.itens;
    }

}