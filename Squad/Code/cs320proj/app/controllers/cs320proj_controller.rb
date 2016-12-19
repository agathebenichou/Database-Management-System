class Cs320projController < ApplicationController
 skip_before_filter :verify_authenticity_token, :only => :create
  def index
  end

  def new 
  end

  def home
  	@school = School.all
  end

  def create

    @attributename = params[:attributename]

    	valid_cols = ["male", "female", "hispanic", "black", "white", "asian",
  	"americanindianalaskan", "multiracial", "specialed", "econdisadv", 
  	"migrant", "ell", "nativehawaiianpacificislander"] 

    	valid_cols.include?(params[:attributename]) or raise "bad query"

  	@data = Multiyearrate.find_by_sql(["SELECT #{params[:attributename]}, schoolid, startyear, school_name
  	 FROM multiyearrates, school WHERE (multiyearrates.schoolid = school.school_id) AND (timeperiod = 4 AND startyear= ?) AND (schoolid = ? OR schoolid = ? OR schoolid = ?)", 
  		 params[:startyear], params[:schoolnames1], params[:schoolnames2], params[:schoolnames3] ])
    
  end

end
