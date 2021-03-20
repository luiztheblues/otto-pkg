#!/bin/sed -f
/#/d
:a
N
$!ba
s/\n/ /g
