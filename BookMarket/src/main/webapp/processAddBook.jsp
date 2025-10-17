<%@page import="dao.BookRepository"%>
<%@page import="dto.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 등록</title>
</head>
<body>
	<!-- 신규 도서 등록 처리 페이지 만들기 -->
	<%
		// 1. 도서 등록페이지에서 넘어오는 요청 파라미터 얻기
		// 2. Book Repository 객체 얻기
		// 3. Book 객체 생성 후 요청 파라미터 값 담기
		// 4. addBook() 메소드로 저장
		// 5. books.jsp 페이지로 강제 이동하도록 작성
			
		String bookId = request.getParameter("bookId");
		String name = request.getParameter("name");
		String unitPrice = request.getParameter("unitPrice");
		String author = request.getParameter("author");
		String description = request.getParameter("description");
		String publisher = request.getParameter("publisher");
		String category = request.getParameter("category");
		String unitsInStock = request.getParameter("unitsInStock");
		String releaseDate = request.getParameter("releaseDate");
		String condition = request.getParameter("condition");
		String filename = request.getParameter("filename");
		
		int price;
		
		if (unitPrice.isEmpty()) {
			price = 0;
		} else {
			price = Integer.parseInt(unitPrice);
		}
		
		long stock;
		
		if (unitsInStock.isEmpty()) {
			stock = 0;
		} else {
			stock = Integer.parseInt(unitsInStock);
		}
		
		BookRepository dao = BookRepository.getInstance();
		
		Book newBook = new Book();
	  newBook.setBookId(bookId);
	  newBook.setName(name);
	  newBook.setUnitPrice(Integer.parseInt(unitPrice));
	  newBook.setAuthor(author);
	  newBook.setPublisher(publisher);
	  newBook.setReleaseDate(releaseDate);
	  newBook.setDescription(description);
	  newBook.setCategory(category);
	  newBook.setUnitsInStock(Long.parseLong(unitsInStock));
	  newBook.setCondition(condition);
			
	  dao.addBook(newBook);
	    
	  response.sendRedirect("books.jsp");
	%>
</body>
</html>