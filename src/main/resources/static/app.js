fetch('/api/hello')
    .then(response => {
        if (!response.ok) {
            throw new Error('Backend request failed');
        }
        return response.json();
    })
    .then(data => {
        document.getElementById('message').textContent = data.message;
    })
    .catch(() => {
        document.getElementById('message').textContent = 'Cannot connect to the backend';
    });
