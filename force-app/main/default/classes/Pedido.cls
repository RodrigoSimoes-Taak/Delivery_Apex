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

    public static Map<Produto,Integer> gerarRelatorioProdutosMaisVendidos(List<Pedido> pedidos){

        Map<Produto,Integer> produtos = new Map<Produto,Integer>();
        Map<Produto,Integer> produtosMaisVendidos = new Map<Produto,Integer>();


        // adiciona no map todos os produtos
        for(Pedido p: pedidos){
            for(ItemPedido i: p.itens){
                if(produtos.containsKey(i.produto)){
                    i.quantidade += produtos.get(i.produto);
                    produtos.put(i.produto, i.quantidade);
                }else{
                    produtos.put(i.produto, i.quantidade);
                }
            }
        }
        System.debug('Top 3 produtos mais vendidos:');
        //calcula os maiores
        for(Integer i = 1; i<4; i++){
            Integer maior = 0;
            Produto produtoMaior = null;
            for(Produto p: produtos.keySet()){
                if(produtos.get(p) > maior){
                    maior = produtos.get(p);
                    produtoMaior = p;
                }
            }
            produtos.remove(produtomaior);
            produtosMaisVendidos.put(produtoMaior, maior);
            System.debug(i+'. '+produtoMaior.nome+' - '+maior+ ' unidades');
        }
        return produtosMaisVendidos;
    }

    public static Map<String,List<Pedido>> gerarRelatorioPedidosPorCliente(List<Pedido> pedidos, List<String> cpfs){

        Map<String,List<Pedido>> relatorio = new Map<String,List<Pedido>>();
        Map<String,List<Pedido>> relatorioDePedidos2 = new Map<String,List<Pedido>>();
        

        for(String c: cpfs){
            List<Pedido> pedidosDoCliente = new List<Pedido>();
            for(Pedido p: pedidos){
                if(p.cliente.cpf == c){
                    pedidosDoCliente.add(p);
                }
            }
            relatorio.put(c, pedidosDoCliente);
        }

        for(String c: relatorio.keySet()){
            Integer maior = 0;
            String cpfComMaisPedidos;
            List<Pedido> pedidosDoCliente = relatorio.get(c);
            if(pedidosDoCliente.size()>=maior){
                maior = pedidosDoCliente.size();
                cpfComMaisPedidos = c;
                if(pedidosDoCliente.size()>1){
                    System.debug('Cliente: '+cpfComMaisPedidos+' - '+maior+' pedidos');
                }else{
                    System.debug('Cliente: '+cpfComMaisPedidos+' - '+maior+' pedido');
                }
                relatorioDePedidos2.put(c, relatorio.get(c));
                relatorio.remove(c);
                
            }
        }

        return relatorioDePedidos2;
    }
}