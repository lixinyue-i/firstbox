package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop_servlet.Register;

@WebServlet("/login.do")
public class LoginController extends HttpServlet{


    private static final long serialVersionUID = 7242872008838278971L;
    public LoginController() {
        super();

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String user_id = request.getParameter("user_id");
            String password = request.getParameter("password");
            Register userService = new  Register();
            if(userService.login(user_id,password)) {
                request.getSession().setAttribute("user_id", user_id);
                response.sendRedirect("first.jsp");
            }else {
                response.getWriter().print("register false!");
            }

        }catch(Exception e) {
            e.printStackTrace();
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }
    @WebServlet("/logout")
    public class LogoutServlet extends HttpServlet {
        protected void doPost(HttpServletRequest request, HttpServletResponse response) {
            try {
                // 清除会话
                request.getSession().invalidate();
                // 重定向到登录页面
                response.sendRedirect("注册.jsp");
            } catch (IOException e) {
                e.printStackTrace();
                try {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Logout failed");
                } catch (IOException ioException) {
                    ioException.printStackTrace();
                }
            }
        }
    }
}
