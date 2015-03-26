/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nex.mobilegis.logic;

import com.nex.mobilegis.dataaccess.DBManager;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author M
 */
@WebServlet(name = "CreateAccount", urlPatterns = {"/CreateAccount"})
public class CreateAccount extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String message = "";
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String cPassword= request.getParameter("cPassword");
        
        // create regular expression patterns
        String pFirstName = "[a-zA-Z]+";
        String pLastName = "[a-zA-Z]+";
        String pUsername = "[a-zA-Z0-9]+";
        String pEmail = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
                + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
        String pPassword = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$";
        
        // save entered values for reuse
        request.setAttribute("firstName", firstName);
        request.setAttribute("lastName", lastName);
        request.setAttribute("email", email);
        request.setAttribute("username", username);
        
        // do passwords match?
        if (password.isEmpty())
        {
            message += "Password field cannot be empty to create an account<br/>";
        }
        else
        {
            if (!password.equals(cPassword))
            {
                message += "Passwords must match<br/>";
            }
        }
        
        if (firstName.isEmpty() || lastName.isEmpty())
        {
            message += "You must include both first and last names to create an account<br/>";
        }
        else
        {
            if(!firstName.matches(pFirstName) || !lastName.matches(pLastName))
            {
                message += "Name cannot contain spaces, numbers, or special characters<br/>";
            }
        }
        
        if (username.isEmpty())
        {
            message += "You must have a username<br/>";
        }
        else
        {
            if(!username.matches(pUsername))
            {
                message += "Username cannont contain special characters or spaces<br/>";
            }
            else
            {
                // check for already used username
                DBManager db;
                try {
                    db = DBManager.getInstance();
                    if(db.usernameExists(username))
                    {
                        message += "This username is already in use!";
                    }   
                } catch (SQLException ex) {
                    Logger.getLogger(CreateAccount.class.getName()).log(Level.SEVERE, null, ex);
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(CreateAccount.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        
        if(email.isEmpty())
        {
            message += "Email cannot be empty if you want an account, what's wrong with you?!<br/>";
        }
        else
        {
            if(!email.matches(pEmail))
            {
                message += "Invalid Email address, better luck next time<br/>";
            }
        }
        
        if(!password.matches(pPassword))
        {
            message += "password must be 8 or more characters, contain at least one digit and one special character<br/>";
        }
        else
        {
            request.setAttribute("password", password);
            request.setAttribute("cPassword", cPassword);
        }
        
        request.setAttribute("message", message);
        if(message.equals(""))
        {
            try {
                // create new account with this user as admin
                DBManager db = DBManager.getInstance();
                int accountId = db.insertAccount();
                System.out.println("accountID == " + accountId);
                // newFirstName, newLastName, newEmail, newUsername, newPassword, isMasterUser, accountId
                db.insertUser(firstName, lastName, email, username, password, true, accountId);
                
                // upon successful creation, log user in
                request.getRequestDispatcher("CreateSession").forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(CreateAccount.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(CreateAccount.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        }
        else
        {
            request.getRequestDispatcher("newAccount.jsp").forward(request, response);
        }
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

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
