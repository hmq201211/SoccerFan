<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <title>SoccerFan</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <link href="css/style.css" rel="stylesheet" type="text/css" media="screen"/>
    <!-- Links for Jquery and bootstrap css -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script>
        <!-- jqurey script -->
        $(document).ready(function () {

            $('#myCarousel').carousel({
                interval: 3000
            })

            $('.carousel .item').each(function () {
                var next = $(this).next();
                if (!next.length) {
                    next = $(this).siblings(':first');
                }
                next.children(':first-child').clone().appendTo($(this));
            });
        });
    </script>
    <style>
        * {
            box-sizing: unset;
        }

        .col-md-6 {
            width: 45% ! important;
        }
    </style>


</head>
<body style='margin: 0px !important; padding: 0 !important;	background: #00cc00 !important;	font-family: Georgia, "Times New Roman", Times, serif;	font-size: 12px !important;	'>
<script type="text/javascript" src="js/autocomplete.js"></script>
<!-- Start #logo top content of the webpage-->
<div id="logo">
    <table style="float: left">
        <tr>
            <td style="valign: top;"><a href="welcome_page.jsp"><img src="images/site/logo.jpg" alt="logo"
                                                      style="height: 80px"></a></td>
            <td><h1>
                <a href="welcome_page.jsp">Soccer Fan</a>
            </h1></td>
        </tr>
        <tr>
            <td></td>
            <td><p>
                <em>World's Largest Soccer Center</em>
            </p></td>
        </tr>
    </table>
    <div
            style="float: right; width: 30%; margin-top: 35px; border: 1px solid white; padding: 5px; padding-right: 15px">
        <em style="color: white;">Search</em>
        <div name="autofillform">
            <input type="text" name="searchId" value="" class="input"
                   id="searchId" onkeyup="doCompletion()" autocomplete="off"
                   placeholder="search here.." style="padding: 5px; font-size: 16px;"/>
            <div id="auto-row">
                <table id="complete-table" class="gridtable"
                       style="position: absolute; width: 315px;"></table>
            </div>
        </div>
    </div>

</div>
<hr/>
<!-- end #logo -->
<!-- start #header -->
<!-- menu in header area the header div ends in utility file where header content right side link gets populated with login id cart and logout option -->
<div id="header">
    <div id="menu">
        <ul>
            <li><a href="GameServlet?type=GameList"><span class="glyphicon glyphicon-cloud">Games</span></a></li>
            <li><a href="TeamServlet?type=TeamList"><span class="glyphicon glyphicon-cloud">Teams</span></a></li>
            <li><a href="PlayerServlet?type=PlayerList"><span class="glyphicon glyphicon-cloud">Players</span></a></li>
            <li><a href="Trending"><span class="glyphicon glyphicon-cloud">Trending</span></a></li>
        </ul>
    </div>
    <!-- end #menu -->
    <div id='menu' style='float: right;'>
        <ul>
            <li><a href='OrderServlet?type=ViewOrder'><span class='glyphicon glyphicon-credit-card'>Orders</span></a></li>
            <c:if test="${!empty sessionScope.get('User').username}"><li><a href='#'><span class='glyphicon glyphicon-user'>Welcome:${sessionScope.get('User').username}</span></a></li></c:if>
            <c:if test="${empty sessionScope.get('User').username}"><li><a href='UserServlet?type=UserLogin'><span class='glyphicon glyphicon-user'>Login</span></a></li></c:if>
            <li><a href='OrderServlet?type=Cart'><span class='glyphicon glyphicon-shopping-cart'>Cart(${sessionScope.get("UserInfo").cart})</span></a></li>
            <li><a href='FollowServlet?type=List'><span class='glyphicon glyphicon-heart'>Follow(${sessionScope.get("UserInfo").follow})</span></a></li>
        </ul>
    </div>
