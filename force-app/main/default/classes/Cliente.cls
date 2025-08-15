public with sharing class Cliente {
    public string nome {get; private set;}
    public string cpf {get; private set;}
    public string endereco {get; private set;}
    public string telefone {get; private set;}

    //construtores
    public Cliente() {

    }

    public Cliente(string nome, string cpf,string endereco, string telefone) {
        this.nome = nome;
        this.cpf = cpf;
        this.endereco = endereco;
        this.telefone = telefone;
    }
}