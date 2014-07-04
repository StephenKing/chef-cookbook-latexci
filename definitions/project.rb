#
# Cookbook Name:: latexci
# Definition:: project
#
# Copyright (C) 2013 Zachary Stevens
# Copyright (C) 2014 Steffen Gebert
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

define :latexci_project, :branch => 'master' do
  job_name = params[:name]
  job_config = File.join(Chef::Config[:file_cache_path], "#{job_name}-config.xml")
  #job_dsl    = File.join(Chef::Config[:file_cache_path], "#{job_name}-job.dsl")

  jenkins_job job_name do
    action :nothing
    config job_config
  end

  template job_config do
    source 'latex-job.config.xml.erb'
    variables :params => params
    notifies  :create, "jenkins_job[#{job_name}]", :immediately
    notifies  :enable, "jenkins_job[#{job_name}]", :immediately
  end



  # template job_dsl do
  #   source 'latex-job.dsl.erb'
  #   variables :params => params
  # end

end
