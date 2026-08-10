package Client;

import Objects.produto;

public class cliente {

    public static void main(String[] args) {

        produto produto = new produto(1, "Arroz", 10);

        System.out.println("Código: " + produto.getCod());
        System.out.println("Nome: " + produto.getNome());
        System.out.println("Categoria: " + produto.getCategoria());
    }
}