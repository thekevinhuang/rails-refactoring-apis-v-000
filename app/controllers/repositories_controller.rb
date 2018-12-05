class RepositoriesController < ApplicationController
  def index
    github = GithubService.new({"access_token" => session[:token]})
    #response = Faraday.get "https://api.github.com/user/repos", {}, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
    @repos_array = github.get_repos() #JSON.parse(response.body)
  end

  def create
    github = GithubService.new({"access_token" => session[:token]})
    github.create_repo(params[:name])
    redirect_to '/'
  end
end
