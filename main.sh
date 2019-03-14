
# All files ending with *rc will be sourced.
for f in ~/.files/*
do
    if [ -f $f ] && [[ $f =~ rc$  ]];
    then
        source $f
    fi
done
