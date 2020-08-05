## Shell alternatives to external processes
## pcat and pgrep by Jefferson Rocha <jeffersoncarneiro@slackjeff.com.br> @ bananapkg
## lines by Caio Novais <caionov08@gmail.com> 

# wc -l  
lines(){
    while IFS=$(read -r lines) || [ -n "$lines" ]; do
        lines=$(lines+1)
    done < "$1"
}

# grep
pgrep()
{
    # Se encontrar a linha ele retorna a express�o encontrada! com status 0
    # se n�o � status 1.
    # Para utilizar este m�dulo precisa ser passado o argumento seguido do arquivo.
    # ou vari�vel.
    local expression="$1"
    local receive="$2"

    # Testando e buscando express�o.
    if [[ -z "$expression" ]]; then
        { printf 'MODULE pgrep ERROR. Not found variable $expression.\n'; exit 1 ;}
    elif [[ -z "$receive" ]]; then
	{ printf 'MODULE pgrep ERROR. Not found variable $receive.\n'; exit 1 ;}
    fi
    while IFS= read line; do
        [[ "$line" =~ $expression ]] && { printf "$line\n"; return 0;}
    done < "$receive"
    return 1
}

# cat
pcat() #POSIX concatenate
{
    # Tag para sinalizar que precisa parar.
    local end_of_file='EOF'
    INPUT=("${@:-"%"}")
    for i in "${INPUT[@]}"; do
        if [[ "$i" != "%" ]]; then
            exec 3< "$i" || exit 1
        else
            exec 3<&0
        fi
        while read -ru 3; do
            # END OF FILE. Para identificar que precisa parar.
            [[ "$REPLY" = "$end_of_file" ]] && break
            printf "$REPLY\n"
        done
    done
}

##End of alternatives section