include_recipe "jenkins::master"

%w{
scm-api
git-client
git
github
ant
ansicolor
jobConfigHistory
job-dsl
keyboard-shortcuts-plugin
}.each do |pl|
  jenkins_plugin pl do
    notifies :restart, "service[jenkins]"
  end
end


latexci_project "latex-test" do
  repository "https://github.com/StephenKing/latex-test"
end

latexci_project "template-deliverable-saser" do
  repository "ssh://github.com:lsinfo3/template-deliverable-saser.git"
end
