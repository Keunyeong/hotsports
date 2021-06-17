<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	session.removeAttribute("id");
	
	/*
	 *  클라이언트에게 새로운 요청경로를 주고 요청을 다시하라고 강요하는것이 리다일렉트 이동이다.
	 *  리다일렉트 이동하라고 강요하는것 자체가 응답이다.
	 */
	
	// /Step03_Scope/index.jsp 절대경로로 요청을 다시 하라고 클라이언트에게 응답하기 (리다일렉트 이동)
	String cPath=request.getContextPath();
	response.sendRedirect(cPath+"/index.jsp");
%>