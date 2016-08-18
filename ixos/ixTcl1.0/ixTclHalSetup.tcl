#############################################################################################
#   Version 6.62
#   
#   File: ixTclHalSetup.tcl
#
#  Package initialization file
#
#  This file is executed when you use "package require IxTclHal" to
#  load the IxTclHal library package. It sets up the TclHal related
#  objects and commands. This file will be called by ixtclhal.tcl file
#  on the server side or whereever the TclHal.dll file is installed.
#
#
# Copyright ©  IXIA.
# All Rights Reserved.
#
#############################################################################################
catch {package req Mpexpr}
proc enableEvents {flag} {}

# note that mpexpr is only req'd for 8.3 & below.
if {[info command mpexpr] == ""} {
    # if we didn't get a real mpexpr AND we're not 8.4, that's ugly so throw an exception - otherwise just make it work
    if {[info tclversion] <= 8.3} {
        puts "Package req failed: Mpexpr package/file not found"
        return -code error -errorinfo "Mpexpr package/file not found"
    } else {    
        proc mpexpr {args}   {return [eval expr $args]}
        proc mpformat {args} {return [eval format $args]}
        proc mpincr {args} \
        {
            set Item [lindex $args 0]
            upvar $Item item
            set args [lrange $args 1 end]
            return [eval incr item $args]
        }
    }
}


useProfile false 


