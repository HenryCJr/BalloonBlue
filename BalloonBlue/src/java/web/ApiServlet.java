/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package web;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import model.Book;
import model.Users;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author cimin
 */
@WebServlet(name = "ApiServlet", urlPatterns = {"/api/*"})
public class ApiServlet extends HttpServlet {

     private JSONObject getJSONBODY(BufferedReader reader) throws IOException {
        StringBuilder buffer = new StringBuilder();
        String line = null;
        while ((line = reader.readLine()) != null) {
            buffer.append(line);
        }
        return new JSONObject(buffer.toString());
    }
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        response.setContentType("application/json;charset=UTF-8");
        JSONObject file = new JSONObject();
        
        try {
            if (request.getRequestURI().endsWith("/api/login")) {
                processSession(file, request, response);
            } else if (request.getRequestURI().endsWith("/api/users")) {
                processUsers(file, request, response);
            } else if (request.getRequestURI().endsWith("/api/mybooks")) {
                processBooks(file, request, response);
            }
        } catch (Exception ex) {
            response.sendError(500, "Internal Error: " + ex.getLocalizedMessage());
        }
        response.getWriter().print(file.toString());
    }

    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void processSession(JSONObject file, HttpServletRequest request, HttpServletResponse response) throws Exception {
        if (request.getMethod().toLowerCase().equals("put")) {
            JSONObject body = getJSONBODY(request.getReader());
            String login = body.getString("login");
            String password = body.getString("password");
            Users u = Users.getUser(login, password); // Verificando se o usuario é cadastrado
            if (u == null) {
                response.sendError(403, "Login or password incorrect");
            } else {
                // Setando a sessão do usuario
                request.getSession().setAttribute("users", u);
                file.put("id", u.getRowid());
                file.put("login", u.getLogin());
                file.put("name", u.getName());
                file.put("role", u.getRole());
                file.put("passwordHash", u.getPasswordHash());
                file.put("contact", u.getContact());
                file.put("books", u.getBooks());
                file.put("obras", u.getObras());
                file.put("message", "Logged in");
            }
        } else if (request.getMethod().toLowerCase().equals("delete")) {
            // Removendo a sessão do usuario
            request.getSession().removeAttribute("users");
            file.put("message", "Logged out");
        } else if (request.getMethod().toLowerCase().equals("get")) {
            // Verificando se existe sessão do usuario
            if (request.getSession().getAttribute("users") == null) {
                response.sendError(403, "No Session");
                response.sendError(HttpServletResponse.SC_FORBIDDEN, "No Session");
                
            } else {
                // Se houver resgata os atributos
                Users u = (Users) request.getSession().getAttribute("users");
                file.put("id", u.getRowid());
                file.put("login", u.getLogin());
                file.put("name", u.getName());
                file.put("role", u.getRole());
                file.put("passwordHash", u.getPasswordHash());
                file.put("contact", u.getContact());
                file.put("books", u.getBooks());
                file.put("obras", u.getObras());
            }
        } else {
            response.sendError(405, "Method not allowed");
        }
    }
    
    private void processUsers(JSONObject file, HttpServletRequest request, HttpServletResponse response) throws Exception {
        if (request.getSession().getAttribute("users") != null) {
            response.sendError(401, "Unauthorized: No session");
        }/* else if (!((Users) request.getSession().getAttribute("users")).getRole().equals("ADMIN")) {
            response.sendError(401, "Unauthorized: Only admin can manage users");
        }*/ else if (request.getMethod().toLowerCase().equals("get")) {
                file.put("list", new JSONArray(Users.getUsers()));
            } else if (request.getMethod().toLowerCase().equals("post")) {
                JSONObject body = getJSONBODY(request.getReader());
                String login = body.getString("login");
                String name = body.getString("name");
                String role = body.getString("role");
                String password = body.getString("password");
                String contact = body.getString("contact");
                String books = body.getString("books");
                String obras = body.getString("obras");
                Users.insertUser(login, name, role, password, contact, books, obras);
            } else if (request.getMethod().toLowerCase().equals("put")) {
                JSONObject body = getJSONBODY(request.getReader());
                String login = body.getString("login");
                String name = body.getString("name");
                String role = body.getString("role");
                String password = body.getString("password");
                String contact = body.getString("contact");
                String books = body.getString("books");
                String obras = body.getString("obras");
                Users.updateUser(login, name, role, password, contact, books, obras);
            } else if (request.getMethod().toLowerCase().equals("delete")) {
                Long id = Long.parseLong(request.getParameter("id"));
                Users.deleteUser(id);
            } else {
                response.sendError(405, "Methodo not allowed");
            }
        }
    
    private void processBooks(JSONObject file, HttpServletRequest request, HttpServletResponse response) throws Exception {
        if (request.getSession().getAttribute("users") != null) {
            response.sendError(401, "Unauthorized: No session");
        } else if (request.getMethod().toLowerCase().equals("get")) {
            file.put("list", new JSONArray(Book.getBook()));
        } else if (request.getMethod().toLowerCase().equals("post")) {
            JSONObject body = getJSONBODY(request.getReader());
            String name = body.getString("name");
            String category = body.getString("category");
            String autores = body.getString("autores");
            String description = body.getString("description");
            double price = body.getDouble("price");
            String capa = body.getString("capa");
            String arq = body.getString("archive");
            Book.insertBook(name, category, autores, description, price, capa, arq);
        } else if (request.getMethod().toLowerCase().equals("put")) {
            JSONObject body = getJSONBODY(request.getReader());
            
            Long id = Long.valueOf(request.getParameter("id"));
            String name = body.getString("name");
            String category = body.getString("category");
            String autores = body.getString("autores");
            String description = body.getString("description");
            double price = body.getDouble("price");
            String capa = body.getString("capa");
            String arq = body.getString("archive");
           
            
            
            Book.updateBook(id, name, category, autores, description, price, capa, arq);
        } else if (request.getMethod().toLowerCase().equals("delete")) {
            Long id = Long.parseLong(request.getParameter("id"));
            Book.deleteBook(id);
        } else {
            response.sendError(405, "Methodo not allowed");
        }
    }

    
}
