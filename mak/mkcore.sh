#!/bin/bash
#默认为debug方式
if [ 0 -eq $# ]
then
   cmds=debug
else
   cmds=$@
fi

make_func()
{
   if [ ! -d "depend" ]
   then
      mkdir "depend"
   fi

   if [ ! -d "obj" ]
   then
      mkdir "obj"
   fi

   for target in ${targets}
   do
      for cmd in $@
      do
    #支持默认目标文件
    export STARGET=${target} 
    export SOBJS="`eval echo '$'{${target}_objs'}'`"
         if [ -z "${SOBJS}" ]
         then
           export   SOBJS="${target}.o"
         fi

    export SLIBS="`eval echo '$'{${target}_libs'}'`" 
         export SINCLUDEPATH="`eval echo '$'{${target}_include_path'}'`"

         if [ "clean" = ${cmd} ]
         then
            make -f ${MKHOME}/mkcore.mak ${cmd} 
         elif [ "all" = ${cmd} ]
         then
            cmd=debug${targetType}
            make -f ${MKHOME}/mkcore.mak ${cmd}
         else
            cmd=${cmd}${targetType}
            make -f ${MKHOME}/mkcore.mak ${cmd}
         fi
      done
      if [[ $cmd =~ "release" ]]; then
         preFix=${PRONAME}/bin/
         if [ ${targetType} = "dynamic" ]; then
            suffix=".so"
            preFix=${PRONAME}/lib/lib
         elif [ ${targetType} = "static" ]; then
            suffix=".a"
            preFix=${PRONAME}/lib/lib
         fi
         strip ${preFix}${target}${suffix}
      fi
   done
}

for cmd in ${cmds}
do
   make_func ${cmd}
done
