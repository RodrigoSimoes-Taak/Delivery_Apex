public with sharing class Cliente {
    String nome;
    String cpf;
    String endereco;
    String telefone;
  

    public Cliente(String nome, String cpf, String endereco, String telefone){
        this.nome = nome;
        this.cpf = cpf;
        this.endereco = endereco;
        this.telefone = telefone;
    }
    public void testarCliente(){
        Cliente cliente1 = new Cliente('Mayk', '25/25/2525', 'casa', '25252525');
        Cliente cliente2 = new Cliente('Zezinho', '25/25/2525', 'casa', '25252525');

    }
}