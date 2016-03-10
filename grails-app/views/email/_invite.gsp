<%@ page contentType="text/html"%>
<body>
<h1>${user} thinks you might be intrested in topic ${topic.name}. Click on join to subscribe!!</h1>
<g:link url="${serverUrl}/topic/join/${topic.id}">Join</g:link>
</body>