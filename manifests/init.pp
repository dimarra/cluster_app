# Class: cluster_app
#
# This module manages cluster_app
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class cluster_role (
  
    $cluster      = undef,
    $app          = undef,
  
) {
  
  case $::osfamily {
    'windows': {
      $etc_home = 'C:/ProgramData/PuppetLabs'
     }
    default: {
      $etc_home = '/etc/puppetlabs'
    }    
  }
  

  file {[
    "$etc_home", 
    "$etc_home/facter",
    "$etc_home/facter/facts.d",
    ]: 
    ensure  => directory,
  }
  ->
  file { "$etc_home/facter/facts.d/custom_facts.yaml":
    ensure  => file,
    content  => "cluster: $cluster \napp: $app \n",
  }

}
