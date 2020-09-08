# Depends: colors.i
# Fork of the _SPINNER() function by Jefferson Rocha <jeffersoncarneiro@slackjeff.com.br> @ bananapkg

txtampel()
{
	local INC=0 # Var incremento
	local COLOR="${GREEN}" # First color to appear

    while :; do
		# "Traffic light"-like colors
		[[ "$INC" -gt '22' ]] && COLOR="${GREEN}"
		[[ "$INC" -gt '44' ]] && COLOR="${RED}"
		[[ "$INC" -gt '66' ]] && COLOR="${YELLOW}"
		# Print it in the screen!
        for TEXT in ${AMPEL[@]}; do
            	printf "${COLOR}\r$TEXT$END\n"
			sleep 0.3s
			INC=$(($INC + 1))
        done
    done
	
	AMPID=$! # Take the while loop PID, it will be useful to kill the loop later.
}
