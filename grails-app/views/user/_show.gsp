<table class="table table-striped">
    <thead>
    <tr>
        <th>#</th>
        <th>Email</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Username</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${users}" var="user">
    <tr>
        <td>${user.id}</td>
        <td>${user.email}</td>
        <td>${user.firstname}</td>
        <td>${user.lastname}</td>
        <td>${user.username}</td>
    </tr>
    </g:each>
    </tbody>
</table>