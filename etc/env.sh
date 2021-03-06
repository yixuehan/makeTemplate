export THIRDLIB=${PRONAME}/thirdLib

if [ -e '/etc/centos-release' ]
then
    MKOSTYPE=centos
else
    MKOSTYPE=$(echo `lsb_release -a 2>/dev/null |grep -i distributor| tr A-Z a-z|cut -d':' -f2`)
fi
export MKOSTYPE
export BOOST_INCLUDE_PATH=${THIRDLIB}/${MKOSTYPE}/boost/include
export BOOST_LIBRARY_PATH=${THIRDLIB}/${MKOSTYPE}/boost/lib

export OPENCL_INCLUDE_PATH=/opt/intel/opencl/include
export OPENCL_LIBRARY_PATH=/opt/intel/opencl

CPLUS_INCLUDE_PATH=${CPLUS_INCLUDE_PATH}:${OPENCL_INCLUDE_PATH}:${BOOST_INCLUDE_PATH}
CPLUS_INCLUDE_PATH=${CPLUS_INCLUDE_PATH}:${PRONAME}/include:${PRONAME}/src:${HOME}/usr/include

LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${BOOST_LIBRARY_PATH}:${PRONAME}/lib:${OPENCL_LIBRARY_PATH}
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${HOME}/usr/lib

LIBRARY_PATH=$LD_LIBRARY_PATH

PATH=$PATH:${PRONAME}/bin

PS1='[\u@\h \W]\$ '

export CPLUS_INCLUDE_PATH
export LD_LIBRARY_PATH
export LIBRARY_PATH
export PATH
export PS1

#export MANPATH=/home/wangkai/project/thirdLib/${MKOSTYPE}/google_coredumper/man

alias cds='cd $PRONAME/src'
alias cdi='cd $PRONAME/include'
alias cdm='cd $MKHOME'
alias cde='cd $PRONAME/etc'
alias cdl='cd $PRONAME/log'
alias cdb='cd $PRONAME/bin'
alias cdp='cd $PRONAME'
alias cdlib='cd $PRONAME/lib'
alias cpmake='cp $MKHOME/mak/build.sh . && chmod +x build.sh'
alias rm='rm -i'

function cd()
{
    builtin cd $@ && ls
}

ulimit -c unlimited
