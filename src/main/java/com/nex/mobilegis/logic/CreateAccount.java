/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nex.mobilegis.logic;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
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
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String cPassword= request.getParameter("cPassword");
        
        // create regular expression patterns
        String pFirstName = "[a-zA-Z]^[\\S]*";
        String pLastName = "[a-zA-Z]^[\\S]*";
        String pEmail = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
                + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
        String pPassword = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$";
        
        // save entered values for reuse
        request.setAttribute("firstName", firstName);
        request.setAttribute("lastName", lastName);
        request.setAttribute("email", email);
        
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
            else
            {
                request.setAttribute("password", password);
                request.setAttribute("cPassword", cPassword);
            }
        }
        
        if (firstName.isEmpty() || lastName.isEmpty())
        {
            message += "You must include both first and last names to create an account<br/>";
        }
        else
        {
            if(!pFirstName.matches(firstName) || !pLastName.matches(lastName))
            {
                message += "Name cannot contain spaces, numbers, or special characters<br/>";
            }
        }
        
        if(email.isEmpty())
        {
            message += "Email cannot be empty if you want an account, what's wrong with you?!<br/>";
        }
        else
        {
            if(!pEmail.matches(email))
            {
                message += "Invalid Email address, better luck next time<br/>";
            }
        }
        
        if(!pPassword.matches(password))
        {
            message += "password must be 8 or more character, contain at least one digit and one special character<br/>";
        }
        
        request.setAttribute("message", message);
        if(message.equals(""))
        {
            // create new account with this user as admin
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
