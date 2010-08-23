class ReportsController < ApplicationController
  require 'active_support/secure_random'
  
  # GET /reports
  # GET /reports.xml
  def index
    @reports = Report.all
    @users=User.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @reports }
    end
  end

  # GET /reports/1
  # GET /reports/1.xml
  def show
    @report = Report.find(params[:id])

    respond_to do |format|
      format.html {render :layout => 'pdf'}
      format.xml  { render :xml => @report }
      format.pdf do
        render (:pdf=>"report",
                :layout=>"pdf.html")
      end
    end
  end

  # GET /reports/new
  # GET /reports/new.xml
  def new  
    @report = Report.new  
    @shippers = Role.find(4).users
    2.times do  
      category = @report.categories.build  
      2.times { category.grades.build }  
    end  
  end

  # GET /reports/1/edit
  def edit
    @report = Report.find(params[:id])
    
    @shippers = Role.find(4).users
  end

  # POST /reports
  # POST /reports.xml
  def create
    @report = Report.new(params[:report])

    respond_to do |format|
      if @report.save
        @users=@report.users
        @users.each do |user|
          ReportMailer.distribute_report(@report,user).deliver
        end
        format.html { redirect_to(@report, :notice => 'Report was successfully created.') }
        format.xml  { render :xml => @report, :status => :created, :location => @report }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @report.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /reports/1
  # PUT /reports/1.xml
  def update
    @report = Report.find(params[:id])
    params[:report][:user_ids] ||= []
    respond_to do |format|
      if @report.update_attributes(params[:report])
        format.html { redirect_to(@report, :notice => 'Report was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @report.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.xml
  def destroy
    @report = Report.find(params[:id])
    @report.destroy

    respond_to do |format|
      format.html { redirect_to(reports_url) }
      format.xml  { head :ok }
    end
  end
  
  def distribute
    @report = Report.find(params[:id])
    @users=@report.users
    @users.each do |user|
      ReportMailer.distribute_report(@report,user).deliver
    end
    
  end
  
end
