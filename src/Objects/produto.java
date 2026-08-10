package Objects;

public class produto {

    private int cod;
    private String nome;
    private int categoria;

    public produto(int cod, String nome, int categoria) {
        this.cod = cod;
        this.nome = nome;
        this.categoria = categoria;
    }

    public int getCod() {
        return cod;
    }

    public void setCod(int cod) {
        this.cod = cod;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }
}