class ReportMailer < ActionMailer::Base
  
  default :from => "naderhen@gmail.com"  
  
  
  
  def distribute_report(report,user) 
    @report = report
    @user = user
    attachments["report.pdf"]=File.read("#{Rails.root}/public/reports/#{@report.id}.pdf")
    mail(:to => user.email, :subject=>"Testing")
  end
end
