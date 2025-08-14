public with sharing class Cliente {
    public String nome;
    public String cpf;
    public String endereco;
    public String telefone;
    public Cliente(String nome, String cpf, String endereco, String telefone) {
        this.nome = nome;
        this.cpf = cpf;
        this.endereco = endereco;
        this.telefone = telefone;
    }
}