public with sharing class Cliente {
    private String _nome;
    private String _cpf;
    private String _endereco;
    private String _telefone;

    public String nome {get{ _nome;} set{_nome = value;}}
    public String cpf {get{ _cpf;} set{ _cpf = value;}}
    public String endereco {get{ _endereco;} set{_endereco = value;}}
    public String telefone {get{ _telefone;} set{_telefone = value;}}
    

    public Cliente() {
        
    }

    public Cliente(String nome, String cpf, String endereco, String telefone) {
        this._nome = nome;
        this._cpf = cpf;
        this._endereco = endereco;
        this._telefone = telefone;
    }
}