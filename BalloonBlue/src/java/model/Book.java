
package model;
import java.util.*;
import java.sql.*;
import web.AppListener;

/**
 *
 * @author cimin
 */
public class Book {
    //Atributos
    private long rowid;
    private String name;
    private String category;
    private String autores;
    private String description;
    private double price;
    private String capa;
    private String arq;
    
    //SQL pra criar a tabela
    public static String getCreateStatement(){
        return "CREATE TABLE IF NOT EXISTS books("
                + "nm_book varchar(100) not null,"
                + "nm_category_book varchar(100),"
                + "nm_autores varchar(500),"
                + "ds_book varchar(500),"
                + "vl_book numeric(10,2) not null,"
                + "nm_cape varchar(100),"
                + "nm_archive varchar(100)"
                + ")";
    }

    public Book(long rowid, String name, String category, String autores, String description, double price, String capa, String arq) {
        this.rowid = rowid;
        this.name = name;
        this.category = category;
        this.autores = autores;
        this.description = description;
        this.price = price;
        this.capa = capa;
        this.arq = arq;
    }

    public long getRowid() {
        return rowid;
    }

    public void setRowid(long rowid) {
        this.rowid = rowid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getAutores() {
        return autores;
    }

    public void setAutores(String autores) {
        this.autores = autores;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getCapa() {
        return capa;
    }

    public void setCapa(String capa) {
        this.capa = capa;
    }

    public String getArq() {
        return arq;
    }

    public void setArq(String arq) {
        this.arq = arq;
    }
    
    // Função para resgatar os registros contido na tabela, retornando como um array de objetos, porém para Medicine
      public static ArrayList<Book> getBook() throws Exception{
        ArrayList<Book> list = new ArrayList<>();
        Connection con = AppListener.getConnection();
        Statement stmt = con.createStatement();
        // Executando o SQL para resgatar todos os registros da tabela
        ResultSet rs = stmt.executeQuery("SELECT rowid, * from books");
        // Enquanto houver registros irá adicionar ao array o novo objeto contendo os dados de medicamentos
        while(rs.next()){
            long rowId = rs.getLong("rowid");
            String name = rs.getString("nm_book");
            String category = rs.getString("nm_category_book");
            String autores = rs.getString("nm_autores");
            String description = rs.getString("ds_book");
            double price = rs.getDouble("vl_book");
            String cape = rs.getString("nm_cape");
            String arq = rs.getString("nm_archive");
            list.add(new Book(rowId, name, category, autores, description, price, cape, arq));
        }
        rs.close();
        stmt.close();
        con.close(); 
        return list;
    }
      
        // getMedicine para resgatar um medicamento seguindo seu ID
    public static Book getBook(long rowid) throws Exception{
        Book book = null;
        Connection con = AppListener.getConnection();
        // Buscando no banco o ID do medicamento que corresponde ao medicamento desejado
        String sql = "SELECT * from books" /*WHERE rowid=?"*/;
        PreparedStatement stmt = con.prepareStatement(sql);
        // Setando o "?" como o rowid recebido
        stmt.setLong(1,rowid);
        ResultSet rs = stmt.executeQuery();
        // Verificando se retornou um dado, se retornou cria um objeto com os dados do medicamento
        if(rs.next()){
           long rowId = rs.getLong("rowid");
            String name = rs.getString("nm_book");
            String category = rs.getString("nm_category_book");
            String autores = rs.getString("nm_autores");
            String description = rs.getString("ds_book");
            double price = rs.getDouble("vl_book");
            String cape = rs.getString("nm_cape");
            String arq = rs.getString("nm_archive");
            book = new Book(rowId, name, category, autores, description, price, cape, arq);
        }
        rs.close();
        stmt.close();
        con.close(); 
        return book;
    }
    
    // Função para inserir novos medicamentos no banco
    public static void insertBook(String name, String category, String autores , String description, double price, String capa, String arq) throws Exception{
        Connection con = AppListener.getConnection();
        String sql = "INSERT INTO books(nm_book, nm_category_book, nm_autores, ds_book, vl_book, nm_cape, nm_archive)"
                + "VALUES(?,?,?,?,?,?,?)";
        // Preparando a string de sql a ser executado e setando as "?" com os parametros
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1,name);
        stmt.setString(2,category);
        stmt.setString(3,autores);
        stmt.setString(4,description);
        stmt.setDouble(5,price);
        stmt.setString(6,capa);
        stmt.setString(7,arq);
        
        
        stmt.execute();
        stmt.close();
        con.close();       
    }
    
    public static void updateBook(long id,String name, String category, String autores , String description, double price, String capa, String arq) throws Exception{
        Connection con = AppListener.getConnection();
        // Identico ao insert com a diferença de que o login seja igual ao do usuario logado
        String sql = "UPDATE books SET nm_book=?, nm_category_book=?, nm_autores=?, ds_book=?, vl_book=?, nm_cape=?, nm_archive=? WHERE rowid=?";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1,name);
        stmt.setString(2,category);
        stmt.setString(3,autores);
        stmt.setString(4,description);
        stmt.setDouble(5,price);
        stmt.setString(6,capa);
        stmt.setString(7,arq);
        stmt.setLong(8,id);
        stmt.execute();
        stmt.close();
        con.close();       
    }
    
    // Função para deletar o medicamento com o ID
    public static void deleteBook(long rowId) throws Exception{
        Connection con = AppListener.getConnection();
        // Deleta todos os dados do medicamento que corresponde ao ID do parametro
        String sql = "DELETE FROM books WHERE rowid=?";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setLong(1, rowId);
        stmt.execute();
        stmt.close();
        con.close();       
    }    
    
}
