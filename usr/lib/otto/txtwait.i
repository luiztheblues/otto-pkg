# Fork of lib-txtampel function by Luiz Antônio Rangel @ otto-pkg.
# Actually, it's txtampel with slight changes.

txtwait()
{
  for dot in `seq 1 35`; do
           printf "."
	   sleep 0.2s
  done
	
  WAITPID=$! # Take the for loop PID, it will be useful to kill the loop later.
}
