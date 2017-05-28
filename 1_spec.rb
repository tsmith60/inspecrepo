control "RHEL-07-020200" do                      
  impact 3.0                                
  title "Only Required Components"
  desc "The operating system must remove all software components after updated versions have been installed"
  describe command('grep -i clean_requirements_on_remove /etc/yum.conf') do
   its('stdout') { should match (/clean_requirements_on_remove=1/) }
   end
end 