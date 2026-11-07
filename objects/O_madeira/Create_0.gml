
coletado = false;
perto = false;

chave_madeira = string(room) + "_" + string(x) + "_" + string(y);

if (!variable_global_exists("madeiras_coletadas"))
{
    global.madeiras_coletadas = 0;
}

if (!variable_global_exists("madeiras_chaves_coletadas"))
{
    global.madeiras_chaves_coletadas = [];
}
