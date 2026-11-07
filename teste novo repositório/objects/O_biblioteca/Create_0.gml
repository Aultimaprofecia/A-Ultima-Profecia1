randomize();

global.livro_encontrado = false;
global.livro_tempo = 0;

var quantidade = instance_number(O_livro);

if (quantidade > 0)
{
    var escolhido = irandom(quantidade - 1);

    for (var i = 0; i < quantidade; i++)
    {
        var livro = instance_find(O_livro, i);

        livro.verdadeiro = (i == escolhido);
    }
}