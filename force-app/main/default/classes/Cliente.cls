public with sharing class Cliente {
    String nome;
    String cpf;
    String endereco;
    String telefone;
    public Cliente(String nome, String cpf, String endereco, String telefone) {
        this.nome = nome;
        this.cpf = cpf;
        this.endereco = endereco;
        this.telefone = telefone;
    }
}