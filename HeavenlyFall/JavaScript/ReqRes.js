async function SavePoints() {
    let body = {
        user: usuario.name,
        points: personagem.pontos
    }
    await fetch('/user/save', {
        method: 'POST',
        body: JSON.stringify(body),
        headers: {
            'Content-Type': 'application/json'
        }
    }).then((res) => res.json())
        .then((response) => console.log(response))
        .catch((error) => console.error('Erro ao salvar pontos:', error))
}
