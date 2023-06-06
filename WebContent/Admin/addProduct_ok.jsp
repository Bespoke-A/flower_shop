
<%@page import="com.project.flower.admin.dao.ProductDAO"%>
<%@page import="com.project.flower.admin.vo.FlowerVO"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.zip.DeflaterInputStream"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
FlowerVO fvo = new FlowerVO();
//업로드 경로지정
String path = "c:/upload";
MultipartRequest mr = new MultipartRequest(request, path, (10 * 1024 * 1024), "UTF-8", new DefaultFileRenamePolicy());
// 파라미터값 vo 저장
fvo.setfCategory(Integer.parseInt(mr.getParameter("category")));
fvo.setfId(mr.getParameter("fId"));
fvo.setfName(mr.getParameter("fName"));
fvo.setfPrice(Integer.parseInt(mr.getParameter("fPrice")));
fvo.setfQuant(Integer.parseInt(mr.getParameter("fQuant")));
fvo.setfInfo(mr.getParameter("fInfo"));
//System.out.println();
//업로드 파일 유무에 따른 파일 이름 저장
if(mr.getFile("fImg") == null) {
	fvo.setfImg("이미지 없음");
} else {
	fvo.setfImg(mr.getOriginalFileName("fImg"));
}
if(mr.getFile("fThumbnail") == null) {
	fvo.setfThumbnail("썸네일 없음");
} else {
	fvo.setfThumbnail(mr.getOriginalFileName("fThumbnail"));
}

ProductDAO.addProduct(fvo);

response.sendRedirect("productPaging?category="+fvo.getfCategory());
%>
