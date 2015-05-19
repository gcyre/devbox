# Set download URL for Powershell V4 depending on OS version
if node['platform_family'] == 'windows'
  case node['platform_version'].split('.')[0..1].join('.')
  when '6.1' # Windows 2008 R2
  	case node['kernel']['machine']
    when 'x86_64'
      default['powershell']['url'] = 'http://download.microsoft.com/download/3/D/6/3D61D262-8549-4769-A660-230B67E15B25/Windows6.1-KB2819745-x64-MultiPkg.msu'
      default['powershell']['checksum'] = 'fbc0889528656a3bc096f27434249f94cba12e413142aa38946fcdd8edf6f4c5'
    end
  when '6.2' # Windows 2012
    case node['kernel']['machine']
    when 'x86_64'
      default['powershell']['url'] = 'http://download.microsoft.com/download/3/D/6/3D61D262-8549-4769-A660-230B67E15B25/Windows8-RT-KB2799888-x64.msu'
      default['powershell']['checksum'] = 'a68da0b05dbe245510578d9affb60fd624e906d21a57bfa35741a6f677091c66'
    end
  end
end

default['chocolatey']['upgrade'] = false
