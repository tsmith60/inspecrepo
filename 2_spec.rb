control "RHEL-07-020210" do                      
  impact 1.0                                
  title "The operating system must enable SELinux."
  desc "Check if SELinux is active and in enforcing mode with the following command: "
  describe command('getenforce') do
   its('stdout') { should match (/Enforcing/) }
   end
end 