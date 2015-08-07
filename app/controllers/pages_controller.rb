class PagesController < ApplicationController
  
  before_filter :login_required, :except => [:home, :news, :about, :needlogin]
  
  def home
  end
  def news
    @articles = Article.all
  end
  def about
  end
  
  def links
    @links = Link.all
  end
  def needlogin
  end
  
  def new_stats
  end
  
  def new_stats2
    @stat = Stat.new
    @stat.grade = params['grade']
    @stat.points = params['points']
    @stat.naqt_att = params['naqt_att']
    @stat.oac_att = params['oac_att']
    @stat.pract_att = params['pract_att']
    @stat.user_id = params['user_id']
    @stat.save
    redirect_to "/myinfo"
  end
  
  
  def myinfo
    @user = User.find_by(id: session['user_id'])
    @stat = Stat.find_by(user_id: @user.id)
  end
  def editinfo
    @user = User.find_by(id: session['user_id'])
    @stat = Stat.find_by(user_id: @user.id)
  end
  
  def editing
    @user = User.find_by(id: session['user_id'])
    @stat = Stat.find_by(user_id: @user.id)
    @stat.grade = params['grade']
    @stat.points = params['points']
    @stat.naqt_att = params['naqt_att']
    @stat.oac_att = params['oac_att']
    @stat.pract_att = params['pract_att']
    @stat.save
    redirect_to "/myinfo"
  end
  
  
  
end