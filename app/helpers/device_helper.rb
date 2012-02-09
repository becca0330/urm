# This file is part of URM Usability Reporting Manager
# Copyright (C) 2012 internettechnik 
# Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.


module DeviceHelper

  
  # summary information about ALL the devices
  def alldevices_summary(report)
    return if report.nil?
    dvs= report.devices ? report.devices.sort : nil
    pluralize(dvs.size,I18n.t(:'devices.device.device'))+": "+dvs.collect {|dv| dv.devicetype.to_s+": "+dv.title.to_s[0,15]+"..."}.join(", ")
  end
  
  
end