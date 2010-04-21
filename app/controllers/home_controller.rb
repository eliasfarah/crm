class HomeController < ApplicationController
  
  def index
    @incomplete_tasks = current_user.tasks.open
    @completed_tasks = current_user.tasks.closed
  end
  
  def finish
    @task = current_user.tasks.find(params[:id].gsub(/\D/,""))
    @task.update_attribute("status","closed")
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def save
    @task = current_user.tasks.build(params[:task].merge({:status=>"open"}))
    @task.save
  end

end
