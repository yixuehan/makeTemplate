export BOOST_HOME=${PRONAME}/thirdLib
export BOOST_INCLUDE_PATH=${BOOST_HOME}/include
export BOOST_LIBRARY_PATH=${BOOST_HOME}/lib/boost_centos

export OPENCL_INCLUDE_PATH=/opt/intel/opencl/include
export OPENCL_LIBRARY_PATH=/opt/intel/opencl

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${BOOST_LIBRARY_PATH}:${PRONAME}/lib:${OPENCL_LIBRARY_PATH}
export LIBRARY_PATH=$LIBRARY_PATH:${BOOST_LIBRARY_PATH}:${PRONAME}/lib:${OPENCL_LIBRARY_PATH}

export CPLUS_INCLUDE_PATH=${CPLUS_INCLUDE_PATH}:${OPENCL_INCLUDE_PATH}:${BOOST_INCLUDE_PATH}

alias cds='cd $PRONAME/src'
alias cdi='cd $PRONAME/include'
alias cdm='cd $PRONAME/mak'
alias cde='cd $PRONAME/etc'
alias cdl='cd $PRONAME/log'
alias cdb='cd $PRONAME/bin'
alias cdp='cd $PRONAME'
alias cdlib='cd $PRONAME/lib'
alias cpmake='cp $PRONAME/mak/build.sh . && chmod +x build.sh'
alias rm='rm -i'

function cd()
{
    builtin cd $@ && ls
}

ulimit -c unlimited
