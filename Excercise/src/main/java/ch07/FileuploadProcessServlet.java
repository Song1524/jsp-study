package ch07;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.UUID;

/**
 * Servlet implementation class Fileupload01ProcessServlet
 */
@WebServlet("/fileuploadProcess")
@MultipartConfig(
	fileSizeThreshold = 1024 * 1024 * 1,
    maxFileSize = 1024 * 1024 * 10,
    maxRequestSize = 1024 * 1024 * 50
)
public class FileuploadProcessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileuploadProcessServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 한글 파일명 처리를 위해 추가
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		UUID uuid = UUID.randomUUID();
		
		String uploadPath = "D:/upload";
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdirs();
		}
		
		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		
		Collection<Part> fileParts = request.getParts();
		
		for (Part part : fileParts) {
		    String fileName = part.getSubmittedFileName();
		    if (fileName == null || part.getSize() == 0) continue;

		    File file = new File(uploadDir, fileName);

		    if (file.exists()) {
		        fileName = fileName.replace(".", "_" + uuid + ".");
		        file = new File(uploadDir, fileName);
		    }

		    part.write(uploadPath + File.separator + fileName);
		    out.println("업로드된 파일" + ": " + fileName + "<br>");
		}	
	}
}