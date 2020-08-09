#!/bin/sh -f

#############################################################################
# Copyright(c) 2013 Intel Corporation.
# All rights reserved.
# Redistribution. Redistribution and use in binary form, without modification,
# are permitted provided that the following conditions are met:
# 1. Redistributions must reproduce the above copyright notice and the
# following disclaimer in the documentation and/or other materials provided
# with the distribution.
# 2. Neither the name of Intel Corporation nor the names of its suppliers may
# be used to endorse or promote products derived from this software without
# specific prior written permission.
# 3. No reverse engineering, de-compilation, or disassembly of this software
# is permitted. Limited patent license. Intel Corporation grants a world-wide,
# royalty-free, non-exclusive license under patents it now or hereafter owns
# or controls to make, have made, use, import, offer to sell and sell
# ("Utilize") this software, but solely to the extent that any such patent
# is necessary to Utilize the software alone. The patent license shall not
# apply to any combinations which include this software. No hardware per se
# is licensed hereunder.
# DISCLAIMER.
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#############################################################################


silent_indicater="/private/tmp/is_haxm_silent"
logfile="/private/tmp/haxm_silent_run.log"
haxm_memory_file="/Library/Preferences/com.intel.kext.haxm.plist"
launch_file="/Library/LaunchDaemons/com.intel.haxm.plist"
launch_file_old="/System/Library/LaunchDaemons/com.intel.haxm.plist"
package_file=""
mem_limit=""
kext_dir="/Library/Extensions/intelhaxm.kext"
kext_dir_old="/System/Library/Extensions/intelhaxm.kext"
ver_file="$kext_dir/Contents/Resources/support.txt" 
ver_file_old="$kext_dir_old/Contents/Resources/support.txt" 
log_input=""
maxSysMem=`sysctl -n hw.memsize`
maxSysMem=`expr $maxSysMem / 1024`;
maxSysMem=`expr $maxSysMem / 1024`; 
maxUIMem=0
postinstall=0
dir1=`dirname $0`
mem_default=0
dmg_default=""
os_type=`sw_vers -productVersion`

usage()
{
    echo " "
    echo "Usage: [sudo] $0 [OPTIONS]"
    echo "       OPTIONS:"
    echo "         -f <dmg>         Specify the haxm dmg package which need to silently install"
    echo "         -v               print haxm version information"
    echo "         -h               print usage"
    echo "         -u               haxm silently uninstall"
    echo "         -log <file>      logfile name (default=/private/tmp/haxm_silent_run.log)"
    echo "         -m <mem_size>    Specify the memory limit value used by haxm"
    echo "         -c               Check VT/NX capability of the current platform"    
    echo " "
    echo "Sample: "
    echo " "
    echo "         $0 -v :          print out haxm version"
    echo "         $0 -h :          print out help information"
    echo "    sudo $0 -u :          silent uninstall haxm driver from current OS"
    echo "    sudo $0 -c :          Check VT/NX capability of the current platform"
    echo "    sudo $0 :             silent install the default intelhaxm.dmg package with the default memory limit value"
    echo "    sudo $0 -f <directory/intelhaxm.dmg> -m <mem_size>:          silent install the intelhaxm.dmg package with mem_size as the memory limit value"
    echo "    sudo $0 -f <directory/intelhaxm.dmg> -m 0:                   silent install the intelhaxm.dmg package with the default memory limit"    
    echo "    sudo $0 -f <directory/intelhaxm.dmg> -log ./run.log:         silent install the intelhaxm.dmg package with the default memory limit, and save log/error into log file ./run.log"
    echo " "
    echo "Note: "
    echo " "
    echo "  For haxm silently install/uninstall, avd instance existence will be checked firstly. If an avd instance is existed, then silently install/uninstall"
    echo "  run will be stopped. Please close all of the avd instances, and then run haxm silent install/uninstall! "
    
    exit 0
}

strstr()
{
    echo $1 | grep --quiet $2
}

get_version()
{
    kext_dir="$1"
    ver_file="$2"
    
    if [ ! -e $kext_dir -a ! -e $kext_dir_old ]; then
        exit 1
    fi
    if [ ! -d $kext_dir -a ! -d $kext_dir_old ]; then
        exit 1
    fi
    if [ ! -e $ver_file -a ! -e $ver_file_old ]; then
        exit 1
    fi
      
    if [ -e $ver_file ]; then
	. $ver_file
	echo $VERSION
        exit 0
    fi

    if [ -e $ver_file_old ]; then
	. $ver_file_old
	echo $VERSION
        exit 0
    fi
}

echo_pass()
{
    log=$1
    
    echo "*************** Silent installation Pass ! ****************" >> $log
    if [ "X$log_input" != "X" ] ; then
        mv $log $log_input 
    fi
    echo "Silent installation Pass! "
    
    exit 0
}

echo_fail()
{
    log=$1
    
    echo "*************** Silent installation failed ! ****************" >> $log
    if [ "X$log_input" != "X" ] ; then
        mv $log $log_input 
        echo "Silent installation failed, please see $log_input for details!"
    else 
        echo "Silent installation failed, please see $log for details!"
    fi
    
    exit 1
}

check_package_valid()
{
    packages=$1
    log=$2
    
    # the package must be existed
    if [ ! -e $packages ]; then
        echo "Haxm installer package $packages not existed!" >> $log
        echo_fail $log
    fi
}

check_memlimit_valid()
{
    memlimit=$1
    maxMem=$2
    log=$3

    # check numeric/string
    word_replace=${memlimit//[0-9]/}

    if [ "X$word_replace" != "X" ] ; then
        echo "Invalid haxm memory limit parameter: mem_size=$memlimit, which includes character inputs! " >> $log
        echo_fail $log
    fi

    #check max length: a 64it number is a number of 19-digit number
    input_mem_len=`echo ${#memlimit}`
    if [ $input_mem_len -gt 19 ] ; then
        echo "Haxm memory limit $memlimit is greater than integer allowed by system! " >> $log
        echo_fail $log
    fi
    
    # check minimum
    if [ $memlimit -lt 512  ]; then
        echo "Haxm memory limit $memlimit is less than 512MB!" >> $log
        echo_fail $log
    fi
    
    # check maximum  
    if [ $memlimit -gt $maxMem  ]; then
        echo "Haxm memory limit $memlimit is greater than the maximum memory limit $maxMem!" >> $log
        echo_fail $log
    fi
}

compat_check_func()
{
    run_dir=$1
    rtn_value=""
    cur_dir=`pwd`
    cd $run_dir
    
    user=`id -u`  

    if [ $user != 0 ]; then
        echo "The VT/NX Capability Check action must run by using sudo!"
        cd $cur_dir
        exit 1
    fi
    
    dmg_files=`find . -name "*IntelHAXM*.dmg"`

    if [ "X$dmg_files" = "X" ] ; then
        echo "Cannot find haxm dmg file under directory $run_dir! "
        echo "Please move haxm dmg file under directory $run_dir, then to run VT/NX Capability Check again! "
        cd $cur_dir
        exit 1
    fi
    
    # here may include more than 1 dmg
    for one in $dmg_files ; do
        #echo $one

        hdiutil attach $one -noverify -nobrowse -mountpoint /Volumes/com_intel_kext_haxm_disc 1>/dev/null 2>&1
        if [ $? != 0 ] ; then
            echo "Hdiutil attach dmg failed! Please unmount the HAXM device first, then try to run VT/NX Capability Check again! "
            cd $cur_dir
            exit 1
        fi
        
        mpkg_file=`find /Volumes/com_intel_kext_haxm_disc/ -name "*.mpkg"`
        if [ "X$mpkg_file" = "X" ] ; then
            echo "Cannot find mpkg file inside haxm dmg package! Invalid haxm dmg package! "
            cd $cur_dir
            exit 1
        fi
        
        pkgutil --expand $mpkg_file ./dir_$$
        haxm_check_binary=./dir_$$/Scripts/haxm-check
        if [ -e $haxm_check_binary ]; then
            chmod 755 $haxm_check_binary
            ./$haxm_check_binary 1>/dev/null 2>&1
            rtn_value=$?
        else
            echo "VT/NX capability check binary does not existed! "
            exit 1
        fi
        
        break
    done
    
    rm -rf ./dir_$$
    
    sleep 1
    hdiutil detach /Volumes/com_intel_kext_haxm_disc  1>/dev/null 2>&1
    
    cd $cur_dir
    
    if [ $rtn_value -eq 0  ]; then
        echo "VT support -- Yes"
        echo "NX support -- Yes"
        exit 0
    elif [ $rtn_value -eq 1 ]; then
    # not support vtx
        echo "VT support -- No"
        echo "NX support -- Yes"
        exit 1
    elif [ $rtn_value -eq 2 ]; then
    # not support nx
        echo "VT support -- Yes"
        echo "NX support -- No"
        exit 1
    else
        echo "Invalid return value for capability check run! "
        exit 1        
    fi       
}

avd_exist_check_func()
{
    dmg_file=$1
    rtn_value=""
    
    user=`id -u`  

    if [ $user != 0 ]; then
        echo "The avd instance check action must run by using sudo!"
        exit 1
    fi
    
    hdiutil attach $dmg_file -noverify -nobrowse -mountpoint /Volumes/com_intel_kext_haxm_disc 1>/dev/null 2>&1
    if [ $? != 0 ] ; then
        echo "Hdiutil attach dmg failed! Please unmount the HAXM device first, then try to run again! "           
        exit 1
    fi
        
    mpkg_file=`find /Volumes/com_intel_kext_haxm_disc/ -name "*.mpkg"`
    if [ "X$mpkg_file" = "X" ] ; then
        echo "Cannot find mpkg file inside haxm dmg package! Invalid haxm dmg package $dmg_file! "
        exit 1
    fi
        
    pkgutil --expand $mpkg_file ./dir_$$
    haxm_check_binary=./dir_$$/Scripts/haxm-isRunning
    if [ -e $haxm_check_binary ]; then
        chmod 755 $haxm_check_binary
        ./$haxm_check_binary 1>/dev/null 2>&1
        rtn_value=$?
    else
        echo "Avd instance check binary does not existed! "
        exit 1
    fi
            
    rm -rf ./dir_$$
    
    sleep 1
    hdiutil detach /Volumes/com_intel_kext_haxm_disc  1>/dev/null 2>&1
    
    if [ $rtn_value -eq 0  ]; then
        #echo "No avd instance existed on current platform !"
        return 0
    elif [ $rtn_value -eq 1 ]; then
    # not support vtx
        #echo "Found avd instance existed on current platform !"
        return 1
    else
        echo "Invalid return value for avd instance check ! "
        exit 1        
    fi       
}

uninstall_func()
{
    haxm_dir=$1
    avd_exist=0
    
    user=`id -u`  

    if [ $user != 0 ]; then
        echo "The uninstall action must run by using sudo!"
        exit 1
    fi
    if [ ! -e $dmg_default ]; then
        echo "Avd instance check failed since cannot find haxm package $dmg_default! HAXM uninstall will be stopped! "
        exit 1
    fi
    
    avd_exist_check_func $dmg_default
    avd_exist=$?
    if [ $avd_exist -eq 1 ]; then
        echo "An Android x86 emulator instance is running. Please stop all emulator instances and continue with haxm uninstall! "
        exit 1
    fi 
    
    if [ ! -e $haxm_dir -a ! -e $kext_dir_old ]; then
        echo "HAXM is not installed! "
        exit 1
    fi


    haxm_status=`kextstat | grep intelhaxm`
    
    if [ "X$haxm_status" = "X" ] ; then
        echo "uninstall: HAXM is not loaded!"
    fi

    if [ -e $haxm_dir ]; then
        kextunload $haxm_dir
        rm -rf $haxm_dir
    fi

    if [ -e $launch_file ]; then
        rm -f $launch_file
    fi
    
    if [ -e $kext_dir_old ]; then
        kextunload $kext_dir_old
        rm -rf $kext_dir_old
    fi

    if [ -e $launch_file_old ]; then
        rm -f $launch_file_old
    fi
    
    if [ -e $haxm_memory_file ]; then
        rm -rf $haxm_memory_file
    fi

    haxm_status_done=`kextstat | grep intelhaxm`
    
    if [ "X$haxm_status_done" = "X" ] ; then
        echo "HAXM uninstall success! "
        exit 0
    else
        echo "HAXM uninstall failed! "
        exit 1
    fi

}

# default setting
if [ $maxSysMem -gt 4096 ]; then
    maxUIMem=`expr $maxSysMem - 2048`;
    mem_default=2048
elif [ $maxSysMem -gt 2048 ]; then
    maxUIMem=`expr $maxSysMem / 2`;
    mem_default=1024
else
    maxUIMem=`expr $maxSysMem - 512`;
    mem_default=512
fi 

mem_limit=$mem_default

if [ $( strstr "$os_type" '10.8') -o $( strstr "$os_type" '10.9') -o $( strstr "$os_type" '10.10') -o $( strstr "$os_type" '10.11') ]
then
    dmg_default="$dir1/IntelHAXM_6.0.5.dmg"
else 
    echo "HAXM silent installation only support mac OS X from 10.8 to 10.11 !"
    exit 1
fi

# parse commandline arguments
while [ $# -ne 0 ]; do
    case $1 in
        -m)
            shift; mem_limit=$1;;
        -f)
            shift; package_file=$1;;
        -log)
            shift; log_input=$1;;
        -v)
            get_version "$kext_dir" "$ver_file" ;;
        -h)
            usage ;;
        -u)
            uninstall_func "$kext_dir" ;;
        -c)
            compat_check_func "$dir1" ;;
        -help)
            usage ;;
        -h*)
            usage ;;
        -*)
            echo "Error: unknown command option: $1! Please using -h to get help! "
            exit 1 ;;
    esac
    shift
done

# check sudo
user=`id -u`  

if [ $user != 0 ]; then
    echo "The silent installation must run by using sudo!"
    exit 1
fi

# avd instance check at first
if [ ! -e $dmg_default ]; then
    echo "Avd instance check failed since cannot find haxm package $dmg_default! HAXM silently install will be stopped! "
    exit 1
fi
avd_exist_check_func $dmg_default
avd_exist=$?
if [ $avd_exist -eq 1 ]; then
    echo "An Android x86 emulator instance is running. Please stop all emulator instances and continue with haxm install! "
    exit 1
fi 

# clean log when start silent run
if [ -e $logfile ]; then
    rm -f $logfile
fi
if [ -e $log_input ]; then
    rm -f $log_input
fi

# check input validity
if [ "X$package_file" = "X" ] ; then
    package_file=$dmg_default
fi
check_package_valid $package_file $logfile
if [ "X$mem_limit" != "X" ] ; then
    if [ $mem_limit != 0 ]; then
        check_memlimit_valid $mem_limit $maxUIMem $logfile
    else
        mem_limit=$mem_default
    fi
else
    echo "Please assign a number after -m parameter" >> $log
    echo_fail $log
fi

# 32 bit OS: reset memory limit
os_ver=`uname -a`

if $( strstr "$os_ver" 'i386')
then
    #echo "32 bit os"
    if [ $mem_limit -gt 1638 ]; then
        mem_limit=1638
        echo "32 bit OS: Reset the memory limit as $mem_limit !" >> $logfile
    fi 
fi

# create the plist file since plugin inside dmg not work in silent installation mode
touch "/private/tmp/com.intel.kext.haxm.plist" 

if [ ! -e "/private/tmp/com.intel.kext.haxm.plist" ]; then
    echo "Cannot create the memory limit storage file /private/tmp/com.intel.kext.haxm.plist !" >> $logfile
    echo_fail $logfile
fi

echo "$mem_limit" > "/private/tmp/com.intel.kext.haxm.plist"

if [ $? != 0 ] ; then
    echo "Cannot print the memory limit value into /private/tmp/com.intel.kext.haxm.plist!" >> $logfile
    echo_fail $logfile
fi
 
# decompress the dmg
hdiutil attach $package_file -noverify -nobrowse -mountpoint /Volumes/com_intel_kext_haxm_disc  1>>$logfile  2>&1

if [ $? != 0 ] ; then
    echo "Error: Hdiutil attach dmg failed! Please unmount the HAXM device first, then try to run silent installation again! " >> $logfile
    echo_fail $logfile
fi

# get mpkg file name 
mpkg_file=`find /Volumes/com_intel_kext_haxm_disc/ -name "*.mpkg"`

if [ "X$mpkg_file" = "X" ] ; then
    echo "Error: Invalid dmg input! Cannot find mpkg file inside dmg package! " >> $logfile
    echo_fail $logfile
fi

echo "mpkg_file=$mpkg_file" >> $logfile

# createt the blank silent indicater so that to control window popup or not
if [ -e $silent_indicater ]; then
    rm -f $silent_indicater
fi
touch $silent_indicater

# install the mpkg
installer -pkg $mpkg_file -target /  1>>$logfile  2>&1

install_result=$?

# close the device
sleep 5 
hdiutil detach /Volumes/com_intel_kext_haxm_disc  1>>$logfile  2>&1

if [ $? != 0 ] ; then
    echo "hdiutil detach /Volumes/com_intel_kext_haxm_disc failed! " >> $logfile
    rm -f $silent_indicater
    echo_fail $logfile
fi

# installaion check meet error
if [ "$install_result" != 0 ] ; then
    echo "Error: The installation-check script run failed ! " >> $logfile
    rm -f $silent_indicater
    echo_fail $logfile
fi

# postinstall check meet error
postinstall=`cat $silent_indicater`
if [ "$postinstall" != "0" ] ; then
    echo "Error: The post-installation check script run failed ! " >> $logfile
    rm -f $silent_indicater
    echo_fail $logfile
fi

echo "HAXM silent installation finished! " >> $logfile
rm -f $silent_indicater

# for install, if the old kext dir exists (for re_install),delete the old kext dir. 
if [ -e $kext_dir_old ]; then
   rm -rf $kext_dir_old
fi

if [ -e $launch_file_old ]; then
   rm -f $launch_file_old
fi

echo_pass $logfile
