<%--
  Created by IntelliJ IDEA.
  User: Felipe Rothen
  Date: 17/10/2018
  Time: 21:09
  To change this template use File | Settings | File Templates.
--%>
<%@tag pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@attribute name="title" type="java.lang.String" %>
<head>
    <title>${title}</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="${urlBase}/js/jquery.countdown.js"></script>



    <style>
        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            border:0;
        }
        body{
            font: 13px/100% tahoma;
        }
        .clear{clear:both;}
        .wrapper{
            width:400px;
            margin:10px auto;
        }
        .commentBox{

        }
        fieldset{
            padding:10px;
            background:#69bdf4;
        }
        .form_grp{
            margin-bottom:10px;
        }
        label{
            width:100%;
            height:32px;
            line-height:32px;
            display:block;
            margin-bottom:10px;
            font-size:18px;
            color:#fff;
            padding-left:34px; background:url(https://cdn3.iconfinder.com/data/icons/glypho-free/64/pen-checkbox-32.png) no-repeat left center;
        }
        textarea{
            width:100%;
            height:100px;
            padding:10px;
            border:1px solid #eee;
            resize:none;
        }
        button{
            padding:5px 20px;
            background-color:#0e7ec7;
            color:#fff;
            float:right;
        }
        .viewCmnt{
            clear:both;
            overflow:hidden;
            position:relative;
            background:#c8e7fb;
            border-bottom:1px solid #A6DAFC;
        }
        .viewCmnt p {
            width:100%;
            float:left;
            padding:10px;
            font-size:14px;
            line-height:20px;
        }
        .edit, .delete{
            position:absolute;
            width:20px;
            height:20px;
            display:none;
            cursor:pointer;
            bottom:5px;
            padding:2px;
        }
        .viewCmnt:hover .edit, .viewCmnt:hover .delete{
            display:block;
        }
        .edit{
            right:26px;  background:url(https://cdn4.iconfinder.com/data/icons/miu/22/editor_pencil_pen_edit_write_-16.png) no-repeat center #0e7ec7;
        }
        .delete{
            right:5px;
            background:url(https://cdn2.iconfinder.com/data/icons/flat-ui-icons-24-px/24/cross-24-16.png) no-repeat center #0e7ec7;
            z-index:2;
        }
    </style>
</head>