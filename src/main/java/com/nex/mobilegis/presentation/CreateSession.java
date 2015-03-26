/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nex.mobilegis.presentation;

import com.nex.mobilegis.logic.*;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "CreateSession", urlPatterns = {"/CreateSession"})
public class CreateSession extends HttpServlet {

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
        String password;
        String username;
        
        // determine if the request is coming from logic, or user
        if (request.getParameter("password").isEmpty() || request.getParameter("username").isEmpty())
        {
            password = (String) request.getAttribute("password");
            username = (String) request.getAttribute("username");
        }
        else
        {
            password = request.getParameter("password");
            username = request.getParameter("username");
        }
        
        try {
            if(Authenticator.Authenticate(username, password))
            {
                request.getSession().setAttribute("validId", Authenticator.validAccountId);
                Account sessionAccount = new Account(Authenticator.validAccountId);
                User sessionUser = sessionAccount.getUser(username);
                request.getSession().setAttribute("account", sessionAccount);
                request.getSession().setAttribute("user", sessionUser);
                request.getRequestDispatcher("accountHome.jsp").forward(request, response);
            }
            else
            {
                request.setAttribute("message", "Invalid Login");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CreateSession.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CreateSession.class.getName()).log(Level.SEVERE, null, ex);
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
