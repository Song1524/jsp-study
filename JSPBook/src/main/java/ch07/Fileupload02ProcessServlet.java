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

/**
 * Servlet implementation class Fileupload01ProcessServlet
 */
@WebServlet("/fileupload02Process")
@MultipartConfig(
	fileSizeThreshold = 1024 * 1024 * 1,
    maxFileSize = 1024 * 1024 * 10,
    maxRequestSize = 1024 * 1024 * 50
)
public class Fileupload02ProcessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Fileupload02ProcessServlet() {
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
		
		String uploadPath = "D:/upload";
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdirs();
		}
		
		String name1 = request.getParameter("name1");
		String subject1 = request.getParameter("subject1");
		
		String name2 = request.getParameter("name2");
		String subject2 = request.getParameter("subject2");
		
		String name3 = request.getParameter("name3");
		String subject3 = request.getParameter("subject3");
		
//		Part filePart1 = request.getPart("uploadFile1");
//		Part filePart2 = request.getPart("uploadFile2");
//		Part filePart3 = request.getPart("uploadFile3");
		// 또는 한번에 가져오기
		Collection<Part> fileParts = request.getParts();
		// 폼에 포함된 모든 입력 양식 요소를 가져옴
		
		int fileCount = 1;
		for (Part part : fileParts) {
			// 파일만 필터링 - 방법1
//			if (part.getName().startsWith("uploadFile")) {
				String filename = part.getSubmittedFileName();
				
				// 파일만 필터링 - 방법2
				// fileName은 파일 필드가 아닌 일반 폼 필드에서는 항상 null
				if (filename == null || filename.isEmpty()) continue;
				
				part.write(uploadPath + File.separator + filename);
				out.println("업로드된 파일" + fileCount + ": " + filename + "<br>");
				fileCount++;
//			}
		}	
		// (참고) multiple 속성을 사용하여 하나의 input으로 여러 개의 파일을 업로드 시 
		// 같은 name(예: uploadFiles)으로 서버에 전송됨
		// getParts()로 모든 Part를 받고, 파일 항목들을 순회하면서 저장
	}
}