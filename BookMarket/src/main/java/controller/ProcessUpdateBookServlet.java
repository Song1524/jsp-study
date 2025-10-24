package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import util.DBUtil;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class ProcessAddBookServlet
 */
@WebServlet("/processUpdateBook")
@MultipartConfig(
  fileSizeThreshold = 1024 * 1024 * 1,   // 메모리 임시 저장 임계값(1MB) -> 이 크기 초과 시 디스크에 임시 저장
  maxFileSize = 1024 * 1024 * 10,        // 업로드 최대 파일 크기(10MB)
  maxRequestSize = 1024 * 1024 * 50      // 전체 요청 크기(50MB)
)
public class ProcessUpdateBookServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;
       
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");

        // ==== 일반 텍스트 데이터 처리 ====
        String bookId = request.getParameter("bookId");
        String name = request.getParameter("name");
        String unitPrice = request.getParameter("unitPrice");
        String author = request.getParameter("author");
        String publisher = request.getParameter("publisher");
        String releaseDate = request.getParameter("releaseDate");
        String description = request.getParameter("description");
        String category = request.getParameter("category");
        String unitsInStock = request.getParameter("unitsInStock");
        String condition = request.getParameter("condition");

        int price = 0;
        if (unitPrice != null && !unitPrice.isEmpty()) {
            price = Integer.parseInt(unitPrice);
        }

        long stock = 0;
        if (unitsInStock != null && !unitsInStock.isEmpty()) {
            stock = Long.parseLong(unitsInStock);
        }
        
        Part filePart = request.getPart("bookImage");
        String fileName = null;
        
        if (filePart != null && filePart.getSize() > 0) {
            fileName = filePart.getSubmittedFileName();
            
            String uploadPath = "D:/upload";
            
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
              uploadDir.mkdirs();
            }
            
            filePart.write(uploadPath + File.separator + fileName);
        }
         
        String sql = "UPDATE book SET "
            + "b_name=?, b_unitPrice=?, b_author=?, b_publisher=?, b_releaseDate=?, b_description=?, "
            + "b_category=?, b_unitsInStock=?, b_condition=?";

       if (fileName != null) {
           sql += ", b_filename=?";
         }
       
       sql += " WHERE b_id=?";
      
       int index = 1;
      
       try (Connection conn = DBUtil.getConnection();
          PreparedStatement pstmt = conn.prepareStatement(sql)) {          
           
           pstmt.setString(index++, name);
           pstmt.setInt(index++, price);
           pstmt.setString(index++, author);
           pstmt.setString(index++, publisher);
           pstmt.setString(index++, releaseDate);
           pstmt.setString(index++, description);
           pstmt.setString(index++, category);
           pstmt.setLong(index++, stock);
           pstmt.setString(index++, condition);
           
           if (fileName != null) {
               pstmt.setString(index++, fileName); 
           }
           
           pstmt.setString(index, bookId); 
      
           pstmt.executeUpdate();
           
             } catch (SQLException e) {
                 e.printStackTrace();
             }
    
        response.sendRedirect("editBook.jsp?edit=update");
  }

}
