<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>My Page</title>
</head>
<body>
    <h1>My Page</h1>
    <div>
        <img src="${member.memberProfileImage}" alt="Profile Image" style="width:150px;height:150px;">
        <form method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/updateProfileImage">
            <input type="file" name="profileImage">
            <button type="submit">Upload</button>
        </form>
    </div>
    <p>Name: <span>${member.memberName}</span></p>
    <p>Email: <span>${member.memberEmail}</span></p>
    <p>Phone: <span>${member.memberPhone}</span></p>
    <p>Address: <span>${member.memberAddress}</span></p>
</body>
</html>
