public class Pedido {
    public Cliente cliente { get; set; }
    public Restaurante restaurante { get; set; }
    public List<ItemPedido> itens { get; set; }
    public StatusPedido status { get; set; }
    public Double total { get; set; }

    Public Pedido(Cliente cliente, Restaurante restaurante) {
        this.cliente = cliente;
        this.restaurante = restaurante;
        this.itens = new List<ItemPedido>();
        this.status = StatusPedido.CARRINHO;
        this.total = 0.0;
    }

    public void adicionarItemPedido (Produto produto, Integer quantidade) {
        ItemPedido item = new ItemPedido(produto, quantidade);
        Boolean produtoExistente = false;

        for (Produto p : this.restaurante.cardapio) {
            if (p.nome == produto.nome) {
                produtoExistente = true;
                break;
            }
        }

        if (!produtoExistente) {
            System.debug('Item não encontrado no cardapio.');
            return;
        }

        Boolean itemExistente = false;

        for( ItemPedido i : this.itens) {
            if (i.produto.nome == produto.nome) {
                i.quantidade += quantidade;
                i.subTotal = i.calcularSubTotal();
                System.debug('Item já existe no pedido, quantidade atualizada: ' + i.quantidade);
                calcularTotal();
                itemExistente = true;
                break;
            }
        }

        if (!itemExistente) {
            this.itens.add(item);
            System.debug('Item adicionado ao pedido: ' + produto.nome + ' - Quantidade: ' + quantidade);
            calcularTotal();
            
        }
    }

    public void calcularTotal() {
        this.total = 0.0;
        for (ItemPedido item : this.itens) {
            this.total += item.subTotal;
        }
        System.debug('Total do pedido: R$' + this.total);
    }

    public void confirmarPedido() {
        if (this.status == StatusPedido.CARRINHO && !this.itens.isEmpty()) {
            this.status = StatusPedido.EM_PROCESSAMENTO;
            System.debug('Pedido confirmado e em processamento.');
        } else {
            System.debug('Pedido já foi confirmado ou está em outro estado.');
        }
    }

    public void exibirResumo() {
        System.debug('Resumo do Pedido:');
        System.debug('Cliente: ' + this.cliente.nome);
        System.debug('Restaurante: ' + this.restaurante.nome);
        System.debug('Status: ' + this.status);
        System.debug('Itens do Pedido:');
        for (ItemPedido item : this.itens) {
            System.debug(item.produto.nome + ' - Quantidade: ' + item.quantidade + ' - Subtotal: R$' + item.subTotal);
        }
        System.debug('Total do Pedido: R$' + this.total);
    }
}