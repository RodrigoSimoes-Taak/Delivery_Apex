// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

public void testAdicionarProduto(){
    Restaurante Restaurante = new Restaurante();
    Restaurante.nome = 'Bella Pizza';
    Restaurante.adicionarProduto(new Produto('Pizza Mussarela', 24));
    Restaurante.adicionarProduto(new Produto('Pizza Mussarela', 24));
    Restaurante.adicionarProduto(new Produto('Refrigerante', 4));
}

testAdicionarProduto();
