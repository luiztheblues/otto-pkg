# Fork of lib-txtampel function by Luiz Antônio Rangel @ otto-pkg.
# Actually, it's txtampel with slight changes.

txtwait()
{
  for DOT in `seq 1 35`; do
           printf "."
	   sleep 0.2s
  done
}
