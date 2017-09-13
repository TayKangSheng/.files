
echo "\nfiles:"
for f in ~/.files/*
do
    if [ -f $f ] && [[ $f =~ rc$  ]];
    then
        echo "\t$f\n"
        source $f
    fi
done
