class ApplicationController < ActionController::Base
  
  protect_from_forgery
  
  def index
    session.delete(:plist) if session[:plist]
    @plist = Plist.new
  end
  
  def results
    if session[:plist] || params[:plist]
      session[:plist] = params[:plist] if params[:plist]
      @plist = Plist.new(session[:plist])
      if @plist.valid?
        params[:plist_name] ? render_results('plist') : render_results('html')
      else
        consolidate_arguments
        session.delete(:plist)
        render :action => 'index'
      end
    else
      redirect_to root_path
    end
  end
  
  private
  
  def render_results(type)
    render :template => "application/results.#{type}.erb"
  end
  
  def consolidate_arguments
    arguments = [ @plist.argument_1, @plist.argument_2, @plist.argument_3, @plist.argument_4, @plist.argument_5 ]
    i = 1
    for argument in arguments do
      if !argument.empty?
        @plist.send("argument_#{i}=",argument)
        i+=1
      end
    end
    for argument in arguments[(i-1)..5] do
      @plist.send("argument_#{i}=",'')
      i+=1
    end
  end
  
end
