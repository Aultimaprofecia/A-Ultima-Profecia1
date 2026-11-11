

// =====================================
// DEFINIR PLAYLIST
// =====================================

var novo_grupo = "";


var nova_lista = [];

// MENU, CONFIGURACOES E SELECAO
if (room == RM_inicial || room == RM_selecaodepersonagem || room == RM_configuracoes)
{
    novo_grupo = "menu";
    nova_lista = [Som_suave];
}

// AMBIENTES GERAIS
else if (
    room == RM_quarto ||
    room == RM_bercario ||
    room == RM_salaoprincipal ||
    room == RM_guardas1fase ||
    room == RM_corredor1 ||
    room == RM_corredor2 ||
    room == RM_corredor3
)
{
    novo_grupo = "ambientes";
    nova_lista = [Som_engracado];
}

// BIBLIOTECA
else if (room == RM_Biblioteca)
{
    novo_grupo = "biblioteca";
    nova_lista = [Som_engracado];
}

// FINAL DO TUTORIAL
else if (room == RM_SaladeEnergia )
{
    novo_grupo = "final";
    nova_lista = [Som_fimtutorial, Som_guitarra, Som_kpop];
}

// =====================================
// TROCAR DE PLAYLIST
// =====================================

if (novo_grupo != audio_grupo)
{
    if (audio_instancia != -1)
    {
        audio_stop_sound(audio_instancia);
    }

    audio_grupo = novo_grupo;
    audio_lista = nova_lista;
    audio_ultima = -1;
    audio_instancia = -1;
}
// =====================================
// DETECTAR PERSEGUICAO
// =====================================

guardas_perseguindo = 0;

with (O_guarda_pai)
{
    if (estado == 1)
    {
        other.guardas_perseguindo += 1;
    }
}

// =====================================
// CONTROLAR MUSICA DE PERSEGUICAO
// =====================================

if (guardas_perseguindo > 0)
{
    // Para a musica normal
    if (audio_instancia != -1)
    {
        audio_stop_sound(audio_instancia);
        audio_instancia = -1;
    }

    // Toca a perseguicao
    if (som_perseguicao == -1 || !audio_is_playing(som_perseguicao))
    {
        som_perseguicao = audio_play_sound(
            Som_perceguicao_contraotempo,
            10,
            true
        );
    }
}
else
{
    // Para a musica de perseguicao
    if (som_perseguicao != -1)
    {
        audio_stop_sound(som_perseguicao);
        som_perseguicao = -1;
    }
}
// =====================================
// TOCAR MUSICA
// =====================================

if (audio_grupo != "" && guardas_perseguindo == 0)
{
    if (audio_instancia == -1 || !audio_is_playing(audio_instancia))
    {
        var quantidade = array_length(audio_lista);

        if (quantidade > 0)
        {
            var escolha = irandom(quantidade - 1);

            if (quantidade > 1)
            {
                while (escolha == audio_ultima)
                {
                    escolha = irandom(quantidade - 1);
                }
            }

            audio_ultima = escolha;

            audio_instancia = audio_play_sound(
                audio_lista[escolha],
                10,
                false
            );
        }
    }
}