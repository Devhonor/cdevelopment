#!/bin/bash
###################################################################
# Program Name: c developement envrionment                        #
# Author: Devhonor                                                #
# Date: 2025-01-18                                                #
###################################################################

#Define Current Directory 
CURRENT_DIR=$(cd "$(dirname $0)";pwd)

#Define Toplevel Directory
TOPLEVEL_DIR=$(cd ${CURRENT_DIR}/..;pwd)

#fetching package
package=${TOPLEVEL_DIR}/packages

#Loading lib 
. ${TOPLEVEL_DIR}/lib/funclib

function copy_files(){
    print_log "Uncompress package to /usr/ directory"
    cd ${package} && tar -zxf ${package}/cdeve.tar.gz -C /usr/
    print_log "Adding LD_LIBRARY_PATH to .bashrc"
    sed -i "/LD_LIBRARY_PATH/d" ~/.bashrc
    echo "export LD_LIBRARY_PATH=/usr/local/lib64:/usr/local/lib:\${LD_LIBRARY_PATH}" >> ~/.bashrc
    print_log "Reloading environment information"
    . ~/.bashrc

    print_log "Output result:"
    gcc_version=$(gcc --version | head -1 | awk '{print $3}')
    if [[ "${gcc_version}" == "14.2.0" ]];then
        print_sub_log "gcc version is latest: ${gcc_version}"
    else
        print_error_log "Please check /usr/local/bin/gcc program"
    fi 
    gpp_version=$(g++ --version | head -1 | awk '{print $3}')
    if [[ "${gpp_version}" == "14.2.0" ]];then
        print_sub_log "g++ version is latest: ${gpp_version}"
    else
        print_error_log "Please check /usr/local/bin/g++ program"
    fi 

    cmake_version=$(cmake --version | head -1 | awk '{print $3}')

    if [[ "${cmake_version}" == "3.31.4" ]];then
        print_sub_log "cmake version is latest: ${cmake_version}"
    else
        print_error_log "Please check /usr/local/bin/cmake program"
    fi

    make_version=$(make --version | head -1 | awk '{print $3}')

    if [[ "${make_version}" == "4.4" ]];then
        print_sub_log "cmake version is latest: ${make_version}"
    else
        print_error_log "Please check /usr/local/bin/make program"
    fi

}

copy_files
