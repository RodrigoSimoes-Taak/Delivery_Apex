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

public void testExibirCardapio(){
    Restaurante Restaurante = new Restaurante();
    Restaurante.nome = 'Bella Pizza';
    Restaurante.adicionarProduto(new Produto('Pizza Mussarela', 24));
    Restaurante.adicionarProduto(new Produto('Refrigerante', 4));
    Restaurante.exibirCardapio();
}

testExibirCardapio();

public void testBuscarProduto(){
    Restaurante Restaurante = new Restaurante();
    Restaurante.nome = 'Bella Pizza';
    Restaurante.adicionarProduto(new Produto('Pizza Mussarela', 24));
    Restaurante.adicionarProduto(new Produto('Pizza calabresa', 24));
    System.debug('Teste buscar pizza');
    Restaurante.buscarProduto('Pizza');
    System.debug('Teste buscar calabresa');
    Restaurante.buscarProduto('calabresa');
    System.debug('Teste buscar batata');
    Restaurante.buscarProduto('batata');

}

testBuscarProduto();