<%-- 
    Document   : layout
    Created on : Nov 21, 2017, 8:40:39 AM
    Author     : hi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta charset="utf-8" />
        <meta name="description" content="Drag &amp; drop file upload with image preview" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
        <title>
            <tiles:getAsString name="title" />
        </title>

        <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css" />"/>
        <link rel="stylesheet" href="<c:url value="/resources/font-awesome/4.5.0/css/font-awesome.min.css" />"/>
        
        <link rel="stylesheet" href="<c:url value="/resources/css/jquery-ui.custom.min.css" />" />
	<link rel="stylesheet" href="<c:url value="/resources/css/jquery.gritter.min.css" />" />
        
        <link rel="stylesheet" href="<c:url value="/resources/css/fonts.googleapis.com.css" />" />
        
        
        <link rel="stylesheet" href=" <c:url value="/resources/css/ace.min.css" />" />
        <link rel="stylesheet" href="<c:url value="/resources/css/ace-rtl.min.css" />" />
        
        <script type="text/javascript">
                if ('ontouchstart' in document.documentElement)
                {
                    document.write("<script src='assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
                }
            </script>
        <script src="<c:url value="/resources/js/jquery-2.1.4.min.js" />"></script>
        <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
        <script src="<c:url value="/resources/js/ace-elements.min.js" />"></script>
        <script src="<c:url value="/resources/js/ace.min.js" />"></script>
        <script src="<c:url value="/resources/js/bootbox.js" />"></script>
        <script src="<c:url value="/resources/js/jquery.gritter.min.js" />"></script>
        
    </head>
    <body class="no-skin">
        <tiles:insertAttribute name="navbar"></tiles:insertAttribute>
            <script type="text/javascript">
                try {
                    ace.settings.loadState('main-container')
                } catch (e) {
                }
            </script>

            <div class="main-container ace-save-state" id="main-container">

            <tiles:insertAttribute name="sidebar"></tiles:insertAttribute>

                <div class="main-content">
                    <div class="main-content-inner">
                        <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                            <ul class="breadcrumb">
                                <li>
                                    <i class="ace-icon fa fa-home home-icon"></i>
                                    <a href="#">Trang chủ</a>
                                </li>
                                <li class="active">
                                    <tiles:getAsString name="title" />
                                </li>
                            </ul><!-- /.breadcrumb -->

                            <div class="nav-search" id="nav-search">
                                <form class="form-search">
                                    <span class="input-icon">
                                        <input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
                                        <i class="ace-icon fa fa-search nav-search-icon"></i>
                                    </span>
                                </form>
                            </div><!-- /.nav-search -->
                        </div>
                        <div class="page-content">
                            <tiles:insertAttribute name="menu-setting"></tiles:insertAttribute>

                            <div class="page-header">
                                <h1>
                                    <tiles:getAsString name="title" />
                                </h1>
                            </div><!-- /.page-header -->

                        <div class="row">
                            <tiles:insertAttribute name="body"></tiles:insertAttribute>
                            </div>
                        </div>
                    </div>
                </div>


            <tiles:insertAttribute name="footer"></tiles:insertAttribute>

            </div>
    </body>
</html>
